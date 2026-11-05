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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1376 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1681 = as_type<float>(_111);
        out.gl_Position.z = _1681;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1749 = as_type<float>(_147);
        out.gl_Position.z = _1749;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _151 = !_149;
    float _169;
    if (!_151)
    {
        float _153 = in.m_53.x;
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_95);
        float _175 = 1.0 / _173;
        float _177 = _129 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _179 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _193 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _195 = isnan(_179);
    bool _197 = _193 || _195;
    bool _199 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _201 = _197 || _199;
    float _203 = float(_201);
    float _205 = 1.0 / _189;
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    bool _209 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _211 = isnan(_179);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _207);
    float _223 = -_203;
    float _225 = _223 + 1.0;
    float _227 = sqrt(_221);
    float _229 = _219 * _225;
    float _231 = -_219;
    float _233 = _231 + 1.0;
    int _235 = as_type<int>(_181) & 1;
    bool _237 = _235 != 0;
    int _239 = as_type<int>(_181) & 2;
    bool _241 = _239 != 0;
    float _243 = in.m_46.x;
    float _245 = in.m_46.y;
    float _247 = in.m_46.z;
    float _249 = _185 * _205;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = rsqrt(_221);
    float _261 = in.m_58.x;
    float _263 = in.m_58.y;
    float _265 = fma(_253, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_257, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _269 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _271 = isnan(0.5);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _277 = _273 || _275;
    float _279 = _265 * _229;
    float _281 = precise::max(_227, 2.0);
    float _283 = _267 * _229;
    bool _285 = !_241;
    float _287 = _285 ? (-0.5) : 0.5;
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _291 = precise::min(_281, 15.0);
    float _293 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    bool _295 = !_237;
    float _297 = _295 ? (-0.5) : 0.5;
    float _299 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    bool _301 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _303 = isnan(0.5);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _309 = _305 || _307;
    float _311 = fma(_291, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _313 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[144].y, _293);
    float _315 = -_245;
    float _317 = _287 + _315;
    float _319 = -_243;
    float _321 = _297 + _319;
    float _323 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _325 = -_317;
    float _327 = fma(_317, _259, _325);
    float _329 = -_321;
    float _331 = fma(_321, _259, _329);
    float _333 = _313 * _263;
    float _335 = _299 * _261;
    float _337 = fma(_311, _327, _317);
    float _339 = fma(_311, _331, _321);
    float _341 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _345 = _337 + _245;
    float _347 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _349 = _339 + _243;
    float _351 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _323);
    float _353 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _345);
    float _355 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _357 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _347);
    float _359 = -_259;
    float _361 = fma(_359, _247, _247);
    float _363 = _343 * _353;
    float _365 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _367 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _349);
    float _369 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _371 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _355);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _357);
    float _375 = _311 * _361;
    float _377 = _365 * _367;
    float _379 = _363 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _381 = _363 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _375);
    float _385 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[26].x, _379);
    float _389 = _369 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[24].x, _381);
    float _393 = _385 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _387);
    float _397 = _373 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _391);
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[11].x, _393);
    float _403 = _395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _405 = _385 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _407 = _399 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].z, _401);
    float _411 = _397 + _403;
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[10].x, _405);
    float _415 = _389 + _407;
    float _417 = _409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _419 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _421 = _411 + _419;
    float _423 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].z, _413);
    float _425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _427 = _415 + _425;
    float _429 = 1.0 / _417;
    float _431 = _421 * _421;
    float _433 = _423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _435 = _363 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _437 = fma(_427, _427, _431);
    float _439 = _433 + _417;
    float _441 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[25].x, _435);
    float _443 = sqrt(_437);
    float _445 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _441);
    float _447 = _439 * _429;
    float _449 = _447 * 0.5;
    float _451 = _445 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _455 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _453);
    float _457 = _385 + _451;
    bool _459 = _443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _461 = 1.0 / _455;
    float _463 = _337;
    float _465 = _415;
    float _467 = _411;
    float _469 = _427;
    float _471 = _421;
    float _473 = _417;
    float _475 = _389;
    if (!_459)
    {
        _463 = _457;
    }
    float _477 = _463;
    bool _479 = !_459;
    float _481 = _477;
    float _483 = _461;
    if (!_479)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _489 = _443 + _487;
        float _491 = rsqrt(_437);
        float _493 = _489 * _485;
        float _495 = _457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = _497 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _497 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 + (-1.0);
        float _509 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _511 = fma(_505, _495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _513 = fma(_457, _501, _509);
        float _515 = _491 * _511;
        float _517 = fma(_427, _515, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _519 = fma(_421, _515, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _465 = _517;
        _481 = _513;
        _467 = _519;
    }
    float _521 = _465;
    float _523 = _481;
    float _525 = _467;
    float _527 = _523;
    float _529 = _521;
    float _531 = _525;
    if (_277)
    {
        _469 = 1.0;
    }
    float _533 = _469;
    float _535 = _533;
    if (!_309)
    {
        float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _539 = _385 + _537;
        float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _543 = _389 + _541;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _547 = -_389;
        float _549 = _547 + _521;
        float _551 = _539 * _539;
        float _553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _555 = _397 + _553;
        float _557 = fma(_543, _543, _551);
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _561 = fma(_555, _555, _557);
        float _563 = sqrt(_561);
        float _565 = _545 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _567 = precise::min(_563, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _569 = _567 * _559;
        float _571 = -_385;
        float _573 = _571 + _523;
        float _575 = _565 * _569;
        float _577 = -_397;
        float _579 = _577 + _525;
        float _581 = fma(_573, _575, _385);
        float _583 = fma(_549, _575, _389);
        float _585 = fma(_579, _575, _397);
        _527 = _581;
        _529 = _583;
        _531 = _585;
    }
    float _587 = _527;
    float _589 = _529;
    float _591 = _531;
    if (_277)
    {
        _471 = 1.0;
    }
    float _593 = _471;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _597 = _461 * _595;
    float _599 = _593;
    if (!_277)
    {
        float _601 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _607 = _603 * 6.283185482025146484375;
        float _609 = cos(_607);
        float _611 = _605 * 0.15915493667125701904296875;
        float _613 = _603 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = 1.0 / _609;
        float _619 = _611 * 6.283185482025146484375;
        float _621 = cos(_619);
        float _623 = _615 * _617;
        float _625 = _611 * 6.283185482025146484375;
        float _627 = sin(_625);
        float _629 = _621 * _623;
        float _631 = 1.0 / _629;
        float _633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _633;
        float _637 = 1.0 / _635;
        float _639 = _627 * _631;
        float _641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _643 = fma(_597, _639, _641);
        float _645 = _643 * _637;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        _483 = _603;
        _535 = _647;
    }
    float _649 = _483;
    float _651 = _535;
    float _653 = _649;
    if (!_277)
    {
        float _655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _657 = _655 * 0.15915493667125701904296875;
        float _659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _661 = _657 * 6.283185482025146484375;
        float _663 = cos(_661);
        float _665 = _659 * 0.15915493667125701904296875;
        float _667 = _657 * 6.283185482025146484375;
        float _669 = sin(_667);
        float _671 = 1.0 / _663;
        float _673 = _665 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _669 * _671;
        float _679 = _665 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = _675 * _677;
        float _685 = 1.0 / _683;
        float _687 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _689 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _687;
        float _691 = 1.0 / _689;
        float _693 = _681 * _685;
        float _695 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _697 = fma(_597, _693, _695);
        float _699 = _697 * _691;
        float _701 = precise::clamp(_699, 0.0, 1.0);
        float _703 = -_701;
        float _705 = _703 + 1.0;
        _653 = _671;
        _599 = _705;
    }
    float _707 = _653;
    float _709 = _599;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _713 = _587 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _589 + _715;
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _721 = _591 + _719;
    float _723 = _713 * _713;
    float _725 = fma(_717, _717, _723);
    float _727 = fma(_721, _721, _725);
    float _729 = rsqrt(_727);
    float _731 = sqrt(_727);
    float _733 = _729 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _735 = _717 * _733;
    float _737 = _721 * _733;
    float _739 = _735 * _735;
    float _741 = _737 * _737;
    float _743 = _739 + _741;
    float _745 = sqrt(_743);
    bool _747 = _745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _751 = _745 + _749;
    float _753 = _707;
    float _755 = _729;
    float _757 = _751;
    float _759 = _713;
    if (_747)
    {
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _753 = _761;
    }
    float _763 = _753;
    if (_747)
    {
        float _765 = rsqrt(_743);
        _755 = _765;
    }
    float _767 = _755;
    float _769 = _767;
    if (_747)
    {
        float _771 = _751 * _763;
        _757 = _771;
    }
    float _773 = _757;
    if (_747)
    {
        float _775 = _773 * 0.15915493667125701904296875;
        _473 = _775;
    }
    float _777 = _473;
    float _779 = _721;
    float _781 = _777;
    if (_747)
    {
        float _783 = _777 * 6.283185482025146484375;
        float _785 = sin(_783);
        _779 = _785;
    }
    float _787 = _779;
    float _789 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _791 = precise::max(0.0, _789);
    float _793 = _763;
    if (_747)
    {
        float _795 = _777 * 6.283185482025146484375;
        float _797 = cos(_795);
        _793 = _797;
    }
    float _799 = _793;
    float _801 = -_733;
    float _803 = -_791;
    float _805 = fma(_713, _801, _803);
    if (_747)
    {
        float _807 = _805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _759 = _807;
    }
    float _809 = _759;
    float _811 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _813 = _809;
    float _815 = _787;
    if (_747)
    {
        float _817 = fma(_787, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _813 = _817;
    }
    float _819 = _813;
    float _821 = _819;
    if (!_747)
    {
        _815 = _805;
    }
    float _823 = _815;
    float _825 = floor(_811);
    float _827 = _823;
    float _829 = _799;
    if (_747)
    {
        float _831 = _799 + (-1.0);
        _475 = _831;
    }
    float _833 = _475;
    float _835 = 0.0;
    float _837 = _833;
    if (_747)
    {
        float _839 = _767 * _819;
        _835 = _839;
    }
    float _841 = _835;
    if (!_747)
    {
        _769 = _735;
    }
    float _843 = _769;
    float _845 = _843;
    if (_747)
    {
        float _847 = _833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _781 = _847;
    }
    float _849 = _781;
    if (_747)
    {
        float _851 = _735 * _841;
        _845 = _851;
    }
    float _853 = _845;
    if (!_747)
    {
        _821 = _737;
    }
    float _855 = _821;
    float _857 = _855;
    if (_747)
    {
        float _859 = _737 * _841;
        _857 = _859;
    }
    float _861 = _857;
    if (!_747)
    {
        _837 = _739;
    }
    float _863 = _837;
    float _865 = _863;
    if (_747)
    {
        float _867 = fma(_805, _799, _849);
        _827 = _867;
    }
    float _869 = _827;
    if (_747)
    {
        float _871 = _853 * _853;
        _865 = _871;
    }
    float _873 = _865;
    if (!_747)
    {
        _829 = _741;
    }
    float _875 = _829;
    float _877 = _875;
    if (_747)
    {
        float _879 = _861 * _861;
        _877 = _879;
    }
    float _881 = _877;
    float _883 = fma(_869, _869, _873);
    float _885 = _587 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _887 = _883 + _881;
    float _889 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[2].x, _885);
    float _891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _893 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[23].w, _891);
    float _895 = precise::clamp(_893, 0.0, 1.0);
    float _897 = rsqrt(_887);
    float _899 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[2].z, _889);
    float _901 = -_895;
    float _903 = _901 + 1.0;
    float _905 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _907 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _909 = _899 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _911 = _587 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = abs(_903);
    float _915 = log2(_913);
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _919 = _587 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _923 = -_917;
    float _925 = fma(_923, _907, 1.0);
    float _927 = _587 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _929 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _931 = _897 * _853;
    float _933 = _897 * _869;
    float _935 = _897 * _861;
    float _937 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[0].x, _927);
    float _939 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[1].z, _929);
    float _941 = _931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _943 = floor(_905);
    float _945 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[0].z, _937);
    float _947 = _939 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _949 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[3].z, _921);
    float _951 = -_941;
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[21].y, _951);
    float _955 = _945 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _957 = _947 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _959 = _915 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _961 = _949 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _963 = -_935;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _953);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[7].x, _957);
    float _969 = exp2(_959);
    float _971 = -_825;
    float _973 = _811 + _971;
    float _975 = fma(_965, -0.5, 0.5);
    float _977 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[7].z, _967);
    float _979 = -_943;
    float _981 = _905 + _979;
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _977);
    float _985 = _947 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _987 = fma(_965, 0.5, 0.5);
    float _989 = log2(_925);
    float _991 = _947 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _993 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[4].x, _985);
    float _995 = fma(_987, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _997 = _933 + 1.0;
    float _999 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[5].x, _991);
    float _1001 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[4].z, _993);
    float _1003 = fma(_987, _995, -0.212114393711090087890625);
    float _1005 = 1.0 / _983;
    float _1007 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[5].z, _999);
    float _1009 = -_933;
    float _1011 = fma(_969, _997, _1009);
    float _1013 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1001);
    float _1015 = fma(_987, _1003, 1.570728778839111328125);
    float _1017 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1007);
    float _1019 = sqrt(_975);
    float _1021 = _989 * 0.693147182464599609375;
    float2 _3157 = float2(_973, _981);
    float _1023 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3157, float2(0.0), isnan(_3157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3157, float2(0.0), isnan(_3157)), level(0.0)).x;
    float _1025 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1027 = _1013 * _1005;
    float _1029 = _1017 * _1005;
    float _1031 = fma(_1027, 0.5, 0.5);
    float _1033 = fma(_1029, -0.5, 0.5);
    float _1035 = _1019 * 0.636619746685028076171875;
    float3 _3185 = float3(_1031, _1033, _1025);
    float _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3185, float3(0.0), isnan(_3185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3185, float3(0.0), isnan(_3185)), level(0.0)).x;
    float _1039 = -_1015;
    float _1041 = fma(_1035, _1039, 1.0);
    float _1043 = fma(_1011, 0.5, 0.5);
    float3 _3203 = float3(_1031, _1033, _1025);
    float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3203, float3(0.0), isnan(_3203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3203, float3(0.0), isnan(_3203)), level(0.0)).xyzw;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = _1046.w;
    float2 _3219 = float2(_1041, _1043);
    float3 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3219, float2(0.0), isnan(_3219)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3219, float2(0.0), isnan(_3219)), level(0.0)).xyz;
    float _1060 = _1058.x;
    float _1062 = _1058.y;
    float _1064 = _1058.z;
    float _1066 = abs(_597);
    float _1068 = log2(_1066);
    float _1070 = in.m_53.x;
    float _1072 = in.m_53.y;
    float _1074 = _915 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1076 = _345 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1078 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1082 = _1080 != 0;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1086 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1088 = exp2(_1074);
    bool _1090 = _1070 > 0.5;
    float _1092 = exp2(_1086);
    bool _1094 = _1072 > 0.5;
    float _1096 = -_297;
    int _1098 = _1090 ? as_type<int>(_1096) : as_type<int>(_297);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1102 = _1100 != 0;
    bool _1104 = !_1082;
    float _1106 = _1104 ? _297 : as_type<float>(_1098);
    float _1108 = -_1088;
    float _1110 = _1108 + 1.0;
    float _1112 = -_287;
    int _1114 = _1094 ? as_type<int>(_1112) : as_type<int>(_287);
    float _1116 = _1106 + 0.5;
    bool _1118 = !_1102;
    float _1120 = _1118 ? _287 : as_type<float>(_1114);
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1124 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1132 = fma(_1126, -2.0, 3.0);
    float _1134 = _1126 * _1126;
    float _1136 = -_1120;
    float _1138 = _1136 + 0.5;
    bool _1140 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1142 = isnan(_731);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1148 = _1144 || _1146;
    float _1150 = _1134 * _1132;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1154 = _947 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1160 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1162 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1154);
    float _1164 = _1130 * _1084;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1170 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1160 * _1128;
    float _1176 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1178 = -_1150;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1162);
    float _1184 = in.m_60.x;
    float _1186 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1150);
    float _1188 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1182);
    out.m_62.x = _1168;
    out.m_62.y = _1170;
    out.m_62.z = _1172;
    out.m_62.w = _1166;
    float _1190 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_64.x = _1164;
    out.m_64.y = _1174;
    float _1192 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1190);
    bool _1194 = _597 <= 8000.0;
    bool _1196 = isnan(_597);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(8000.0);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = _1188 + _983;
    float _1210 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1212 = _1204 * _1186;
    float _1214 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1216 = _1208 * 0.5;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1214);
    float _1222 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    out.gl_Position.x = _1013;
    out.gl_Position.y = _1017;
    out.gl_Position.z = _1188;
    out.gl_Position.w = _983;
    float _1224 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1210);
    out.m_66.z = _1216;
    out.m_66.w = _983;
    float _1226 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1224);
    out.m_68.x = _1226;
    out.m_68.y = _1220;
    out.m_68.z = _1222;
    float _1228 = -_1122;
    float _1230 = _1228 + 1.0;
    float _1232 = _983;
    float _1234 = _1188;
    float _1236 = _1017;
    if (!_1148)
    {
        _1232 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1238 = _1232;
    float _1240 = _1238;
    float _1242 = _1238;
    if (!_1148)
    {
        _1234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1244 = _1234;
    float _1246 = _1244;
    float _1248 = _1244;
    if (!_1148)
    {
        _1236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1250 = _1236;
    float _1252 = -_1023;
    float _1254 = _1252 + 1.0;
    float _1256 = _1254 * _1218;
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = -_1258;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1264 = _1262 * _1184;
    float _1266 = _1122 * _1037;
    float _1268 = _1054 * _1266;
    float _1270 = _1054 * _1230;
    float _1272 = _651 * _709;
    float _1274 = _1064 * _1266;
    float _1276 = fma(_1060, _1268, _1048);
    float _1278 = fma(_1062, _1268, _1050);
    float _1280 = _1264 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1282 = fma(_1054, _1274, _1052);
    float _1284 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1286 = _1264;
    float _1288 = _1048;
    float _1290 = _1272;
    float _1292 = _1250;
    float _1294 = _1250;
    if (!_1148)
    {
        _1286 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1296 = _1286;
    out.m_70.x = _1280;
    float _1298 = _1296;
    float _1300 = _1296;
    if (!_1148)
    {
        _1288 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1302 = _1288;
    float _1304 = _1302;
    float _1306 = _1302;
    if (!_1148)
    {
        _1290 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1308 = _1290;
    out.m_72.x = _1276;
    out.m_72.y = _1278;
    out.m_72.z = _1282;
    out.m_72.w = _1270;
    bool _1310 = !_1148;
    float _1312 = _1308;
    float _1314 = _1308;
    if (!_1310)
    {
        bool _1316 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1318 = isnan(_731);
        bool _1320 = _1316 || _1318;
        bool _1322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1324 = _1320 || _1322;
        if (!_1324)
        {
            float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1328 = _731 + _1326;
            float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1330;
            float _1334 = 1.0 / _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1338 = _1336 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1346 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1350 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1356 = _1328 * _1334;
            float _1358 = precise::clamp(_1356, 0.0, 1.0);
            float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1362 = _1360 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1364 = fma(_1358, _1338, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1366 = fma(_1358, _1362, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1368 = fma(_1358, _1342, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1370 = fma(_1358, _1346, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1372 = fma(_1358, _1350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1374 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1306 = _1366;
            _1294 = _1372;
            _1300 = _1364;
            _1248 = _1370;
            _1242 = _1368;
            _1314 = _1374;
            _1376 = true;
        }
        else
        {
            bool _1378 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1380 = isnan(_731);
            bool _1382 = _1378 || _1380;
            bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1386 = _1382 || _1384;
            if (!_1386)
            {
                _1298 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1388 = _1298;
            _1300 = _1388;
            if (!_1386)
            {
                _1304 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1390 = _1304;
            _1306 = _1390;
            if (!_1386)
            {
                _1240 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1392 = _1240;
            _1242 = _1392;
            if (!_1386)
            {
                _1246 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1394 = _1246;
            _1248 = _1394;
            if (!_1386)
            {
                _1292 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1396 = _1292;
            _1294 = _1396;
            if (!_1386)
            {
                _1312 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1398 = _1312;
            bool _1400 = !_1386;
            _1314 = _1398;
            if (!_1400)
            {
                bool _1402 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1404 = isnan(_731);
                bool _1406 = _1402 || _1404;
                bool _1408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1410 = _1406 || _1408;
                if (!_1410)
                {
                    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1414 = _731 + _1412;
                    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1416;
                    float _1420 = 1.0 / _1418;
                    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1428 = _1426 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1432 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1436 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1440 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1442 = _1414 * _1420;
                    float _1444 = precise::clamp(_1442, 0.0, 1.0);
                    float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1448 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1450 = fma(_1444, _1424, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1452 = fma(_1444, _1448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1454 = fma(_1444, _1428, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1456 = fma(_1444, _1432, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1458 = fma(_1444, _1436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1460 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1306 = _1452;
                    _1294 = _1458;
                    _1300 = _1450;
                    _1248 = _1456;
                    _1242 = _1454;
                    _1314 = _1460;
                    _1376 = true;
                }
                else
                {
                    _1306 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1294 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1300 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1248 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1242 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1314 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1376 = false;
    float _1462 = _1306;
    float _1464 = _1294;
    float _1466 = _1300;
    float _1468 = _1248;
    float _1470 = _1242;
    float _1472 = _1314;
    float _1474 = fma(_1220, -0.5, 0.5);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = -_1462;
    float _1480 = _1478 + _1464;
    float _1482 = _1284 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1484 = -_1466;
    float _1486 = _1484 + _1468;
    float _1488 = fma(_1476, _1480, _1462);
    out.m_74.x = 0.0;
    float _1490 = -_1470;
    float _1492 = _1490 + _1472;
    float _1494 = fma(_1476, _1486, _1466);
    float _1496 = _1488 * 0.586610972881317138671875;
    out.m_49.x = _1482;
    bool _1498 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1500 = fma(_1476, _1492, _1470);
    float _1502 = fma(_1494, 0.298911988735198974609375, _1496);
    bool _1504 = _651 > 0.0;
    bool _1506 = isnan(_651);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(0.0);
    bool _1512 = _1508 || _1510;
    float _1514 = fma(_1500, 0.114477999508380889892578125, _1502);
    bool _1516 = _709 <= 0.0;
    bool _1518 = !_1512;
    bool _1520 = _1516 || _1518;
    float _1522 = -_1514;
    float _1524 = _1494 + _1522;
    float _1526 = -_1514;
    float _1528 = _1488 + _1526;
    float _1530 = -_1514;
    float _1532 = _1500 + _1530;
    float _1534 = fma(_1524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    float _1536 = fma(_1528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    float _1538 = fma(_1532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    bool _1540 = !_1498;
    if (!_1540)
    {
        float _1542 = -_587;
        float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1546 = -_589;
        float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1550 = -_591;
        float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1554 = _1544 * _1544;
        float _1556 = fma(_1548, _1548, _1554);
        float _1558 = fma(_1552, _1552, _1556);
        float _1560 = sqrt(_1558);
        float _1562 = rsqrt(_1558);
        float _1564 = -_1560;
        float _1566 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1568 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        float _1572 = _1548 * _1562;
        float _1574 = _1544 * _1562;
        float _1576 = abs(_1570);
        float _1578 = log2(_1576);
        float _1580 = _1552 * _1562;
        float _1582 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1584 = _1220 * _1574;
        float _1586 = -_1574;
        float _1588 = -_1582;
        float _1590 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1588);
        float _1592 = fma(_1226, _1572, _1584);
        float _1594 = -_1580;
        float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1590);
        float _1598 = fma(_1222, _1580, _1592);
        float _1600 = precise::clamp(_1598, 0.0, 1.0);
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1604 = _1596 + _1602;
        float _1606 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1608 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = exp2(_1606);
        float _1614 = _1612 * _1610;
        float _1616 = _1600 * _1614;
        float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1620 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1622 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _1618;
        out.m_74.y = _1620;
        out.m_74.z = _1622;
    }
    out.m_76.x = _1534;
    out.m_76.y = _1536;
    out.m_76.z = _1538;
    if (!_1520)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1624;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1376 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1681 = as_type<float>(_111);
        out.gl_Position.z = _1681;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1749 = as_type<float>(_147);
        out.gl_Position.z = _1749;
    }
    if (_141)
    {
        return out;
    }
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _151 = !_149;
    float _169;
    if (!_151)
    {
        float _153 = in.m_53.x;
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_95);
        float _175 = 1.0 / _173;
        float _177 = _129 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _179 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _193 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _195 = isnan(_179);
    bool _197 = _193 || _195;
    bool _199 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _201 = _197 || _199;
    float _203 = float(_201);
    float _205 = 1.0 / _189;
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    bool _209 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _211 = isnan(_179);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _207);
    float _223 = -_203;
    float _225 = _223 + 1.0;
    float _227 = sqrt(_221);
    float _229 = _219 * _225;
    float _231 = -_219;
    float _233 = _231 + 1.0;
    int _235 = as_type<int>(_181) & 1;
    bool _237 = _235 != 0;
    int _239 = as_type<int>(_181) & 2;
    bool _241 = _239 != 0;
    float _243 = in.m_46.x;
    float _245 = in.m_46.y;
    float _247 = in.m_46.z;
    float _249 = _185 * _205;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = rsqrt(_221);
    float _261 = in.m_58.x;
    float _263 = in.m_58.y;
    float _265 = fma(_253, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_257, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _269 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _271 = isnan(0.5);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _277 = _273 || _275;
    float _279 = _265 * _229;
    float _281 = precise::max(_227, 2.0);
    float _283 = _267 * _229;
    bool _285 = !_241;
    float _287 = _285 ? (-0.5) : 0.5;
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _291 = precise::min(_281, 15.0);
    float _293 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    bool _295 = !_237;
    float _297 = _295 ? (-0.5) : 0.5;
    float _299 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    bool _301 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _303 = isnan(0.5);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _309 = _305 || _307;
    float _311 = fma(_291, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _313 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[144].y, _293);
    float _315 = -_245;
    float _317 = _287 + _315;
    float _319 = -_243;
    float _321 = _297 + _319;
    float _323 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _325 = -_317;
    float _327 = fma(_317, _259, _325);
    float _329 = -_321;
    float _331 = fma(_321, _259, _329);
    float _333 = _313 * _263;
    float _335 = _299 * _261;
    float _337 = fma(_311, _327, _317);
    float _339 = fma(_311, _331, _321);
    float _341 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _345 = _337 + _245;
    float _347 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _349 = _339 + _243;
    float _351 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _323);
    float _353 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _345);
    float _355 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _357 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _347);
    float _359 = -_259;
    float _361 = fma(_359, _247, _247);
    float _363 = _343 * _353;
    float _365 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _367 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _349);
    float _369 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _371 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _355);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _357);
    float _375 = _311 * _361;
    float _377 = _365 * _367;
    float _379 = _363 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _381 = _363 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _375);
    float _385 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[26].x, _379);
    float _389 = _369 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[24].x, _381);
    float _393 = _385 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _387);
    float _397 = _373 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _391);
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[11].x, _393);
    float _403 = _395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _405 = _385 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _407 = _399 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].z, _401);
    float _411 = _397 + _403;
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[10].x, _405);
    float _415 = _389 + _407;
    float _417 = _409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _419 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _421 = _411 + _419;
    float _423 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].z, _413);
    float _425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _427 = _415 + _425;
    float _429 = 1.0 / _417;
    float _431 = _421 * _421;
    float _433 = _423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _435 = _363 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _437 = fma(_427, _427, _431);
    float _439 = _433 + _417;
    float _441 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[25].x, _435);
    float _443 = sqrt(_437);
    float _445 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _441);
    float _447 = _439 * _429;
    float _449 = _447 * 0.5;
    float _451 = _445 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _455 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _453);
    float _457 = _385 + _451;
    bool _459 = _443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _461 = 1.0 / _455;
    float _463 = _337;
    float _465 = _415;
    float _467 = _411;
    float _469 = _427;
    float _471 = _421;
    float _473 = _417;
    float _475 = _389;
    if (!_459)
    {
        _463 = _457;
    }
    float _477 = _463;
    bool _479 = !_459;
    float _481 = _477;
    float _483 = _461;
    if (!_479)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _489 = _443 + _487;
        float _491 = rsqrt(_437);
        float _493 = _489 * _485;
        float _495 = _457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = _497 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _497 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 + (-1.0);
        float _509 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _511 = fma(_505, _495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _513 = fma(_457, _501, _509);
        float _515 = _491 * _511;
        float _517 = fma(_427, _515, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _519 = fma(_421, _515, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _465 = _517;
        _481 = _513;
        _467 = _519;
    }
    float _521 = _465;
    float _523 = _481;
    float _525 = _467;
    float _527 = _523;
    float _529 = _521;
    float _531 = _525;
    if (_277)
    {
        _469 = 1.0;
    }
    float _533 = _469;
    float _535 = _533;
    if (!_309)
    {
        float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _539 = _385 + _537;
        float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _543 = _389 + _541;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _547 = -_389;
        float _549 = _547 + _521;
        float _551 = _539 * _539;
        float _553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _555 = _397 + _553;
        float _557 = fma(_543, _543, _551);
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _561 = fma(_555, _555, _557);
        float _563 = sqrt(_561);
        float _565 = _545 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _567 = precise::min(_563, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _569 = _567 * _559;
        float _571 = -_385;
        float _573 = _571 + _523;
        float _575 = _565 * _569;
        float _577 = -_397;
        float _579 = _577 + _525;
        float _581 = fma(_573, _575, _385);
        float _583 = fma(_549, _575, _389);
        float _585 = fma(_579, _575, _397);
        _527 = _581;
        _529 = _583;
        _531 = _585;
    }
    float _587 = _527;
    float _589 = _529;
    float _591 = _531;
    if (_277)
    {
        _471 = 1.0;
    }
    float _593 = _471;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _597 = _461 * _595;
    float _599 = _593;
    if (!_277)
    {
        float _601 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _607 = _603 * 6.283185482025146484375;
        float _609 = cos(_607);
        float _611 = _605 * 0.15915493667125701904296875;
        float _613 = _603 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = 1.0 / _609;
        float _619 = _611 * 6.283185482025146484375;
        float _621 = cos(_619);
        float _623 = _615 * _617;
        float _625 = _611 * 6.283185482025146484375;
        float _627 = sin(_625);
        float _629 = _621 * _623;
        float _631 = 1.0 / _629;
        float _633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _633;
        float _637 = 1.0 / _635;
        float _639 = _627 * _631;
        float _641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _643 = fma(_597, _639, _641);
        float _645 = _643 * _637;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        _483 = _603;
        _535 = _647;
    }
    float _649 = _483;
    float _651 = _535;
    float _653 = _649;
    if (!_277)
    {
        float _655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _657 = _655 * 0.15915493667125701904296875;
        float _659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _661 = _657 * 6.283185482025146484375;
        float _663 = cos(_661);
        float _665 = _659 * 0.15915493667125701904296875;
        float _667 = _657 * 6.283185482025146484375;
        float _669 = sin(_667);
        float _671 = 1.0 / _663;
        float _673 = _665 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _669 * _671;
        float _679 = _665 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = _675 * _677;
        float _685 = 1.0 / _683;
        float _687 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _689 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _687;
        float _691 = 1.0 / _689;
        float _693 = _681 * _685;
        float _695 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _697 = fma(_597, _693, _695);
        float _699 = _697 * _691;
        float _701 = precise::clamp(_699, 0.0, 1.0);
        float _703 = -_701;
        float _705 = _703 + 1.0;
        _653 = _671;
        _599 = _705;
    }
    float _707 = _653;
    float _709 = _599;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _713 = _587 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _589 + _715;
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _721 = _591 + _719;
    float _723 = _713 * _713;
    float _725 = fma(_717, _717, _723);
    float _727 = fma(_721, _721, _725);
    float _729 = rsqrt(_727);
    float _731 = sqrt(_727);
    float _733 = _729 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _735 = _717 * _733;
    float _737 = _721 * _733;
    float _739 = _735 * _735;
    float _741 = _737 * _737;
    float _743 = _739 + _741;
    float _745 = sqrt(_743);
    bool _747 = _745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _751 = _745 + _749;
    float _753 = _707;
    float _755 = _729;
    float _757 = _751;
    float _759 = _713;
    if (_747)
    {
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _753 = _761;
    }
    float _763 = _753;
    if (_747)
    {
        float _765 = rsqrt(_743);
        _755 = _765;
    }
    float _767 = _755;
    float _769 = _767;
    if (_747)
    {
        float _771 = _751 * _763;
        _757 = _771;
    }
    float _773 = _757;
    if (_747)
    {
        float _775 = _773 * 0.15915493667125701904296875;
        _473 = _775;
    }
    float _777 = _473;
    float _779 = _721;
    float _781 = _777;
    if (_747)
    {
        float _783 = _777 * 6.283185482025146484375;
        float _785 = sin(_783);
        _779 = _785;
    }
    float _787 = _779;
    float _789 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _791 = precise::max(0.0, _789);
    float _793 = _763;
    if (_747)
    {
        float _795 = _777 * 6.283185482025146484375;
        float _797 = cos(_795);
        _793 = _797;
    }
    float _799 = _793;
    float _801 = -_733;
    float _803 = -_791;
    float _805 = fma(_713, _801, _803);
    if (_747)
    {
        float _807 = _805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _759 = _807;
    }
    float _809 = _759;
    float _811 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _813 = _809;
    float _815 = _787;
    if (_747)
    {
        float _817 = fma(_787, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _813 = _817;
    }
    float _819 = _813;
    float _821 = _819;
    if (!_747)
    {
        _815 = _805;
    }
    float _823 = _815;
    float _825 = floor(_811);
    float _827 = _823;
    float _829 = _799;
    if (_747)
    {
        float _831 = _799 + (-1.0);
        _475 = _831;
    }
    float _833 = _475;
    float _835 = 0.0;
    float _837 = _833;
    if (_747)
    {
        float _839 = _767 * _819;
        _835 = _839;
    }
    float _841 = _835;
    if (!_747)
    {
        _769 = _735;
    }
    float _843 = _769;
    float _845 = _843;
    if (_747)
    {
        float _847 = _833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _781 = _847;
    }
    float _849 = _781;
    if (_747)
    {
        float _851 = _735 * _841;
        _845 = _851;
    }
    float _853 = _845;
    if (!_747)
    {
        _821 = _737;
    }
    float _855 = _821;
    float _857 = _855;
    if (_747)
    {
        float _859 = _737 * _841;
        _857 = _859;
    }
    float _861 = _857;
    if (!_747)
    {
        _837 = _739;
    }
    float _863 = _837;
    float _865 = _863;
    if (_747)
    {
        float _867 = fma(_805, _799, _849);
        _827 = _867;
    }
    float _869 = _827;
    if (_747)
    {
        float _871 = _853 * _853;
        _865 = _871;
    }
    float _873 = _865;
    if (!_747)
    {
        _829 = _741;
    }
    float _875 = _829;
    float _877 = _875;
    if (_747)
    {
        float _879 = _861 * _861;
        _877 = _879;
    }
    float _881 = _877;
    float _883 = fma(_869, _869, _873);
    float _885 = _587 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _887 = _883 + _881;
    float _889 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[2].x, _885);
    float _891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _893 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[23].w, _891);
    float _895 = precise::clamp(_893, 0.0, 1.0);
    float _897 = rsqrt(_887);
    float _899 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[2].z, _889);
    float _901 = -_895;
    float _903 = _901 + 1.0;
    float _905 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _907 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _909 = _899 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _911 = _587 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = abs(_903);
    float _915 = log2(_913);
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _919 = _587 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _923 = -_917;
    float _925 = fma(_923, _907, 1.0);
    float _927 = _587 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _929 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _931 = _897 * _853;
    float _933 = _897 * _869;
    float _935 = _897 * _861;
    float _937 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[0].x, _927);
    float _939 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[1].z, _929);
    float _941 = _931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _943 = floor(_905);
    float _945 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[0].z, _937);
    float _947 = _939 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _949 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[3].z, _921);
    float _951 = -_941;
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[21].y, _951);
    float _955 = _945 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _957 = _947 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _959 = _915 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _961 = _949 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _963 = -_935;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _953);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[7].x, _957);
    float _969 = exp2(_959);
    float _971 = -_825;
    float _973 = _811 + _971;
    float _975 = fma(_965, -0.5, 0.5);
    float _977 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[7].z, _967);
    float _979 = -_943;
    float _981 = _905 + _979;
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _977);
    float _985 = _947 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _987 = fma(_965, 0.5, 0.5);
    float _989 = log2(_925);
    float _991 = _947 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _993 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[4].x, _985);
    float _995 = fma(_987, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _997 = _933 + 1.0;
    float _999 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[5].x, _991);
    float _1001 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[4].z, _993);
    float _1003 = fma(_987, _995, -0.212114393711090087890625);
    float _1005 = 1.0 / _983;
    float _1007 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[5].z, _999);
    float _1009 = -_933;
    float _1011 = fma(_969, _997, _1009);
    float _1013 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1001);
    float _1015 = fma(_987, _1003, 1.570728778839111328125);
    float _1017 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1007);
    float _1019 = sqrt(_975);
    float _1021 = _989 * 0.693147182464599609375;
    float2 _3157 = float2(_973, _981);
    float _1023 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3157, float2(0.0), isnan(_3157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3157, float2(0.0), isnan(_3157)), level(0.0)).x;
    float _1025 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1027 = _1013 * _1005;
    float _1029 = _1017 * _1005;
    float _1031 = fma(_1027, 0.5, 0.5);
    float _1033 = fma(_1029, -0.5, 0.5);
    float _1035 = _1019 * 0.636619746685028076171875;
    float3 _3185 = float3(_1031, _1033, _1025);
    float _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3185, float3(0.0), isnan(_3185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3185, float3(0.0), isnan(_3185)), level(0.0)).x;
    float _1039 = -_1015;
    float _1041 = fma(_1035, _1039, 1.0);
    float _1043 = fma(_1011, 0.5, 0.5);
    float3 _3203 = float3(_1031, _1033, _1025);
    float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3203, float3(0.0), isnan(_3203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3203, float3(0.0), isnan(_3203)), level(0.0)).xyzw;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = _1046.w;
    float2 _3219 = float2(_1041, _1043);
    float3 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3219, float2(0.0), isnan(_3219)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3219, float2(0.0), isnan(_3219)), level(0.0)).xyz;
    float _1060 = _1058.x;
    float _1062 = _1058.y;
    float _1064 = _1058.z;
    float _1066 = abs(_597);
    float _1068 = log2(_1066);
    float _1070 = in.m_53.x;
    float _1072 = in.m_53.y;
    float _1074 = _915 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1076 = _345 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1078 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1082 = _1080 != 0;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1086 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1088 = exp2(_1074);
    bool _1090 = _1070 > 0.5;
    float _1092 = exp2(_1086);
    bool _1094 = _1072 > 0.5;
    float _1096 = -_297;
    int _1098 = _1090 ? as_type<int>(_1096) : as_type<int>(_297);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1102 = _1100 != 0;
    bool _1104 = !_1082;
    float _1106 = _1104 ? _297 : as_type<float>(_1098);
    float _1108 = -_1088;
    float _1110 = _1108 + 1.0;
    float _1112 = -_287;
    int _1114 = _1094 ? as_type<int>(_1112) : as_type<int>(_287);
    float _1116 = _1106 + 0.5;
    bool _1118 = !_1102;
    float _1120 = _1118 ? _287 : as_type<float>(_1114);
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1124 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1132 = fma(_1126, -2.0, 3.0);
    float _1134 = _1126 * _1126;
    float _1136 = -_1120;
    float _1138 = _1136 + 0.5;
    bool _1140 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1142 = isnan(_731);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1148 = _1144 || _1146;
    float _1150 = _1134 * _1132;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1154 = _947 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1160 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1162 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1154);
    float _1164 = _1130 * _1084;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1170 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1160 * _1128;
    float _1176 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1178 = -_1150;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1162);
    float _1184 = in.m_60.x;
    float _1186 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1150);
    float _1188 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1182);
    out.m_62.x = _1168;
    out.m_62.y = _1170;
    out.m_62.z = _1172;
    out.m_62.w = _1166;
    float _1190 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_64.x = _1164;
    out.m_64.y = _1174;
    float _1192 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1190);
    bool _1194 = _597 <= 8000.0;
    bool _1196 = isnan(_597);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(8000.0);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = _1188 + _983;
    float _1210 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1212 = _1204 * _1186;
    float _1214 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1216 = _1208 * 0.5;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1214);
    float _1222 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    out.gl_Position.x = _1013;
    out.gl_Position.y = _1017;
    out.gl_Position.z = _1188;
    out.gl_Position.w = _983;
    float _1224 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1210);
    out.m_66.z = _1216;
    out.m_66.w = _983;
    float _1226 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1224);
    out.m_68.x = _1226;
    out.m_68.y = _1220;
    out.m_68.z = _1222;
    float _1228 = -_1122;
    float _1230 = _1228 + 1.0;
    float _1232 = _983;
    float _1234 = _1188;
    float _1236 = _1017;
    if (!_1148)
    {
        _1232 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1238 = _1232;
    float _1240 = _1238;
    float _1242 = _1238;
    if (!_1148)
    {
        _1234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1244 = _1234;
    float _1246 = _1244;
    float _1248 = _1244;
    if (!_1148)
    {
        _1236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1250 = _1236;
    float _1252 = -_1023;
    float _1254 = _1252 + 1.0;
    float _1256 = _1254 * _1218;
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = -_1258;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1264 = _1262 * _1184;
    float _1266 = _1122 * _1037;
    float _1268 = _1054 * _1266;
    float _1270 = _1054 * _1230;
    float _1272 = _651 * _709;
    float _1274 = _1064 * _1266;
    float _1276 = fma(_1060, _1268, _1048);
    float _1278 = fma(_1062, _1268, _1050);
    float _1280 = _1264 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1282 = fma(_1054, _1274, _1052);
    float _1284 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1286 = _1264;
    float _1288 = _1048;
    float _1290 = _1272;
    float _1292 = _1250;
    float _1294 = _1250;
    if (!_1148)
    {
        _1286 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1296 = _1286;
    out.m_70.x = _1280;
    float _1298 = _1296;
    float _1300 = _1296;
    if (!_1148)
    {
        _1288 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1302 = _1288;
    float _1304 = _1302;
    float _1306 = _1302;
    if (!_1148)
    {
        _1290 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1308 = _1290;
    out.m_72.x = _1276;
    out.m_72.y = _1278;
    out.m_72.z = _1282;
    out.m_72.w = _1270;
    bool _1310 = !_1148;
    float _1312 = _1308;
    float _1314 = _1308;
    if (!_1310)
    {
        bool _1316 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1318 = isnan(_731);
        bool _1320 = _1316 || _1318;
        bool _1322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1324 = _1320 || _1322;
        if (!_1324)
        {
            float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1328 = _731 + _1326;
            float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1330;
            float _1334 = 1.0 / _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1338 = _1336 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1346 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1350 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1356 = _1328 * _1334;
            float _1358 = precise::clamp(_1356, 0.0, 1.0);
            float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1362 = _1360 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1364 = fma(_1358, _1338, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1366 = fma(_1358, _1362, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1368 = fma(_1358, _1342, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1370 = fma(_1358, _1346, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1372 = fma(_1358, _1350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1374 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1306 = _1366;
            _1294 = _1372;
            _1300 = _1364;
            _1248 = _1370;
            _1242 = _1368;
            _1314 = _1374;
            _1376 = true;
        }
        else
        {
            bool _1378 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1380 = isnan(_731);
            bool _1382 = _1378 || _1380;
            bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1386 = _1382 || _1384;
            if (!_1386)
            {
                _1298 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1388 = _1298;
            _1300 = _1388;
            if (!_1386)
            {
                _1304 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1390 = _1304;
            _1306 = _1390;
            if (!_1386)
            {
                _1240 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1392 = _1240;
            _1242 = _1392;
            if (!_1386)
            {
                _1246 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1394 = _1246;
            _1248 = _1394;
            if (!_1386)
            {
                _1292 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1396 = _1292;
            _1294 = _1396;
            if (!_1386)
            {
                _1312 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1398 = _1312;
            bool _1400 = !_1386;
            _1314 = _1398;
            if (!_1400)
            {
                bool _1402 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1404 = isnan(_731);
                bool _1406 = _1402 || _1404;
                bool _1408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1410 = _1406 || _1408;
                if (!_1410)
                {
                    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1414 = _731 + _1412;
                    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1416;
                    float _1420 = 1.0 / _1418;
                    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1428 = _1426 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1432 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1436 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1440 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1442 = _1414 * _1420;
                    float _1444 = precise::clamp(_1442, 0.0, 1.0);
                    float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1448 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1450 = fma(_1444, _1424, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1452 = fma(_1444, _1448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1454 = fma(_1444, _1428, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1456 = fma(_1444, _1432, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1458 = fma(_1444, _1436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1460 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1306 = _1452;
                    _1294 = _1458;
                    _1300 = _1450;
                    _1248 = _1456;
                    _1242 = _1454;
                    _1314 = _1460;
                    _1376 = true;
                }
                else
                {
                    _1306 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1294 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1300 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1248 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1242 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1314 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1376 = false;
    float _1462 = _1306;
    float _1464 = _1294;
    float _1466 = _1300;
    float _1468 = _1248;
    float _1470 = _1242;
    float _1472 = _1314;
    float _1474 = fma(_1220, -0.5, 0.5);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = -_1462;
    float _1480 = _1478 + _1464;
    float _1482 = _1284 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1484 = -_1466;
    float _1486 = _1484 + _1468;
    float _1488 = fma(_1476, _1480, _1462);
    out.m_74.x = 0.0;
    float _1490 = -_1470;
    float _1492 = _1490 + _1472;
    float _1494 = fma(_1476, _1486, _1466);
    float _1496 = _1488 * 0.586610972881317138671875;
    out.m_49.x = _1482;
    bool _1498 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1500 = fma(_1476, _1492, _1470);
    float _1502 = fma(_1494, 0.298911988735198974609375, _1496);
    bool _1504 = _651 > 0.0;
    bool _1506 = isnan(_651);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(0.0);
    bool _1512 = _1508 || _1510;
    float _1514 = fma(_1500, 0.114477999508380889892578125, _1502);
    bool _1516 = _709 <= 0.0;
    bool _1518 = !_1512;
    bool _1520 = _1516 || _1518;
    float _1522 = -_1514;
    float _1524 = _1494 + _1522;
    float _1526 = -_1514;
    float _1528 = _1488 + _1526;
    float _1530 = -_1514;
    float _1532 = _1500 + _1530;
    float _1534 = fma(_1524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    float _1536 = fma(_1528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    float _1538 = fma(_1532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    bool _1540 = !_1498;
    if (!_1540)
    {
        float _1542 = -_587;
        float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1546 = -_589;
        float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1550 = -_591;
        float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1554 = _1544 * _1544;
        float _1556 = fma(_1548, _1548, _1554);
        float _1558 = fma(_1552, _1552, _1556);
        float _1560 = sqrt(_1558);
        float _1562 = rsqrt(_1558);
        float _1564 = -_1560;
        float _1566 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1568 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        float _1572 = _1548 * _1562;
        float _1574 = _1544 * _1562;
        float _1576 = abs(_1570);
        float _1578 = log2(_1576);
        float _1580 = _1552 * _1562;
        float _1582 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1584 = _1220 * _1574;
        float _1586 = -_1574;
        float _1588 = -_1582;
        float _1590 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1588);
        float _1592 = fma(_1226, _1572, _1584);
        float _1594 = -_1580;
        float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1590);
        float _1598 = fma(_1222, _1580, _1592);
        float _1600 = precise::clamp(_1598, 0.0, 1.0);
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1604 = _1596 + _1602;
        float _1606 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1608 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = exp2(_1606);
        float _1614 = _1612 * _1610;
        float _1616 = _1600 * _1614;
        float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1620 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1622 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _1618;
        out.m_74.y = _1620;
        out.m_74.z = _1622;
    }
    out.m_76.x = _1534;
    out.m_76.y = _1536;
    out.m_76.z = _1538;
    if (!_1520)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1624;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1376 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1681 = as_type<float>(_111);
        out.gl_Position.z = _1681;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1749 = as_type<float>(_147);
        out.gl_Position.z = _1749;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _151 = !_149;
    float _169;
    if (!_151)
    {
        float _153 = in.m_53.x;
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_95);
        float _175 = 1.0 / _173;
        float _177 = _129 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _179 + _183;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _193 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _195 = isnan(_179);
    bool _197 = _193 || _195;
    bool _199 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _201 = _197 || _199;
    float _203 = float(_201);
    float _205 = 1.0 / _189;
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    bool _209 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _211 = isnan(_179);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _207);
    float _223 = -_203;
    float _225 = _223 + 1.0;
    float _227 = sqrt(_221);
    float _229 = _219 * _225;
    float _231 = -_219;
    float _233 = _231 + 1.0;
    int _235 = as_type<int>(_181) & 1;
    bool _237 = _235 != 0;
    int _239 = as_type<int>(_181) & 2;
    bool _241 = _239 != 0;
    float _243 = in.m_46.x;
    float _245 = in.m_46.y;
    float _247 = in.m_46.z;
    float _249 = _185 * _205;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = rsqrt(_221);
    float _261 = in.m_58.x;
    float _263 = in.m_58.y;
    float _265 = fma(_253, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_257, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _269 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _271 = isnan(0.5);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _277 = _273 || _275;
    float _279 = _265 * _229;
    float _281 = precise::max(_227, 2.0);
    float _283 = _267 * _229;
    bool _285 = !_241;
    float _287 = _285 ? (-0.5) : 0.5;
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _291 = precise::min(_281, 15.0);
    float _293 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    bool _295 = !_237;
    float _297 = _295 ? (-0.5) : 0.5;
    float _299 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    bool _301 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _303 = isnan(0.5);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _309 = _305 || _307;
    float _311 = fma(_291, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _313 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[144].y, _293);
    float _315 = -_245;
    float _317 = _287 + _315;
    float _319 = -_243;
    float _321 = _297 + _319;
    float _323 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _325 = -_317;
    float _327 = fma(_317, _259, _325);
    float _329 = -_321;
    float _331 = fma(_321, _259, _329);
    float _333 = _313 * _263;
    float _335 = _299 * _261;
    float _337 = fma(_311, _327, _317);
    float _339 = fma(_311, _331, _321);
    float _341 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _343 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _345 = _337 + _245;
    float _347 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _349 = _339 + _243;
    float _351 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _323);
    float _353 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _345);
    float _355 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _341);
    float _357 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _347);
    float _359 = -_259;
    float _361 = fma(_359, _247, _247);
    float _363 = _343 * _353;
    float _365 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _367 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _349);
    float _369 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _371 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _355);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _357);
    float _375 = _311 * _361;
    float _377 = _365 * _367;
    float _379 = _363 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _381 = _363 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _375);
    float _385 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[26].x, _379);
    float _389 = _369 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[24].x, _381);
    float _393 = _385 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _387);
    float _397 = _373 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _391);
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[11].x, _393);
    float _403 = _395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _405 = _385 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _407 = _399 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].z, _401);
    float _411 = _397 + _403;
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[10].x, _405);
    float _415 = _389 + _407;
    float _417 = _409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _419 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _421 = _411 + _419;
    float _423 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].z, _413);
    float _425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _427 = _415 + _425;
    float _429 = 1.0 / _417;
    float _431 = _421 * _421;
    float _433 = _423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _435 = _363 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _437 = fma(_427, _427, _431);
    float _439 = _433 + _417;
    float _441 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[25].x, _435);
    float _443 = sqrt(_437);
    float _445 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _441);
    float _447 = _439 * _429;
    float _449 = _447 * 0.5;
    float _451 = _445 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _455 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _453);
    float _457 = _385 + _451;
    bool _459 = _443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _461 = 1.0 / _455;
    float _463 = _337;
    float _465 = _415;
    float _467 = _411;
    float _469 = _427;
    float _471 = _421;
    float _473 = _417;
    float _475 = _389;
    if (!_459)
    {
        _463 = _457;
    }
    float _477 = _463;
    bool _479 = !_459;
    float _481 = _477;
    float _483 = _461;
    if (!_479)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _489 = _443 + _487;
        float _491 = rsqrt(_437);
        float _493 = _489 * _485;
        float _495 = _457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = _497 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _497 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 + (-1.0);
        float _509 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _511 = fma(_505, _495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _513 = fma(_457, _501, _509);
        float _515 = _491 * _511;
        float _517 = fma(_427, _515, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _519 = fma(_421, _515, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _465 = _517;
        _481 = _513;
        _467 = _519;
    }
    float _521 = _465;
    float _523 = _481;
    float _525 = _467;
    float _527 = _523;
    float _529 = _521;
    float _531 = _525;
    if (_277)
    {
        _469 = 1.0;
    }
    float _533 = _469;
    float _535 = _533;
    if (!_309)
    {
        float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _539 = _385 + _537;
        float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _543 = _389 + _541;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _547 = -_389;
        float _549 = _547 + _521;
        float _551 = _539 * _539;
        float _553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _555 = _397 + _553;
        float _557 = fma(_543, _543, _551);
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _561 = fma(_555, _555, _557);
        float _563 = sqrt(_561);
        float _565 = _545 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _567 = precise::min(_563, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _569 = _567 * _559;
        float _571 = -_385;
        float _573 = _571 + _523;
        float _575 = _565 * _569;
        float _577 = -_397;
        float _579 = _577 + _525;
        float _581 = fma(_573, _575, _385);
        float _583 = fma(_549, _575, _389);
        float _585 = fma(_579, _575, _397);
        _527 = _581;
        _529 = _583;
        _531 = _585;
    }
    float _587 = _527;
    float _589 = _529;
    float _591 = _531;
    if (_277)
    {
        _471 = 1.0;
    }
    float _593 = _471;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _597 = _461 * _595;
    float _599 = _593;
    if (!_277)
    {
        float _601 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _607 = _603 * 6.283185482025146484375;
        float _609 = cos(_607);
        float _611 = _605 * 0.15915493667125701904296875;
        float _613 = _603 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = 1.0 / _609;
        float _619 = _611 * 6.283185482025146484375;
        float _621 = cos(_619);
        float _623 = _615 * _617;
        float _625 = _611 * 6.283185482025146484375;
        float _627 = sin(_625);
        float _629 = _621 * _623;
        float _631 = 1.0 / _629;
        float _633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _633;
        float _637 = 1.0 / _635;
        float _639 = _627 * _631;
        float _641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _643 = fma(_597, _639, _641);
        float _645 = _643 * _637;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        _483 = _603;
        _535 = _647;
    }
    float _649 = _483;
    float _651 = _535;
    float _653 = _649;
    if (!_277)
    {
        float _655 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _657 = _655 * 0.15915493667125701904296875;
        float _659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _661 = _657 * 6.283185482025146484375;
        float _663 = cos(_661);
        float _665 = _659 * 0.15915493667125701904296875;
        float _667 = _657 * 6.283185482025146484375;
        float _669 = sin(_667);
        float _671 = 1.0 / _663;
        float _673 = _665 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _669 * _671;
        float _679 = _665 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = _675 * _677;
        float _685 = 1.0 / _683;
        float _687 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _689 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _687;
        float _691 = 1.0 / _689;
        float _693 = _681 * _685;
        float _695 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _697 = fma(_597, _693, _695);
        float _699 = _697 * _691;
        float _701 = precise::clamp(_699, 0.0, 1.0);
        float _703 = -_701;
        float _705 = _703 + 1.0;
        _653 = _671;
        _599 = _705;
    }
    float _707 = _653;
    float _709 = _599;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _713 = _587 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _589 + _715;
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _721 = _591 + _719;
    float _723 = _713 * _713;
    float _725 = fma(_717, _717, _723);
    float _727 = fma(_721, _721, _725);
    float _729 = rsqrt(_727);
    float _731 = sqrt(_727);
    float _733 = _729 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _735 = _717 * _733;
    float _737 = _721 * _733;
    float _739 = _735 * _735;
    float _741 = _737 * _737;
    float _743 = _739 + _741;
    float _745 = sqrt(_743);
    bool _747 = _745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _751 = _745 + _749;
    float _753 = _707;
    float _755 = _729;
    float _757 = _751;
    float _759 = _713;
    if (_747)
    {
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _753 = _761;
    }
    float _763 = _753;
    if (_747)
    {
        float _765 = rsqrt(_743);
        _755 = _765;
    }
    float _767 = _755;
    float _769 = _767;
    if (_747)
    {
        float _771 = _751 * _763;
        _757 = _771;
    }
    float _773 = _757;
    if (_747)
    {
        float _775 = _773 * 0.15915493667125701904296875;
        _473 = _775;
    }
    float _777 = _473;
    float _779 = _721;
    float _781 = _777;
    if (_747)
    {
        float _783 = _777 * 6.283185482025146484375;
        float _785 = sin(_783);
        _779 = _785;
    }
    float _787 = _779;
    float _789 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _791 = precise::max(0.0, _789);
    float _793 = _763;
    if (_747)
    {
        float _795 = _777 * 6.283185482025146484375;
        float _797 = cos(_795);
        _793 = _797;
    }
    float _799 = _793;
    float _801 = -_733;
    float _803 = -_791;
    float _805 = fma(_713, _801, _803);
    if (_747)
    {
        float _807 = _805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _759 = _807;
    }
    float _809 = _759;
    float _811 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _813 = _809;
    float _815 = _787;
    if (_747)
    {
        float _817 = fma(_787, _809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _813 = _817;
    }
    float _819 = _813;
    float _821 = _819;
    if (!_747)
    {
        _815 = _805;
    }
    float _823 = _815;
    float _825 = floor(_811);
    float _827 = _823;
    float _829 = _799;
    if (_747)
    {
        float _831 = _799 + (-1.0);
        _475 = _831;
    }
    float _833 = _475;
    float _835 = 0.0;
    float _837 = _833;
    if (_747)
    {
        float _839 = _767 * _819;
        _835 = _839;
    }
    float _841 = _835;
    if (!_747)
    {
        _769 = _735;
    }
    float _843 = _769;
    float _845 = _843;
    if (_747)
    {
        float _847 = _833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _781 = _847;
    }
    float _849 = _781;
    if (_747)
    {
        float _851 = _735 * _841;
        _845 = _851;
    }
    float _853 = _845;
    if (!_747)
    {
        _821 = _737;
    }
    float _855 = _821;
    float _857 = _855;
    if (_747)
    {
        float _859 = _737 * _841;
        _857 = _859;
    }
    float _861 = _857;
    if (!_747)
    {
        _837 = _739;
    }
    float _863 = _837;
    float _865 = _863;
    if (_747)
    {
        float _867 = fma(_805, _799, _849);
        _827 = _867;
    }
    float _869 = _827;
    if (_747)
    {
        float _871 = _853 * _853;
        _865 = _871;
    }
    float _873 = _865;
    if (!_747)
    {
        _829 = _741;
    }
    float _875 = _829;
    float _877 = _875;
    if (_747)
    {
        float _879 = _861 * _861;
        _877 = _879;
    }
    float _881 = _877;
    float _883 = fma(_869, _869, _873);
    float _885 = _587 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _887 = _883 + _881;
    float _889 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[2].x, _885);
    float _891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _893 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[23].w, _891);
    float _895 = precise::clamp(_893, 0.0, 1.0);
    float _897 = rsqrt(_887);
    float _899 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[2].z, _889);
    float _901 = -_895;
    float _903 = _901 + 1.0;
    float _905 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _907 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _909 = _899 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _911 = _587 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = abs(_903);
    float _915 = log2(_913);
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _919 = _587 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _923 = -_917;
    float _925 = fma(_923, _907, 1.0);
    float _927 = _587 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _929 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _931 = _897 * _853;
    float _933 = _897 * _869;
    float _935 = _897 * _861;
    float _937 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[0].x, _927);
    float _939 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[1].z, _929);
    float _941 = _931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _943 = floor(_905);
    float _945 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[0].z, _937);
    float _947 = _939 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _949 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[3].z, _921);
    float _951 = -_941;
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[21].y, _951);
    float _955 = _945 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _957 = _947 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _959 = _915 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _961 = _949 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _963 = -_935;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _953);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[7].x, _957);
    float _969 = exp2(_959);
    float _971 = -_825;
    float _973 = _811 + _971;
    float _975 = fma(_965, -0.5, 0.5);
    float _977 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[7].z, _967);
    float _979 = -_943;
    float _981 = _905 + _979;
    float _983 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _977);
    float _985 = _947 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _987 = fma(_965, 0.5, 0.5);
    float _989 = log2(_925);
    float _991 = _947 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _993 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[4].x, _985);
    float _995 = fma(_987, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _997 = _933 + 1.0;
    float _999 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[5].x, _991);
    float _1001 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[4].z, _993);
    float _1003 = fma(_987, _995, -0.212114393711090087890625);
    float _1005 = 1.0 / _983;
    float _1007 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[5].z, _999);
    float _1009 = -_933;
    float _1011 = fma(_969, _997, _1009);
    float _1013 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1001);
    float _1015 = fma(_987, _1003, 1.570728778839111328125);
    float _1017 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1007);
    float _1019 = sqrt(_975);
    float _1021 = _989 * 0.693147182464599609375;
    float2 _3157 = float2(_973, _981);
    float _1023 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3157, float2(0.0), isnan(_3157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3157, float2(0.0), isnan(_3157)), level(0.0)).x;
    float _1025 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1027 = _1013 * _1005;
    float _1029 = _1017 * _1005;
    float _1031 = fma(_1027, 0.5, 0.5);
    float _1033 = fma(_1029, -0.5, 0.5);
    float _1035 = _1019 * 0.636619746685028076171875;
    float3 _3185 = float3(_1031, _1033, _1025);
    float _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3185, float3(0.0), isnan(_3185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3185, float3(0.0), isnan(_3185)), level(0.0)).x;
    float _1039 = -_1015;
    float _1041 = fma(_1035, _1039, 1.0);
    float _1043 = fma(_1011, 0.5, 0.5);
    float3 _3203 = float3(_1031, _1033, _1025);
    float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3203, float3(0.0), isnan(_3203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3203, float3(0.0), isnan(_3203)), level(0.0)).xyzw;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = _1046.w;
    float2 _3219 = float2(_1041, _1043);
    float3 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3219, float2(0.0), isnan(_3219)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3219, float2(0.0), isnan(_3219)), level(0.0)).xyz;
    float _1060 = _1058.x;
    float _1062 = _1058.y;
    float _1064 = _1058.z;
    float _1066 = abs(_597);
    float _1068 = log2(_1066);
    float _1070 = in.m_53.x;
    float _1072 = in.m_53.y;
    float _1074 = _915 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1076 = _345 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1078 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1082 = _1080 != 0;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1086 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1088 = exp2(_1074);
    bool _1090 = _1070 > 0.5;
    float _1092 = exp2(_1086);
    bool _1094 = _1072 > 0.5;
    float _1096 = -_297;
    int _1098 = _1090 ? as_type<int>(_1096) : as_type<int>(_297);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1102 = _1100 != 0;
    bool _1104 = !_1082;
    float _1106 = _1104 ? _297 : as_type<float>(_1098);
    float _1108 = -_1088;
    float _1110 = _1108 + 1.0;
    float _1112 = -_287;
    int _1114 = _1094 ? as_type<int>(_1112) : as_type<int>(_287);
    float _1116 = _1106 + 0.5;
    bool _1118 = !_1102;
    float _1120 = _1118 ? _287 : as_type<float>(_1114);
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1124 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1132 = fma(_1126, -2.0, 3.0);
    float _1134 = _1126 * _1126;
    float _1136 = -_1120;
    float _1138 = _1136 + 0.5;
    bool _1140 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1142 = isnan(_731);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1148 = _1144 || _1146;
    float _1150 = _1134 * _1132;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1154 = _947 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1160 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1162 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1154);
    float _1164 = _1130 * _1084;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1170 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1160 * _1128;
    float _1176 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1178 = -_1150;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1162);
    float _1184 = in.m_60.x;
    float _1186 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1150);
    float _1188 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1182);
    out.m_62.x = _1168;
    out.m_62.y = _1170;
    out.m_62.z = _1172;
    out.m_62.w = _1166;
    float _1190 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_64.x = _1164;
    out.m_64.y = _1174;
    float _1192 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1190);
    bool _1194 = _597 <= 8000.0;
    bool _1196 = isnan(_597);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(8000.0);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = _1188 + _983;
    float _1210 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1212 = _1204 * _1186;
    float _1214 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1216 = _1208 * 0.5;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1214);
    float _1222 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    out.gl_Position.x = _1013;
    out.gl_Position.y = _1017;
    out.gl_Position.z = _1188;
    out.gl_Position.w = _983;
    float _1224 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1210);
    out.m_66.z = _1216;
    out.m_66.w = _983;
    float _1226 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1224);
    out.m_68.x = _1226;
    out.m_68.y = _1220;
    out.m_68.z = _1222;
    float _1228 = -_1122;
    float _1230 = _1228 + 1.0;
    float _1232 = _983;
    float _1234 = _1188;
    float _1236 = _1017;
    if (!_1148)
    {
        _1232 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1238 = _1232;
    float _1240 = _1238;
    float _1242 = _1238;
    if (!_1148)
    {
        _1234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1244 = _1234;
    float _1246 = _1244;
    float _1248 = _1244;
    if (!_1148)
    {
        _1236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1250 = _1236;
    float _1252 = -_1023;
    float _1254 = _1252 + 1.0;
    float _1256 = _1254 * _1218;
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = -_1258;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1264 = _1262 * _1184;
    float _1266 = _1122 * _1037;
    float _1268 = _1054 * _1266;
    float _1270 = _1054 * _1230;
    float _1272 = _651 * _709;
    float _1274 = _1064 * _1266;
    float _1276 = fma(_1060, _1268, _1048);
    float _1278 = fma(_1062, _1268, _1050);
    float _1280 = _1264 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1282 = fma(_1054, _1274, _1052);
    float _1284 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1286 = _1264;
    float _1288 = _1048;
    float _1290 = _1272;
    float _1292 = _1250;
    float _1294 = _1250;
    if (!_1148)
    {
        _1286 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1296 = _1286;
    out.m_70.x = _1280;
    float _1298 = _1296;
    float _1300 = _1296;
    if (!_1148)
    {
        _1288 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1302 = _1288;
    float _1304 = _1302;
    float _1306 = _1302;
    if (!_1148)
    {
        _1290 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1308 = _1290;
    out.m_72.x = _1276;
    out.m_72.y = _1278;
    out.m_72.z = _1282;
    out.m_72.w = _1270;
    bool _1310 = !_1148;
    float _1312 = _1308;
    float _1314 = _1308;
    if (!_1310)
    {
        bool _1316 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1318 = isnan(_731);
        bool _1320 = _1316 || _1318;
        bool _1322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1324 = _1320 || _1322;
        if (!_1324)
        {
            float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1328 = _731 + _1326;
            float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1330;
            float _1334 = 1.0 / _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1338 = _1336 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1346 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1350 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1356 = _1328 * _1334;
            float _1358 = precise::clamp(_1356, 0.0, 1.0);
            float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1362 = _1360 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1364 = fma(_1358, _1338, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1366 = fma(_1358, _1362, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1368 = fma(_1358, _1342, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1370 = fma(_1358, _1346, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1372 = fma(_1358, _1350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1374 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1306 = _1366;
            _1294 = _1372;
            _1300 = _1364;
            _1248 = _1370;
            _1242 = _1368;
            _1314 = _1374;
            _1376 = true;
        }
        else
        {
            bool _1378 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1380 = isnan(_731);
            bool _1382 = _1378 || _1380;
            bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1386 = _1382 || _1384;
            if (!_1386)
            {
                _1298 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1388 = _1298;
            _1300 = _1388;
            if (!_1386)
            {
                _1304 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1390 = _1304;
            _1306 = _1390;
            if (!_1386)
            {
                _1240 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1392 = _1240;
            _1242 = _1392;
            if (!_1386)
            {
                _1246 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1394 = _1246;
            _1248 = _1394;
            if (!_1386)
            {
                _1292 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1396 = _1292;
            _1294 = _1396;
            if (!_1386)
            {
                _1312 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1398 = _1312;
            bool _1400 = !_1386;
            _1314 = _1398;
            if (!_1400)
            {
                bool _1402 = _731 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1404 = isnan(_731);
                bool _1406 = _1402 || _1404;
                bool _1408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1410 = _1406 || _1408;
                if (!_1410)
                {
                    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1414 = _731 + _1412;
                    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1416;
                    float _1420 = 1.0 / _1418;
                    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1428 = _1426 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1432 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1436 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1440 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1442 = _1414 * _1420;
                    float _1444 = precise::clamp(_1442, 0.0, 1.0);
                    float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1448 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1450 = fma(_1444, _1424, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1452 = fma(_1444, _1448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1454 = fma(_1444, _1428, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1456 = fma(_1444, _1432, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1458 = fma(_1444, _1436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1460 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1306 = _1452;
                    _1294 = _1458;
                    _1300 = _1450;
                    _1248 = _1456;
                    _1242 = _1454;
                    _1314 = _1460;
                    _1376 = true;
                }
                else
                {
                    _1306 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1294 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1300 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1248 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1242 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1314 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1376 = false;
    float _1462 = _1306;
    float _1464 = _1294;
    float _1466 = _1300;
    float _1468 = _1248;
    float _1470 = _1242;
    float _1472 = _1314;
    float _1474 = fma(_1220, -0.5, 0.5);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = -_1462;
    float _1480 = _1478 + _1464;
    float _1482 = _1284 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1484 = -_1466;
    float _1486 = _1484 + _1468;
    float _1488 = fma(_1476, _1480, _1462);
    out.m_74.x = 0.0;
    float _1490 = -_1470;
    float _1492 = _1490 + _1472;
    float _1494 = fma(_1476, _1486, _1466);
    float _1496 = _1488 * 0.586610972881317138671875;
    out.m_49.x = _1482;
    bool _1498 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1500 = fma(_1476, _1492, _1470);
    float _1502 = fma(_1494, 0.298911988735198974609375, _1496);
    bool _1504 = _651 > 0.0;
    bool _1506 = isnan(_651);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(0.0);
    bool _1512 = _1508 || _1510;
    float _1514 = fma(_1500, 0.114477999508380889892578125, _1502);
    bool _1516 = _709 <= 0.0;
    bool _1518 = !_1512;
    bool _1520 = _1516 || _1518;
    float _1522 = -_1514;
    float _1524 = _1494 + _1522;
    float _1526 = -_1514;
    float _1528 = _1488 + _1526;
    float _1530 = -_1514;
    float _1532 = _1500 + _1530;
    float _1534 = fma(_1524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    float _1536 = fma(_1528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    float _1538 = fma(_1532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1514);
    bool _1540 = !_1498;
    if (!_1540)
    {
        float _1542 = -_587;
        float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1546 = -_589;
        float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1550 = -_591;
        float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1554 = _1544 * _1544;
        float _1556 = fma(_1548, _1548, _1554);
        float _1558 = fma(_1552, _1552, _1556);
        float _1560 = sqrt(_1558);
        float _1562 = rsqrt(_1558);
        float _1564 = -_1560;
        float _1566 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1568 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        float _1572 = _1548 * _1562;
        float _1574 = _1544 * _1562;
        float _1576 = abs(_1570);
        float _1578 = log2(_1576);
        float _1580 = _1552 * _1562;
        float _1582 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1584 = _1220 * _1574;
        float _1586 = -_1574;
        float _1588 = -_1582;
        float _1590 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1588);
        float _1592 = fma(_1226, _1572, _1584);
        float _1594 = -_1580;
        float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1590);
        float _1598 = fma(_1222, _1580, _1592);
        float _1600 = precise::clamp(_1598, 0.0, 1.0);
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1604 = _1596 + _1602;
        float _1606 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1608 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = exp2(_1606);
        float _1614 = _1612 * _1610;
        float _1616 = _1600 * _1614;
        float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1620 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1622 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _1618;
        out.m_74.y = _1620;
        out.m_74.z = _1622;
    }
    out.m_76.x = _1534;
    out.m_76.y = _1536;
    out.m_76.z = _1538;
    if (!_1520)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1624;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

