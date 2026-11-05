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
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_94 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_68 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3865 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4163 = as_type<float>(_127);
        out.gl_Position.z = _4163;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_49.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = 1.0 / _133;
    float _157 = _131;
    float _159 = _137;
    if (_153)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _157;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    float _163 = _137 * _155;
    float _165 = _163;
    if (_153)
    {
        float _167 = _161 * 5.0;
        _129 = as_type<int>(_167);
    }
    int _169 = _129;
    out.m_51.x = _163;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4236 = as_type<float>(_169);
        out.gl_Position.z = _4236;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_53.x;
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _181 = _175 * _173;
    float _183 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _187 = _183 * _179;
    float _189 = floor(_185);
    float _191 = _185 * 6.283185482025146484375;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].y, _187);
    int _195 = as_type<int>(_177) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_177) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = floor(_193);
    bool _211 = !_201;
    float _213 = _211 ? (-0.5) : 0.5;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _221 = _219 != 0;
    float _223 = _203 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_189;
    float _229 = _185 + _227;
    float _231 = _193 * 6.283185482025146484375;
    float _233 = _231 * 0.15915493667125701904296875;
    bool _235 = !_207;
    int _237 = _235 ? 0 : 1;
    float _239 = -_209;
    float _241 = _193 + _239;
    bool _243 = !_217;
    int _245 = _243 ? 0 : 1;
    float _247 = -_229;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _251 = _229 < 0.5;
    float _253 = float(_251);
    float _255 = _233 * 6.283185482025146484375;
    float _257 = cos(_255);
    int _259 = abs(_245);
    bool _261 = !_221;
    int _263 = _261 ? 0 : 1;
    float _265 = fma(_225, 0.5, 0.5);
    float _267 = -_253;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _277 = abs(_263);
    float _279 = float(_259);
    float _281 = -_241;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _285 = _241 < 0.5;
    float _287 = float(_285);
    float _289 = fma(_257, 0.5, 0.5);
    int _291 = abs(_237);
    float _293 = abs(_249);
    float _295 = _279 * _293;
    float _297 = float(_291);
    float _299 = -_287;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _303 = -_289;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _307 = abs(_283);
    float _309 = _279 * _307;
    float _311 = float(_277);
    float _313 = fma(_297, _275, _295);
    float _315 = fma(_297, _305, _309);
    float _317 = abs(_269);
    float _319 = fma(_311, _317, _313);
    bool _321 = !_197;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = abs(_301);
    float _327 = fma(_311, _325, _315);
    bool _329 = !_271;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _165 = _343;
    }
    float _345 = _165;
    float _347 = in.m_53.y;
    float _349 = _171 * 2.0;
    float _351 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _353 = in.m_53.z;
    float _355 = floor(_349);
    float _357 = in.m_44.x;
    float _359 = in.m_44.y;
    float _361 = in.m_44.z;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _365 = _363 != 0;
    float _367 = in.m_58.x;
    float _369 = in.m_58.y;
    float _371 = in.m_58.z;
    float _373 = in.m_58.w;
    float _375 = in.m_60.x;
    float _377 = in.m_60.y;
    float _379 = in.m_60.z;
    float _381 = in.m_60.w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _385 = in.m_62.x;
    float _387 = in.m_62.y;
    float _389 = in.m_62.z;
    float _391 = in.m_62.w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _395 = _347 * 2.0;
    bool _397 = _347 > 0.5;
    float _399 = _347 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _401 = -_393;
    float _403 = fma(_351, 2.0, _401);
    bool _405 = _353 > 0.5;
    float _407 = fma(_399, -2.0, _383);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _415 = _413 != 0;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _419 = _417 != 0;
    float _421 = floor(_395);
    float _423 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _407);
    float _425 = _359 * _369;
    float _427 = -_213;
    int _429 = _405 ? as_type<int>(_427) : as_type<int>(_213);
    float _431 = fma(_357, _367, _425);
    float _433 = -_323;
    int _435 = _397 ? as_type<int>(_433) : as_type<int>(_323);
    float _437 = _359 * _377;
    bool _439 = !_419;
    float _441 = _439 ? _213 : as_type<float>(_429);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _443;
    bool _447 = !_415;
    float _449 = _447 ? _323 : as_type<float>(_435);
    float _451 = fma(_357, _375, _437);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _463 = _461 != 0;
    float _465 = 1.0 / _445;
    bool _467 = _355 >= 0.0;
    bool _469 = isnan(_355);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = _359 * _387;
    int _485 = _475 ? 0 : 1;
    float _487 = -_477;
    float _489 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _487);
    bool _491 = _355 > 0.0;
    float _493 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _495 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _497 = 1.0 / _481;
    float _499 = fma(_361, _371, _431);
    float _501 = -_493;
    float _503 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _501);
    float _505 = -_495;
    float _507 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _345 + _509;
    int _513 = ~_485;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _171 + _347;
    float _521 = fma(_357, _385, _483);
    float _523 = _511 * _465;
    int _525 = as_type<int>(_511);
    int _527 = _517;
    float _529 = _373;
    float _531 = _391;
    float _533 = _499;
    if (_365)
    {
        _525 = 0;
    }
    int _535 = _525;
    float _537 = _519 + (-1.0);
    int _539 = _535;
    if (!_491)
    {
        int _541 = ~_485;
        int _543 = _541 + 1;
        _527 = _543;
    }
    int _545 = _527;
    float _547 = fma(_361, _389, _521);
    bool _549 = _421 > 0.0;
    float _551 = fma(_361, _379, _451);
    bool _553 = _421 >= 0.0;
    bool _555 = isnan(_421);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _565 = _345 + _563;
    float _567 = _547;
    if (!_365)
    {
        _539 = 1;
    }
    int _569 = _539;
    float _571 = _551 + _381;
    float _573 = _565 * _497;
    int _575 = _561 ? 0 : 1;
    float _577 = _499 + _373;
    bool _579 = _569 != 1;
    float _581 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = _547 + _391;
    int _585 = ~_575;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    float _591 = -_577;
    float _593 = _591 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _595 = _589;
    if (!_549)
    {
        int _597 = ~_575;
        int _599 = _597 + 1;
        _595 = _599;
    }
    int _601 = _595;
    float _603 = -_583;
    float _605 = _603 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _607 = _353 * 2.0;
    float _609 = -_571;
    float _611 = _609 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _613 = _605 * _605;
    float _615 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _617 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _619 = floor(_607);
    float _621 = fma(_593, _593, _613);
    float _623 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    if (!_579)
    {
        _529 = _347;
    }
    float _625 = _529;
    float _627 = -_617;
    float _629 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _627);
    float _631 = fma(_611, _611, _621);
    float _633 = -_623;
    float _635 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _633);
    bool _637 = !_459;
    int _639 = _637 ? 0 : 1;
    float _641 = rsqrt(_631);
    bool _643 = !_455;
    int _645 = _643 ? 0 : 1;
    float _647 = _353 + _347;
    bool _649 = !_463;
    int _651 = _649 ? 0 : 1;
    float _653 = -_615;
    float _655 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _653);
    float _657 = _625;
    float _659 = _629;
    if (!_579)
    {
        _567 = _353;
    }
    float _661 = _567;
    float _663 = _647 + (-1.0);
    float _665 = _661;
    if (!_579)
    {
        _531 = _353;
    }
    float _667 = _531;
    float _669 = _507 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _671 = _667;
    if (!_579)
    {
        _533 = _625;
    }
    float _673 = _533;
    float _675 = _507 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _677 = _673;
    if (_579)
    {
        _677 = _171;
    }
    float _679 = _677;
    float _681 = _507 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_579)
    {
        _657 = _171;
    }
    float _683 = _657;
    float _685 = _489 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    if (_579)
    {
        _665 = _347;
    }
    float _687 = _665;
    float _689 = _593 * _641;
    if (_579)
    {
        _671 = _347;
    }
    float _691 = _671;
    float _693 = -_685;
    float _695 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[0].y, _693);
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _707 = _705 != 0;
    float _709 = _689 * _689;
    bool _711 = _619 > 0.0;
    float _713 = -_675;
    float _715 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[0].x, _713);
    bool _717 = _619 >= 0.0;
    bool _719 = isnan(_619);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = fma(_729, _523, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _737 = _611 * _641;
    float _739 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _741 = !_703;
    int _743 = _741 ? 0 : 1;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _745;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _751 = _749 != 0;
    float _753 = fma(_737, _737, _709);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _759 = fma(_747, _523, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _761 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _763 = isnan(_345);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = rsqrt(_753);
    float _775 = fma(_733, _573, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_757, _573, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _779 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _781 = isnan(_345);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_771;
    float _793 = _791 + 1.0;
    bool _795 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _797 = isnan(_345);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[0].w, _715);
    int _809 = _725 ? 0 : 1;
    float _811 = _789 * _793;
    int _813 = 0;
    if (_751)
    {
        _813 = 0;
    }
    int _815 = _813;
    float _817 = -_789;
    float _819 = _817 + 1.0;
    int _821 = _815;
    if (!_751)
    {
        _821 = 2;
    }
    int _823 = _821;
    float _825 = -_669;
    float _827 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _825);
    float _829 = _629 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _831 = _805 * _819;
    bool _833 = _823 != 2;
    float _835 = _507 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _837 = _737 * _773;
    float _839 = _489 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _841 = _735 * _831;
    float _843 = _759 * _831;
    float _845 = _689 * _773;
    float _847 = -_837;
    float _849 = _737 * _847;
    float _851 = -_835;
    float _853 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[1].x, _851);
    float _855 = -_839;
    float _857 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[1].y, _855);
    float _859 = _605 * _641;
    float _861 = -_849;
    float _863 = fma(_689, _845, _861);
    float _865 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[1].w, _853);
    float _867 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[1].w, _857);
    float _869 = _859 * _845;
    float _871 = _863 * _863;
    float _873 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _875 = -_681;
    float _877 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _875);
    float _879 = -_829;
    float _881 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[1].x, _879);
    float _883 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[0].w, _695);
    float _885 = fma(_869, _869, _871);
    float _887 = -_837;
    float _889 = _859 * _887;
    float _891 = -_873;
    float _893 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _891);
    float _895 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[1].w, _827);
    float _897 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[1].z, _881);
    float _899 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[0].w, _877);
    float _901 = fma(_889, _889, _885);
    float _903 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[0].z, _893);
    float _905 = in.m_64.x;
    float _907 = in.m_64.y;
    float _909 = -_805;
    float _911 = _909 + 1.0;
    float _913 = rsqrt(_901);
    float _915 = -_897;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].w, _903);
    float _919 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[143].x, _841);
    if (_833)
    {
        _659 = _171;
    }
    float _921 = _659;
    float _923 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _927 = 1.0 / _917;
    float _929 = fma(_775, _811, _919);
    float _931 = _921;
    if (!_833)
    {
        _931 = _353;
    }
    float _933 = _931;
    float _935 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[83].z, _925);
    float _937 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[145].x, _929);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _943 = _863 * _913;
    float _945 = precise::clamp(_943, 0.0, 1.0);
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _951 = _583 + _949;
    float _953 = -_939;
    float _955 = fma(_941, 2.0, _953);
    float _957 = -_945;
    float _959 = _957 + 1.0;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _577 + _961;
    float _965 = _937 * _905;
    float _967 = -_947;
    float _969 = fma(_923, 2.0, _967);
    float _971 = fma(_807, _927, -1.0);
    float _973 = _959 * _927;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _977 = _571 + _975;
    float _979 = fma(_959, _971, 1.0);
    float _981 = _951 * _951;
    float _983 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _985 = log2(_983);
    float _987 = _883 * _973;
    float _989 = _899 * _973;
    float _991 = fma(_963, _963, _981);
    float _993 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _995 = _979 * _979;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _999 = fma(_977, _977, _991);
    bool _1001 = !_699;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = fma(_987, _987, _995);
    float _1007 = fma(_993, -2.0, _997);
    float _1009 = sqrt(_999);
    int _1011 = abs(_743);
    float _1013 = fma(_989, _989, _1005);
    int _1015 = abs(_1003);
    float _1017 = _319 * _965;
    float _1019 = _985 * _137;
    int _1021 = ~_809;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = rsqrt(_1013);
    float _1029 = float(_545);
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1033 = _1025;
    float _1035 = _995;
    if (!_711)
    {
        int _1037 = ~_809;
        int _1039 = _1037 + 1;
        _1033 = _1039;
    }
    int _1041 = _1033;
    float _1043 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[143].y, _843);
    float _1045 = float(_1041);
    float _1047 = exp2(_1019);
    float _1049 = float(_1015);
    float _1051 = _1031 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1053 = fma(_777, _811, _1043);
    if (_833)
    {
        _1035 = _347;
    }
    float _1055 = _1035;
    float _1057 = _1049 * _1045;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1061 = int(_1059);
    float _1063 = _1055;
    if (!_833)
    {
        _1063 = _171;
    }
    float _1065 = _1063;
    float _1067 = _1009 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1069 = _989 * _1027;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1073 = float(_1011);
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1079 = precise::min(_1051, _1067);
    float _1081 = _979 * _1027;
    float _1083 = _987 * _1027;
    float _1085 = -_1069;
    float _1087 = _689 * _1085;
    float _1089 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1071);
    float _1091 = fma(_1077, -2.0, _1075);
    float _1093 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1095 = int(_1093);
    float _1097 = _1073 * _1029;
    float _1099 = _737 * _1081;
    float _1101 = -_1083;
    float _1103 = _859 * _1101;
    float _1105 = -_1083;
    float _1107 = -_1087;
    float _1109 = fma(_737, _1105, _1107);
    float _1111 = -_1047;
    float _1113 = _1111 + 1.0;
    bool _1115 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1123 = _1119 || _1121;
    float _1125 = -_1069;
    float _1127 = -_1099;
    float _1129 = fma(_859, _1125, _1127);
    float _1131 = _155 * _137;
    float _1133 = _1123 ? _1113 : 0.0;
    float _1135 = -_137;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[76].x, _403);
    float _1139 = float(_1061);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1143 = in.m_66.x;
    float _1145 = in.m_66.y;
    float _1147 = in.m_66.z;
    float _1149 = _1109 * _1109;
    float _1151 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1141);
    float _1153 = float(_1095);
    float _1155 = rsqrt(_999);
    bool _1157 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(1.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1169 = 1.0 + _1167;
    float _1171 = -_1103;
    float _1173 = fma(_689, _1081, _1171);
    float _1175 = fma(_1129, _1129, _1149);
    float _1177 = _1057 * (-2.0);
    float _1179 = 1.0 / _1153;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1183 = -_137;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _969);
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1189 = float(_601);
    float _1191 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1181);
    float _1193 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1053);
    float _1195 = 1.0 / _1139;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1199 = _1155 * _1079;
    float _1201 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1191);
    float _1203 = fma(_1177, _1143, _1143);
    float _1205 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1197);
    float _1207 = -_137;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[86].x, _955);
    float _1211 = _951 * _1199;
    float _1213 = 1.0 / _1169;
    float _1215 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1187);
    float _1217 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _935);
    float _1219 = _1179 * _137;
    float _1221 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1205);
    float _1223 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1215);
    float _1225 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1151);
    float _1227 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1007);
    float _1229 = _1195 * _137;
    float _1231 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1233 = fma(_1173, _1173, _1175);
    float _1235 = _171 + (-0.5);
    float _1237 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1091);
    float _1239 = fma(_581, _1177, _581);
    float _1241 = -_1211;
    float _1243 = _951 + _1241;
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1203);
    float _1247 = rsqrt(_1233);
    float _1249 = _1229;
    if (_1165)
    {
        float _1251 = _1133 * _1213;
        _159 = _1251;
    }
    float _1253 = _159;
    float _1255 = _963 * _1199;
    float _1257 = _1097 * (-2.0);
    float _1259 = _1243 * _1243;
    float _1261 = fma(_1239, _1253, _1245);
    float _1263 = -_1255;
    float _1265 = _963 + _1263;
    float _1267 = _977 * _1199;
    float _1269 = fma(_739, _1257, _739);
    float _1271 = fma(_1257, _1145, _1145);
    float _1273 = fma(_1265, _1265, _1259);
    float _1275 = -_1267;
    float _1277 = _977 + _1275;
    bool _1279 = !_707;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = _1261 * 0.15915493667125701904296875;
    float _1285 = _1193 * _907;
    float _1287 = fma(_1277, _1277, _1273);
    float _1289 = _1129 * _1247;
    float _1291 = _1173 * _1247;
    int _1293 = abs(_1281);
    float _1295 = _1109 * _1247;
    float _1297 = _737 * _1289;
    float _1299 = _859 * _1291;
    float _1301 = _347 + (-0.5);
    float _1303 = sqrt(_1287);
    float _1305 = -_1297;
    float _1307 = fma(_689, _1291, _1305);
    float _1309 = -_1299;
    float _1311 = fma(_737, _1295, _1309);
    float _1313 = _689 * _1295;
    float _1315 = _1307 * _1307;
    float _1317 = float(_1293);
    float _1319 = _327 * _1285;
    float _1321 = -_1313;
    float _1323 = fma(_859, _1289, _1321);
    float _1325 = fma(_1311, _1311, _1315);
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1271);
    float _1329 = _171 + _353;
    float _1331 = _1317 * _1189;
    float _1333 = fma(_1323, _1323, _1325);
    float _1335 = fma(_1269, _1253, _1327);
    float _1337 = _1329 + (-1.0);
    float _1339 = _1331 * (-2.0);
    float _1341 = _1155 * _1303;
    float _1343 = rsqrt(_1333);
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1347 = fma(_1339, _1147, _1147);
    float _1349 = _353 + (-0.5);
    float _1351 = _1335 * 0.15915493667125701904296875;
    float _1353 = fma(_1345, _1339, _1345);
    float _1355 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1357 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1347);
    float _1359 = _1283 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = _1031 * _1341;
    float _1365 = _1355 * _1341;
    float _1367 = fma(_1353, _1253, _1357);
    float _1369 = in.m_53.w;
    float _1371 = _1367 * 0.15915493667125701904296875;
    float _1373 = _1323 * _1343;
    float _1375 = _1283 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1307 * _1343;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1383 = _689 * _1373;
    float _1385 = _737 * _1379;
    float _1387 = _1351 * 6.283185482025146484375;
    float _1389 = sin(_1387);
    float _1391 = _1311 * _1343;
    float _1393 = -_1385;
    float _1395 = fma(_859, _1373, _1393);
    float _1397 = -_1383;
    float _1399 = fma(_737, _1391, _1397);
    float _1401 = _859 * _1391;
    float _1403 = _1365 * _1381;
    float _1405 = _1351 * 6.283185482025146484375;
    float _1407 = cos(_1405);
    float _1409 = _1399 * _1399;
    float _1411 = -_1401;
    float _1413 = fma(_689, _1379, _1411);
    float _1415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    bool _1417 = _1369 > 0.5;
    float _1419 = fma(_1395, _1395, _1409);
    float _1421 = _1363 * _1415;
    float _1423 = _1371 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = fma(_1413, _1413, _1419);
    float _1429 = _1361 * _1389;
    float _1431 = -_213;
    int _1433 = _1417 ? as_type<int>(_1431) : as_type<int>(_213);
    bool _1435 = !_411;
    float _1437 = _1435 ? _213 : as_type<float>(_1433);
    float _1439 = _1371 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = _1377 * _1407;
    float _1445 = _1361 * _1407;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1449 = _1447 != 0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1453 = _1451 != 0;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1457 = _1455 != 0;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1461 = _1459 != 0;
    float _1463 = rsqrt(_1427);
    float _1465 = _1377 * _1425;
    float _1467 = _1407 * _1425;
    float _1469 = _1361 * _1425;
    float _1471 = _1377 * _1389;
    float _1473 = _1465 * _1403;
    bool _1475 = !_1449;
    int _1477 = _1475 ? 0 : 1;
    float _1479 = fma(_1441, _1443, _1429);
    float _1481 = -_1403;
    float _1483 = _1441 * _1481;
    float _1485 = -_1471;
    float _1487 = fma(_1441, _1445, _1485);
    float _1489 = _1469 * _1403;
    float _1491 = fma(_1479, _1421, _1473);
    float _1493 = fma(_1467, _1421, _1483);
    float _1495 = fma(_1487, _1421, _1489);
    float _1497 = _1491 * _1373;
    float _1499 = _1413 * _1463;
    float _1501 = _1491 * _1391;
    float _1503 = _1395 * _1463;
    float _1505 = _1399 * _1463;
    float _1507 = fma(_1493, _1499, _1497);
    float _1509 = -_1255;
    float _1511 = _577 + _1509;
    float _1513 = fma(_1493, _1503, _1501);
    float _1515 = -_1267;
    float _1517 = _571 + _1515;
    float _1519 = fma(_737, _1495, _1507);
    bool _1521 = !_1453;
    int _1523 = _1521 ? 0 : 1;
    float _1525 = fma(_689, _1495, _1513);
    bool _1527 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    float _1537 = _571 + _1519;
    bool _1539 = !_1457;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = _577 + _1525;
    float _1545 = -_1211;
    float _1547 = _583 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1537 + _1549;
    bool _1553 = !_1461;
    int _1555 = _1553 ? 0 : 1;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1559 = _1543 + _1557;
    float _1561 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1563 = _1551 * _1551;
    float _1565 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1561);
    float _1567 = fma(_1559, _1559, _1563);
    float _1569 = _1491 * _1379;
    float _1571 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1573 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1565);
    float _1575 = sqrt(_1567);
    float _1577 = fma(_1493, _1505, _1569);
    float _1579 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1571);
    float _1581 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1583 = fma(_859, _1495, _1577);
    float _1585 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1579);
    float _1587 = 1.0 / _1581;
    float _1589 = _583 + _1583;
    float _1591 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1593 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan(0.5);
    bool _1601 = _1597 || _1599;
    float _1603 = _1591 + _1581;
    bool _1605 = _1575 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1609 = _1591;
    float _1611 = _1495;
    float _1613 = _1589;
    float _1615 = _1267;
    float _1617 = _1537;
    if (!_1605)
    {
        _1607 = _1543;
    }
    float _1619 = _1607;
    float _1621 = _1619;
    if (!_1605)
    {
        _1609 = _1537;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (!_1605)
    {
        _1611 = _1589;
    }
    float _1627 = _1611;
    bool _1629 = !_1605;
    float _1631 = _1627;
    if (!_1629)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1637 = _1575 + _1635;
        float _1639 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = rsqrt(_1567);
        float _1643 = _1637 * _1633;
        float _1645 = _1643 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1645 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1649 + (-1.0);
        float _1657 = fma(_1653, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1659 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1661 = _1641 * _1657;
        float _1663 = fma(_1589, _1649, _1659);
        float _1665 = fma(_1559, _1661, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1667 = fma(_1551, _1661, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1621 = _1665;
        _1625 = _1667;
        _1631 = _1663;
    }
    float _1669 = _1621;
    float _1671 = _1625;
    float _1673 = _1631;
    float _1675 = -_1255;
    float _1677 = _1675 + _1669;
    float _1679 = -_1267;
    float _1681 = _1679 + _1671;
    float _1683 = -_1211;
    float _1685 = _1683 + _1673;
    float _1687 = _1603 * _1587;
    float _1689 = _1687 * 0.5;
    float _1691 = _1685;
    float _1693 = _1681;
    float _1695 = _1669;
    if (_1601)
    {
        _1613 = 1.0;
    }
    float _1697 = _1613;
    float _1699 = _1697;
    if (_1535)
    {
        _1615 = _1677;
    }
    float _1701 = _1615;
    float _1703 = _1701;
    if (!_1535)
    {
        float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1707 = _1547 + _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1711 = _1511 + _1709;
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1715 = -_571;
        float _1717 = _1715 + _1671;
        float _1719 = _1707 * _1707;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1723 = _1517 + _1721;
        float _1725 = fma(_1711, _1711, _1719);
        float _1727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1729 = fma(_1723, _1723, _1725);
        float _1731 = sqrt(_1729);
        float _1733 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1735 = -_583;
        float _1737 = _1735 + _1673;
        float _1739 = precise::min(_1731, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1741 = _1739 * _1727;
        float _1743 = -_577;
        float _1745 = _1743 + _1669;
        float _1747 = _1733 * _1741;
        float _1749 = fma(_1745, _1747, _1511);
        float _1751 = fma(_1737, _1747, _1547);
        float _1753 = fma(_1717, _1747, _1517);
        _1691 = _1751;
        _1703 = _1749;
        _1693 = _1753;
    }
    float _1755 = _1691;
    float _1757 = _1703;
    float _1759 = _1693;
    if (!_1601)
    {
        float _1761 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1765 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1763);
        float _1767 = _1761 * 0.15915493667125701904296875;
        float _1769 = _1767 * 6.283185482025146484375;
        float _1771 = cos(_1769);
        float _1773 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1775 = _1773 * 0.15915493667125701904296875;
        float _1777 = _1767 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = 1.0 / _1771;
        float _1783 = _1775 * 6.283185482025146484375;
        float _1785 = cos(_1783);
        float _1787 = _1779 * _1781;
        float _1789 = 1.0 / _1765;
        float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1793 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1791;
        float _1795 = _1785 * _1787;
        float _1797 = _1775 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = 1.0 / _1795;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1805 = _1789 * _1803;
        float _1807 = 1.0 / _1793;
        float _1809 = _1799 * _1801;
        float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1813 = fma(_1809, _1805, _1811);
        float _1815 = _1813 * _1807;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        _1695 = _1787;
        _1699 = _1817;
    }
    float _1819 = _1695;
    float _1821 = _1699;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1825 = _1755 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1829 = _1757 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1833 = _1759 + _1831;
    float _1835 = _1825 * _1825;
    float _1837 = fma(_1829, _1829, _1835);
    float _1839 = fma(_1833, _1833, _1837);
    float _1841 = rsqrt(_1839);
    float _1843 = sqrt(_1839);
    float _1845 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1847 = _1829 * _1845;
    float _1849 = _1833 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 * _1849;
    float _1855 = _1851 + _1853;
    float _1857 = sqrt(_1855);
    bool _1859 = _1857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1863 = _1857 + _1861;
    float _1865 = _1833;
    float _1867 = _1841;
    float _1869 = _1863;
    float _1871 = _1819;
    float _1873 = _1825;
    if (_1859)
    {
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1859)
    {
        float _1879 = rsqrt(_1855);
        _1867 = _1879;
    }
    float _1881 = _1867;
    float _1883 = _1881;
    if (_1859)
    {
        float _1885 = _1863 * _1877;
        _1869 = _1885;
    }
    float _1887 = _1869;
    if (_1859)
    {
        float _1889 = _1887 * 0.15915493667125701904296875;
        _1871 = _1889;
    }
    float _1891 = _1871;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = _1877;
    float _1897 = _1891;
    if (_1859)
    {
        float _1899 = _1891 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        _1895 = _1901;
    }
    float _1903 = _1895;
    float _1905 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1907 = precise::max(0.0, _1905);
    float _1909 = _1835;
    float _1911 = _1907;
    if (_1859)
    {
        float _1913 = _1891 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = -_1845;
    float _1921 = -_1907;
    float _1923 = fma(_1825, _1919, _1921);
    if (_1859)
    {
        float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1925;
    }
    float _1927 = _1911;
    float _1929 = _1903;
    float _1931 = _1927;
    if (_1859)
    {
        float _1933 = fma(_1903, _1927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1873 = _1933;
    }
    float _1935 = _1873;
    float _1937 = _1935;
    if (!_1859)
    {
        _1929 = _1847;
    }
    float _1939 = _1929;
    float _1941 = _1939;
    float _1943 = _1917;
    if (_1859)
    {
        float _1945 = _1917 + (-1.0);
        _1931 = _1945;
    }
    float _1947 = _1931;
    float _1949 = _1947;
    if (_1859)
    {
        float _1951 = _1881 * _1935;
        _1617 = _1951;
    }
    float _1953 = _1617;
    if (!_1859)
    {
        _1937 = _1923;
    }
    float _1955 = _1937;
    float _1957 = _1955;
    if (_1859)
    {
        float _1959 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1959;
    }
    float _1961 = _1897;
    if (_1859)
    {
        float _1963 = _1847 * _1953;
        _1941 = _1963;
    }
    float _1965 = _1941;
    if (!_1859)
    {
        _1949 = _1849;
    }
    float _1967 = _1949;
    float _1969 = _1967;
    if (_1859)
    {
        float _1971 = _1849 * _1953;
        _1969 = _1971;
    }
    float _1973 = _1969;
    if (!_1859)
    {
        _1883 = _1851;
    }
    float _1975 = _1883;
    float _1977 = _1975;
    if (_1859)
    {
        float _1979 = fma(_1923, _1917, _1961);
        _1957 = _1979;
    }
    float _1981 = _1957;
    if (_1859)
    {
        float _1983 = _1965 * _1965;
        _1977 = _1983;
    }
    float _1985 = _1977;
    if (!_1859)
    {
        _1943 = _1853;
    }
    float _1987 = _1943;
    float _1989 = _1987;
    if (_1859)
    {
        float _1991 = _1973 * _1973;
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1997 = fma(_1981, _1981, _1985);
    float _1999 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2001 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2003 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1995);
    float _2005 = _1997 + _1993;
    float _2007 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1999);
    float _2011 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2015 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2013);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    float _2019 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2021 = rsqrt(_2005);
    float _2023 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2009);
    float _2027 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2019);
    float _2029 = -_2017;
    float _2031 = _2029 + 1.0;
    float _2033 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2001);
    float _2035 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2037 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2041 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2033);
    float _2043 = abs(_2031);
    float _2045 = log2(_2043);
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2049 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2039);
    float _2051 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = -_2047;
    float _2055 = fma(_2053, _1893, 1.0);
    float _2057 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2049);
    float _2059 = _2021 * _1965;
    float _2061 = _2021 * _1981;
    float _2063 = _2021 * _1973;
    float _2065 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2057);
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = log2(_2055);
    float _2071 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2073 = -_2067;
    float _2075 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2073);
    float _2077 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2079 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2071);
    float _2081 = -_2063;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2075);
    float _2085 = 1.0 / _2065;
    float _2087 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2089 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2079);
    float _2091 = fma(_2083, -0.5, 0.5);
    float _2093 = fma(_2083, 0.5, 0.5);
    float _2095 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2087);
    float _2097 = _2061 + 1.0;
    float _2099 = exp2(_2077);
    float _2101 = fma(_2093, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2103 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2095);
    float _2105 = _2069 * 0.693147182464599609375;
    float _2107 = fma(_2093, _2101, -0.212114393711090087890625);
    float _2109 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2103);
    float _2111 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2089);
    float _2113 = sqrt(_2091);
    float _2115 = fma(_2093, _2107, 1.570728778839111328125);
    float _2117 = _2109 * _2085;
    float _2119 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2121 = fma(_2117, 0.5, 0.5);
    float _2123 = -_2061;
    float _2125 = fma(_2099, _2097, _2123);
    float _2127 = _2111 * _2085;
    float _2129 = fma(_2127, -0.5, 0.5);
    float _2131 = _2113 * 0.636619746685028076171875;
    float _2133 = -_2115;
    float _2135 = fma(_2131, _2133, 1.0);
    float _2137 = fma(_2125, 0.5, 0.5);
    float3 _7297 = float3(_2121, _2129, _2119);
    float _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7297, float3(0.0), isnan(_7297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7297, float3(0.0), isnan(_7297)), level(0.0)).x;
    float3 _7308 = float3(_2121, _2129, _2119);
    float4 _2142 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7308, float3(0.0), isnan(_7308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7308, float3(0.0), isnan(_7308)), level(0.0)).xyzw;
    float _2144 = _2142.x;
    float _2146 = _2142.y;
    float _2148 = _2142.z;
    float _2150 = _2142.w;
    float2 _7325 = float2(_2135, _2137);
    float3 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7325, float2(0.0), isnan(_7325)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7325, float2(0.0), isnan(_7325)), level(0.0)).xyz;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2164 = int(_2162);
    int _2166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2168 = _2166 != 0;
    float _2170 = -_1225;
    float _2172 = _2170 + 1.0;
    int _2174 = abs(_1523);
    out.m_68.x = _1511;
    out.m_68.y = _1547;
    out.m_68.z = _1517;
    int _2176 = abs(_1541);
    float _2178 = -_1445;
    float _2180 = fma(_1441, _1471, _2178);
    bool _2182 = _347 > 0.5;
    float _2184 = trunc(_1219);
    int _2186 = int(_2184);
    out.m_70.w = _1079;
    float _2188 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2190 = -_1217;
    float _2192 = _2190 + 1.0;
    float _2194 = -_1231;
    float _2196 = _2194 + 1.0;
    out.m_72.x = _1363;
    float _2198 = float(uint(_2164));
    float _2200 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2202 = int(_2200);
    bool _2204 = _2164 == 0;
    out.m_74.x = _1757;
    out.m_74.y = _1755;
    out.m_74.z = _1759;
    float _2206 = float(uint(_2186));
    float _2208 = 1.0 / _2198;
    float _2210 = float(uint(_2202));
    float _2212 = trunc(_1229);
    int _2214 = int(_2212);
    int _2216 = ~_2164;
    int _2218 = _2216 + 1;
    int _2220 = ~_2202;
    int _2222 = _2220 + 1;
    int _2224 = ~_2202;
    int _2226 = _2224 + 1;
    int _2228 = as_type<int>(_2208) + (-2);
    float _2230 = 1.0 / _2210;
    float _2232 = _2065;
    float _2234 = _2111;
    float _2236 = _2109;
    if (_751)
    {
        _1249 = 1.0;
    }
    float _2238 = _1249;
    float _2240 = _2238;
    if (!_751)
    {
        _2240 = 7.345489978790283203125;
    }
    float _2242 = _2240;
    float _2244 = as_type<float>(_2228) * _2206;
    float _2246 = float(uint(_2214));
    float _2248 = _2242 * _171;
    float _2250 = trunc(_2244);
    float _2252 = precise::max(_2250, 0.0);
    uint _2255 = uint(_2252);
    int _2257 = as_type<int>(_2230) + (-2);
    float _2259 = _2230;
    if (_751)
    {
        _2259 = 1.0;
    }
    float _2261 = _2259;
    float _2263 = floor(_2248);
    float _2265 = _2261;
    if (!_751)
    {
        _2265 = 1.2345600128173828125;
    }
    float _2267 = _2265;
    float _2269 = as_type<float>(_2257) * _2246;
    int _2271 = _2218 * int(_2255);
    int _2273 = _2271 + _2186;
    float _2275 = trunc(_2269);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = float(uint(_2273));
    float _2283 = -_2263;
    float _2285 = _2248 + _2283;
    float _2287 = as_type<float>(_2228) * _2281;
    float _2289 = _2281;
    if (_751)
    {
        _2289 = _171;
    }
    float _2291 = _2289;
    float _2293 = exp2(_2188);
    float _2295 = _2291;
    if (!_751)
    {
        _2295 = _347;
    }
    float _2297 = _2295;
    int _2299 = _2164 + (-1);
    int _2301 = _2222 * int(_2279);
    int _2303 = _2301 + _2214;
    float _2305 = _2267 * _2297;
    float _2307 = float(_2186);
    float _2309 = trunc(_2287);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    bool _2315 = _353 > 0.5;
    float _2317 = float(uint(_2303));
    float _2319 = as_type<float>(_2257) * _2317;
    int _2321 = ~_2164;
    int _2323 = _2321 + 1;
    float _2325 = floor(_2305);
    float _2327 = -_2293;
    float _2329 = _2327 + 1.0;
    int _2331 = int(_2255) + int(_2313);
    float _2333 = trunc(_2319);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    float _2339 = float(_2164);
    int _2341 = _2323 * _2331;
    int _2343 = _2341 + _2186;
    bool _2345 = _2307 >= _2339;
    bool _2347 = isnan(_2307);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(_2339);
    bool _2353 = _2349 || _2351;
    float _2355 = float(_2353);
    float _2357 = -_2325;
    float _2359 = _2305 + _2357;
    float _2361 = _2285 * _2339;
    bool _2363 = uint(_2343) >= uint(_2164);
    float _2365 = _2339 * _1131;
    float _2367 = trunc(_2355);
    int _2369 = int(_2367);
    float _2371 = float(_2202);
    bool _2373 = !_2363;
    int _2375 = _2373 ? 0 : (-1);
    int _2377 = int(_2279) + int(_2337);
    float _2379 = _2359 * _2371;
    int _2381 = ~_2331;
    int _2383 = _2381 + _2375;
    int _2385 = _2383 + 1;
    float _2387 = trunc(_2361);
    int _2389 = int(_2387);
    float _2391 = float(_2214);
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2395 = _2393 != 0;
    int _2397 = _2164 * _2385;
    int _2399 = _2397 + _2186;
    bool _2401 = _2391 >= _2371;
    bool _2403 = isnan(_2391);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan(_2371);
    bool _2409 = _2405 || _2407;
    float _2411 = float(_2409);
    float _2413 = trunc(_2365);
    int _2415 = int(_2413);
    int _2417 = ~_2369;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    int _2423 = _2226 * _2377;
    int _2425 = _2423 + _2214;
    bool _2427 = !_2204;
    int _2429 = _2427 ? _2399 : (-1);
    bool _2431 = !_2395;
    int _2433 = _2431 ? 0 : 1;
    bool _2435 = uint(_2425) >= uint(_2202);
    int _2437 = _2429 * _2421;
    float _2439 = trunc(_2411);
    int _2441 = int(_2439);
    int _2443 = abs(_2433);
    int _2445 = _2369 * _2299;
    int _2447 = _2445 + _2437;
    int _2449 = abs(_639);
    float _2451 = _2371 * _1131;
    bool _2453 = !_2435;
    int _2455 = _2453 ? 0 : (-1);
    int _2457 = _2389 * _2443;
    int _2459 = _2457 + _2186;
    int _2461 = abs(_645);
    int _2463 = _2447 * _2449;
    int _2465 = ~_2377;
    int _2467 = _2465 + _2455;
    int _2469 = _2467 + 1;
    float _2471 = trunc(_2451);
    int _2473 = int(_2471);
    bool _2475 = _2202 == 0;
    int _2477 = _2415 * _2461;
    int _2479 = _2477 + _2463;
    int _2481 = abs(_651);
    int _2483 = _2202 * _2469;
    int _2485 = _2483 + _2214;
    bool _2487 = !_2168;
    int _2489 = _2487 ? 0 : 1;
    int _2491 = ~_2441;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    float _2497 = trunc(_2379);
    int _2499 = int(_2497);
    int _2501 = abs(_2489);
    int _2503 = _2459 * _2481;
    int _2505 = _2503 + _2479;
    bool _2507 = !_2475;
    int _2509 = _2507 ? _2485 : (-1);
    int _2511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2513 = _2511 != 0;
    int _2515 = _2509 * _2495;
    bool _2517 = !_2513;
    int _2519 = _2517 ? 0 : 1;
    int _2521 = _2202 + (-1);
    int _2523 = _2389 * _2501;
    int _2525 = _2523 + _2505;
    int _2527 = abs(_2519);
    int _2529 = _2441 * _2521;
    int _2531 = _2529 + _2515;
    float _2533 = float(uint(_2525));
    int _2535 = _2531 * _2174;
    int _2537 = abs(_1477);
    int _2539 = _2499 * _2527;
    int _2541 = _2539 + _2214;
    int _2543 = abs(_1555);
    float _2545 = as_type<float>(_2228) * _2533;
    float _2547 = float(uint(_2459));
    int _2549 = _2473 * _2537;
    int _2551 = _2549 + _2535;
    int _2553 = ~_2164;
    int _2555 = _2553 + 1;
    float _2557 = trunc(_2545);
    float _2559 = precise::max(_2557, 0.0);
    uint _2561 = uint(_2559);
    int _2563 = ~_2202;
    int _2565 = _2563 + 1;
    int _2567 = _2541 * _2176;
    int _2569 = _2567 + _2551;
    int _2571 = ~_2164;
    int _2573 = _2571 + 1;
    int _2575 = _2499 * _2543;
    int _2577 = _2575 + _2569;
    float _2579 = as_type<float>(_2228) * _2547;
    float _2581 = float(uint(_2577));
    float _2583 = trunc(_2579);
    float _2585 = precise::max(_2583, 0.0);
    uint _2587 = uint(_2585);
    int _2589 = _2555 * int(_2561);
    int _2591 = _2589 + _2525;
    float _2593 = as_type<float>(_2257) * _2581;
    int _2595 = ~_2164;
    int _2597 = _2595 + 1;
    float _2599 = float(uint(_2591));
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = as_type<float>(_2228) * _2599;
    int _2609 = _2597 * int(_2587);
    int _2611 = _2609 + _2459;
    float _2613 = trunc(_2607);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    float _2619 = float(uint(_2611));
    int _2621 = _2565 * int(_2605);
    int _2623 = _2621 + _2577;
    float _2625 = as_type<float>(_2228) * _2619;
    int _2627 = ~_2164;
    int _2629 = _2627 + 1;
    float _2631 = float(uint(_2623));
    int _2633 = int(_2561) + int(_2617);
    float _2635 = as_type<float>(_2257) * _2631;
    float _2637 = trunc(_2625);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    int _2643 = _2573 * _2633;
    int _2645 = _2643 + _2525;
    bool _2647 = uint(_2645) >= uint(_2164);
    float _2649 = trunc(_2635);
    float _2651 = precise::max(_2649, 0.0);
    uint _2653 = uint(_2651);
    bool _2655 = !_2647;
    int _2657 = _2655 ? 0 : (-1);
    int _2659 = ~_2633;
    int _2661 = _2659 + _2657;
    int _2663 = _2661 + 1;
    int _2665 = int(_2587) + int(_2641);
    int _2667 = ~_2202;
    int _2669 = _2667 + 1;
    int _2671 = _2164 * _2663;
    int _2673 = _2671 + _2525;
    int _2675 = int(_2605) + int(_2653);
    int _2677 = _2629 * _2665;
    int _2679 = _2677 + _2459;
    bool _2681 = !_2204;
    int _2683 = _2681 ? _2673 : (-1);
    float _2685 = float(uint(_2541));
    int _2687 = _2669 * _2675;
    int _2689 = _2687 + _2577;
    bool _2691 = uint(_2679) >= uint(_2164);
    int _2693 = _2683 & 3;
    bool _2695 = _2693 != 0;
    float _2697 = as_type<float>(_2257) * _2685;
    int _2699 = _2683 & 3;
    bool _2701 = _2699 != 0;
    bool _2703 = !_2691;
    int _2705 = _2703 ? 0 : (-1);
    int _2707 = _2695 ? 0 : 1;
    float _2709 = trunc(_2697);
    float _2711 = precise::max(_2709, 0.0);
    uint _2713 = uint(_2711);
    bool _2715 = uint(_2699) >= 2u;
    bool _2717 = uint(_2689) >= uint(_2202);
    int _2719 = _2715 ? 0 : 1;
    bool _2721 = !_2717;
    int _2723 = _2721 ? 0 : (-1);
    bool _2725 = uint(_2699) > 1u;
    bool _2727 = _2699 != 3;
    int _2729 = ~_2675;
    int _2731 = _2729 + _2723;
    int _2733 = _2731 + 1;
    int _2735 = ~_2665;
    int _2737 = _2735 + _2705;
    int _2739 = _2737 + 1;
    int _2741 = ~_2719;
    int _2743 = _2741 + 1;
    int _2745 = _2743 + 1;
    int _2747 = _2202 * _2733;
    int _2749 = _2747 + _2577;
    int _2751 = ~_2202;
    int _2753 = _2751 + 1;
    int _2755 = _2164 * _2739;
    int _2757 = _2755 + _2459;
    int _2759 = ~_2707;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    float _2765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2767 = _2763;
    int _2769 = _2745;
    if (!_2725)
    {
        int _2771 = ~_2707;
        int _2773 = _2771 + 1;
        _2767 = _2773;
    }
    int _2775 = _2767;
    int _2777 = _2753 * int(_2713);
    int _2779 = _2777 + _2541;
    if (_2727)
    {
        int _2781 = ~_2719;
        int _2783 = _2781 + 1;
        _2769 = _2783;
    }
    int _2785 = _2769;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2789 = _2787 != 0;
    bool _2791 = !_2475;
    int _2793 = _2791 ? _2749 : (-1);
    bool _2795 = !_2789;
    int _2797 = _2795 ? 0 : 1;
    int _2799 = _2793 & 3;
    bool _2801 = _2799 != 0;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2805 = _2803 != 0;
    bool _2807 = !_2204;
    int _2809 = _2807 ? _2757 : (-1);
    bool _2811 = uint(_2799) > 1u;
    float _2813 = float(uint(_2779));
    bool _2815 = !_2805;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2793 & 3;
    bool _2821 = _2819 != 0;
    float _2823 = as_type<float>(_2257) * _2813;
    bool _2825 = !_2701;
    int _2827 = _2825 ? 0 : 1;
    int _2829 = _2821 ? 0 : 1;
    float _2831 = trunc(_2823);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    bool _2837 = _171 > 0.5;
    int _2839 = ~_2829;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2843;
    if (!_2811)
    {
        int _2847 = ~_2829;
        int _2849 = _2847 + 1;
        _2845 = _2849;
    }
    int _2851 = _2845;
    float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2855 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2857 = _2855 != 0;
    int _2859 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2861 = _2859 != 0;
    int _2863 = _2683 >> 31;
    int _2865 = _2793 >> 31;
    int _2867 = _2863 & 3;
    int _2869 = _2865 & 3;
    int _2871 = _2683 + _2867;
    float _2873 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2875 = !_2801;
    int _2877 = _2875 ? 0 : 1;
    float _2879 = _441 + (-0.5);
    bool _2881 = _2699 != 3;
    float _2883 = _2853 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2885 = _2793 + _2869;
    float _2887 = _449 + 0.5;
    int _2889 = _2871 >> 2;
    float _2891 = -_2883;
    float _2893 = -_1237;
    float _2895 = fma(_2891, _2879, _2893);
    bool _2897 = !_2881;
    int _2899 = _2897 ? 0 : (-1);
    float _2901 = fma(_2873, _2887, _1209);
    bool _2903 = uint(_2799) >= 2u;
    float _2905 = fma(_441, _2172, _2895);
    int _2907 = _2885 >> 2;
    int _2909 = _2889 << 4;
    int _2911 = _2909 + 368;
    float _2913 = -_1221;
    float _2915 = _2913 + 1.0;
    int _2917 = int(_2713) + int(_2835);
    int _2919 = ~_2202;
    int _2921 = _2919 + 1;
    uint _2923 = uint(int(uint(_2911) >> uint(2)));
    uint _2925 = uint(int(uint(int(_2923)) >> uint(2)));
    int _2927 = int(_2923) & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = int(_2923) + 1;
    uint _2933 = uint(int(uint(_2931) >> uint(2)));
    int _2935 = _2931 & 3;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[int(_2933)][_2935];
    int _2939 = _2903 ? 0 : 1;
    float _2941 = -_2915;
    float _2943 = fma(_449, _2941, _2901);
    bool _2945 = _2799 != 3;
    int _2947 = _2921 * _2917;
    int _2949 = _2947 + _2541;
    int _2951 = _2907 << 4;
    int _2953 = _2951 + 512;
    bool _2955 = !_2945;
    int _2957 = _2955 ? 0 : (-1);
    int _2959 = _2911 + 8;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    uint _2963 = uint(int(uint(int(_2961)) >> uint(2)));
    int _2965 = int(_2961) & 3;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[int(_2963)][_2965];
    int _2969 = int(_2961) + 1;
    uint _2971 = uint(int(uint(_2969) >> uint(2)));
    int _2973 = _2969 & 3;
    float _2975 = (*spvDescriptorSet0.vp_c9)._m0[int(_2971)][_2973];
    bool _2977 = _2799 != 3;
    out.m_76.x = _2943;
    out.m_76.y = _2905;
    int _2979 = ~_2939;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    uint _2985 = uint(int(uint(_2953) >> uint(2)));
    uint _2987 = uint(int(uint(int(_2985)) >> uint(2)));
    int _2989 = int(_2985) & 3;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[int(_2987)][_2989];
    int _2993 = int(_2985) + 1;
    uint _2995 = uint(int(uint(_2993) >> uint(2)));
    int _2997 = _2993 & 3;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[int(_2995)][_2997];
    int _3001 = abs(_2851);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _3007 = _3003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3009 = _2983;
    if (_2977)
    {
        int _3011 = ~_2939;
        int _3013 = _3011 + 1;
        _3009 = _3013;
    }
    int _3015 = _3009;
    int _3017 = _2953 + 8;
    uint _3019 = uint(int(uint(_3017) >> uint(2)));
    uint _3021 = uint(int(uint(int(_3019)) >> uint(2)));
    int _3023 = int(_3019) & 3;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[int(_3021)][_3023];
    int _3027 = int(_3019) + 1;
    uint _3029 = uint(int(uint(_3027) >> uint(2)));
    int _3031 = _3027 & 3;
    float _3033 = (*spvDescriptorSet0.vp_c9)._m0[int(_3029)][_3031];
    bool _3035 = uint(_2949) >= uint(_2202);
    float _3037 = _3005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3043 = abs(_2775);
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3047 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3051 = _3041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3053 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3055 = abs(_2827);
    float _3057 = _3049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3059 = !_3035;
    int _3061 = _3059 ? 0 : (-1);
    out.m_78.x = _3007;
    out.m_78.y = _3037;
    out.m_78.z = _3053;
    int _3063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3065 = _3063 != 0;
    float _3067 = _1389 * _1425;
    float _3069 = fma(_1441, _1429, _1443);
    out.m_80.x = _3047;
    out.m_80.y = _3051;
    out.m_80.z = _3057;
    int _3071 = ~_3055;
    int _3073 = _3071 + 1;
    int _3075 = _3073 + 1;
    int _3077 = abs(_2785);
    int _3079 = ~_2917;
    int _3081 = _3079 + _3061;
    int _3083 = _3081 + 1;
    float _3085 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3087 = int(_3085);
    int _3089 = ~_3043;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    int _3095 = _2202 * _3083;
    int _3097 = _3095 + _2541;
    int _3099 = ~_3001;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    int _3105 = abs(_2877);
    int _3107 = _3093 * as_type<int>(_2937);
    int _3109 = abs(_2899);
    float _3111 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3113 = int(_3111);
    int _3115 = ~_3105;
    int _3117 = _3115 + 1;
    int _3119 = _3117 + 1;
    int _3121 = _3103 * as_type<int>(_2999);
    int _3123 = abs(_3015);
    int _3125 = _3075 * as_type<int>(_2929);
    int _3127 = _3125 + _3107;
    int _3129 = ~_3077;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = _3119 * as_type<int>(_2991);
    int _3137 = _3135 + _3121;
    int _3139 = ~_3109;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    int _3145 = ~_3123;
    int _3147 = _3145 + 1;
    int _3149 = _3147 + 1;
    int _3151 = _3133 * as_type<int>(_2967);
    int _3153 = _3151 + _3127;
    float _3155 = float(uint(_3087));
    int _3157 = abs(_3087);
    int _3159 = _3143 * as_type<int>(_2975);
    int _3161 = _3159 + _3153;
    int _3163 = abs(_2957);
    int _3165 = _3149 * as_type<int>(_3025);
    int _3167 = _3165 + _3137;
    float _3169 = float(uint(_3113));
    float _3171 = 1.0 / _3155;
    int _3173 = abs(_2797);
    float _3175 = _2180 * _1373;
    int _3177 = abs(_2817);
    int _3179 = abs(_3113);
    int _3181 = ~_3177;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    float _3187 = 1.0 / _3169;
    int _3189 = ~_3163;
    int _3191 = _3189 + 1;
    int _3193 = _3191 + 1;
    int _3195 = ~_3173;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = float(uint(_3157));
    int _3203 = _3193 * as_type<int>(_3033);
    int _3205 = _3203 + _3167;
    bool _3207 = !_2475;
    int _3209 = _3207 ? _3097 : (-1);
    int _3211 = _3161 * _3199;
    float _3213 = float(uint(_3179));
    int _3215 = _3205 * _3185;
    float _3217 = 1.0 / _3201;
    int _3219 = _2809 * _3173;
    int _3221 = _3219 + _3211;
    int _3223 = as_type<int>(_3171) + (-2);
    int _3225 = _3209 * _3177;
    int _3227 = _3225 + _3215;
    float _3229 = _1479 * _1391;
    int _3231 = as_type<int>(_3187) + (-2);
    float _3233 = _1479 * _1379;
    float _3235 = float(uint(_3221));
    float _3237 = 1.0 / _3213;
    float _3239 = float(uint(_3227));
    float _3241 = _1465 * _1391;
    int _3243 = abs(_3227);
    float _3245 = as_type<float>(_3223) * _3235;
    int _3247 = abs(_3221);
    float _3249 = as_type<float>(_3231) * _3239;
    float _3251 = _1479 * _1373;
    float _3253 = trunc(_3245);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = _1465 * _1379;
    float _3261 = _1465 * _1373;
    float _3263 = float(uint(_3243));
    float _3265 = _2180 * _1391;
    int _3267 = as_type<int>(_3217) + (-2);
    float _3269 = _2180 * _1379;
    float _3271 = float(uint(_3247));
    float _3273 = trunc(_3249);
    float _3275 = precise::max(_3273, 0.0);
    uint _3277 = uint(_3275);
    int _3279 = as_type<int>(_3237) + (-2);
    float _3281 = -_1441;
    float _3283 = fma(_3281, _1503, _3241);
    int _3285 = ~_3087;
    int _3287 = _3285 + 1;
    float _3289 = as_type<float>(_3267) * _3271;
    float _3291 = -_1441;
    float _3293 = fma(_3291, _1505, _3259);
    float _3295 = as_type<float>(_3279) * _3263;
    float _3297 = -_1441;
    float _3299 = fma(_3297, _1499, _3261);
    int _3301 = ~_3113;
    int _3303 = _3301 + 1;
    float _3305 = trunc(_3289);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = fma(_1467, _1505, _3233);
    int _3313 = _3287 * int(_3257);
    int _3315 = _3313 + _3221;
    float _3317 = fma(_3067, _1505, _3269);
    int _3319 = ~_3157;
    int _3321 = _3319 + 1;
    float _3323 = fma(_1467, _1499, _3251);
    int _3325 = ~_3179;
    int _3327 = _3325 + 1;
    float _3329 = fma(_3067, _1499, _3175);
    float _3331 = trunc(_3295);
    float _3333 = precise::max(_3331, 0.0);
    uint _3335 = uint(_3333);
    float _3337 = float(uint(_3315));
    int _3339 = _3303 * int(_3277);
    int _3341 = _3339 + _3227;
    float _3343 = fma(_1467, _1503, _3229);
    float _3345 = fma(_3067, _1503, _3265);
    float _3347 = fma(_1469, _859, _3293);
    float _3349 = as_type<float>(_3223) * _3337;
    float _3351 = float(uint(_3341));
    int _3353 = _3321 * int(_3309);
    int _3355 = _3353 + _3247;
    float _3357 = fma(_1469, _689, _3283);
    float _3359 = trunc(_3349);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    float _3365 = fma(_1469, _737, _3299);
    float _3367 = as_type<float>(_3231) * _3351;
    float _3369 = float(uint(_3355));
    float _3371 = fma(_3069, _689, _3345);
    float _3373 = -_213;
    int _3375 = _2182 ? as_type<int>(_3373) : as_type<int>(_213);
    int _3377 = _3327 * int(_3335);
    int _3379 = _3377 + _3243;
    float _3381 = -_323;
    int _3383 = _2315 ? as_type<int>(_3381) : as_type<int>(_323);
    float _3385 = trunc(_3367);
    float _3387 = precise::max(_3385, 0.0);
    uint _3389 = uint(_3387);
    float _3391 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3393 = as_type<float>(_3267) * _3369;
    float _3395 = float(uint(_3379));
    float _3397 = fma(_1487, _689, _3343);
    bool _3399 = !_2861;
    float _3401 = _3399 ? _213 : as_type<float>(_3375);
    float _3403 = fma(_3069, _859, _3317);
    float _3405 = -_323;
    int _3407 = _2837 ? as_type<int>(_3405) : as_type<int>(_323);
    float _3409 = fma(_1487, _859, _3311);
    bool _3411 = !_3065;
    float _3413 = _3411 ? _323 : as_type<float>(_3383);
    float _3415 = fma(_1487, _737, _3323);
    float _3417 = _323 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3419 = _3391 * _3357;
    float _3421 = as_type<float>(_3279) * _3395;
    float _3423 = trunc(_3393);
    float _3425 = precise::max(_3423, 0.0);
    uint _3427 = uint(_3425);
    float _3429 = _3391 * _3347;
    bool _3431 = !_2857;
    float _3433 = _3431 ? _323 : as_type<float>(_3407);
    float _3435 = fma(_3417, _3397, _3419);
    float _3437 = fma(_3069, _737, _3329);
    float _3439 = fma(_3417, _3409, _3429);
    int _3441 = ~_3113;
    int _3443 = _3441 + 1;
    out.m_82.x = _3397;
    out.m_82.y = _3409;
    out.m_82.z = _3415;
    int _3445 = int(_3277) + int(_3389);
    float _3447 = trunc(_3421);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = ~_3087;
    int _3455 = _3453 + 1;
    int _3457 = int(_3257) + int(_3363);
    int _3459 = ~_3157;
    int _3461 = _3459 + 1;
    int _3463 = int(_3309) + int(_3427);
    int _3465 = ~_3179;
    int _3467 = _3465 + 1;
    int _3469 = _3443 * _3445;
    int _3471 = _3469 + _3227;
    bool _3473 = _3113 == 0;
    int _3475 = _3455 * _3457;
    int _3477 = _3475 + _3221;
    int _3479 = _3461 * _3463;
    int _3481 = _3479 + _3247;
    bool _3483 = uint(_3471) >= uint(_3113);
    float _3485 = _3391 * _3365;
    bool _3487 = uint(_3477) >= uint(_3087);
    int _3489 = int(_3335) + int(_3451);
    float _3491 = fma(_3417, _3415, _3485);
    bool _3493 = !_3483;
    int _3495 = _3493 ? 0 : (-1);
    float _3497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3499 = !_3487;
    int _3501 = _3499 ? 0 : (-1);
    int _3503 = _3467 * _3489;
    int _3505 = _3503 + _3243;
    int _3507 = ~_3445;
    int _3509 = _3507 + _3495;
    int _3511 = _3509 + 1;
    bool _3513 = uint(_3481) >= uint(_3157);
    int _3515 = ~_3457;
    int _3517 = _3515 + _3501;
    int _3519 = _3517 + 1;
    float _3521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3523 = _3221 ^ _3087;
    int _3525 = _3113 * _3511;
    int _3527 = _3525 + _3227;
    bool _3529 = !_3513;
    int _3531 = _3529 ? 0 : (-1);
    uint _3533 = uint(int(uint(_3523) >> uint(31)));
    int _3535 = _3087 * _3519;
    int _3537 = _3535 + _3221;
    bool _3539 = _3087 == 0;
    float _3541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3543 = _3087 == 0;
    bool _3545 = uint(_3505) >= uint(_3179);
    int _3547 = _3227 ^ _3113;
    float _3549 = _3413 + 0.5;
    int _3551 = ~_3531;
    int _3553 = _3463 + _3551;
    int _3555 = _3553 + 1;
    float _3557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3559 = ~int(_3533);
    int _3561 = _3559 + 1;
    float _3563 = _3521 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3565 = !_3545;
    int _3567 = _3565 ? 0 : (-1);
    uint _3569 = uint(int(uint(_3547) >> uint(31)));
    bool _3571 = _3113 == 0;
    int _3573 = _3555 ^ _3561;
    int _3575 = ~_3567;
    int _3577 = _3489 + _3575;
    int _3579 = _3577 + 1;
    float _3581 = fma(_3391, _3391, 1.0);
    int _3583 = ~int(_3569);
    int _3585 = _3583 + 1;
    int _3587 = ~_3561;
    int _3589 = _3587 + _3573;
    int _3591 = _3589 + 1;
    float _3593 = _3497 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3595 = _3579 ^ _3585;
    float _3597 = rsqrt(_3581);
    bool _3599 = !_3473;
    int _3601 = _3599 ? _3527 : (-1);
    bool _3603 = !_3539;
    int _3605 = _3603 ? _3537 : (-1);
    int _3607 = ~_3585;
    int _3609 = _3607 + _3595;
    int _3611 = _3609 + 1;
    float _3613 = _3433 + 0.5;
    float _3615 = float(_3601);
    float _3617 = float(_3605);
    bool _3619 = !_3571;
    int _3621 = _3619 ? _3611 : (-1);
    float _3623 = fma(_3563, _3615, _1185);
    float _3625 = _3557 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3627 = fma(_3593, _3617, _1137);
    float _3629 = float(_3621);
    float _3631 = _3541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3633 = !_3543;
    int _3635 = _3633 ? _3591 : (-1);
    float _3637 = fma(_3593, _3613, _3627);
    float _3639 = _1437 + (-0.5);
    float _3641 = -_1227;
    float _3643 = fma(_3631, _3629, _3641);
    float _3645 = float(_3635);
    float _3647 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3649 = _3391 * _3597;
    float _3651 = fma(_3563, _3549, _3623);
    float _3653 = -_423;
    float _3655 = fma(_3625, _3645, _3653);
    float _3657 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3647);
    float _3659 = _3401 + (-0.5);
    float _3661 = -_3631;
    float _3663 = fma(_3661, _3639, _3643);
    float _3665 = -_3403;
    float _3667 = _3649 * _3665;
    float _3669 = -_3371;
    float _3671 = _3649 * _3669;
    float _3673 = -_3625;
    float _3675 = fma(_3673, _3659, _3655);
    float _3677 = -_3437;
    float _3679 = _3649 * _3677;
    float _3681 = fma(_3597, _3347, _3667);
    float _3683 = _2065 * 0.5;
    float _3685 = fma(_3597, _3357, _3671);
    float _3687 = -_1223;
    float _3689 = _3687 + 1.0;
    float _3691 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3657);
    float _3693 = fma(_2111, -0.5, _3683);
    float _3695 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3697 = -_3689;
    float _3699 = fma(_3433, _3697, _3637);
    float _3701 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3691);
    float _3703 = -_1201;
    float _3705 = _3703 + 1.0;
    float _3707 = _3695 * _2139;
    float _3709 = -_2192;
    float _3711 = fma(_3413, _3709, _3651);
    float _3713 = _3371 + _3435;
    float _3715 = -_3695;
    float _3717 = _3715 + 1.0;
    float _3719 = _3701 + _2065;
    float _3721 = _2109 + _2065;
    float _3723 = _2150 * _3707;
    float _3725 = _2160 * _3707;
    float _3727 = fma(_3401, _3705, _3675);
    float _3729 = _2150 * _3717;
    float _3731 = fma(_1437, _2196, _3663);
    float _3733 = _3719 * 0.5;
    float _3735 = _3721 * 0.5;
    float _3737 = _3403 + _3439;
    float _3739 = _3437 + _3491;
    float _3741 = fma(_2156, _3723, _2144);
    float _3743 = fma(_2158, _3723, _2146);
    float _3745 = fma(_2150, _3725, _2148);
    out.m_84.x = _3699;
    out.m_84.y = _3727;
    out.m_84.z = _3711;
    out.m_84.w = _3731;
    bool _3747 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3749 = isnan(_1843);
    bool _3751 = _3747 || _3749;
    bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3755 = _3751 || _3753;
    float _3757 = fma(_3597, _3365, _3679);
    out.m_86.x = _3735;
    out.m_86.y = _3693;
    out.m_86.z = _3733;
    out.m_86.w = _2065;
    out.m_88.x = _3741;
    out.m_88.y = _3743;
    out.m_88.z = _3745;
    out.m_88.w = _3729;
    out.m_90.x = _3713;
    out.m_90.y = _3737;
    out.m_90.z = _3739;
    float _3759 = _3723;
    float _3761 = _3685;
    float _3763 = _3701;
    if (!_3755)
    {
        _3759 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3765 = _3759;
    out.m_92.x = _3685;
    out.m_92.y = _3681;
    out.m_92.z = _3757;
    out.gl_Position.x = _2109;
    out.gl_Position.y = _2111;
    out.gl_Position.z = _3701;
    out.gl_Position.w = _2065;
    float _3767 = _1821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3769 = _3765;
    float _3771 = _3765;
    if (!_3755)
    {
        _3761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3773 = _3761;
    float _3775 = _3773;
    float _3777 = _3773;
    if (!_3755)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3779 = _2232;
    float _3781 = _3779;
    float _3783 = _3779;
    if (!_3755)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3785 = _3763;
    float _3787 = _3785;
    float _3789 = _3785;
    if (!_3755)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3791 = _2234;
    float _3793 = _3791;
    float _3795 = _3791;
    if (!_3755)
    {
        _2236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3797 = _2236;
    bool _3799 = !_3755;
    float _3801 = _3797;
    float _3803 = _3797;
    if (!_3799)
    {
        bool _3805 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3807 = isnan(_1843);
        bool _3809 = _3805 || _3807;
        bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3813 = _3809 || _3811;
        if (!_3813)
        {
            float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3817 = _1843 + _3815;
            float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3821 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3819;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3827 = 1.0 / _3821;
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3845 = _3817 * _3827;
            float _3847 = precise::clamp(_3845, 0.0, 1.0);
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3853 = fma(_3847, _3825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3855 = fma(_3847, _3851, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3857 = fma(_3847, _3831, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3859 = fma(_3847, _3835, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3861 = fma(_3847, _3839, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3863 = fma(_3847, _3843, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3783 = _3857;
            _3803 = _3861;
            _3777 = _3853;
            _3795 = _3859;
            _3789 = _3855;
            _3771 = _3863;
            _3865 = true;
        }
        else
        {
            bool _3867 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3869 = isnan(_1843);
            bool _3871 = _3867 || _3869;
            bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3875 = _3871 || _3873;
            if (!_3875)
            {
                _3775 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3877 = _3775;
            _3777 = _3877;
            if (!_3875)
            {
                _3781 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3879 = _3781;
            _3783 = _3879;
            if (!_3875)
            {
                _3787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3881 = _3787;
            _3789 = _3881;
            if (!_3875)
            {
                _3793 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3883 = _3793;
            _3795 = _3883;
            if (!_3875)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3885 = _3801;
            _3803 = _3885;
            if (!_3875)
            {
                _3769 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3887 = _3769;
            bool _3889 = !_3875;
            _3771 = _3887;
            if (!_3889)
            {
                bool _3891 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3893 = isnan(_1843);
                bool _3895 = _3891 || _3893;
                bool _3897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3899 = _3895 || _3897;
                if (!_3899)
                {
                    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3903 = _1843 + _3901;
                    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3907 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3905;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3913 = 1.0 / _3907;
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3917 = _3915 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3921 = _3919 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3923 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3925 = _3923 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3931 = _3903 * _3913;
                    float _3933 = precise::clamp(_3931, 0.0, 1.0);
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3939 = fma(_3933, _3911, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3941 = fma(_3933, _3937, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3943 = fma(_3933, _3917, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3945 = fma(_3933, _3921, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3947 = fma(_3933, _3925, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3949 = fma(_3933, _3929, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3783 = _3943;
                    _3803 = _3947;
                    _3777 = _3939;
                    _3795 = _3945;
                    _3789 = _3941;
                    _3771 = _3949;
                    _3865 = true;
                }
                else
                {
                    _3783 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3777 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3795 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3771 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3865 = false;
    float _3951 = _3783;
    float _3953 = _3803;
    float _3955 = _3777;
    float _3957 = _3795;
    float _3959 = _3789;
    float _3961 = _3771;
    float _3963 = fma(_3737, -0.5, 0.5);
    float _3965 = precise::clamp(_3963, 0.0, 1.0);
    float _3967 = -_3951;
    float _3969 = _3967 + _3953;
    float _3971 = _3767 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3973 = -_3955;
    float _3975 = _3973 + _3957;
    float _3977 = fma(_3965, _3969, _3951);
    out.m_94.x = 0.0;
    float _3979 = -_3959;
    float _3981 = _3979 + _3961;
    float _3983 = fma(_3965, _3975, _3955);
    float _3985 = _3977 * 0.586610972881317138671875;
    out.m_47.x = _3971;
    bool _3987 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3989 = fma(_3965, _3981, _3959);
    float _3991 = fma(_3983, 0.298911988735198974609375, _3985);
    bool _3993 = _1821 > 0.0;
    bool _3995 = isnan(_1821);
    bool _3997 = _3993 || _3995;
    bool _3999 = isnan(0.0);
    bool _4001 = _3997 || _3999;
    float _4003 = fma(_3989, 0.114477999508380889892578125, _3991);
    float _4005 = -_4003;
    float _4007 = _3983 + _4005;
    float _4009 = -_4003;
    float _4011 = _3977 + _4009;
    float _4013 = -_4003;
    float _4015 = _3989 + _4013;
    float _4017 = fma(_4007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    float _4019 = fma(_4011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    float _4021 = fma(_4015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    bool _4023 = !_3987;
    if (!_4023)
    {
        float _4025 = -_1755;
        float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4029 = -_1757;
        float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4033 = -_1759;
        float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4037 = _4027 * _4027;
        float _4039 = fma(_4031, _4031, _4037);
        float _4041 = fma(_4035, _4035, _4039);
        float _4043 = sqrt(_4041);
        float _4045 = rsqrt(_4041);
        float _4047 = -_4043;
        float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4053 = precise::clamp(_4051, 0.0, 1.0);
        float _4055 = _4031 * _4045;
        float _4057 = _4027 * _4045;
        float _4059 = abs(_4053);
        float _4061 = log2(_4059);
        float _4063 = _4035 * _4045;
        float _4065 = _4055 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4067 = _3737 * _4057;
        float _4069 = -_4057;
        float _4071 = -_4065;
        float _4073 = fma(_4069, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4071);
        float _4075 = fma(_3713, _4055, _4067);
        float _4077 = -_4063;
        float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4073);
        float _4081 = fma(_3739, _4063, _4075);
        float _4083 = precise::clamp(_4081, 0.0, 1.0);
        float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4087 = _4079 + _4085;
        float _4089 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4091 = _4087 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4093 = precise::clamp(_4091, 0.0, 1.0);
        float _4095 = exp2(_4089);
        float _4097 = _4095 * _4093;
        float _4099 = _4083 * _4097;
        float _4101 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4103 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4105 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4101;
        out.m_94.y = _4103;
        out.m_94.z = _4105;
    }
    out.m_70.x = _4017;
    out.m_70.y = _4019;
    out.m_70.z = _4021;
    if (_4001)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4107 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4107;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3865 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4163 = as_type<float>(_127);
        out.gl_Position.z = _4163;
    }
    if (!_117)
    {
        return out;
    }
    float _131 = in.m_49.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = 1.0 / _133;
    float _157 = _131;
    float _159 = _137;
    if (_153)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _157;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    float _163 = _137 * _155;
    float _165 = _163;
    if (_153)
    {
        float _167 = _161 * 5.0;
        _129 = as_type<int>(_167);
    }
    int _169 = _129;
    out.m_51.x = _163;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4236 = as_type<float>(_169);
        out.gl_Position.z = _4236;
    }
    if (_153)
    {
        return out;
    }
    float _171 = in.m_53.x;
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _181 = _175 * _173;
    float _183 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _187 = _183 * _179;
    float _189 = floor(_185);
    float _191 = _185 * 6.283185482025146484375;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].y, _187);
    int _195 = as_type<int>(_177) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_177) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = floor(_193);
    bool _211 = !_201;
    float _213 = _211 ? (-0.5) : 0.5;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _221 = _219 != 0;
    float _223 = _203 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_189;
    float _229 = _185 + _227;
    float _231 = _193 * 6.283185482025146484375;
    float _233 = _231 * 0.15915493667125701904296875;
    bool _235 = !_207;
    int _237 = _235 ? 0 : 1;
    float _239 = -_209;
    float _241 = _193 + _239;
    bool _243 = !_217;
    int _245 = _243 ? 0 : 1;
    float _247 = -_229;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _251 = _229 < 0.5;
    float _253 = float(_251);
    float _255 = _233 * 6.283185482025146484375;
    float _257 = cos(_255);
    int _259 = abs(_245);
    bool _261 = !_221;
    int _263 = _261 ? 0 : 1;
    float _265 = fma(_225, 0.5, 0.5);
    float _267 = -_253;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _277 = abs(_263);
    float _279 = float(_259);
    float _281 = -_241;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _285 = _241 < 0.5;
    float _287 = float(_285);
    float _289 = fma(_257, 0.5, 0.5);
    int _291 = abs(_237);
    float _293 = abs(_249);
    float _295 = _279 * _293;
    float _297 = float(_291);
    float _299 = -_287;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _303 = -_289;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _307 = abs(_283);
    float _309 = _279 * _307;
    float _311 = float(_277);
    float _313 = fma(_297, _275, _295);
    float _315 = fma(_297, _305, _309);
    float _317 = abs(_269);
    float _319 = fma(_311, _317, _313);
    bool _321 = !_197;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = abs(_301);
    float _327 = fma(_311, _325, _315);
    bool _329 = !_271;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _165 = _343;
    }
    float _345 = _165;
    float _347 = in.m_53.y;
    float _349 = _171 * 2.0;
    float _351 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _353 = in.m_53.z;
    float _355 = floor(_349);
    float _357 = in.m_44.x;
    float _359 = in.m_44.y;
    float _361 = in.m_44.z;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _365 = _363 != 0;
    float _367 = in.m_58.x;
    float _369 = in.m_58.y;
    float _371 = in.m_58.z;
    float _373 = in.m_58.w;
    float _375 = in.m_60.x;
    float _377 = in.m_60.y;
    float _379 = in.m_60.z;
    float _381 = in.m_60.w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _385 = in.m_62.x;
    float _387 = in.m_62.y;
    float _389 = in.m_62.z;
    float _391 = in.m_62.w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _395 = _347 * 2.0;
    bool _397 = _347 > 0.5;
    float _399 = _347 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _401 = -_393;
    float _403 = fma(_351, 2.0, _401);
    bool _405 = _353 > 0.5;
    float _407 = fma(_399, -2.0, _383);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _415 = _413 != 0;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _419 = _417 != 0;
    float _421 = floor(_395);
    float _423 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _407);
    float _425 = _359 * _369;
    float _427 = -_213;
    int _429 = _405 ? as_type<int>(_427) : as_type<int>(_213);
    float _431 = fma(_357, _367, _425);
    float _433 = -_323;
    int _435 = _397 ? as_type<int>(_433) : as_type<int>(_323);
    float _437 = _359 * _377;
    bool _439 = !_419;
    float _441 = _439 ? _213 : as_type<float>(_429);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _443;
    bool _447 = !_415;
    float _449 = _447 ? _323 : as_type<float>(_435);
    float _451 = fma(_357, _375, _437);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _463 = _461 != 0;
    float _465 = 1.0 / _445;
    bool _467 = _355 >= 0.0;
    bool _469 = isnan(_355);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = _359 * _387;
    int _485 = _475 ? 0 : 1;
    float _487 = -_477;
    float _489 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _487);
    bool _491 = _355 > 0.0;
    float _493 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _495 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _497 = 1.0 / _481;
    float _499 = fma(_361, _371, _431);
    float _501 = -_493;
    float _503 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _501);
    float _505 = -_495;
    float _507 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _345 + _509;
    int _513 = ~_485;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _171 + _347;
    float _521 = fma(_357, _385, _483);
    float _523 = _511 * _465;
    int _525 = as_type<int>(_511);
    int _527 = _517;
    float _529 = _373;
    float _531 = _391;
    float _533 = _499;
    if (_365)
    {
        _525 = 0;
    }
    int _535 = _525;
    float _537 = _519 + (-1.0);
    int _539 = _535;
    if (!_491)
    {
        int _541 = ~_485;
        int _543 = _541 + 1;
        _527 = _543;
    }
    int _545 = _527;
    float _547 = fma(_361, _389, _521);
    bool _549 = _421 > 0.0;
    float _551 = fma(_361, _379, _451);
    bool _553 = _421 >= 0.0;
    bool _555 = isnan(_421);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _565 = _345 + _563;
    float _567 = _547;
    if (!_365)
    {
        _539 = 1;
    }
    int _569 = _539;
    float _571 = _551 + _381;
    float _573 = _565 * _497;
    int _575 = _561 ? 0 : 1;
    float _577 = _499 + _373;
    bool _579 = _569 != 1;
    float _581 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = _547 + _391;
    int _585 = ~_575;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    float _591 = -_577;
    float _593 = _591 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _595 = _589;
    if (!_549)
    {
        int _597 = ~_575;
        int _599 = _597 + 1;
        _595 = _599;
    }
    int _601 = _595;
    float _603 = -_583;
    float _605 = _603 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _607 = _353 * 2.0;
    float _609 = -_571;
    float _611 = _609 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _613 = _605 * _605;
    float _615 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _617 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _619 = floor(_607);
    float _621 = fma(_593, _593, _613);
    float _623 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    if (!_579)
    {
        _529 = _347;
    }
    float _625 = _529;
    float _627 = -_617;
    float _629 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _627);
    float _631 = fma(_611, _611, _621);
    float _633 = -_623;
    float _635 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _633);
    bool _637 = !_459;
    int _639 = _637 ? 0 : 1;
    float _641 = rsqrt(_631);
    bool _643 = !_455;
    int _645 = _643 ? 0 : 1;
    float _647 = _353 + _347;
    bool _649 = !_463;
    int _651 = _649 ? 0 : 1;
    float _653 = -_615;
    float _655 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _653);
    float _657 = _625;
    float _659 = _629;
    if (!_579)
    {
        _567 = _353;
    }
    float _661 = _567;
    float _663 = _647 + (-1.0);
    float _665 = _661;
    if (!_579)
    {
        _531 = _353;
    }
    float _667 = _531;
    float _669 = _507 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _671 = _667;
    if (!_579)
    {
        _533 = _625;
    }
    float _673 = _533;
    float _675 = _507 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _677 = _673;
    if (_579)
    {
        _677 = _171;
    }
    float _679 = _677;
    float _681 = _507 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_579)
    {
        _657 = _171;
    }
    float _683 = _657;
    float _685 = _489 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    if (_579)
    {
        _665 = _347;
    }
    float _687 = _665;
    float _689 = _593 * _641;
    if (_579)
    {
        _671 = _347;
    }
    float _691 = _671;
    float _693 = -_685;
    float _695 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[0].y, _693);
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _707 = _705 != 0;
    float _709 = _689 * _689;
    bool _711 = _619 > 0.0;
    float _713 = -_675;
    float _715 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[0].x, _713);
    bool _717 = _619 >= 0.0;
    bool _719 = isnan(_619);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = fma(_729, _523, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _737 = _611 * _641;
    float _739 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _741 = !_703;
    int _743 = _741 ? 0 : 1;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _745;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _751 = _749 != 0;
    float _753 = fma(_737, _737, _709);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _759 = fma(_747, _523, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _761 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _763 = isnan(_345);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = rsqrt(_753);
    float _775 = fma(_733, _573, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_757, _573, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _779 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _781 = isnan(_345);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_771;
    float _793 = _791 + 1.0;
    bool _795 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _797 = isnan(_345);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[0].w, _715);
    int _809 = _725 ? 0 : 1;
    float _811 = _789 * _793;
    int _813 = 0;
    if (_751)
    {
        _813 = 0;
    }
    int _815 = _813;
    float _817 = -_789;
    float _819 = _817 + 1.0;
    int _821 = _815;
    if (!_751)
    {
        _821 = 2;
    }
    int _823 = _821;
    float _825 = -_669;
    float _827 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _825);
    float _829 = _629 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _831 = _805 * _819;
    bool _833 = _823 != 2;
    float _835 = _507 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _837 = _737 * _773;
    float _839 = _489 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _841 = _735 * _831;
    float _843 = _759 * _831;
    float _845 = _689 * _773;
    float _847 = -_837;
    float _849 = _737 * _847;
    float _851 = -_835;
    float _853 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[1].x, _851);
    float _855 = -_839;
    float _857 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[1].y, _855);
    float _859 = _605 * _641;
    float _861 = -_849;
    float _863 = fma(_689, _845, _861);
    float _865 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[1].w, _853);
    float _867 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[1].w, _857);
    float _869 = _859 * _845;
    float _871 = _863 * _863;
    float _873 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _875 = -_681;
    float _877 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _875);
    float _879 = -_829;
    float _881 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[1].x, _879);
    float _883 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[0].w, _695);
    float _885 = fma(_869, _869, _871);
    float _887 = -_837;
    float _889 = _859 * _887;
    float _891 = -_873;
    float _893 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _891);
    float _895 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[1].w, _827);
    float _897 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[1].z, _881);
    float _899 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[0].w, _877);
    float _901 = fma(_889, _889, _885);
    float _903 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[0].z, _893);
    float _905 = in.m_64.x;
    float _907 = in.m_64.y;
    float _909 = -_805;
    float _911 = _909 + 1.0;
    float _913 = rsqrt(_901);
    float _915 = -_897;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].w, _903);
    float _919 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[143].x, _841);
    if (_833)
    {
        _659 = _171;
    }
    float _921 = _659;
    float _923 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _927 = 1.0 / _917;
    float _929 = fma(_775, _811, _919);
    float _931 = _921;
    if (!_833)
    {
        _931 = _353;
    }
    float _933 = _931;
    float _935 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[83].z, _925);
    float _937 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[145].x, _929);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _943 = _863 * _913;
    float _945 = precise::clamp(_943, 0.0, 1.0);
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _951 = _583 + _949;
    float _953 = -_939;
    float _955 = fma(_941, 2.0, _953);
    float _957 = -_945;
    float _959 = _957 + 1.0;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _577 + _961;
    float _965 = _937 * _905;
    float _967 = -_947;
    float _969 = fma(_923, 2.0, _967);
    float _971 = fma(_807, _927, -1.0);
    float _973 = _959 * _927;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _977 = _571 + _975;
    float _979 = fma(_959, _971, 1.0);
    float _981 = _951 * _951;
    float _983 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _985 = log2(_983);
    float _987 = _883 * _973;
    float _989 = _899 * _973;
    float _991 = fma(_963, _963, _981);
    float _993 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _995 = _979 * _979;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _999 = fma(_977, _977, _991);
    bool _1001 = !_699;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = fma(_987, _987, _995);
    float _1007 = fma(_993, -2.0, _997);
    float _1009 = sqrt(_999);
    int _1011 = abs(_743);
    float _1013 = fma(_989, _989, _1005);
    int _1015 = abs(_1003);
    float _1017 = _319 * _965;
    float _1019 = _985 * _137;
    int _1021 = ~_809;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = rsqrt(_1013);
    float _1029 = float(_545);
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1033 = _1025;
    float _1035 = _995;
    if (!_711)
    {
        int _1037 = ~_809;
        int _1039 = _1037 + 1;
        _1033 = _1039;
    }
    int _1041 = _1033;
    float _1043 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[143].y, _843);
    float _1045 = float(_1041);
    float _1047 = exp2(_1019);
    float _1049 = float(_1015);
    float _1051 = _1031 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1053 = fma(_777, _811, _1043);
    if (_833)
    {
        _1035 = _347;
    }
    float _1055 = _1035;
    float _1057 = _1049 * _1045;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1061 = int(_1059);
    float _1063 = _1055;
    if (!_833)
    {
        _1063 = _171;
    }
    float _1065 = _1063;
    float _1067 = _1009 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1069 = _989 * _1027;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1073 = float(_1011);
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1079 = precise::min(_1051, _1067);
    float _1081 = _979 * _1027;
    float _1083 = _987 * _1027;
    float _1085 = -_1069;
    float _1087 = _689 * _1085;
    float _1089 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1071);
    float _1091 = fma(_1077, -2.0, _1075);
    float _1093 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1095 = int(_1093);
    float _1097 = _1073 * _1029;
    float _1099 = _737 * _1081;
    float _1101 = -_1083;
    float _1103 = _859 * _1101;
    float _1105 = -_1083;
    float _1107 = -_1087;
    float _1109 = fma(_737, _1105, _1107);
    float _1111 = -_1047;
    float _1113 = _1111 + 1.0;
    bool _1115 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1123 = _1119 || _1121;
    float _1125 = -_1069;
    float _1127 = -_1099;
    float _1129 = fma(_859, _1125, _1127);
    float _1131 = _155 * _137;
    float _1133 = _1123 ? _1113 : 0.0;
    float _1135 = -_137;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[76].x, _403);
    float _1139 = float(_1061);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1143 = in.m_66.x;
    float _1145 = in.m_66.y;
    float _1147 = in.m_66.z;
    float _1149 = _1109 * _1109;
    float _1151 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1141);
    float _1153 = float(_1095);
    float _1155 = rsqrt(_999);
    bool _1157 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(1.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1169 = 1.0 + _1167;
    float _1171 = -_1103;
    float _1173 = fma(_689, _1081, _1171);
    float _1175 = fma(_1129, _1129, _1149);
    float _1177 = _1057 * (-2.0);
    float _1179 = 1.0 / _1153;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1183 = -_137;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _969);
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1189 = float(_601);
    float _1191 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1181);
    float _1193 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1053);
    float _1195 = 1.0 / _1139;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1199 = _1155 * _1079;
    float _1201 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1191);
    float _1203 = fma(_1177, _1143, _1143);
    float _1205 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1197);
    float _1207 = -_137;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[86].x, _955);
    float _1211 = _951 * _1199;
    float _1213 = 1.0 / _1169;
    float _1215 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1187);
    float _1217 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _935);
    float _1219 = _1179 * _137;
    float _1221 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1205);
    float _1223 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1215);
    float _1225 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1151);
    float _1227 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1007);
    float _1229 = _1195 * _137;
    float _1231 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1233 = fma(_1173, _1173, _1175);
    float _1235 = _171 + (-0.5);
    float _1237 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1091);
    float _1239 = fma(_581, _1177, _581);
    float _1241 = -_1211;
    float _1243 = _951 + _1241;
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1203);
    float _1247 = rsqrt(_1233);
    float _1249 = _1229;
    if (_1165)
    {
        float _1251 = _1133 * _1213;
        _159 = _1251;
    }
    float _1253 = _159;
    float _1255 = _963 * _1199;
    float _1257 = _1097 * (-2.0);
    float _1259 = _1243 * _1243;
    float _1261 = fma(_1239, _1253, _1245);
    float _1263 = -_1255;
    float _1265 = _963 + _1263;
    float _1267 = _977 * _1199;
    float _1269 = fma(_739, _1257, _739);
    float _1271 = fma(_1257, _1145, _1145);
    float _1273 = fma(_1265, _1265, _1259);
    float _1275 = -_1267;
    float _1277 = _977 + _1275;
    bool _1279 = !_707;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = _1261 * 0.15915493667125701904296875;
    float _1285 = _1193 * _907;
    float _1287 = fma(_1277, _1277, _1273);
    float _1289 = _1129 * _1247;
    float _1291 = _1173 * _1247;
    int _1293 = abs(_1281);
    float _1295 = _1109 * _1247;
    float _1297 = _737 * _1289;
    float _1299 = _859 * _1291;
    float _1301 = _347 + (-0.5);
    float _1303 = sqrt(_1287);
    float _1305 = -_1297;
    float _1307 = fma(_689, _1291, _1305);
    float _1309 = -_1299;
    float _1311 = fma(_737, _1295, _1309);
    float _1313 = _689 * _1295;
    float _1315 = _1307 * _1307;
    float _1317 = float(_1293);
    float _1319 = _327 * _1285;
    float _1321 = -_1313;
    float _1323 = fma(_859, _1289, _1321);
    float _1325 = fma(_1311, _1311, _1315);
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1271);
    float _1329 = _171 + _353;
    float _1331 = _1317 * _1189;
    float _1333 = fma(_1323, _1323, _1325);
    float _1335 = fma(_1269, _1253, _1327);
    float _1337 = _1329 + (-1.0);
    float _1339 = _1331 * (-2.0);
    float _1341 = _1155 * _1303;
    float _1343 = rsqrt(_1333);
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1347 = fma(_1339, _1147, _1147);
    float _1349 = _353 + (-0.5);
    float _1351 = _1335 * 0.15915493667125701904296875;
    float _1353 = fma(_1345, _1339, _1345);
    float _1355 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1357 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1347);
    float _1359 = _1283 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = _1031 * _1341;
    float _1365 = _1355 * _1341;
    float _1367 = fma(_1353, _1253, _1357);
    float _1369 = in.m_53.w;
    float _1371 = _1367 * 0.15915493667125701904296875;
    float _1373 = _1323 * _1343;
    float _1375 = _1283 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1307 * _1343;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1383 = _689 * _1373;
    float _1385 = _737 * _1379;
    float _1387 = _1351 * 6.283185482025146484375;
    float _1389 = sin(_1387);
    float _1391 = _1311 * _1343;
    float _1393 = -_1385;
    float _1395 = fma(_859, _1373, _1393);
    float _1397 = -_1383;
    float _1399 = fma(_737, _1391, _1397);
    float _1401 = _859 * _1391;
    float _1403 = _1365 * _1381;
    float _1405 = _1351 * 6.283185482025146484375;
    float _1407 = cos(_1405);
    float _1409 = _1399 * _1399;
    float _1411 = -_1401;
    float _1413 = fma(_689, _1379, _1411);
    float _1415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    bool _1417 = _1369 > 0.5;
    float _1419 = fma(_1395, _1395, _1409);
    float _1421 = _1363 * _1415;
    float _1423 = _1371 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = fma(_1413, _1413, _1419);
    float _1429 = _1361 * _1389;
    float _1431 = -_213;
    int _1433 = _1417 ? as_type<int>(_1431) : as_type<int>(_213);
    bool _1435 = !_411;
    float _1437 = _1435 ? _213 : as_type<float>(_1433);
    float _1439 = _1371 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = _1377 * _1407;
    float _1445 = _1361 * _1407;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1449 = _1447 != 0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1453 = _1451 != 0;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1457 = _1455 != 0;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1461 = _1459 != 0;
    float _1463 = rsqrt(_1427);
    float _1465 = _1377 * _1425;
    float _1467 = _1407 * _1425;
    float _1469 = _1361 * _1425;
    float _1471 = _1377 * _1389;
    float _1473 = _1465 * _1403;
    bool _1475 = !_1449;
    int _1477 = _1475 ? 0 : 1;
    float _1479 = fma(_1441, _1443, _1429);
    float _1481 = -_1403;
    float _1483 = _1441 * _1481;
    float _1485 = -_1471;
    float _1487 = fma(_1441, _1445, _1485);
    float _1489 = _1469 * _1403;
    float _1491 = fma(_1479, _1421, _1473);
    float _1493 = fma(_1467, _1421, _1483);
    float _1495 = fma(_1487, _1421, _1489);
    float _1497 = _1491 * _1373;
    float _1499 = _1413 * _1463;
    float _1501 = _1491 * _1391;
    float _1503 = _1395 * _1463;
    float _1505 = _1399 * _1463;
    float _1507 = fma(_1493, _1499, _1497);
    float _1509 = -_1255;
    float _1511 = _577 + _1509;
    float _1513 = fma(_1493, _1503, _1501);
    float _1515 = -_1267;
    float _1517 = _571 + _1515;
    float _1519 = fma(_737, _1495, _1507);
    bool _1521 = !_1453;
    int _1523 = _1521 ? 0 : 1;
    float _1525 = fma(_689, _1495, _1513);
    bool _1527 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    float _1537 = _571 + _1519;
    bool _1539 = !_1457;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = _577 + _1525;
    float _1545 = -_1211;
    float _1547 = _583 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1537 + _1549;
    bool _1553 = !_1461;
    int _1555 = _1553 ? 0 : 1;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1559 = _1543 + _1557;
    float _1561 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1563 = _1551 * _1551;
    float _1565 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1561);
    float _1567 = fma(_1559, _1559, _1563);
    float _1569 = _1491 * _1379;
    float _1571 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1573 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1565);
    float _1575 = sqrt(_1567);
    float _1577 = fma(_1493, _1505, _1569);
    float _1579 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1571);
    float _1581 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1583 = fma(_859, _1495, _1577);
    float _1585 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1579);
    float _1587 = 1.0 / _1581;
    float _1589 = _583 + _1583;
    float _1591 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1593 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan(0.5);
    bool _1601 = _1597 || _1599;
    float _1603 = _1591 + _1581;
    bool _1605 = _1575 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1609 = _1591;
    float _1611 = _1495;
    float _1613 = _1589;
    float _1615 = _1267;
    float _1617 = _1537;
    if (!_1605)
    {
        _1607 = _1543;
    }
    float _1619 = _1607;
    float _1621 = _1619;
    if (!_1605)
    {
        _1609 = _1537;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (!_1605)
    {
        _1611 = _1589;
    }
    float _1627 = _1611;
    bool _1629 = !_1605;
    float _1631 = _1627;
    if (!_1629)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1637 = _1575 + _1635;
        float _1639 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = rsqrt(_1567);
        float _1643 = _1637 * _1633;
        float _1645 = _1643 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1645 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1649 + (-1.0);
        float _1657 = fma(_1653, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1659 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1661 = _1641 * _1657;
        float _1663 = fma(_1589, _1649, _1659);
        float _1665 = fma(_1559, _1661, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1667 = fma(_1551, _1661, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1621 = _1665;
        _1625 = _1667;
        _1631 = _1663;
    }
    float _1669 = _1621;
    float _1671 = _1625;
    float _1673 = _1631;
    float _1675 = -_1255;
    float _1677 = _1675 + _1669;
    float _1679 = -_1267;
    float _1681 = _1679 + _1671;
    float _1683 = -_1211;
    float _1685 = _1683 + _1673;
    float _1687 = _1603 * _1587;
    float _1689 = _1687 * 0.5;
    float _1691 = _1685;
    float _1693 = _1681;
    float _1695 = _1669;
    if (_1601)
    {
        _1613 = 1.0;
    }
    float _1697 = _1613;
    float _1699 = _1697;
    if (_1535)
    {
        _1615 = _1677;
    }
    float _1701 = _1615;
    float _1703 = _1701;
    if (!_1535)
    {
        float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1707 = _1547 + _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1711 = _1511 + _1709;
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1715 = -_571;
        float _1717 = _1715 + _1671;
        float _1719 = _1707 * _1707;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1723 = _1517 + _1721;
        float _1725 = fma(_1711, _1711, _1719);
        float _1727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1729 = fma(_1723, _1723, _1725);
        float _1731 = sqrt(_1729);
        float _1733 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1735 = -_583;
        float _1737 = _1735 + _1673;
        float _1739 = precise::min(_1731, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1741 = _1739 * _1727;
        float _1743 = -_577;
        float _1745 = _1743 + _1669;
        float _1747 = _1733 * _1741;
        float _1749 = fma(_1745, _1747, _1511);
        float _1751 = fma(_1737, _1747, _1547);
        float _1753 = fma(_1717, _1747, _1517);
        _1691 = _1751;
        _1703 = _1749;
        _1693 = _1753;
    }
    float _1755 = _1691;
    float _1757 = _1703;
    float _1759 = _1693;
    if (!_1601)
    {
        float _1761 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1765 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1763);
        float _1767 = _1761 * 0.15915493667125701904296875;
        float _1769 = _1767 * 6.283185482025146484375;
        float _1771 = cos(_1769);
        float _1773 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1775 = _1773 * 0.15915493667125701904296875;
        float _1777 = _1767 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = 1.0 / _1771;
        float _1783 = _1775 * 6.283185482025146484375;
        float _1785 = cos(_1783);
        float _1787 = _1779 * _1781;
        float _1789 = 1.0 / _1765;
        float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1793 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1791;
        float _1795 = _1785 * _1787;
        float _1797 = _1775 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = 1.0 / _1795;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1805 = _1789 * _1803;
        float _1807 = 1.0 / _1793;
        float _1809 = _1799 * _1801;
        float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1813 = fma(_1809, _1805, _1811);
        float _1815 = _1813 * _1807;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        _1695 = _1787;
        _1699 = _1817;
    }
    float _1819 = _1695;
    float _1821 = _1699;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1825 = _1755 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1829 = _1757 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1833 = _1759 + _1831;
    float _1835 = _1825 * _1825;
    float _1837 = fma(_1829, _1829, _1835);
    float _1839 = fma(_1833, _1833, _1837);
    float _1841 = rsqrt(_1839);
    float _1843 = sqrt(_1839);
    float _1845 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1847 = _1829 * _1845;
    float _1849 = _1833 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 * _1849;
    float _1855 = _1851 + _1853;
    float _1857 = sqrt(_1855);
    bool _1859 = _1857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1863 = _1857 + _1861;
    float _1865 = _1833;
    float _1867 = _1841;
    float _1869 = _1863;
    float _1871 = _1819;
    float _1873 = _1825;
    if (_1859)
    {
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1859)
    {
        float _1879 = rsqrt(_1855);
        _1867 = _1879;
    }
    float _1881 = _1867;
    float _1883 = _1881;
    if (_1859)
    {
        float _1885 = _1863 * _1877;
        _1869 = _1885;
    }
    float _1887 = _1869;
    if (_1859)
    {
        float _1889 = _1887 * 0.15915493667125701904296875;
        _1871 = _1889;
    }
    float _1891 = _1871;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = _1877;
    float _1897 = _1891;
    if (_1859)
    {
        float _1899 = _1891 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        _1895 = _1901;
    }
    float _1903 = _1895;
    float _1905 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1907 = precise::max(0.0, _1905);
    float _1909 = _1835;
    float _1911 = _1907;
    if (_1859)
    {
        float _1913 = _1891 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = -_1845;
    float _1921 = -_1907;
    float _1923 = fma(_1825, _1919, _1921);
    if (_1859)
    {
        float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1925;
    }
    float _1927 = _1911;
    float _1929 = _1903;
    float _1931 = _1927;
    if (_1859)
    {
        float _1933 = fma(_1903, _1927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1873 = _1933;
    }
    float _1935 = _1873;
    float _1937 = _1935;
    if (!_1859)
    {
        _1929 = _1847;
    }
    float _1939 = _1929;
    float _1941 = _1939;
    float _1943 = _1917;
    if (_1859)
    {
        float _1945 = _1917 + (-1.0);
        _1931 = _1945;
    }
    float _1947 = _1931;
    float _1949 = _1947;
    if (_1859)
    {
        float _1951 = _1881 * _1935;
        _1617 = _1951;
    }
    float _1953 = _1617;
    if (!_1859)
    {
        _1937 = _1923;
    }
    float _1955 = _1937;
    float _1957 = _1955;
    if (_1859)
    {
        float _1959 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1959;
    }
    float _1961 = _1897;
    if (_1859)
    {
        float _1963 = _1847 * _1953;
        _1941 = _1963;
    }
    float _1965 = _1941;
    if (!_1859)
    {
        _1949 = _1849;
    }
    float _1967 = _1949;
    float _1969 = _1967;
    if (_1859)
    {
        float _1971 = _1849 * _1953;
        _1969 = _1971;
    }
    float _1973 = _1969;
    if (!_1859)
    {
        _1883 = _1851;
    }
    float _1975 = _1883;
    float _1977 = _1975;
    if (_1859)
    {
        float _1979 = fma(_1923, _1917, _1961);
        _1957 = _1979;
    }
    float _1981 = _1957;
    if (_1859)
    {
        float _1983 = _1965 * _1965;
        _1977 = _1983;
    }
    float _1985 = _1977;
    if (!_1859)
    {
        _1943 = _1853;
    }
    float _1987 = _1943;
    float _1989 = _1987;
    if (_1859)
    {
        float _1991 = _1973 * _1973;
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1997 = fma(_1981, _1981, _1985);
    float _1999 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2001 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2003 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1995);
    float _2005 = _1997 + _1993;
    float _2007 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1999);
    float _2011 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2015 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2013);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    float _2019 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2021 = rsqrt(_2005);
    float _2023 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2009);
    float _2027 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2019);
    float _2029 = -_2017;
    float _2031 = _2029 + 1.0;
    float _2033 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2001);
    float _2035 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2037 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2041 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2033);
    float _2043 = abs(_2031);
    float _2045 = log2(_2043);
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2049 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2039);
    float _2051 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = -_2047;
    float _2055 = fma(_2053, _1893, 1.0);
    float _2057 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2049);
    float _2059 = _2021 * _1965;
    float _2061 = _2021 * _1981;
    float _2063 = _2021 * _1973;
    float _2065 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2057);
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = log2(_2055);
    float _2071 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2073 = -_2067;
    float _2075 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2073);
    float _2077 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2079 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2071);
    float _2081 = -_2063;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2075);
    float _2085 = 1.0 / _2065;
    float _2087 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2089 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2079);
    float _2091 = fma(_2083, -0.5, 0.5);
    float _2093 = fma(_2083, 0.5, 0.5);
    float _2095 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2087);
    float _2097 = _2061 + 1.0;
    float _2099 = exp2(_2077);
    float _2101 = fma(_2093, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2103 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2095);
    float _2105 = _2069 * 0.693147182464599609375;
    float _2107 = fma(_2093, _2101, -0.212114393711090087890625);
    float _2109 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2103);
    float _2111 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2089);
    float _2113 = sqrt(_2091);
    float _2115 = fma(_2093, _2107, 1.570728778839111328125);
    float _2117 = _2109 * _2085;
    float _2119 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2121 = fma(_2117, 0.5, 0.5);
    float _2123 = -_2061;
    float _2125 = fma(_2099, _2097, _2123);
    float _2127 = _2111 * _2085;
    float _2129 = fma(_2127, -0.5, 0.5);
    float _2131 = _2113 * 0.636619746685028076171875;
    float _2133 = -_2115;
    float _2135 = fma(_2131, _2133, 1.0);
    float _2137 = fma(_2125, 0.5, 0.5);
    float3 _7297 = float3(_2121, _2129, _2119);
    float _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7297, float3(0.0), isnan(_7297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7297, float3(0.0), isnan(_7297)), level(0.0)).x;
    float3 _7308 = float3(_2121, _2129, _2119);
    float4 _2142 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7308, float3(0.0), isnan(_7308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7308, float3(0.0), isnan(_7308)), level(0.0)).xyzw;
    float _2144 = _2142.x;
    float _2146 = _2142.y;
    float _2148 = _2142.z;
    float _2150 = _2142.w;
    float2 _7325 = float2(_2135, _2137);
    float3 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7325, float2(0.0), isnan(_7325)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7325, float2(0.0), isnan(_7325)), level(0.0)).xyz;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2164 = int(_2162);
    int _2166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2168 = _2166 != 0;
    float _2170 = -_1225;
    float _2172 = _2170 + 1.0;
    int _2174 = abs(_1523);
    out.m_68.x = _1511;
    out.m_68.y = _1547;
    out.m_68.z = _1517;
    int _2176 = abs(_1541);
    float _2178 = -_1445;
    float _2180 = fma(_1441, _1471, _2178);
    bool _2182 = _347 > 0.5;
    float _2184 = trunc(_1219);
    int _2186 = int(_2184);
    out.m_70.w = _1079;
    float _2188 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2190 = -_1217;
    float _2192 = _2190 + 1.0;
    float _2194 = -_1231;
    float _2196 = _2194 + 1.0;
    out.m_72.x = _1363;
    float _2198 = float(uint(_2164));
    float _2200 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2202 = int(_2200);
    bool _2204 = _2164 == 0;
    out.m_74.x = _1757;
    out.m_74.y = _1755;
    out.m_74.z = _1759;
    float _2206 = float(uint(_2186));
    float _2208 = 1.0 / _2198;
    float _2210 = float(uint(_2202));
    float _2212 = trunc(_1229);
    int _2214 = int(_2212);
    int _2216 = ~_2164;
    int _2218 = _2216 + 1;
    int _2220 = ~_2202;
    int _2222 = _2220 + 1;
    int _2224 = ~_2202;
    int _2226 = _2224 + 1;
    int _2228 = as_type<int>(_2208) + (-2);
    float _2230 = 1.0 / _2210;
    float _2232 = _2065;
    float _2234 = _2111;
    float _2236 = _2109;
    if (_751)
    {
        _1249 = 1.0;
    }
    float _2238 = _1249;
    float _2240 = _2238;
    if (!_751)
    {
        _2240 = 7.345489978790283203125;
    }
    float _2242 = _2240;
    float _2244 = as_type<float>(_2228) * _2206;
    float _2246 = float(uint(_2214));
    float _2248 = _2242 * _171;
    float _2250 = trunc(_2244);
    float _2252 = precise::max(_2250, 0.0);
    uint _2255 = uint(_2252);
    int _2257 = as_type<int>(_2230) + (-2);
    float _2259 = _2230;
    if (_751)
    {
        _2259 = 1.0;
    }
    float _2261 = _2259;
    float _2263 = floor(_2248);
    float _2265 = _2261;
    if (!_751)
    {
        _2265 = 1.2345600128173828125;
    }
    float _2267 = _2265;
    float _2269 = as_type<float>(_2257) * _2246;
    int _2271 = _2218 * int(_2255);
    int _2273 = _2271 + _2186;
    float _2275 = trunc(_2269);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = float(uint(_2273));
    float _2283 = -_2263;
    float _2285 = _2248 + _2283;
    float _2287 = as_type<float>(_2228) * _2281;
    float _2289 = _2281;
    if (_751)
    {
        _2289 = _171;
    }
    float _2291 = _2289;
    float _2293 = exp2(_2188);
    float _2295 = _2291;
    if (!_751)
    {
        _2295 = _347;
    }
    float _2297 = _2295;
    int _2299 = _2164 + (-1);
    int _2301 = _2222 * int(_2279);
    int _2303 = _2301 + _2214;
    float _2305 = _2267 * _2297;
    float _2307 = float(_2186);
    float _2309 = trunc(_2287);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    bool _2315 = _353 > 0.5;
    float _2317 = float(uint(_2303));
    float _2319 = as_type<float>(_2257) * _2317;
    int _2321 = ~_2164;
    int _2323 = _2321 + 1;
    float _2325 = floor(_2305);
    float _2327 = -_2293;
    float _2329 = _2327 + 1.0;
    int _2331 = int(_2255) + int(_2313);
    float _2333 = trunc(_2319);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    float _2339 = float(_2164);
    int _2341 = _2323 * _2331;
    int _2343 = _2341 + _2186;
    bool _2345 = _2307 >= _2339;
    bool _2347 = isnan(_2307);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(_2339);
    bool _2353 = _2349 || _2351;
    float _2355 = float(_2353);
    float _2357 = -_2325;
    float _2359 = _2305 + _2357;
    float _2361 = _2285 * _2339;
    bool _2363 = uint(_2343) >= uint(_2164);
    float _2365 = _2339 * _1131;
    float _2367 = trunc(_2355);
    int _2369 = int(_2367);
    float _2371 = float(_2202);
    bool _2373 = !_2363;
    int _2375 = _2373 ? 0 : (-1);
    int _2377 = int(_2279) + int(_2337);
    float _2379 = _2359 * _2371;
    int _2381 = ~_2331;
    int _2383 = _2381 + _2375;
    int _2385 = _2383 + 1;
    float _2387 = trunc(_2361);
    int _2389 = int(_2387);
    float _2391 = float(_2214);
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2395 = _2393 != 0;
    int _2397 = _2164 * _2385;
    int _2399 = _2397 + _2186;
    bool _2401 = _2391 >= _2371;
    bool _2403 = isnan(_2391);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan(_2371);
    bool _2409 = _2405 || _2407;
    float _2411 = float(_2409);
    float _2413 = trunc(_2365);
    int _2415 = int(_2413);
    int _2417 = ~_2369;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    int _2423 = _2226 * _2377;
    int _2425 = _2423 + _2214;
    bool _2427 = !_2204;
    int _2429 = _2427 ? _2399 : (-1);
    bool _2431 = !_2395;
    int _2433 = _2431 ? 0 : 1;
    bool _2435 = uint(_2425) >= uint(_2202);
    int _2437 = _2429 * _2421;
    float _2439 = trunc(_2411);
    int _2441 = int(_2439);
    int _2443 = abs(_2433);
    int _2445 = _2369 * _2299;
    int _2447 = _2445 + _2437;
    int _2449 = abs(_639);
    float _2451 = _2371 * _1131;
    bool _2453 = !_2435;
    int _2455 = _2453 ? 0 : (-1);
    int _2457 = _2389 * _2443;
    int _2459 = _2457 + _2186;
    int _2461 = abs(_645);
    int _2463 = _2447 * _2449;
    int _2465 = ~_2377;
    int _2467 = _2465 + _2455;
    int _2469 = _2467 + 1;
    float _2471 = trunc(_2451);
    int _2473 = int(_2471);
    bool _2475 = _2202 == 0;
    int _2477 = _2415 * _2461;
    int _2479 = _2477 + _2463;
    int _2481 = abs(_651);
    int _2483 = _2202 * _2469;
    int _2485 = _2483 + _2214;
    bool _2487 = !_2168;
    int _2489 = _2487 ? 0 : 1;
    int _2491 = ~_2441;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    float _2497 = trunc(_2379);
    int _2499 = int(_2497);
    int _2501 = abs(_2489);
    int _2503 = _2459 * _2481;
    int _2505 = _2503 + _2479;
    bool _2507 = !_2475;
    int _2509 = _2507 ? _2485 : (-1);
    int _2511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2513 = _2511 != 0;
    int _2515 = _2509 * _2495;
    bool _2517 = !_2513;
    int _2519 = _2517 ? 0 : 1;
    int _2521 = _2202 + (-1);
    int _2523 = _2389 * _2501;
    int _2525 = _2523 + _2505;
    int _2527 = abs(_2519);
    int _2529 = _2441 * _2521;
    int _2531 = _2529 + _2515;
    float _2533 = float(uint(_2525));
    int _2535 = _2531 * _2174;
    int _2537 = abs(_1477);
    int _2539 = _2499 * _2527;
    int _2541 = _2539 + _2214;
    int _2543 = abs(_1555);
    float _2545 = as_type<float>(_2228) * _2533;
    float _2547 = float(uint(_2459));
    int _2549 = _2473 * _2537;
    int _2551 = _2549 + _2535;
    int _2553 = ~_2164;
    int _2555 = _2553 + 1;
    float _2557 = trunc(_2545);
    float _2559 = precise::max(_2557, 0.0);
    uint _2561 = uint(_2559);
    int _2563 = ~_2202;
    int _2565 = _2563 + 1;
    int _2567 = _2541 * _2176;
    int _2569 = _2567 + _2551;
    int _2571 = ~_2164;
    int _2573 = _2571 + 1;
    int _2575 = _2499 * _2543;
    int _2577 = _2575 + _2569;
    float _2579 = as_type<float>(_2228) * _2547;
    float _2581 = float(uint(_2577));
    float _2583 = trunc(_2579);
    float _2585 = precise::max(_2583, 0.0);
    uint _2587 = uint(_2585);
    int _2589 = _2555 * int(_2561);
    int _2591 = _2589 + _2525;
    float _2593 = as_type<float>(_2257) * _2581;
    int _2595 = ~_2164;
    int _2597 = _2595 + 1;
    float _2599 = float(uint(_2591));
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = as_type<float>(_2228) * _2599;
    int _2609 = _2597 * int(_2587);
    int _2611 = _2609 + _2459;
    float _2613 = trunc(_2607);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    float _2619 = float(uint(_2611));
    int _2621 = _2565 * int(_2605);
    int _2623 = _2621 + _2577;
    float _2625 = as_type<float>(_2228) * _2619;
    int _2627 = ~_2164;
    int _2629 = _2627 + 1;
    float _2631 = float(uint(_2623));
    int _2633 = int(_2561) + int(_2617);
    float _2635 = as_type<float>(_2257) * _2631;
    float _2637 = trunc(_2625);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    int _2643 = _2573 * _2633;
    int _2645 = _2643 + _2525;
    bool _2647 = uint(_2645) >= uint(_2164);
    float _2649 = trunc(_2635);
    float _2651 = precise::max(_2649, 0.0);
    uint _2653 = uint(_2651);
    bool _2655 = !_2647;
    int _2657 = _2655 ? 0 : (-1);
    int _2659 = ~_2633;
    int _2661 = _2659 + _2657;
    int _2663 = _2661 + 1;
    int _2665 = int(_2587) + int(_2641);
    int _2667 = ~_2202;
    int _2669 = _2667 + 1;
    int _2671 = _2164 * _2663;
    int _2673 = _2671 + _2525;
    int _2675 = int(_2605) + int(_2653);
    int _2677 = _2629 * _2665;
    int _2679 = _2677 + _2459;
    bool _2681 = !_2204;
    int _2683 = _2681 ? _2673 : (-1);
    float _2685 = float(uint(_2541));
    int _2687 = _2669 * _2675;
    int _2689 = _2687 + _2577;
    bool _2691 = uint(_2679) >= uint(_2164);
    int _2693 = _2683 & 3;
    bool _2695 = _2693 != 0;
    float _2697 = as_type<float>(_2257) * _2685;
    int _2699 = _2683 & 3;
    bool _2701 = _2699 != 0;
    bool _2703 = !_2691;
    int _2705 = _2703 ? 0 : (-1);
    int _2707 = _2695 ? 0 : 1;
    float _2709 = trunc(_2697);
    float _2711 = precise::max(_2709, 0.0);
    uint _2713 = uint(_2711);
    bool _2715 = uint(_2699) >= 2u;
    bool _2717 = uint(_2689) >= uint(_2202);
    int _2719 = _2715 ? 0 : 1;
    bool _2721 = !_2717;
    int _2723 = _2721 ? 0 : (-1);
    bool _2725 = uint(_2699) > 1u;
    bool _2727 = _2699 != 3;
    int _2729 = ~_2675;
    int _2731 = _2729 + _2723;
    int _2733 = _2731 + 1;
    int _2735 = ~_2665;
    int _2737 = _2735 + _2705;
    int _2739 = _2737 + 1;
    int _2741 = ~_2719;
    int _2743 = _2741 + 1;
    int _2745 = _2743 + 1;
    int _2747 = _2202 * _2733;
    int _2749 = _2747 + _2577;
    int _2751 = ~_2202;
    int _2753 = _2751 + 1;
    int _2755 = _2164 * _2739;
    int _2757 = _2755 + _2459;
    int _2759 = ~_2707;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    float _2765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2767 = _2763;
    int _2769 = _2745;
    if (!_2725)
    {
        int _2771 = ~_2707;
        int _2773 = _2771 + 1;
        _2767 = _2773;
    }
    int _2775 = _2767;
    int _2777 = _2753 * int(_2713);
    int _2779 = _2777 + _2541;
    if (_2727)
    {
        int _2781 = ~_2719;
        int _2783 = _2781 + 1;
        _2769 = _2783;
    }
    int _2785 = _2769;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2789 = _2787 != 0;
    bool _2791 = !_2475;
    int _2793 = _2791 ? _2749 : (-1);
    bool _2795 = !_2789;
    int _2797 = _2795 ? 0 : 1;
    int _2799 = _2793 & 3;
    bool _2801 = _2799 != 0;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2805 = _2803 != 0;
    bool _2807 = !_2204;
    int _2809 = _2807 ? _2757 : (-1);
    bool _2811 = uint(_2799) > 1u;
    float _2813 = float(uint(_2779));
    bool _2815 = !_2805;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2793 & 3;
    bool _2821 = _2819 != 0;
    float _2823 = as_type<float>(_2257) * _2813;
    bool _2825 = !_2701;
    int _2827 = _2825 ? 0 : 1;
    int _2829 = _2821 ? 0 : 1;
    float _2831 = trunc(_2823);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    bool _2837 = _171 > 0.5;
    int _2839 = ~_2829;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2843;
    if (!_2811)
    {
        int _2847 = ~_2829;
        int _2849 = _2847 + 1;
        _2845 = _2849;
    }
    int _2851 = _2845;
    float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2855 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2857 = _2855 != 0;
    int _2859 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2861 = _2859 != 0;
    int _2863 = _2683 >> 31;
    int _2865 = _2793 >> 31;
    int _2867 = _2863 & 3;
    int _2869 = _2865 & 3;
    int _2871 = _2683 + _2867;
    float _2873 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2875 = !_2801;
    int _2877 = _2875 ? 0 : 1;
    float _2879 = _441 + (-0.5);
    bool _2881 = _2699 != 3;
    float _2883 = _2853 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2885 = _2793 + _2869;
    float _2887 = _449 + 0.5;
    int _2889 = _2871 >> 2;
    float _2891 = -_2883;
    float _2893 = -_1237;
    float _2895 = fma(_2891, _2879, _2893);
    bool _2897 = !_2881;
    int _2899 = _2897 ? 0 : (-1);
    float _2901 = fma(_2873, _2887, _1209);
    bool _2903 = uint(_2799) >= 2u;
    float _2905 = fma(_441, _2172, _2895);
    int _2907 = _2885 >> 2;
    int _2909 = _2889 << 4;
    int _2911 = _2909 + 368;
    float _2913 = -_1221;
    float _2915 = _2913 + 1.0;
    int _2917 = int(_2713) + int(_2835);
    int _2919 = ~_2202;
    int _2921 = _2919 + 1;
    uint _2923 = uint(int(uint(_2911) >> uint(2)));
    uint _2925 = uint(int(uint(int(_2923)) >> uint(2)));
    int _2927 = int(_2923) & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = int(_2923) + 1;
    uint _2933 = uint(int(uint(_2931) >> uint(2)));
    int _2935 = _2931 & 3;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[int(_2933)][_2935];
    int _2939 = _2903 ? 0 : 1;
    float _2941 = -_2915;
    float _2943 = fma(_449, _2941, _2901);
    bool _2945 = _2799 != 3;
    int _2947 = _2921 * _2917;
    int _2949 = _2947 + _2541;
    int _2951 = _2907 << 4;
    int _2953 = _2951 + 512;
    bool _2955 = !_2945;
    int _2957 = _2955 ? 0 : (-1);
    int _2959 = _2911 + 8;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    uint _2963 = uint(int(uint(int(_2961)) >> uint(2)));
    int _2965 = int(_2961) & 3;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[int(_2963)][_2965];
    int _2969 = int(_2961) + 1;
    uint _2971 = uint(int(uint(_2969) >> uint(2)));
    int _2973 = _2969 & 3;
    float _2975 = (*spvDescriptorSet0.vp_c9)._m0[int(_2971)][_2973];
    bool _2977 = _2799 != 3;
    out.m_76.x = _2943;
    out.m_76.y = _2905;
    int _2979 = ~_2939;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    uint _2985 = uint(int(uint(_2953) >> uint(2)));
    uint _2987 = uint(int(uint(int(_2985)) >> uint(2)));
    int _2989 = int(_2985) & 3;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[int(_2987)][_2989];
    int _2993 = int(_2985) + 1;
    uint _2995 = uint(int(uint(_2993) >> uint(2)));
    int _2997 = _2993 & 3;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[int(_2995)][_2997];
    int _3001 = abs(_2851);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _3007 = _3003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3009 = _2983;
    if (_2977)
    {
        int _3011 = ~_2939;
        int _3013 = _3011 + 1;
        _3009 = _3013;
    }
    int _3015 = _3009;
    int _3017 = _2953 + 8;
    uint _3019 = uint(int(uint(_3017) >> uint(2)));
    uint _3021 = uint(int(uint(int(_3019)) >> uint(2)));
    int _3023 = int(_3019) & 3;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[int(_3021)][_3023];
    int _3027 = int(_3019) + 1;
    uint _3029 = uint(int(uint(_3027) >> uint(2)));
    int _3031 = _3027 & 3;
    float _3033 = (*spvDescriptorSet0.vp_c9)._m0[int(_3029)][_3031];
    bool _3035 = uint(_2949) >= uint(_2202);
    float _3037 = _3005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3043 = abs(_2775);
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3047 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3051 = _3041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3053 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3055 = abs(_2827);
    float _3057 = _3049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3059 = !_3035;
    int _3061 = _3059 ? 0 : (-1);
    out.m_78.x = _3007;
    out.m_78.y = _3037;
    out.m_78.z = _3053;
    int _3063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3065 = _3063 != 0;
    float _3067 = _1389 * _1425;
    float _3069 = fma(_1441, _1429, _1443);
    out.m_80.x = _3047;
    out.m_80.y = _3051;
    out.m_80.z = _3057;
    int _3071 = ~_3055;
    int _3073 = _3071 + 1;
    int _3075 = _3073 + 1;
    int _3077 = abs(_2785);
    int _3079 = ~_2917;
    int _3081 = _3079 + _3061;
    int _3083 = _3081 + 1;
    float _3085 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3087 = int(_3085);
    int _3089 = ~_3043;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    int _3095 = _2202 * _3083;
    int _3097 = _3095 + _2541;
    int _3099 = ~_3001;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    int _3105 = abs(_2877);
    int _3107 = _3093 * as_type<int>(_2937);
    int _3109 = abs(_2899);
    float _3111 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3113 = int(_3111);
    int _3115 = ~_3105;
    int _3117 = _3115 + 1;
    int _3119 = _3117 + 1;
    int _3121 = _3103 * as_type<int>(_2999);
    int _3123 = abs(_3015);
    int _3125 = _3075 * as_type<int>(_2929);
    int _3127 = _3125 + _3107;
    int _3129 = ~_3077;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = _3119 * as_type<int>(_2991);
    int _3137 = _3135 + _3121;
    int _3139 = ~_3109;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    int _3145 = ~_3123;
    int _3147 = _3145 + 1;
    int _3149 = _3147 + 1;
    int _3151 = _3133 * as_type<int>(_2967);
    int _3153 = _3151 + _3127;
    float _3155 = float(uint(_3087));
    int _3157 = abs(_3087);
    int _3159 = _3143 * as_type<int>(_2975);
    int _3161 = _3159 + _3153;
    int _3163 = abs(_2957);
    int _3165 = _3149 * as_type<int>(_3025);
    int _3167 = _3165 + _3137;
    float _3169 = float(uint(_3113));
    float _3171 = 1.0 / _3155;
    int _3173 = abs(_2797);
    float _3175 = _2180 * _1373;
    int _3177 = abs(_2817);
    int _3179 = abs(_3113);
    int _3181 = ~_3177;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    float _3187 = 1.0 / _3169;
    int _3189 = ~_3163;
    int _3191 = _3189 + 1;
    int _3193 = _3191 + 1;
    int _3195 = ~_3173;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = float(uint(_3157));
    int _3203 = _3193 * as_type<int>(_3033);
    int _3205 = _3203 + _3167;
    bool _3207 = !_2475;
    int _3209 = _3207 ? _3097 : (-1);
    int _3211 = _3161 * _3199;
    float _3213 = float(uint(_3179));
    int _3215 = _3205 * _3185;
    float _3217 = 1.0 / _3201;
    int _3219 = _2809 * _3173;
    int _3221 = _3219 + _3211;
    int _3223 = as_type<int>(_3171) + (-2);
    int _3225 = _3209 * _3177;
    int _3227 = _3225 + _3215;
    float _3229 = _1479 * _1391;
    int _3231 = as_type<int>(_3187) + (-2);
    float _3233 = _1479 * _1379;
    float _3235 = float(uint(_3221));
    float _3237 = 1.0 / _3213;
    float _3239 = float(uint(_3227));
    float _3241 = _1465 * _1391;
    int _3243 = abs(_3227);
    float _3245 = as_type<float>(_3223) * _3235;
    int _3247 = abs(_3221);
    float _3249 = as_type<float>(_3231) * _3239;
    float _3251 = _1479 * _1373;
    float _3253 = trunc(_3245);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = _1465 * _1379;
    float _3261 = _1465 * _1373;
    float _3263 = float(uint(_3243));
    float _3265 = _2180 * _1391;
    int _3267 = as_type<int>(_3217) + (-2);
    float _3269 = _2180 * _1379;
    float _3271 = float(uint(_3247));
    float _3273 = trunc(_3249);
    float _3275 = precise::max(_3273, 0.0);
    uint _3277 = uint(_3275);
    int _3279 = as_type<int>(_3237) + (-2);
    float _3281 = -_1441;
    float _3283 = fma(_3281, _1503, _3241);
    int _3285 = ~_3087;
    int _3287 = _3285 + 1;
    float _3289 = as_type<float>(_3267) * _3271;
    float _3291 = -_1441;
    float _3293 = fma(_3291, _1505, _3259);
    float _3295 = as_type<float>(_3279) * _3263;
    float _3297 = -_1441;
    float _3299 = fma(_3297, _1499, _3261);
    int _3301 = ~_3113;
    int _3303 = _3301 + 1;
    float _3305 = trunc(_3289);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = fma(_1467, _1505, _3233);
    int _3313 = _3287 * int(_3257);
    int _3315 = _3313 + _3221;
    float _3317 = fma(_3067, _1505, _3269);
    int _3319 = ~_3157;
    int _3321 = _3319 + 1;
    float _3323 = fma(_1467, _1499, _3251);
    int _3325 = ~_3179;
    int _3327 = _3325 + 1;
    float _3329 = fma(_3067, _1499, _3175);
    float _3331 = trunc(_3295);
    float _3333 = precise::max(_3331, 0.0);
    uint _3335 = uint(_3333);
    float _3337 = float(uint(_3315));
    int _3339 = _3303 * int(_3277);
    int _3341 = _3339 + _3227;
    float _3343 = fma(_1467, _1503, _3229);
    float _3345 = fma(_3067, _1503, _3265);
    float _3347 = fma(_1469, _859, _3293);
    float _3349 = as_type<float>(_3223) * _3337;
    float _3351 = float(uint(_3341));
    int _3353 = _3321 * int(_3309);
    int _3355 = _3353 + _3247;
    float _3357 = fma(_1469, _689, _3283);
    float _3359 = trunc(_3349);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    float _3365 = fma(_1469, _737, _3299);
    float _3367 = as_type<float>(_3231) * _3351;
    float _3369 = float(uint(_3355));
    float _3371 = fma(_3069, _689, _3345);
    float _3373 = -_213;
    int _3375 = _2182 ? as_type<int>(_3373) : as_type<int>(_213);
    int _3377 = _3327 * int(_3335);
    int _3379 = _3377 + _3243;
    float _3381 = -_323;
    int _3383 = _2315 ? as_type<int>(_3381) : as_type<int>(_323);
    float _3385 = trunc(_3367);
    float _3387 = precise::max(_3385, 0.0);
    uint _3389 = uint(_3387);
    float _3391 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3393 = as_type<float>(_3267) * _3369;
    float _3395 = float(uint(_3379));
    float _3397 = fma(_1487, _689, _3343);
    bool _3399 = !_2861;
    float _3401 = _3399 ? _213 : as_type<float>(_3375);
    float _3403 = fma(_3069, _859, _3317);
    float _3405 = -_323;
    int _3407 = _2837 ? as_type<int>(_3405) : as_type<int>(_323);
    float _3409 = fma(_1487, _859, _3311);
    bool _3411 = !_3065;
    float _3413 = _3411 ? _323 : as_type<float>(_3383);
    float _3415 = fma(_1487, _737, _3323);
    float _3417 = _323 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3419 = _3391 * _3357;
    float _3421 = as_type<float>(_3279) * _3395;
    float _3423 = trunc(_3393);
    float _3425 = precise::max(_3423, 0.0);
    uint _3427 = uint(_3425);
    float _3429 = _3391 * _3347;
    bool _3431 = !_2857;
    float _3433 = _3431 ? _323 : as_type<float>(_3407);
    float _3435 = fma(_3417, _3397, _3419);
    float _3437 = fma(_3069, _737, _3329);
    float _3439 = fma(_3417, _3409, _3429);
    int _3441 = ~_3113;
    int _3443 = _3441 + 1;
    out.m_82.x = _3397;
    out.m_82.y = _3409;
    out.m_82.z = _3415;
    int _3445 = int(_3277) + int(_3389);
    float _3447 = trunc(_3421);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = ~_3087;
    int _3455 = _3453 + 1;
    int _3457 = int(_3257) + int(_3363);
    int _3459 = ~_3157;
    int _3461 = _3459 + 1;
    int _3463 = int(_3309) + int(_3427);
    int _3465 = ~_3179;
    int _3467 = _3465 + 1;
    int _3469 = _3443 * _3445;
    int _3471 = _3469 + _3227;
    bool _3473 = _3113 == 0;
    int _3475 = _3455 * _3457;
    int _3477 = _3475 + _3221;
    int _3479 = _3461 * _3463;
    int _3481 = _3479 + _3247;
    bool _3483 = uint(_3471) >= uint(_3113);
    float _3485 = _3391 * _3365;
    bool _3487 = uint(_3477) >= uint(_3087);
    int _3489 = int(_3335) + int(_3451);
    float _3491 = fma(_3417, _3415, _3485);
    bool _3493 = !_3483;
    int _3495 = _3493 ? 0 : (-1);
    float _3497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3499 = !_3487;
    int _3501 = _3499 ? 0 : (-1);
    int _3503 = _3467 * _3489;
    int _3505 = _3503 + _3243;
    int _3507 = ~_3445;
    int _3509 = _3507 + _3495;
    int _3511 = _3509 + 1;
    bool _3513 = uint(_3481) >= uint(_3157);
    int _3515 = ~_3457;
    int _3517 = _3515 + _3501;
    int _3519 = _3517 + 1;
    float _3521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3523 = _3221 ^ _3087;
    int _3525 = _3113 * _3511;
    int _3527 = _3525 + _3227;
    bool _3529 = !_3513;
    int _3531 = _3529 ? 0 : (-1);
    uint _3533 = uint(int(uint(_3523) >> uint(31)));
    int _3535 = _3087 * _3519;
    int _3537 = _3535 + _3221;
    bool _3539 = _3087 == 0;
    float _3541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3543 = _3087 == 0;
    bool _3545 = uint(_3505) >= uint(_3179);
    int _3547 = _3227 ^ _3113;
    float _3549 = _3413 + 0.5;
    int _3551 = ~_3531;
    int _3553 = _3463 + _3551;
    int _3555 = _3553 + 1;
    float _3557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3559 = ~int(_3533);
    int _3561 = _3559 + 1;
    float _3563 = _3521 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3565 = !_3545;
    int _3567 = _3565 ? 0 : (-1);
    uint _3569 = uint(int(uint(_3547) >> uint(31)));
    bool _3571 = _3113 == 0;
    int _3573 = _3555 ^ _3561;
    int _3575 = ~_3567;
    int _3577 = _3489 + _3575;
    int _3579 = _3577 + 1;
    float _3581 = fma(_3391, _3391, 1.0);
    int _3583 = ~int(_3569);
    int _3585 = _3583 + 1;
    int _3587 = ~_3561;
    int _3589 = _3587 + _3573;
    int _3591 = _3589 + 1;
    float _3593 = _3497 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3595 = _3579 ^ _3585;
    float _3597 = rsqrt(_3581);
    bool _3599 = !_3473;
    int _3601 = _3599 ? _3527 : (-1);
    bool _3603 = !_3539;
    int _3605 = _3603 ? _3537 : (-1);
    int _3607 = ~_3585;
    int _3609 = _3607 + _3595;
    int _3611 = _3609 + 1;
    float _3613 = _3433 + 0.5;
    float _3615 = float(_3601);
    float _3617 = float(_3605);
    bool _3619 = !_3571;
    int _3621 = _3619 ? _3611 : (-1);
    float _3623 = fma(_3563, _3615, _1185);
    float _3625 = _3557 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3627 = fma(_3593, _3617, _1137);
    float _3629 = float(_3621);
    float _3631 = _3541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3633 = !_3543;
    int _3635 = _3633 ? _3591 : (-1);
    float _3637 = fma(_3593, _3613, _3627);
    float _3639 = _1437 + (-0.5);
    float _3641 = -_1227;
    float _3643 = fma(_3631, _3629, _3641);
    float _3645 = float(_3635);
    float _3647 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3649 = _3391 * _3597;
    float _3651 = fma(_3563, _3549, _3623);
    float _3653 = -_423;
    float _3655 = fma(_3625, _3645, _3653);
    float _3657 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3647);
    float _3659 = _3401 + (-0.5);
    float _3661 = -_3631;
    float _3663 = fma(_3661, _3639, _3643);
    float _3665 = -_3403;
    float _3667 = _3649 * _3665;
    float _3669 = -_3371;
    float _3671 = _3649 * _3669;
    float _3673 = -_3625;
    float _3675 = fma(_3673, _3659, _3655);
    float _3677 = -_3437;
    float _3679 = _3649 * _3677;
    float _3681 = fma(_3597, _3347, _3667);
    float _3683 = _2065 * 0.5;
    float _3685 = fma(_3597, _3357, _3671);
    float _3687 = -_1223;
    float _3689 = _3687 + 1.0;
    float _3691 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3657);
    float _3693 = fma(_2111, -0.5, _3683);
    float _3695 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3697 = -_3689;
    float _3699 = fma(_3433, _3697, _3637);
    float _3701 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3691);
    float _3703 = -_1201;
    float _3705 = _3703 + 1.0;
    float _3707 = _3695 * _2139;
    float _3709 = -_2192;
    float _3711 = fma(_3413, _3709, _3651);
    float _3713 = _3371 + _3435;
    float _3715 = -_3695;
    float _3717 = _3715 + 1.0;
    float _3719 = _3701 + _2065;
    float _3721 = _2109 + _2065;
    float _3723 = _2150 * _3707;
    float _3725 = _2160 * _3707;
    float _3727 = fma(_3401, _3705, _3675);
    float _3729 = _2150 * _3717;
    float _3731 = fma(_1437, _2196, _3663);
    float _3733 = _3719 * 0.5;
    float _3735 = _3721 * 0.5;
    float _3737 = _3403 + _3439;
    float _3739 = _3437 + _3491;
    float _3741 = fma(_2156, _3723, _2144);
    float _3743 = fma(_2158, _3723, _2146);
    float _3745 = fma(_2150, _3725, _2148);
    out.m_84.x = _3699;
    out.m_84.y = _3727;
    out.m_84.z = _3711;
    out.m_84.w = _3731;
    bool _3747 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3749 = isnan(_1843);
    bool _3751 = _3747 || _3749;
    bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3755 = _3751 || _3753;
    float _3757 = fma(_3597, _3365, _3679);
    out.m_86.x = _3735;
    out.m_86.y = _3693;
    out.m_86.z = _3733;
    out.m_86.w = _2065;
    out.m_88.x = _3741;
    out.m_88.y = _3743;
    out.m_88.z = _3745;
    out.m_88.w = _3729;
    out.m_90.x = _3713;
    out.m_90.y = _3737;
    out.m_90.z = _3739;
    float _3759 = _3723;
    float _3761 = _3685;
    float _3763 = _3701;
    if (!_3755)
    {
        _3759 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3765 = _3759;
    out.m_92.x = _3685;
    out.m_92.y = _3681;
    out.m_92.z = _3757;
    out.gl_Position.x = _2109;
    out.gl_Position.y = _2111;
    out.gl_Position.z = _3701;
    out.gl_Position.w = _2065;
    float _3767 = _1821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3769 = _3765;
    float _3771 = _3765;
    if (!_3755)
    {
        _3761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3773 = _3761;
    float _3775 = _3773;
    float _3777 = _3773;
    if (!_3755)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3779 = _2232;
    float _3781 = _3779;
    float _3783 = _3779;
    if (!_3755)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3785 = _3763;
    float _3787 = _3785;
    float _3789 = _3785;
    if (!_3755)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3791 = _2234;
    float _3793 = _3791;
    float _3795 = _3791;
    if (!_3755)
    {
        _2236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3797 = _2236;
    bool _3799 = !_3755;
    float _3801 = _3797;
    float _3803 = _3797;
    if (!_3799)
    {
        bool _3805 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3807 = isnan(_1843);
        bool _3809 = _3805 || _3807;
        bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3813 = _3809 || _3811;
        if (!_3813)
        {
            float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3817 = _1843 + _3815;
            float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3821 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3819;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3827 = 1.0 / _3821;
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3845 = _3817 * _3827;
            float _3847 = precise::clamp(_3845, 0.0, 1.0);
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3853 = fma(_3847, _3825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3855 = fma(_3847, _3851, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3857 = fma(_3847, _3831, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3859 = fma(_3847, _3835, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3861 = fma(_3847, _3839, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3863 = fma(_3847, _3843, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3783 = _3857;
            _3803 = _3861;
            _3777 = _3853;
            _3795 = _3859;
            _3789 = _3855;
            _3771 = _3863;
            _3865 = true;
        }
        else
        {
            bool _3867 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3869 = isnan(_1843);
            bool _3871 = _3867 || _3869;
            bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3875 = _3871 || _3873;
            if (!_3875)
            {
                _3775 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3877 = _3775;
            _3777 = _3877;
            if (!_3875)
            {
                _3781 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3879 = _3781;
            _3783 = _3879;
            if (!_3875)
            {
                _3787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3881 = _3787;
            _3789 = _3881;
            if (!_3875)
            {
                _3793 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3883 = _3793;
            _3795 = _3883;
            if (!_3875)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3885 = _3801;
            _3803 = _3885;
            if (!_3875)
            {
                _3769 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3887 = _3769;
            bool _3889 = !_3875;
            _3771 = _3887;
            if (!_3889)
            {
                bool _3891 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3893 = isnan(_1843);
                bool _3895 = _3891 || _3893;
                bool _3897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3899 = _3895 || _3897;
                if (!_3899)
                {
                    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3903 = _1843 + _3901;
                    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3907 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3905;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3913 = 1.0 / _3907;
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3917 = _3915 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3921 = _3919 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3923 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3925 = _3923 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3931 = _3903 * _3913;
                    float _3933 = precise::clamp(_3931, 0.0, 1.0);
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3939 = fma(_3933, _3911, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3941 = fma(_3933, _3937, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3943 = fma(_3933, _3917, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3945 = fma(_3933, _3921, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3947 = fma(_3933, _3925, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3949 = fma(_3933, _3929, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3783 = _3943;
                    _3803 = _3947;
                    _3777 = _3939;
                    _3795 = _3945;
                    _3789 = _3941;
                    _3771 = _3949;
                    _3865 = true;
                }
                else
                {
                    _3783 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3777 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3795 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3771 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3865 = false;
    float _3951 = _3783;
    float _3953 = _3803;
    float _3955 = _3777;
    float _3957 = _3795;
    float _3959 = _3789;
    float _3961 = _3771;
    float _3963 = fma(_3737, -0.5, 0.5);
    float _3965 = precise::clamp(_3963, 0.0, 1.0);
    float _3967 = -_3951;
    float _3969 = _3967 + _3953;
    float _3971 = _3767 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3973 = -_3955;
    float _3975 = _3973 + _3957;
    float _3977 = fma(_3965, _3969, _3951);
    out.m_94.x = 0.0;
    float _3979 = -_3959;
    float _3981 = _3979 + _3961;
    float _3983 = fma(_3965, _3975, _3955);
    float _3985 = _3977 * 0.586610972881317138671875;
    out.m_47.x = _3971;
    bool _3987 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3989 = fma(_3965, _3981, _3959);
    float _3991 = fma(_3983, 0.298911988735198974609375, _3985);
    bool _3993 = _1821 > 0.0;
    bool _3995 = isnan(_1821);
    bool _3997 = _3993 || _3995;
    bool _3999 = isnan(0.0);
    bool _4001 = _3997 || _3999;
    float _4003 = fma(_3989, 0.114477999508380889892578125, _3991);
    float _4005 = -_4003;
    float _4007 = _3983 + _4005;
    float _4009 = -_4003;
    float _4011 = _3977 + _4009;
    float _4013 = -_4003;
    float _4015 = _3989 + _4013;
    float _4017 = fma(_4007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    float _4019 = fma(_4011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    float _4021 = fma(_4015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    bool _4023 = !_3987;
    if (!_4023)
    {
        float _4025 = -_1755;
        float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4029 = -_1757;
        float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4033 = -_1759;
        float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4037 = _4027 * _4027;
        float _4039 = fma(_4031, _4031, _4037);
        float _4041 = fma(_4035, _4035, _4039);
        float _4043 = sqrt(_4041);
        float _4045 = rsqrt(_4041);
        float _4047 = -_4043;
        float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4053 = precise::clamp(_4051, 0.0, 1.0);
        float _4055 = _4031 * _4045;
        float _4057 = _4027 * _4045;
        float _4059 = abs(_4053);
        float _4061 = log2(_4059);
        float _4063 = _4035 * _4045;
        float _4065 = _4055 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4067 = _3737 * _4057;
        float _4069 = -_4057;
        float _4071 = -_4065;
        float _4073 = fma(_4069, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4071);
        float _4075 = fma(_3713, _4055, _4067);
        float _4077 = -_4063;
        float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4073);
        float _4081 = fma(_3739, _4063, _4075);
        float _4083 = precise::clamp(_4081, 0.0, 1.0);
        float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4087 = _4079 + _4085;
        float _4089 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4091 = _4087 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4093 = precise::clamp(_4091, 0.0, 1.0);
        float _4095 = exp2(_4089);
        float _4097 = _4095 * _4093;
        float _4099 = _4083 * _4097;
        float _4101 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4103 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4105 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4101;
        out.m_94.y = _4103;
        out.m_94.z = _4105;
    }
    out.m_70.x = _4017;
    out.m_70.y = _4019;
    out.m_70.z = _4021;
    if (_4001)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4107 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4107;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3865 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4163 = as_type<float>(_127);
        out.gl_Position.z = _4163;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_49.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = 1.0 / _133;
    float _157 = _131;
    float _159 = _137;
    if (_153)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _157;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    float _163 = _137 * _155;
    float _165 = _163;
    if (_153)
    {
        float _167 = _161 * 5.0;
        _129 = as_type<int>(_167);
    }
    int _169 = _129;
    out.m_51.x = _163;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4236 = as_type<float>(_169);
        out.gl_Position.z = _4236;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_53.x;
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _181 = _175 * _173;
    float _183 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _185 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _187 = _183 * _179;
    float _189 = floor(_185);
    float _191 = _185 * 6.283185482025146484375;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[20].y, _187);
    int _195 = as_type<int>(_177) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_177) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = floor(_193);
    bool _211 = !_201;
    float _213 = _211 ? (-0.5) : 0.5;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _217 = _215 != 0;
    int _219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _221 = _219 != 0;
    float _223 = _203 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_189;
    float _229 = _185 + _227;
    float _231 = _193 * 6.283185482025146484375;
    float _233 = _231 * 0.15915493667125701904296875;
    bool _235 = !_207;
    int _237 = _235 ? 0 : 1;
    float _239 = -_209;
    float _241 = _193 + _239;
    bool _243 = !_217;
    int _245 = _243 ? 0 : 1;
    float _247 = -_229;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _251 = _229 < 0.5;
    float _253 = float(_251);
    float _255 = _233 * 6.283185482025146484375;
    float _257 = cos(_255);
    int _259 = abs(_245);
    bool _261 = !_221;
    int _263 = _261 ? 0 : 1;
    float _265 = fma(_225, 0.5, 0.5);
    float _267 = -_253;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _277 = abs(_263);
    float _279 = float(_259);
    float _281 = -_241;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _285 = _241 < 0.5;
    float _287 = float(_285);
    float _289 = fma(_257, 0.5, 0.5);
    int _291 = abs(_237);
    float _293 = abs(_249);
    float _295 = _279 * _293;
    float _297 = float(_291);
    float _299 = -_287;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _303 = -_289;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _307 = abs(_283);
    float _309 = _279 * _307;
    float _311 = float(_277);
    float _313 = fma(_297, _275, _295);
    float _315 = fma(_297, _305, _309);
    float _317 = abs(_269);
    float _319 = fma(_311, _317, _313);
    bool _321 = !_197;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = abs(_301);
    float _327 = fma(_311, _325, _315);
    bool _329 = !_271;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _165 = _343;
    }
    float _345 = _165;
    float _347 = in.m_53.y;
    float _349 = _171 * 2.0;
    float _351 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _353 = in.m_53.z;
    float _355 = floor(_349);
    float _357 = in.m_44.x;
    float _359 = in.m_44.y;
    float _361 = in.m_44.z;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _365 = _363 != 0;
    float _367 = in.m_58.x;
    float _369 = in.m_58.y;
    float _371 = in.m_58.z;
    float _373 = in.m_58.w;
    float _375 = in.m_60.x;
    float _377 = in.m_60.y;
    float _379 = in.m_60.z;
    float _381 = in.m_60.w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _385 = in.m_62.x;
    float _387 = in.m_62.y;
    float _389 = in.m_62.z;
    float _391 = in.m_62.w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _395 = _347 * 2.0;
    bool _397 = _347 > 0.5;
    float _399 = _347 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _401 = -_393;
    float _403 = fma(_351, 2.0, _401);
    bool _405 = _353 > 0.5;
    float _407 = fma(_399, -2.0, _383);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _415 = _413 != 0;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _419 = _417 != 0;
    float _421 = floor(_395);
    float _423 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _407);
    float _425 = _359 * _369;
    float _427 = -_213;
    int _429 = _405 ? as_type<int>(_427) : as_type<int>(_213);
    float _431 = fma(_357, _367, _425);
    float _433 = -_323;
    int _435 = _397 ? as_type<int>(_433) : as_type<int>(_323);
    float _437 = _359 * _377;
    bool _439 = !_419;
    float _441 = _439 ? _213 : as_type<float>(_429);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _443;
    bool _447 = !_415;
    float _449 = _447 ? _323 : as_type<float>(_435);
    float _451 = fma(_357, _375, _437);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _463 = _461 != 0;
    float _465 = 1.0 / _445;
    bool _467 = _355 >= 0.0;
    bool _469 = isnan(_355);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = _359 * _387;
    int _485 = _475 ? 0 : 1;
    float _487 = -_477;
    float _489 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _487);
    bool _491 = _355 > 0.0;
    float _493 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _495 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _497 = 1.0 / _481;
    float _499 = fma(_361, _371, _431);
    float _501 = -_493;
    float _503 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _501);
    float _505 = -_495;
    float _507 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _345 + _509;
    int _513 = ~_485;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = _171 + _347;
    float _521 = fma(_357, _385, _483);
    float _523 = _511 * _465;
    int _525 = as_type<int>(_511);
    int _527 = _517;
    float _529 = _373;
    float _531 = _391;
    float _533 = _499;
    if (_365)
    {
        _525 = 0;
    }
    int _535 = _525;
    float _537 = _519 + (-1.0);
    int _539 = _535;
    if (!_491)
    {
        int _541 = ~_485;
        int _543 = _541 + 1;
        _527 = _543;
    }
    int _545 = _527;
    float _547 = fma(_361, _389, _521);
    bool _549 = _421 > 0.0;
    float _551 = fma(_361, _379, _451);
    bool _553 = _421 >= 0.0;
    bool _555 = isnan(_421);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _565 = _345 + _563;
    float _567 = _547;
    if (!_365)
    {
        _539 = 1;
    }
    int _569 = _539;
    float _571 = _551 + _381;
    float _573 = _565 * _497;
    int _575 = _561 ? 0 : 1;
    float _577 = _499 + _373;
    bool _579 = _569 != 1;
    float _581 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = _547 + _391;
    int _585 = ~_575;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    float _591 = -_577;
    float _593 = _591 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _595 = _589;
    if (!_549)
    {
        int _597 = ~_575;
        int _599 = _597 + 1;
        _595 = _599;
    }
    int _601 = _595;
    float _603 = -_583;
    float _605 = _603 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _607 = _353 * 2.0;
    float _609 = -_571;
    float _611 = _609 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _613 = _605 * _605;
    float _615 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _617 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _619 = floor(_607);
    float _621 = fma(_593, _593, _613);
    float _623 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    if (!_579)
    {
        _529 = _347;
    }
    float _625 = _529;
    float _627 = -_617;
    float _629 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _627);
    float _631 = fma(_611, _611, _621);
    float _633 = -_623;
    float _635 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _633);
    bool _637 = !_459;
    int _639 = _637 ? 0 : 1;
    float _641 = rsqrt(_631);
    bool _643 = !_455;
    int _645 = _643 ? 0 : 1;
    float _647 = _353 + _347;
    bool _649 = !_463;
    int _651 = _649 ? 0 : 1;
    float _653 = -_615;
    float _655 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _653);
    float _657 = _625;
    float _659 = _629;
    if (!_579)
    {
        _567 = _353;
    }
    float _661 = _567;
    float _663 = _647 + (-1.0);
    float _665 = _661;
    if (!_579)
    {
        _531 = _353;
    }
    float _667 = _531;
    float _669 = _507 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _671 = _667;
    if (!_579)
    {
        _533 = _625;
    }
    float _673 = _533;
    float _675 = _507 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _677 = _673;
    if (_579)
    {
        _677 = _171;
    }
    float _679 = _677;
    float _681 = _507 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_579)
    {
        _657 = _171;
    }
    float _683 = _657;
    float _685 = _489 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    if (_579)
    {
        _665 = _347;
    }
    float _687 = _665;
    float _689 = _593 * _641;
    if (_579)
    {
        _671 = _347;
    }
    float _691 = _671;
    float _693 = -_685;
    float _695 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[0].y, _693);
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _699 = _697 != 0;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _707 = _705 != 0;
    float _709 = _689 * _689;
    bool _711 = _619 > 0.0;
    float _713 = -_675;
    float _715 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[0].x, _713);
    bool _717 = _619 >= 0.0;
    bool _719 = isnan(_619);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = fma(_729, _523, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _737 = _611 * _641;
    float _739 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _741 = !_703;
    int _743 = _741 ? 0 : 1;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _745;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _751 = _749 != 0;
    float _753 = fma(_737, _737, _709);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _759 = fma(_747, _523, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _761 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _763 = isnan(_345);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = rsqrt(_753);
    float _775 = fma(_733, _573, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_757, _573, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _779 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _781 = isnan(_345);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_771;
    float _793 = _791 + 1.0;
    bool _795 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _797 = isnan(_345);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[0].w, _715);
    int _809 = _725 ? 0 : 1;
    float _811 = _789 * _793;
    int _813 = 0;
    if (_751)
    {
        _813 = 0;
    }
    int _815 = _813;
    float _817 = -_789;
    float _819 = _817 + 1.0;
    int _821 = _815;
    if (!_751)
    {
        _821 = 2;
    }
    int _823 = _821;
    float _825 = -_669;
    float _827 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _825);
    float _829 = _629 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _831 = _805 * _819;
    bool _833 = _823 != 2;
    float _835 = _507 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _837 = _737 * _773;
    float _839 = _489 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _841 = _735 * _831;
    float _843 = _759 * _831;
    float _845 = _689 * _773;
    float _847 = -_837;
    float _849 = _737 * _847;
    float _851 = -_835;
    float _853 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[1].x, _851);
    float _855 = -_839;
    float _857 = fma(_503, (*spvDescriptorSet0.vp_c8)._m0[1].y, _855);
    float _859 = _605 * _641;
    float _861 = -_849;
    float _863 = fma(_689, _845, _861);
    float _865 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[1].w, _853);
    float _867 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[1].w, _857);
    float _869 = _859 * _845;
    float _871 = _863 * _863;
    float _873 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _875 = -_681;
    float _877 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _875);
    float _879 = -_829;
    float _881 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[1].x, _879);
    float _883 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[0].w, _695);
    float _885 = fma(_869, _869, _871);
    float _887 = -_837;
    float _889 = _859 * _887;
    float _891 = -_873;
    float _893 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _891);
    float _895 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[1].w, _827);
    float _897 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[1].z, _881);
    float _899 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[0].w, _877);
    float _901 = fma(_889, _889, _885);
    float _903 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[0].z, _893);
    float _905 = in.m_64.x;
    float _907 = in.m_64.y;
    float _909 = -_805;
    float _911 = _909 + 1.0;
    float _913 = rsqrt(_901);
    float _915 = -_897;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].w, _903);
    float _919 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[143].x, _841);
    if (_833)
    {
        _659 = _171;
    }
    float _921 = _659;
    float _923 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _927 = 1.0 / _917;
    float _929 = fma(_775, _811, _919);
    float _931 = _921;
    if (!_833)
    {
        _931 = _353;
    }
    float _933 = _931;
    float _935 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[83].z, _925);
    float _937 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[145].x, _929);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _943 = _863 * _913;
    float _945 = precise::clamp(_943, 0.0, 1.0);
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _951 = _583 + _949;
    float _953 = -_939;
    float _955 = fma(_941, 2.0, _953);
    float _957 = -_945;
    float _959 = _957 + 1.0;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _577 + _961;
    float _965 = _937 * _905;
    float _967 = -_947;
    float _969 = fma(_923, 2.0, _967);
    float _971 = fma(_807, _927, -1.0);
    float _973 = _959 * _927;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _977 = _571 + _975;
    float _979 = fma(_959, _971, 1.0);
    float _981 = _951 * _951;
    float _983 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _985 = log2(_983);
    float _987 = _883 * _973;
    float _989 = _899 * _973;
    float _991 = fma(_963, _963, _981);
    float _993 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _995 = _979 * _979;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _999 = fma(_977, _977, _991);
    bool _1001 = !_699;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = fma(_987, _987, _995);
    float _1007 = fma(_993, -2.0, _997);
    float _1009 = sqrt(_999);
    int _1011 = abs(_743);
    float _1013 = fma(_989, _989, _1005);
    int _1015 = abs(_1003);
    float _1017 = _319 * _965;
    float _1019 = _985 * _137;
    int _1021 = ~_809;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = rsqrt(_1013);
    float _1029 = float(_545);
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1033 = _1025;
    float _1035 = _995;
    if (!_711)
    {
        int _1037 = ~_809;
        int _1039 = _1037 + 1;
        _1033 = _1039;
    }
    int _1041 = _1033;
    float _1043 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[143].y, _843);
    float _1045 = float(_1041);
    float _1047 = exp2(_1019);
    float _1049 = float(_1015);
    float _1051 = _1031 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1053 = fma(_777, _811, _1043);
    if (_833)
    {
        _1035 = _347;
    }
    float _1055 = _1035;
    float _1057 = _1049 * _1045;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1061 = int(_1059);
    float _1063 = _1055;
    if (!_833)
    {
        _1063 = _171;
    }
    float _1065 = _1063;
    float _1067 = _1009 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1069 = _989 * _1027;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1073 = float(_1011);
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1079 = precise::min(_1051, _1067);
    float _1081 = _979 * _1027;
    float _1083 = _987 * _1027;
    float _1085 = -_1069;
    float _1087 = _689 * _1085;
    float _1089 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1071);
    float _1091 = fma(_1077, -2.0, _1075);
    float _1093 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1095 = int(_1093);
    float _1097 = _1073 * _1029;
    float _1099 = _737 * _1081;
    float _1101 = -_1083;
    float _1103 = _859 * _1101;
    float _1105 = -_1083;
    float _1107 = -_1087;
    float _1109 = fma(_737, _1105, _1107);
    float _1111 = -_1047;
    float _1113 = _1111 + 1.0;
    bool _1115 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1123 = _1119 || _1121;
    float _1125 = -_1069;
    float _1127 = -_1099;
    float _1129 = fma(_859, _1125, _1127);
    float _1131 = _155 * _137;
    float _1133 = _1123 ? _1113 : 0.0;
    float _1135 = -_137;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[76].x, _403);
    float _1139 = float(_1061);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1143 = in.m_66.x;
    float _1145 = in.m_66.y;
    float _1147 = in.m_66.z;
    float _1149 = _1109 * _1109;
    float _1151 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1141);
    float _1153 = float(_1095);
    float _1155 = rsqrt(_999);
    bool _1157 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(1.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1169 = 1.0 + _1167;
    float _1171 = -_1103;
    float _1173 = fma(_689, _1081, _1171);
    float _1175 = fma(_1129, _1129, _1149);
    float _1177 = _1057 * (-2.0);
    float _1179 = 1.0 / _1153;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1183 = -_137;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _969);
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1189 = float(_601);
    float _1191 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1181);
    float _1193 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1053);
    float _1195 = 1.0 / _1139;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1199 = _1155 * _1079;
    float _1201 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1191);
    float _1203 = fma(_1177, _1143, _1143);
    float _1205 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1197);
    float _1207 = -_137;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[86].x, _955);
    float _1211 = _951 * _1199;
    float _1213 = 1.0 / _1169;
    float _1215 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1187);
    float _1217 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _935);
    float _1219 = _1179 * _137;
    float _1221 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1205);
    float _1223 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1215);
    float _1225 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1151);
    float _1227 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1007);
    float _1229 = _1195 * _137;
    float _1231 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1233 = fma(_1173, _1173, _1175);
    float _1235 = _171 + (-0.5);
    float _1237 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1091);
    float _1239 = fma(_581, _1177, _581);
    float _1241 = -_1211;
    float _1243 = _951 + _1241;
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1203);
    float _1247 = rsqrt(_1233);
    float _1249 = _1229;
    if (_1165)
    {
        float _1251 = _1133 * _1213;
        _159 = _1251;
    }
    float _1253 = _159;
    float _1255 = _963 * _1199;
    float _1257 = _1097 * (-2.0);
    float _1259 = _1243 * _1243;
    float _1261 = fma(_1239, _1253, _1245);
    float _1263 = -_1255;
    float _1265 = _963 + _1263;
    float _1267 = _977 * _1199;
    float _1269 = fma(_739, _1257, _739);
    float _1271 = fma(_1257, _1145, _1145);
    float _1273 = fma(_1265, _1265, _1259);
    float _1275 = -_1267;
    float _1277 = _977 + _1275;
    bool _1279 = !_707;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = _1261 * 0.15915493667125701904296875;
    float _1285 = _1193 * _907;
    float _1287 = fma(_1277, _1277, _1273);
    float _1289 = _1129 * _1247;
    float _1291 = _1173 * _1247;
    int _1293 = abs(_1281);
    float _1295 = _1109 * _1247;
    float _1297 = _737 * _1289;
    float _1299 = _859 * _1291;
    float _1301 = _347 + (-0.5);
    float _1303 = sqrt(_1287);
    float _1305 = -_1297;
    float _1307 = fma(_689, _1291, _1305);
    float _1309 = -_1299;
    float _1311 = fma(_737, _1295, _1309);
    float _1313 = _689 * _1295;
    float _1315 = _1307 * _1307;
    float _1317 = float(_1293);
    float _1319 = _327 * _1285;
    float _1321 = -_1313;
    float _1323 = fma(_859, _1289, _1321);
    float _1325 = fma(_1311, _1311, _1315);
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1271);
    float _1329 = _171 + _353;
    float _1331 = _1317 * _1189;
    float _1333 = fma(_1323, _1323, _1325);
    float _1335 = fma(_1269, _1253, _1327);
    float _1337 = _1329 + (-1.0);
    float _1339 = _1331 * (-2.0);
    float _1341 = _1155 * _1303;
    float _1343 = rsqrt(_1333);
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1347 = fma(_1339, _1147, _1147);
    float _1349 = _353 + (-0.5);
    float _1351 = _1335 * 0.15915493667125701904296875;
    float _1353 = fma(_1345, _1339, _1345);
    float _1355 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1357 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1347);
    float _1359 = _1283 * 6.283185482025146484375;
    float _1361 = sin(_1359);
    float _1363 = _1031 * _1341;
    float _1365 = _1355 * _1341;
    float _1367 = fma(_1353, _1253, _1357);
    float _1369 = in.m_53.w;
    float _1371 = _1367 * 0.15915493667125701904296875;
    float _1373 = _1323 * _1343;
    float _1375 = _1283 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1307 * _1343;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1383 = _689 * _1373;
    float _1385 = _737 * _1379;
    float _1387 = _1351 * 6.283185482025146484375;
    float _1389 = sin(_1387);
    float _1391 = _1311 * _1343;
    float _1393 = -_1385;
    float _1395 = fma(_859, _1373, _1393);
    float _1397 = -_1383;
    float _1399 = fma(_737, _1391, _1397);
    float _1401 = _859 * _1391;
    float _1403 = _1365 * _1381;
    float _1405 = _1351 * 6.283185482025146484375;
    float _1407 = cos(_1405);
    float _1409 = _1399 * _1399;
    float _1411 = -_1401;
    float _1413 = fma(_689, _1379, _1411);
    float _1415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    bool _1417 = _1369 > 0.5;
    float _1419 = fma(_1395, _1395, _1409);
    float _1421 = _1363 * _1415;
    float _1423 = _1371 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = fma(_1413, _1413, _1419);
    float _1429 = _1361 * _1389;
    float _1431 = -_213;
    int _1433 = _1417 ? as_type<int>(_1431) : as_type<int>(_213);
    bool _1435 = !_411;
    float _1437 = _1435 ? _213 : as_type<float>(_1433);
    float _1439 = _1371 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = _1377 * _1407;
    float _1445 = _1361 * _1407;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1449 = _1447 != 0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1453 = _1451 != 0;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1457 = _1455 != 0;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1461 = _1459 != 0;
    float _1463 = rsqrt(_1427);
    float _1465 = _1377 * _1425;
    float _1467 = _1407 * _1425;
    float _1469 = _1361 * _1425;
    float _1471 = _1377 * _1389;
    float _1473 = _1465 * _1403;
    bool _1475 = !_1449;
    int _1477 = _1475 ? 0 : 1;
    float _1479 = fma(_1441, _1443, _1429);
    float _1481 = -_1403;
    float _1483 = _1441 * _1481;
    float _1485 = -_1471;
    float _1487 = fma(_1441, _1445, _1485);
    float _1489 = _1469 * _1403;
    float _1491 = fma(_1479, _1421, _1473);
    float _1493 = fma(_1467, _1421, _1483);
    float _1495 = fma(_1487, _1421, _1489);
    float _1497 = _1491 * _1373;
    float _1499 = _1413 * _1463;
    float _1501 = _1491 * _1391;
    float _1503 = _1395 * _1463;
    float _1505 = _1399 * _1463;
    float _1507 = fma(_1493, _1499, _1497);
    float _1509 = -_1255;
    float _1511 = _577 + _1509;
    float _1513 = fma(_1493, _1503, _1501);
    float _1515 = -_1267;
    float _1517 = _571 + _1515;
    float _1519 = fma(_737, _1495, _1507);
    bool _1521 = !_1453;
    int _1523 = _1521 ? 0 : 1;
    float _1525 = fma(_689, _1495, _1513);
    bool _1527 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    float _1537 = _571 + _1519;
    bool _1539 = !_1457;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = _577 + _1525;
    float _1545 = -_1211;
    float _1547 = _583 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1537 + _1549;
    bool _1553 = !_1461;
    int _1555 = _1553 ? 0 : 1;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1559 = _1543 + _1557;
    float _1561 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1563 = _1551 * _1551;
    float _1565 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1561);
    float _1567 = fma(_1559, _1559, _1563);
    float _1569 = _1491 * _1379;
    float _1571 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1573 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1565);
    float _1575 = sqrt(_1567);
    float _1577 = fma(_1493, _1505, _1569);
    float _1579 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1571);
    float _1581 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1583 = fma(_859, _1495, _1577);
    float _1585 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1579);
    float _1587 = 1.0 / _1581;
    float _1589 = _583 + _1583;
    float _1591 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1593 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan(0.5);
    bool _1601 = _1597 || _1599;
    float _1603 = _1591 + _1581;
    bool _1605 = _1575 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1609 = _1591;
    float _1611 = _1495;
    float _1613 = _1589;
    float _1615 = _1267;
    float _1617 = _1537;
    if (!_1605)
    {
        _1607 = _1543;
    }
    float _1619 = _1607;
    float _1621 = _1619;
    if (!_1605)
    {
        _1609 = _1537;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (!_1605)
    {
        _1611 = _1589;
    }
    float _1627 = _1611;
    bool _1629 = !_1605;
    float _1631 = _1627;
    if (!_1629)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1637 = _1575 + _1635;
        float _1639 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = rsqrt(_1567);
        float _1643 = _1637 * _1633;
        float _1645 = _1643 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1645 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1649 + (-1.0);
        float _1657 = fma(_1653, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1659 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1661 = _1641 * _1657;
        float _1663 = fma(_1589, _1649, _1659);
        float _1665 = fma(_1559, _1661, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1667 = fma(_1551, _1661, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1621 = _1665;
        _1625 = _1667;
        _1631 = _1663;
    }
    float _1669 = _1621;
    float _1671 = _1625;
    float _1673 = _1631;
    float _1675 = -_1255;
    float _1677 = _1675 + _1669;
    float _1679 = -_1267;
    float _1681 = _1679 + _1671;
    float _1683 = -_1211;
    float _1685 = _1683 + _1673;
    float _1687 = _1603 * _1587;
    float _1689 = _1687 * 0.5;
    float _1691 = _1685;
    float _1693 = _1681;
    float _1695 = _1669;
    if (_1601)
    {
        _1613 = 1.0;
    }
    float _1697 = _1613;
    float _1699 = _1697;
    if (_1535)
    {
        _1615 = _1677;
    }
    float _1701 = _1615;
    float _1703 = _1701;
    if (!_1535)
    {
        float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1707 = _1547 + _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1711 = _1511 + _1709;
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1715 = -_571;
        float _1717 = _1715 + _1671;
        float _1719 = _1707 * _1707;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1723 = _1517 + _1721;
        float _1725 = fma(_1711, _1711, _1719);
        float _1727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1729 = fma(_1723, _1723, _1725);
        float _1731 = sqrt(_1729);
        float _1733 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1735 = -_583;
        float _1737 = _1735 + _1673;
        float _1739 = precise::min(_1731, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1741 = _1739 * _1727;
        float _1743 = -_577;
        float _1745 = _1743 + _1669;
        float _1747 = _1733 * _1741;
        float _1749 = fma(_1745, _1747, _1511);
        float _1751 = fma(_1737, _1747, _1547);
        float _1753 = fma(_1717, _1747, _1517);
        _1691 = _1751;
        _1703 = _1749;
        _1693 = _1753;
    }
    float _1755 = _1691;
    float _1757 = _1703;
    float _1759 = _1693;
    if (!_1601)
    {
        float _1761 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1765 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1763);
        float _1767 = _1761 * 0.15915493667125701904296875;
        float _1769 = _1767 * 6.283185482025146484375;
        float _1771 = cos(_1769);
        float _1773 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1775 = _1773 * 0.15915493667125701904296875;
        float _1777 = _1767 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = 1.0 / _1771;
        float _1783 = _1775 * 6.283185482025146484375;
        float _1785 = cos(_1783);
        float _1787 = _1779 * _1781;
        float _1789 = 1.0 / _1765;
        float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1793 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1791;
        float _1795 = _1785 * _1787;
        float _1797 = _1775 * 6.283185482025146484375;
        float _1799 = sin(_1797);
        float _1801 = 1.0 / _1795;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1805 = _1789 * _1803;
        float _1807 = 1.0 / _1793;
        float _1809 = _1799 * _1801;
        float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1813 = fma(_1809, _1805, _1811);
        float _1815 = _1813 * _1807;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        _1695 = _1787;
        _1699 = _1817;
    }
    float _1819 = _1695;
    float _1821 = _1699;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1825 = _1755 + _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1829 = _1757 + _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1833 = _1759 + _1831;
    float _1835 = _1825 * _1825;
    float _1837 = fma(_1829, _1829, _1835);
    float _1839 = fma(_1833, _1833, _1837);
    float _1841 = rsqrt(_1839);
    float _1843 = sqrt(_1839);
    float _1845 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1847 = _1829 * _1845;
    float _1849 = _1833 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 * _1849;
    float _1855 = _1851 + _1853;
    float _1857 = sqrt(_1855);
    bool _1859 = _1857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1863 = _1857 + _1861;
    float _1865 = _1833;
    float _1867 = _1841;
    float _1869 = _1863;
    float _1871 = _1819;
    float _1873 = _1825;
    if (_1859)
    {
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1859)
    {
        float _1879 = rsqrt(_1855);
        _1867 = _1879;
    }
    float _1881 = _1867;
    float _1883 = _1881;
    if (_1859)
    {
        float _1885 = _1863 * _1877;
        _1869 = _1885;
    }
    float _1887 = _1869;
    if (_1859)
    {
        float _1889 = _1887 * 0.15915493667125701904296875;
        _1871 = _1889;
    }
    float _1891 = _1871;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = _1877;
    float _1897 = _1891;
    if (_1859)
    {
        float _1899 = _1891 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        _1895 = _1901;
    }
    float _1903 = _1895;
    float _1905 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1907 = precise::max(0.0, _1905);
    float _1909 = _1835;
    float _1911 = _1907;
    if (_1859)
    {
        float _1913 = _1891 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = -_1845;
    float _1921 = -_1907;
    float _1923 = fma(_1825, _1919, _1921);
    if (_1859)
    {
        float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1925;
    }
    float _1927 = _1911;
    float _1929 = _1903;
    float _1931 = _1927;
    if (_1859)
    {
        float _1933 = fma(_1903, _1927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1873 = _1933;
    }
    float _1935 = _1873;
    float _1937 = _1935;
    if (!_1859)
    {
        _1929 = _1847;
    }
    float _1939 = _1929;
    float _1941 = _1939;
    float _1943 = _1917;
    if (_1859)
    {
        float _1945 = _1917 + (-1.0);
        _1931 = _1945;
    }
    float _1947 = _1931;
    float _1949 = _1947;
    if (_1859)
    {
        float _1951 = _1881 * _1935;
        _1617 = _1951;
    }
    float _1953 = _1617;
    if (!_1859)
    {
        _1937 = _1923;
    }
    float _1955 = _1937;
    float _1957 = _1955;
    if (_1859)
    {
        float _1959 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1959;
    }
    float _1961 = _1897;
    if (_1859)
    {
        float _1963 = _1847 * _1953;
        _1941 = _1963;
    }
    float _1965 = _1941;
    if (!_1859)
    {
        _1949 = _1849;
    }
    float _1967 = _1949;
    float _1969 = _1967;
    if (_1859)
    {
        float _1971 = _1849 * _1953;
        _1969 = _1971;
    }
    float _1973 = _1969;
    if (!_1859)
    {
        _1883 = _1851;
    }
    float _1975 = _1883;
    float _1977 = _1975;
    if (_1859)
    {
        float _1979 = fma(_1923, _1917, _1961);
        _1957 = _1979;
    }
    float _1981 = _1957;
    if (_1859)
    {
        float _1983 = _1965 * _1965;
        _1977 = _1983;
    }
    float _1985 = _1977;
    if (!_1859)
    {
        _1943 = _1853;
    }
    float _1987 = _1943;
    float _1989 = _1987;
    if (_1859)
    {
        float _1991 = _1973 * _1973;
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1997 = fma(_1981, _1981, _1985);
    float _1999 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2001 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2003 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1995);
    float _2005 = _1997 + _1993;
    float _2007 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1999);
    float _2011 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2015 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2013);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    float _2019 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2021 = rsqrt(_2005);
    float _2023 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2009);
    float _2027 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2019);
    float _2029 = -_2017;
    float _2031 = _2029 + 1.0;
    float _2033 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2001);
    float _2035 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2037 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2041 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2033);
    float _2043 = abs(_2031);
    float _2045 = log2(_2043);
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2049 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2039);
    float _2051 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = -_2047;
    float _2055 = fma(_2053, _1893, 1.0);
    float _2057 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2049);
    float _2059 = _2021 * _1965;
    float _2061 = _2021 * _1981;
    float _2063 = _2021 * _1973;
    float _2065 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2057);
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = log2(_2055);
    float _2071 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2073 = -_2067;
    float _2075 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2073);
    float _2077 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2079 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2071);
    float _2081 = -_2063;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2075);
    float _2085 = 1.0 / _2065;
    float _2087 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2089 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2079);
    float _2091 = fma(_2083, -0.5, 0.5);
    float _2093 = fma(_2083, 0.5, 0.5);
    float _2095 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2087);
    float _2097 = _2061 + 1.0;
    float _2099 = exp2(_2077);
    float _2101 = fma(_2093, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2103 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2095);
    float _2105 = _2069 * 0.693147182464599609375;
    float _2107 = fma(_2093, _2101, -0.212114393711090087890625);
    float _2109 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2103);
    float _2111 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2089);
    float _2113 = sqrt(_2091);
    float _2115 = fma(_2093, _2107, 1.570728778839111328125);
    float _2117 = _2109 * _2085;
    float _2119 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2121 = fma(_2117, 0.5, 0.5);
    float _2123 = -_2061;
    float _2125 = fma(_2099, _2097, _2123);
    float _2127 = _2111 * _2085;
    float _2129 = fma(_2127, -0.5, 0.5);
    float _2131 = _2113 * 0.636619746685028076171875;
    float _2133 = -_2115;
    float _2135 = fma(_2131, _2133, 1.0);
    float _2137 = fma(_2125, 0.5, 0.5);
    float3 _7297 = float3(_2121, _2129, _2119);
    float _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7297, float3(0.0), isnan(_7297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7297, float3(0.0), isnan(_7297)), level(0.0)).x;
    float3 _7308 = float3(_2121, _2129, _2119);
    float4 _2142 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7308, float3(0.0), isnan(_7308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7308, float3(0.0), isnan(_7308)), level(0.0)).xyzw;
    float _2144 = _2142.x;
    float _2146 = _2142.y;
    float _2148 = _2142.z;
    float _2150 = _2142.w;
    float2 _7325 = float2(_2135, _2137);
    float3 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7325, float2(0.0), isnan(_7325)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7325, float2(0.0), isnan(_7325)), level(0.0)).xyz;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2164 = int(_2162);
    int _2166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2168 = _2166 != 0;
    float _2170 = -_1225;
    float _2172 = _2170 + 1.0;
    int _2174 = abs(_1523);
    out.m_68.x = _1511;
    out.m_68.y = _1547;
    out.m_68.z = _1517;
    int _2176 = abs(_1541);
    float _2178 = -_1445;
    float _2180 = fma(_1441, _1471, _2178);
    bool _2182 = _347 > 0.5;
    float _2184 = trunc(_1219);
    int _2186 = int(_2184);
    out.m_70.w = _1079;
    float _2188 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2190 = -_1217;
    float _2192 = _2190 + 1.0;
    float _2194 = -_1231;
    float _2196 = _2194 + 1.0;
    out.m_72.x = _1363;
    float _2198 = float(uint(_2164));
    float _2200 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2202 = int(_2200);
    bool _2204 = _2164 == 0;
    out.m_74.x = _1757;
    out.m_74.y = _1755;
    out.m_74.z = _1759;
    float _2206 = float(uint(_2186));
    float _2208 = 1.0 / _2198;
    float _2210 = float(uint(_2202));
    float _2212 = trunc(_1229);
    int _2214 = int(_2212);
    int _2216 = ~_2164;
    int _2218 = _2216 + 1;
    int _2220 = ~_2202;
    int _2222 = _2220 + 1;
    int _2224 = ~_2202;
    int _2226 = _2224 + 1;
    int _2228 = as_type<int>(_2208) + (-2);
    float _2230 = 1.0 / _2210;
    float _2232 = _2065;
    float _2234 = _2111;
    float _2236 = _2109;
    if (_751)
    {
        _1249 = 1.0;
    }
    float _2238 = _1249;
    float _2240 = _2238;
    if (!_751)
    {
        _2240 = 7.345489978790283203125;
    }
    float _2242 = _2240;
    float _2244 = as_type<float>(_2228) * _2206;
    float _2246 = float(uint(_2214));
    float _2248 = _2242 * _171;
    float _2250 = trunc(_2244);
    float _2252 = precise::max(_2250, 0.0);
    uint _2255 = uint(_2252);
    int _2257 = as_type<int>(_2230) + (-2);
    float _2259 = _2230;
    if (_751)
    {
        _2259 = 1.0;
    }
    float _2261 = _2259;
    float _2263 = floor(_2248);
    float _2265 = _2261;
    if (!_751)
    {
        _2265 = 1.2345600128173828125;
    }
    float _2267 = _2265;
    float _2269 = as_type<float>(_2257) * _2246;
    int _2271 = _2218 * int(_2255);
    int _2273 = _2271 + _2186;
    float _2275 = trunc(_2269);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = float(uint(_2273));
    float _2283 = -_2263;
    float _2285 = _2248 + _2283;
    float _2287 = as_type<float>(_2228) * _2281;
    float _2289 = _2281;
    if (_751)
    {
        _2289 = _171;
    }
    float _2291 = _2289;
    float _2293 = exp2(_2188);
    float _2295 = _2291;
    if (!_751)
    {
        _2295 = _347;
    }
    float _2297 = _2295;
    int _2299 = _2164 + (-1);
    int _2301 = _2222 * int(_2279);
    int _2303 = _2301 + _2214;
    float _2305 = _2267 * _2297;
    float _2307 = float(_2186);
    float _2309 = trunc(_2287);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    bool _2315 = _353 > 0.5;
    float _2317 = float(uint(_2303));
    float _2319 = as_type<float>(_2257) * _2317;
    int _2321 = ~_2164;
    int _2323 = _2321 + 1;
    float _2325 = floor(_2305);
    float _2327 = -_2293;
    float _2329 = _2327 + 1.0;
    int _2331 = int(_2255) + int(_2313);
    float _2333 = trunc(_2319);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    float _2339 = float(_2164);
    int _2341 = _2323 * _2331;
    int _2343 = _2341 + _2186;
    bool _2345 = _2307 >= _2339;
    bool _2347 = isnan(_2307);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(_2339);
    bool _2353 = _2349 || _2351;
    float _2355 = float(_2353);
    float _2357 = -_2325;
    float _2359 = _2305 + _2357;
    float _2361 = _2285 * _2339;
    bool _2363 = uint(_2343) >= uint(_2164);
    float _2365 = _2339 * _1131;
    float _2367 = trunc(_2355);
    int _2369 = int(_2367);
    float _2371 = float(_2202);
    bool _2373 = !_2363;
    int _2375 = _2373 ? 0 : (-1);
    int _2377 = int(_2279) + int(_2337);
    float _2379 = _2359 * _2371;
    int _2381 = ~_2331;
    int _2383 = _2381 + _2375;
    int _2385 = _2383 + 1;
    float _2387 = trunc(_2361);
    int _2389 = int(_2387);
    float _2391 = float(_2214);
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2395 = _2393 != 0;
    int _2397 = _2164 * _2385;
    int _2399 = _2397 + _2186;
    bool _2401 = _2391 >= _2371;
    bool _2403 = isnan(_2391);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan(_2371);
    bool _2409 = _2405 || _2407;
    float _2411 = float(_2409);
    float _2413 = trunc(_2365);
    int _2415 = int(_2413);
    int _2417 = ~_2369;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    int _2423 = _2226 * _2377;
    int _2425 = _2423 + _2214;
    bool _2427 = !_2204;
    int _2429 = _2427 ? _2399 : (-1);
    bool _2431 = !_2395;
    int _2433 = _2431 ? 0 : 1;
    bool _2435 = uint(_2425) >= uint(_2202);
    int _2437 = _2429 * _2421;
    float _2439 = trunc(_2411);
    int _2441 = int(_2439);
    int _2443 = abs(_2433);
    int _2445 = _2369 * _2299;
    int _2447 = _2445 + _2437;
    int _2449 = abs(_639);
    float _2451 = _2371 * _1131;
    bool _2453 = !_2435;
    int _2455 = _2453 ? 0 : (-1);
    int _2457 = _2389 * _2443;
    int _2459 = _2457 + _2186;
    int _2461 = abs(_645);
    int _2463 = _2447 * _2449;
    int _2465 = ~_2377;
    int _2467 = _2465 + _2455;
    int _2469 = _2467 + 1;
    float _2471 = trunc(_2451);
    int _2473 = int(_2471);
    bool _2475 = _2202 == 0;
    int _2477 = _2415 * _2461;
    int _2479 = _2477 + _2463;
    int _2481 = abs(_651);
    int _2483 = _2202 * _2469;
    int _2485 = _2483 + _2214;
    bool _2487 = !_2168;
    int _2489 = _2487 ? 0 : 1;
    int _2491 = ~_2441;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    float _2497 = trunc(_2379);
    int _2499 = int(_2497);
    int _2501 = abs(_2489);
    int _2503 = _2459 * _2481;
    int _2505 = _2503 + _2479;
    bool _2507 = !_2475;
    int _2509 = _2507 ? _2485 : (-1);
    int _2511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2513 = _2511 != 0;
    int _2515 = _2509 * _2495;
    bool _2517 = !_2513;
    int _2519 = _2517 ? 0 : 1;
    int _2521 = _2202 + (-1);
    int _2523 = _2389 * _2501;
    int _2525 = _2523 + _2505;
    int _2527 = abs(_2519);
    int _2529 = _2441 * _2521;
    int _2531 = _2529 + _2515;
    float _2533 = float(uint(_2525));
    int _2535 = _2531 * _2174;
    int _2537 = abs(_1477);
    int _2539 = _2499 * _2527;
    int _2541 = _2539 + _2214;
    int _2543 = abs(_1555);
    float _2545 = as_type<float>(_2228) * _2533;
    float _2547 = float(uint(_2459));
    int _2549 = _2473 * _2537;
    int _2551 = _2549 + _2535;
    int _2553 = ~_2164;
    int _2555 = _2553 + 1;
    float _2557 = trunc(_2545);
    float _2559 = precise::max(_2557, 0.0);
    uint _2561 = uint(_2559);
    int _2563 = ~_2202;
    int _2565 = _2563 + 1;
    int _2567 = _2541 * _2176;
    int _2569 = _2567 + _2551;
    int _2571 = ~_2164;
    int _2573 = _2571 + 1;
    int _2575 = _2499 * _2543;
    int _2577 = _2575 + _2569;
    float _2579 = as_type<float>(_2228) * _2547;
    float _2581 = float(uint(_2577));
    float _2583 = trunc(_2579);
    float _2585 = precise::max(_2583, 0.0);
    uint _2587 = uint(_2585);
    int _2589 = _2555 * int(_2561);
    int _2591 = _2589 + _2525;
    float _2593 = as_type<float>(_2257) * _2581;
    int _2595 = ~_2164;
    int _2597 = _2595 + 1;
    float _2599 = float(uint(_2591));
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = as_type<float>(_2228) * _2599;
    int _2609 = _2597 * int(_2587);
    int _2611 = _2609 + _2459;
    float _2613 = trunc(_2607);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    float _2619 = float(uint(_2611));
    int _2621 = _2565 * int(_2605);
    int _2623 = _2621 + _2577;
    float _2625 = as_type<float>(_2228) * _2619;
    int _2627 = ~_2164;
    int _2629 = _2627 + 1;
    float _2631 = float(uint(_2623));
    int _2633 = int(_2561) + int(_2617);
    float _2635 = as_type<float>(_2257) * _2631;
    float _2637 = trunc(_2625);
    float _2639 = precise::max(_2637, 0.0);
    uint _2641 = uint(_2639);
    int _2643 = _2573 * _2633;
    int _2645 = _2643 + _2525;
    bool _2647 = uint(_2645) >= uint(_2164);
    float _2649 = trunc(_2635);
    float _2651 = precise::max(_2649, 0.0);
    uint _2653 = uint(_2651);
    bool _2655 = !_2647;
    int _2657 = _2655 ? 0 : (-1);
    int _2659 = ~_2633;
    int _2661 = _2659 + _2657;
    int _2663 = _2661 + 1;
    int _2665 = int(_2587) + int(_2641);
    int _2667 = ~_2202;
    int _2669 = _2667 + 1;
    int _2671 = _2164 * _2663;
    int _2673 = _2671 + _2525;
    int _2675 = int(_2605) + int(_2653);
    int _2677 = _2629 * _2665;
    int _2679 = _2677 + _2459;
    bool _2681 = !_2204;
    int _2683 = _2681 ? _2673 : (-1);
    float _2685 = float(uint(_2541));
    int _2687 = _2669 * _2675;
    int _2689 = _2687 + _2577;
    bool _2691 = uint(_2679) >= uint(_2164);
    int _2693 = _2683 & 3;
    bool _2695 = _2693 != 0;
    float _2697 = as_type<float>(_2257) * _2685;
    int _2699 = _2683 & 3;
    bool _2701 = _2699 != 0;
    bool _2703 = !_2691;
    int _2705 = _2703 ? 0 : (-1);
    int _2707 = _2695 ? 0 : 1;
    float _2709 = trunc(_2697);
    float _2711 = precise::max(_2709, 0.0);
    uint _2713 = uint(_2711);
    bool _2715 = uint(_2699) >= 2u;
    bool _2717 = uint(_2689) >= uint(_2202);
    int _2719 = _2715 ? 0 : 1;
    bool _2721 = !_2717;
    int _2723 = _2721 ? 0 : (-1);
    bool _2725 = uint(_2699) > 1u;
    bool _2727 = _2699 != 3;
    int _2729 = ~_2675;
    int _2731 = _2729 + _2723;
    int _2733 = _2731 + 1;
    int _2735 = ~_2665;
    int _2737 = _2735 + _2705;
    int _2739 = _2737 + 1;
    int _2741 = ~_2719;
    int _2743 = _2741 + 1;
    int _2745 = _2743 + 1;
    int _2747 = _2202 * _2733;
    int _2749 = _2747 + _2577;
    int _2751 = ~_2202;
    int _2753 = _2751 + 1;
    int _2755 = _2164 * _2739;
    int _2757 = _2755 + _2459;
    int _2759 = ~_2707;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    float _2765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2767 = _2763;
    int _2769 = _2745;
    if (!_2725)
    {
        int _2771 = ~_2707;
        int _2773 = _2771 + 1;
        _2767 = _2773;
    }
    int _2775 = _2767;
    int _2777 = _2753 * int(_2713);
    int _2779 = _2777 + _2541;
    if (_2727)
    {
        int _2781 = ~_2719;
        int _2783 = _2781 + 1;
        _2769 = _2783;
    }
    int _2785 = _2769;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2789 = _2787 != 0;
    bool _2791 = !_2475;
    int _2793 = _2791 ? _2749 : (-1);
    bool _2795 = !_2789;
    int _2797 = _2795 ? 0 : 1;
    int _2799 = _2793 & 3;
    bool _2801 = _2799 != 0;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2805 = _2803 != 0;
    bool _2807 = !_2204;
    int _2809 = _2807 ? _2757 : (-1);
    bool _2811 = uint(_2799) > 1u;
    float _2813 = float(uint(_2779));
    bool _2815 = !_2805;
    int _2817 = _2815 ? 0 : 1;
    int _2819 = _2793 & 3;
    bool _2821 = _2819 != 0;
    float _2823 = as_type<float>(_2257) * _2813;
    bool _2825 = !_2701;
    int _2827 = _2825 ? 0 : 1;
    int _2829 = _2821 ? 0 : 1;
    float _2831 = trunc(_2823);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    bool _2837 = _171 > 0.5;
    int _2839 = ~_2829;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _2843;
    if (!_2811)
    {
        int _2847 = ~_2829;
        int _2849 = _2847 + 1;
        _2845 = _2849;
    }
    int _2851 = _2845;
    float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2855 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2857 = _2855 != 0;
    int _2859 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2861 = _2859 != 0;
    int _2863 = _2683 >> 31;
    int _2865 = _2793 >> 31;
    int _2867 = _2863 & 3;
    int _2869 = _2865 & 3;
    int _2871 = _2683 + _2867;
    float _2873 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2875 = !_2801;
    int _2877 = _2875 ? 0 : 1;
    float _2879 = _441 + (-0.5);
    bool _2881 = _2699 != 3;
    float _2883 = _2853 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2885 = _2793 + _2869;
    float _2887 = _449 + 0.5;
    int _2889 = _2871 >> 2;
    float _2891 = -_2883;
    float _2893 = -_1237;
    float _2895 = fma(_2891, _2879, _2893);
    bool _2897 = !_2881;
    int _2899 = _2897 ? 0 : (-1);
    float _2901 = fma(_2873, _2887, _1209);
    bool _2903 = uint(_2799) >= 2u;
    float _2905 = fma(_441, _2172, _2895);
    int _2907 = _2885 >> 2;
    int _2909 = _2889 << 4;
    int _2911 = _2909 + 368;
    float _2913 = -_1221;
    float _2915 = _2913 + 1.0;
    int _2917 = int(_2713) + int(_2835);
    int _2919 = ~_2202;
    int _2921 = _2919 + 1;
    uint _2923 = uint(int(uint(_2911) >> uint(2)));
    uint _2925 = uint(int(uint(int(_2923)) >> uint(2)));
    int _2927 = int(_2923) & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = int(_2923) + 1;
    uint _2933 = uint(int(uint(_2931) >> uint(2)));
    int _2935 = _2931 & 3;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[int(_2933)][_2935];
    int _2939 = _2903 ? 0 : 1;
    float _2941 = -_2915;
    float _2943 = fma(_449, _2941, _2901);
    bool _2945 = _2799 != 3;
    int _2947 = _2921 * _2917;
    int _2949 = _2947 + _2541;
    int _2951 = _2907 << 4;
    int _2953 = _2951 + 512;
    bool _2955 = !_2945;
    int _2957 = _2955 ? 0 : (-1);
    int _2959 = _2911 + 8;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    uint _2963 = uint(int(uint(int(_2961)) >> uint(2)));
    int _2965 = int(_2961) & 3;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[int(_2963)][_2965];
    int _2969 = int(_2961) + 1;
    uint _2971 = uint(int(uint(_2969) >> uint(2)));
    int _2973 = _2969 & 3;
    float _2975 = (*spvDescriptorSet0.vp_c9)._m0[int(_2971)][_2973];
    bool _2977 = _2799 != 3;
    out.m_76.x = _2943;
    out.m_76.y = _2905;
    int _2979 = ~_2939;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    uint _2985 = uint(int(uint(_2953) >> uint(2)));
    uint _2987 = uint(int(uint(int(_2985)) >> uint(2)));
    int _2989 = int(_2985) & 3;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[int(_2987)][_2989];
    int _2993 = int(_2985) + 1;
    uint _2995 = uint(int(uint(_2993) >> uint(2)));
    int _2997 = _2993 & 3;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[int(_2995)][_2997];
    int _3001 = abs(_2851);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _3007 = _3003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3009 = _2983;
    if (_2977)
    {
        int _3011 = ~_2939;
        int _3013 = _3011 + 1;
        _3009 = _3013;
    }
    int _3015 = _3009;
    int _3017 = _2953 + 8;
    uint _3019 = uint(int(uint(_3017) >> uint(2)));
    uint _3021 = uint(int(uint(int(_3019)) >> uint(2)));
    int _3023 = int(_3019) & 3;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[int(_3021)][_3023];
    int _3027 = int(_3019) + 1;
    uint _3029 = uint(int(uint(_3027) >> uint(2)));
    int _3031 = _3027 & 3;
    float _3033 = (*spvDescriptorSet0.vp_c9)._m0[int(_3029)][_3031];
    bool _3035 = uint(_2949) >= uint(_2202);
    float _3037 = _3005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3043 = abs(_2775);
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _3047 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3051 = _3041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3053 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3055 = abs(_2827);
    float _3057 = _3049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3059 = !_3035;
    int _3061 = _3059 ? 0 : (-1);
    out.m_78.x = _3007;
    out.m_78.y = _3037;
    out.m_78.z = _3053;
    int _3063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3065 = _3063 != 0;
    float _3067 = _1389 * _1425;
    float _3069 = fma(_1441, _1429, _1443);
    out.m_80.x = _3047;
    out.m_80.y = _3051;
    out.m_80.z = _3057;
    int _3071 = ~_3055;
    int _3073 = _3071 + 1;
    int _3075 = _3073 + 1;
    int _3077 = abs(_2785);
    int _3079 = ~_2917;
    int _3081 = _3079 + _3061;
    int _3083 = _3081 + 1;
    float _3085 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3087 = int(_3085);
    int _3089 = ~_3043;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    int _3095 = _2202 * _3083;
    int _3097 = _3095 + _2541;
    int _3099 = ~_3001;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    int _3105 = abs(_2877);
    int _3107 = _3093 * as_type<int>(_2937);
    int _3109 = abs(_2899);
    float _3111 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3113 = int(_3111);
    int _3115 = ~_3105;
    int _3117 = _3115 + 1;
    int _3119 = _3117 + 1;
    int _3121 = _3103 * as_type<int>(_2999);
    int _3123 = abs(_3015);
    int _3125 = _3075 * as_type<int>(_2929);
    int _3127 = _3125 + _3107;
    int _3129 = ~_3077;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = _3119 * as_type<int>(_2991);
    int _3137 = _3135 + _3121;
    int _3139 = ~_3109;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    int _3145 = ~_3123;
    int _3147 = _3145 + 1;
    int _3149 = _3147 + 1;
    int _3151 = _3133 * as_type<int>(_2967);
    int _3153 = _3151 + _3127;
    float _3155 = float(uint(_3087));
    int _3157 = abs(_3087);
    int _3159 = _3143 * as_type<int>(_2975);
    int _3161 = _3159 + _3153;
    int _3163 = abs(_2957);
    int _3165 = _3149 * as_type<int>(_3025);
    int _3167 = _3165 + _3137;
    float _3169 = float(uint(_3113));
    float _3171 = 1.0 / _3155;
    int _3173 = abs(_2797);
    float _3175 = _2180 * _1373;
    int _3177 = abs(_2817);
    int _3179 = abs(_3113);
    int _3181 = ~_3177;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    float _3187 = 1.0 / _3169;
    int _3189 = ~_3163;
    int _3191 = _3189 + 1;
    int _3193 = _3191 + 1;
    int _3195 = ~_3173;
    int _3197 = _3195 + 1;
    int _3199 = _3197 + 1;
    float _3201 = float(uint(_3157));
    int _3203 = _3193 * as_type<int>(_3033);
    int _3205 = _3203 + _3167;
    bool _3207 = !_2475;
    int _3209 = _3207 ? _3097 : (-1);
    int _3211 = _3161 * _3199;
    float _3213 = float(uint(_3179));
    int _3215 = _3205 * _3185;
    float _3217 = 1.0 / _3201;
    int _3219 = _2809 * _3173;
    int _3221 = _3219 + _3211;
    int _3223 = as_type<int>(_3171) + (-2);
    int _3225 = _3209 * _3177;
    int _3227 = _3225 + _3215;
    float _3229 = _1479 * _1391;
    int _3231 = as_type<int>(_3187) + (-2);
    float _3233 = _1479 * _1379;
    float _3235 = float(uint(_3221));
    float _3237 = 1.0 / _3213;
    float _3239 = float(uint(_3227));
    float _3241 = _1465 * _1391;
    int _3243 = abs(_3227);
    float _3245 = as_type<float>(_3223) * _3235;
    int _3247 = abs(_3221);
    float _3249 = as_type<float>(_3231) * _3239;
    float _3251 = _1479 * _1373;
    float _3253 = trunc(_3245);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = _1465 * _1379;
    float _3261 = _1465 * _1373;
    float _3263 = float(uint(_3243));
    float _3265 = _2180 * _1391;
    int _3267 = as_type<int>(_3217) + (-2);
    float _3269 = _2180 * _1379;
    float _3271 = float(uint(_3247));
    float _3273 = trunc(_3249);
    float _3275 = precise::max(_3273, 0.0);
    uint _3277 = uint(_3275);
    int _3279 = as_type<int>(_3237) + (-2);
    float _3281 = -_1441;
    float _3283 = fma(_3281, _1503, _3241);
    int _3285 = ~_3087;
    int _3287 = _3285 + 1;
    float _3289 = as_type<float>(_3267) * _3271;
    float _3291 = -_1441;
    float _3293 = fma(_3291, _1505, _3259);
    float _3295 = as_type<float>(_3279) * _3263;
    float _3297 = -_1441;
    float _3299 = fma(_3297, _1499, _3261);
    int _3301 = ~_3113;
    int _3303 = _3301 + 1;
    float _3305 = trunc(_3289);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = fma(_1467, _1505, _3233);
    int _3313 = _3287 * int(_3257);
    int _3315 = _3313 + _3221;
    float _3317 = fma(_3067, _1505, _3269);
    int _3319 = ~_3157;
    int _3321 = _3319 + 1;
    float _3323 = fma(_1467, _1499, _3251);
    int _3325 = ~_3179;
    int _3327 = _3325 + 1;
    float _3329 = fma(_3067, _1499, _3175);
    float _3331 = trunc(_3295);
    float _3333 = precise::max(_3331, 0.0);
    uint _3335 = uint(_3333);
    float _3337 = float(uint(_3315));
    int _3339 = _3303 * int(_3277);
    int _3341 = _3339 + _3227;
    float _3343 = fma(_1467, _1503, _3229);
    float _3345 = fma(_3067, _1503, _3265);
    float _3347 = fma(_1469, _859, _3293);
    float _3349 = as_type<float>(_3223) * _3337;
    float _3351 = float(uint(_3341));
    int _3353 = _3321 * int(_3309);
    int _3355 = _3353 + _3247;
    float _3357 = fma(_1469, _689, _3283);
    float _3359 = trunc(_3349);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    float _3365 = fma(_1469, _737, _3299);
    float _3367 = as_type<float>(_3231) * _3351;
    float _3369 = float(uint(_3355));
    float _3371 = fma(_3069, _689, _3345);
    float _3373 = -_213;
    int _3375 = _2182 ? as_type<int>(_3373) : as_type<int>(_213);
    int _3377 = _3327 * int(_3335);
    int _3379 = _3377 + _3243;
    float _3381 = -_323;
    int _3383 = _2315 ? as_type<int>(_3381) : as_type<int>(_323);
    float _3385 = trunc(_3367);
    float _3387 = precise::max(_3385, 0.0);
    uint _3389 = uint(_3387);
    float _3391 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3393 = as_type<float>(_3267) * _3369;
    float _3395 = float(uint(_3379));
    float _3397 = fma(_1487, _689, _3343);
    bool _3399 = !_2861;
    float _3401 = _3399 ? _213 : as_type<float>(_3375);
    float _3403 = fma(_3069, _859, _3317);
    float _3405 = -_323;
    int _3407 = _2837 ? as_type<int>(_3405) : as_type<int>(_323);
    float _3409 = fma(_1487, _859, _3311);
    bool _3411 = !_3065;
    float _3413 = _3411 ? _323 : as_type<float>(_3383);
    float _3415 = fma(_1487, _737, _3323);
    float _3417 = _323 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3419 = _3391 * _3357;
    float _3421 = as_type<float>(_3279) * _3395;
    float _3423 = trunc(_3393);
    float _3425 = precise::max(_3423, 0.0);
    uint _3427 = uint(_3425);
    float _3429 = _3391 * _3347;
    bool _3431 = !_2857;
    float _3433 = _3431 ? _323 : as_type<float>(_3407);
    float _3435 = fma(_3417, _3397, _3419);
    float _3437 = fma(_3069, _737, _3329);
    float _3439 = fma(_3417, _3409, _3429);
    int _3441 = ~_3113;
    int _3443 = _3441 + 1;
    out.m_82.x = _3397;
    out.m_82.y = _3409;
    out.m_82.z = _3415;
    int _3445 = int(_3277) + int(_3389);
    float _3447 = trunc(_3421);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = ~_3087;
    int _3455 = _3453 + 1;
    int _3457 = int(_3257) + int(_3363);
    int _3459 = ~_3157;
    int _3461 = _3459 + 1;
    int _3463 = int(_3309) + int(_3427);
    int _3465 = ~_3179;
    int _3467 = _3465 + 1;
    int _3469 = _3443 * _3445;
    int _3471 = _3469 + _3227;
    bool _3473 = _3113 == 0;
    int _3475 = _3455 * _3457;
    int _3477 = _3475 + _3221;
    int _3479 = _3461 * _3463;
    int _3481 = _3479 + _3247;
    bool _3483 = uint(_3471) >= uint(_3113);
    float _3485 = _3391 * _3365;
    bool _3487 = uint(_3477) >= uint(_3087);
    int _3489 = int(_3335) + int(_3451);
    float _3491 = fma(_3417, _3415, _3485);
    bool _3493 = !_3483;
    int _3495 = _3493 ? 0 : (-1);
    float _3497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3499 = !_3487;
    int _3501 = _3499 ? 0 : (-1);
    int _3503 = _3467 * _3489;
    int _3505 = _3503 + _3243;
    int _3507 = ~_3445;
    int _3509 = _3507 + _3495;
    int _3511 = _3509 + 1;
    bool _3513 = uint(_3481) >= uint(_3157);
    int _3515 = ~_3457;
    int _3517 = _3515 + _3501;
    int _3519 = _3517 + 1;
    float _3521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3523 = _3221 ^ _3087;
    int _3525 = _3113 * _3511;
    int _3527 = _3525 + _3227;
    bool _3529 = !_3513;
    int _3531 = _3529 ? 0 : (-1);
    uint _3533 = uint(int(uint(_3523) >> uint(31)));
    int _3535 = _3087 * _3519;
    int _3537 = _3535 + _3221;
    bool _3539 = _3087 == 0;
    float _3541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3543 = _3087 == 0;
    bool _3545 = uint(_3505) >= uint(_3179);
    int _3547 = _3227 ^ _3113;
    float _3549 = _3413 + 0.5;
    int _3551 = ~_3531;
    int _3553 = _3463 + _3551;
    int _3555 = _3553 + 1;
    float _3557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3559 = ~int(_3533);
    int _3561 = _3559 + 1;
    float _3563 = _3521 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3565 = !_3545;
    int _3567 = _3565 ? 0 : (-1);
    uint _3569 = uint(int(uint(_3547) >> uint(31)));
    bool _3571 = _3113 == 0;
    int _3573 = _3555 ^ _3561;
    int _3575 = ~_3567;
    int _3577 = _3489 + _3575;
    int _3579 = _3577 + 1;
    float _3581 = fma(_3391, _3391, 1.0);
    int _3583 = ~int(_3569);
    int _3585 = _3583 + 1;
    int _3587 = ~_3561;
    int _3589 = _3587 + _3573;
    int _3591 = _3589 + 1;
    float _3593 = _3497 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3595 = _3579 ^ _3585;
    float _3597 = rsqrt(_3581);
    bool _3599 = !_3473;
    int _3601 = _3599 ? _3527 : (-1);
    bool _3603 = !_3539;
    int _3605 = _3603 ? _3537 : (-1);
    int _3607 = ~_3585;
    int _3609 = _3607 + _3595;
    int _3611 = _3609 + 1;
    float _3613 = _3433 + 0.5;
    float _3615 = float(_3601);
    float _3617 = float(_3605);
    bool _3619 = !_3571;
    int _3621 = _3619 ? _3611 : (-1);
    float _3623 = fma(_3563, _3615, _1185);
    float _3625 = _3557 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3627 = fma(_3593, _3617, _1137);
    float _3629 = float(_3621);
    float _3631 = _3541 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3633 = !_3543;
    int _3635 = _3633 ? _3591 : (-1);
    float _3637 = fma(_3593, _3613, _3627);
    float _3639 = _1437 + (-0.5);
    float _3641 = -_1227;
    float _3643 = fma(_3631, _3629, _3641);
    float _3645 = float(_3635);
    float _3647 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3649 = _3391 * _3597;
    float _3651 = fma(_3563, _3549, _3623);
    float _3653 = -_423;
    float _3655 = fma(_3625, _3645, _3653);
    float _3657 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3647);
    float _3659 = _3401 + (-0.5);
    float _3661 = -_3631;
    float _3663 = fma(_3661, _3639, _3643);
    float _3665 = -_3403;
    float _3667 = _3649 * _3665;
    float _3669 = -_3371;
    float _3671 = _3649 * _3669;
    float _3673 = -_3625;
    float _3675 = fma(_3673, _3659, _3655);
    float _3677 = -_3437;
    float _3679 = _3649 * _3677;
    float _3681 = fma(_3597, _3347, _3667);
    float _3683 = _2065 * 0.5;
    float _3685 = fma(_3597, _3357, _3671);
    float _3687 = -_1223;
    float _3689 = _3687 + 1.0;
    float _3691 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3657);
    float _3693 = fma(_2111, -0.5, _3683);
    float _3695 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3697 = -_3689;
    float _3699 = fma(_3433, _3697, _3637);
    float _3701 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3691);
    float _3703 = -_1201;
    float _3705 = _3703 + 1.0;
    float _3707 = _3695 * _2139;
    float _3709 = -_2192;
    float _3711 = fma(_3413, _3709, _3651);
    float _3713 = _3371 + _3435;
    float _3715 = -_3695;
    float _3717 = _3715 + 1.0;
    float _3719 = _3701 + _2065;
    float _3721 = _2109 + _2065;
    float _3723 = _2150 * _3707;
    float _3725 = _2160 * _3707;
    float _3727 = fma(_3401, _3705, _3675);
    float _3729 = _2150 * _3717;
    float _3731 = fma(_1437, _2196, _3663);
    float _3733 = _3719 * 0.5;
    float _3735 = _3721 * 0.5;
    float _3737 = _3403 + _3439;
    float _3739 = _3437 + _3491;
    float _3741 = fma(_2156, _3723, _2144);
    float _3743 = fma(_2158, _3723, _2146);
    float _3745 = fma(_2150, _3725, _2148);
    out.m_84.x = _3699;
    out.m_84.y = _3727;
    out.m_84.z = _3711;
    out.m_84.w = _3731;
    bool _3747 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3749 = isnan(_1843);
    bool _3751 = _3747 || _3749;
    bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3755 = _3751 || _3753;
    float _3757 = fma(_3597, _3365, _3679);
    out.m_86.x = _3735;
    out.m_86.y = _3693;
    out.m_86.z = _3733;
    out.m_86.w = _2065;
    out.m_88.x = _3741;
    out.m_88.y = _3743;
    out.m_88.z = _3745;
    out.m_88.w = _3729;
    out.m_90.x = _3713;
    out.m_90.y = _3737;
    out.m_90.z = _3739;
    float _3759 = _3723;
    float _3761 = _3685;
    float _3763 = _3701;
    if (!_3755)
    {
        _3759 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3765 = _3759;
    out.m_92.x = _3685;
    out.m_92.y = _3681;
    out.m_92.z = _3757;
    out.gl_Position.x = _2109;
    out.gl_Position.y = _2111;
    out.gl_Position.z = _3701;
    out.gl_Position.w = _2065;
    float _3767 = _1821 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3769 = _3765;
    float _3771 = _3765;
    if (!_3755)
    {
        _3761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3773 = _3761;
    float _3775 = _3773;
    float _3777 = _3773;
    if (!_3755)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3779 = _2232;
    float _3781 = _3779;
    float _3783 = _3779;
    if (!_3755)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3785 = _3763;
    float _3787 = _3785;
    float _3789 = _3785;
    if (!_3755)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3791 = _2234;
    float _3793 = _3791;
    float _3795 = _3791;
    if (!_3755)
    {
        _2236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3797 = _2236;
    bool _3799 = !_3755;
    float _3801 = _3797;
    float _3803 = _3797;
    if (!_3799)
    {
        bool _3805 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3807 = isnan(_1843);
        bool _3809 = _3805 || _3807;
        bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3813 = _3809 || _3811;
        if (!_3813)
        {
            float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3817 = _1843 + _3815;
            float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3821 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3819;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3827 = 1.0 / _3821;
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3845 = _3817 * _3827;
            float _3847 = precise::clamp(_3845, 0.0, 1.0);
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3853 = fma(_3847, _3825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3855 = fma(_3847, _3851, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3857 = fma(_3847, _3831, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3859 = fma(_3847, _3835, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3861 = fma(_3847, _3839, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3863 = fma(_3847, _3843, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3783 = _3857;
            _3803 = _3861;
            _3777 = _3853;
            _3795 = _3859;
            _3789 = _3855;
            _3771 = _3863;
            _3865 = true;
        }
        else
        {
            bool _3867 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3869 = isnan(_1843);
            bool _3871 = _3867 || _3869;
            bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3875 = _3871 || _3873;
            if (!_3875)
            {
                _3775 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3877 = _3775;
            _3777 = _3877;
            if (!_3875)
            {
                _3781 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3879 = _3781;
            _3783 = _3879;
            if (!_3875)
            {
                _3787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3881 = _3787;
            _3789 = _3881;
            if (!_3875)
            {
                _3793 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3883 = _3793;
            _3795 = _3883;
            if (!_3875)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3885 = _3801;
            _3803 = _3885;
            if (!_3875)
            {
                _3769 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3887 = _3769;
            bool _3889 = !_3875;
            _3771 = _3887;
            if (!_3889)
            {
                bool _3891 = _1843 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3893 = isnan(_1843);
                bool _3895 = _3891 || _3893;
                bool _3897 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3899 = _3895 || _3897;
                if (!_3899)
                {
                    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3903 = _1843 + _3901;
                    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3907 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3905;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3913 = 1.0 / _3907;
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3917 = _3915 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3921 = _3919 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3923 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3925 = _3923 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3931 = _3903 * _3913;
                    float _3933 = precise::clamp(_3931, 0.0, 1.0);
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3939 = fma(_3933, _3911, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3941 = fma(_3933, _3937, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3943 = fma(_3933, _3917, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3945 = fma(_3933, _3921, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3947 = fma(_3933, _3925, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3949 = fma(_3933, _3929, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3783 = _3943;
                    _3803 = _3947;
                    _3777 = _3939;
                    _3795 = _3945;
                    _3789 = _3941;
                    _3771 = _3949;
                    _3865 = true;
                }
                else
                {
                    _3783 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3777 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3795 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3771 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3865 = false;
    float _3951 = _3783;
    float _3953 = _3803;
    float _3955 = _3777;
    float _3957 = _3795;
    float _3959 = _3789;
    float _3961 = _3771;
    float _3963 = fma(_3737, -0.5, 0.5);
    float _3965 = precise::clamp(_3963, 0.0, 1.0);
    float _3967 = -_3951;
    float _3969 = _3967 + _3953;
    float _3971 = _3767 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3973 = -_3955;
    float _3975 = _3973 + _3957;
    float _3977 = fma(_3965, _3969, _3951);
    out.m_94.x = 0.0;
    float _3979 = -_3959;
    float _3981 = _3979 + _3961;
    float _3983 = fma(_3965, _3975, _3955);
    float _3985 = _3977 * 0.586610972881317138671875;
    out.m_47.x = _3971;
    bool _3987 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3989 = fma(_3965, _3981, _3959);
    float _3991 = fma(_3983, 0.298911988735198974609375, _3985);
    bool _3993 = _1821 > 0.0;
    bool _3995 = isnan(_1821);
    bool _3997 = _3993 || _3995;
    bool _3999 = isnan(0.0);
    bool _4001 = _3997 || _3999;
    float _4003 = fma(_3989, 0.114477999508380889892578125, _3991);
    float _4005 = -_4003;
    float _4007 = _3983 + _4005;
    float _4009 = -_4003;
    float _4011 = _3977 + _4009;
    float _4013 = -_4003;
    float _4015 = _3989 + _4013;
    float _4017 = fma(_4007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    float _4019 = fma(_4011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    float _4021 = fma(_4015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4003);
    bool _4023 = !_3987;
    if (!_4023)
    {
        float _4025 = -_1755;
        float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4029 = -_1757;
        float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4033 = -_1759;
        float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4037 = _4027 * _4027;
        float _4039 = fma(_4031, _4031, _4037);
        float _4041 = fma(_4035, _4035, _4039);
        float _4043 = sqrt(_4041);
        float _4045 = rsqrt(_4041);
        float _4047 = -_4043;
        float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4053 = precise::clamp(_4051, 0.0, 1.0);
        float _4055 = _4031 * _4045;
        float _4057 = _4027 * _4045;
        float _4059 = abs(_4053);
        float _4061 = log2(_4059);
        float _4063 = _4035 * _4045;
        float _4065 = _4055 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4067 = _3737 * _4057;
        float _4069 = -_4057;
        float _4071 = -_4065;
        float _4073 = fma(_4069, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4071);
        float _4075 = fma(_3713, _4055, _4067);
        float _4077 = -_4063;
        float _4079 = fma(_4077, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4073);
        float _4081 = fma(_3739, _4063, _4075);
        float _4083 = precise::clamp(_4081, 0.0, 1.0);
        float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4087 = _4079 + _4085;
        float _4089 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4091 = _4087 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4093 = precise::clamp(_4091, 0.0, 1.0);
        float _4095 = exp2(_4089);
        float _4097 = _4095 * _4093;
        float _4099 = _4083 * _4097;
        float _4101 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4103 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4105 = _4099 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4101;
        out.m_94.y = _4103;
        out.m_94.z = _4105;
    }
    out.m_70.x = _4017;
    out.m_70.y = _4019;
    out.m_70.z = _4021;
    if (_4001)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4107 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4107;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

