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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_74 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_60 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 m_78 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = in.m_46.w;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = -_98;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _107;
    bool _111 = _103 >= 1;
    float _113 = 0.0;
    int _115 = as_type<int>(_98);
    float _117 = _107;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2513 = as_type<float>(_125);
        out.gl_Position.z = _2513;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _129 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_98);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = float(_103);
    bool _141 = _107 >= _139;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_51.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _127 = as_type<int>(_151);
    }
    int _153 = _127;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_153);
        out.gl_Position.z = _2569;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _163 = _161 != 0;
    float _165 = in.m_56.x;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = 0.0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _183 = _177;
    if (_163)
    {
        float _185 = in.m_56.y;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = 0.0;
    if (!_175)
    {
        float _191 = _177 * _177;
        float _193 = _191 * 0.5;
        _189 = _193;
    }
    float _195 = _189;
    float _197 = 0.0;
    float _199 = _195;
    if (_163)
    {
        float _201 = in.m_56.z;
        _197 = _201;
    }
    float _203 = _197;
    if (!_175)
    {
        float _205 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _205;
    }
    float _207 = _199;
    bool _209 = !_175;
    float _211 = _207;
    float _213 = _203;
    float _215 = _187;
    if (!_209)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _177 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _177);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = as_type<int>(_235);
        _211 = _245;
        _115 = as_type<int>(_233);
    }
    int _247 = _181;
    float _249 = _211;
    int _251 = _115;
    bool _253 = !_175;
    int _255 = _247;
    int _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _177 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = as_type<int>(_271);
        _183 = _277;
    }
    int _279 = _255;
    float _281 = _183;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    int _291 = _279;
    if (_163)
    {
        _257 = 0;
        _291 = 0;
    }
    int _293 = _257;
    int _295 = _291;
    int _297 = 0;
    int _299 = _293;
    int _301 = _295;
    if (_163)
    {
        _297 = as_type<int>(_165);
    }
    int _303 = _297;
    int _305 = 0;
    int _307 = _303;
    if (_163)
    {
        _305 = as_type<int>(_187);
    }
    int _309 = _305;
    int _311 = 0;
    int _313 = _309;
    if (_163)
    {
        _311 = as_type<int>(_203);
    }
    int _315 = _311;
    bool _317 = !_285;
    int _319 = _317 ? 0 : 1;
    bool _321 = !_289;
    int _323 = _321 ? 0 : 1;
    int _325 = _315;
    if (!_163)
    {
        float _327 = in.m_56.y;
        float _329 = _165 * 3.1415927410125732421875;
        float _331 = in.m_56.z;
        float _333 = _329 * 0.15915493667125701904296875;
        float _335 = _333 * 6.283185482025146484375;
        float _337 = sin(_335);
        float _339 = _327 * 3.1415927410125732421875;
        float _341 = _339 * 0.15915493667125701904296875;
        float _343 = _331 * 3.1415927410125732421875;
        float _345 = _343 * 0.15915493667125701904296875;
        float _347 = _341 * 6.283185482025146484375;
        float _349 = sin(_347);
        float _351 = _345 * 6.283185482025146484375;
        float _353 = sin(_351);
        _213 = _331;
        _215 = _327;
        _299 = 1;
        _313 = as_type<int>(_349);
        _307 = as_type<int>(_337);
        _325 = as_type<int>(_353);
        _301 = 2;
    }
    float _355 = _213;
    float _357 = _215;
    int _359 = _299;
    int _361 = _313;
    int _363 = _307;
    int _365 = _325;
    int _367 = _301;
    float _369 = _355 * 2.0;
    float _371 = _159 * _107;
    float _373 = in.m_58.w;
    float _375 = floor(_369);
    int _377 = as_type<int>(_155) & 1;
    bool _379 = _377 != 0;
    float _381 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _383 = as_type<int>(_155) & 2;
    bool _385 = _383 != 0;
    float _387 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _389 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _391 = _357 > 0.5;
    float _393 = exp2(_371);
    bool _395 = !_379;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _401 = !_385;
    float _403 = _401 ? (-0.5) : 0.5;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _415 = _413 != 0;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _419 = _417 != 0;
    float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _423 = -_397;
    int _425 = _391 ? as_type<int>(_423) : as_type<int>(_397);
    bool _427 = _359 != 1;
    float _429 = -_403;
    int _431 = _391 ? as_type<int>(_429) : as_type<int>(_403);
    bool _433 = _375 > 0.0;
    float _435 = -_393;
    float _437 = _435 + 1.0;
    bool _439 = !_415;
    float _441 = _439 ? _397 : as_type<float>(_425);
    bool _443 = !_427;
    float _445 = _443 ? as_type<float>(_361) : as_type<float>(_363);
    bool _447 = !_427;
    float _449 = _447 ? as_type<float>(_365) : as_type<float>(_361);
    bool _451 = _375 >= 0.0;
    bool _453 = isnan(_375);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = _399 * _421;
    bool _463 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _471 = _467 || _469;
    bool _473 = _367 != 2;
    float _475 = _165 * 2.0;
    int _477 = _459 ? 0 : 1;
    float _479 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _461);
    float _481 = _471 ? _437 : 0.0;
    float _483 = floor(_475);
    float _485 = in.m_46.x;
    float _487 = in.m_46.y;
    float _489 = in.m_46.z;
    int _491 = ~_477;
    int _493 = _491 + 1;
    int _495 = _493 + 1;
    int _497 = _495;
    if (!_433)
    {
        int _499 = ~_477;
        int _501 = _499 + 1;
        _497 = _501;
    }
    int _503 = _497;
    bool _505 = _355 > 0.5;
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _515 = -_403;
    int _517 = _505 ? as_type<int>(_515) : as_type<int>(_403);
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _521 = 0.0;
    if (_473)
    {
        _521 = _165;
    }
    float _523 = _521;
    float _525 = fma(as_type<float>(_363), (*spvDescriptorSet0.vp_c9)._m0[93].z, _513);
    float _527 = 0.0;
    float _529 = _523;
    if (_473)
    {
        _527 = _357;
    }
    float _531 = _527;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _535 = 0.0;
    float _537 = _531;
    if (_473)
    {
        _535 = _355;
    }
    float _539 = _535;
    bool _541 = !_419;
    float _543 = _541 ? _403 : as_type<float>(_517);
    float _545 = _539;
    if (!_473)
    {
        _529 = _355;
    }
    float _547 = _529;
    float _549 = fma(_281, _487, _387);
    float _551 = fma(_281, _489, _389);
    float _553 = fma(_281, _485, _381);
    if (!_473)
    {
        _537 = _165;
    }
    float _555 = _537;
    float _557 = as_type<float>(_363) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (!_473)
    {
        _545 = _357;
    }
    float _559 = _545;
    float _561 = as_type<float>(_361) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _573 = _571 != 0;
    float _575 = fma(_551, _373, _511);
    float _577 = _357 + _355;
    bool _579 = _483 > 0.0;
    float _581 = _165 + _355;
    float _583 = -_519;
    float _585 = fma(_557, 2.0, _583);
    float _587 = fma(_561, -2.0, _533);
    float _589 = _577 + (-1.0);
    bool _591 = !_565;
    int _593 = _591 ? 0 : 1;
    float _595 = fma(_553, _373, _507);
    float _597 = _581 + (-1.0);
    bool _599 = _483 >= 0.0;
    bool _601 = isnan(_483);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _611 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _613 = _357 * 2.0;
    int _615 = _607 ? 0 : 1;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _619 = fma(as_type<float>(_365), (*spvDescriptorSet0.vp_c9)._m0[94].z, _609);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _623 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _625 = _623 != 0;
    float _627 = _165 + _357;
    int _629 = ~_615;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = fma(_549, _373, _509);
    int _637 = _633;
    bool _639 = _505;
    int _641 = _411 ? (-1) : 0;
    bool _643 = _625;
    if (!_579)
    {
        int _645 = ~_615;
        int _647 = _645 + 1;
        _637 = _647;
    }
    int _649 = _637;
    float _651 = fma(as_type<float>(_361), (*spvDescriptorSet0.vp_c9)._m0[93].w, _621);
    float _653 = floor(_613);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _657 = _627 + (-1.0);
    float _659 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[98].z, _655);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _663 = _445 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _665 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _669 = -_661;
    float _671 = fma(_663, 2.0, _669);
    float _673 = _635 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _675 = _635 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _677 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[89].z, _667);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _681 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[4].x, _673);
    float _683 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    bool _685 = _653 >= 0.0;
    bool _687 = isnan(_653);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[98].w, _679);
    float _697 = _449 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _699 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[4].z, _681);
    float _701 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[6].z, _683);
    int _703 = _693 ? 0 : 1;
    float _705 = _555 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _707 = _653 > 0.0;
    float _709 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _701 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _709 + _715;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _721 = -_711;
    float _723 = _721 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _725 = fma(_697, -2.0, _713);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _729 = _547 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _731 = !_569;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_705, -2.0, _719);
    float _737 = abs(_717);
    float _739 = abs(_723);
    float _741 = precise::max(_737, _739);
    float _743 = -_727;
    float _745 = fma(_729, 2.0, _743);
    int _747 = ~_703;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[94].x, _619);
    int _755 = abs(_593);
    float _757 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[92].w, _651);
    int _759 = abs(_733);
    float _761 = -_107;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[91].x, _585);
    int _765 = _751;
    float _767 = _717;
    float _769 = _723;
    if (!_707)
    {
        int _771 = ~_703;
        int _773 = _771 + 1;
        _765 = _773;
    }
    int _775 = _765;
    float _777 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[96].y, _725);
    bool _779 = _741 >= 16.0;
    float _781 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[91].y, _587);
    float _783 = float(_649);
    float _785 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[97].z, _659);
    float _787 = float(_759);
    float _789 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[97].w, _695);
    float _791 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[89].x, _677);
    float _793 = floor(_479);
    float _795 = _787 * _783;
    float _797 = float(_503);
    float _799 = -_107;
    float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[96].x, _671);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _805 = 1.0 + _803;
    float _807 = float(_755);
    float _809 = _795 * (-2.0);
    float _811 = 1.0 / _805;
    float _813 = _807 * _797;
    bool _815 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _817 = isnan(1.0);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _823 = _819 || _821;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _827 = !_573;
    int _829 = _827 ? 0 : 1;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_779)
    {
        float _833 = _717 * 0.0625;
        _767 = _833;
    }
    float _835 = _767;
    float _837 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _825);
    float _839 = -_793;
    float _841 = _479 + _839;
    float _843 = _479 * 6.283185482025146484375;
    float _845 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[88].w, _831);
    int _847 = abs(_829);
    float _849 = fma(_611, _809, _611);
    float _851 = _843 * 0.15915493667125701904296875;
    float _853 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[87].z, _837);
    float _855 = _813 * (-2.0);
    float _857 = _165 + (-0.5);
    float _859 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[87].w, _845);
    float _861 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[92].z, _525);
    float _863 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[86].y, _735);
    float _865 = -_107;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[86].x, _745);
    float _869 = float(_775);
    if (_823)
    {
        float _871 = _481 * _811;
        _117 = _871;
    }
    float _873 = _117;
    float _875 = float(_847);
    if (_779)
    {
        float _877 = _723 * 0.0625;
        _769 = _877;
    }
    float _879 = _769;
    float _881 = _851 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = abs(_835);
    bool _887 = _885 != 0.0;
    bool _889 = isnan(_885);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = fma(_665, _855, _665);
    float _899 = _857 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _901 = _875 * _869;
    bool _903 = _841 < 0.5;
    float _905 = float(_903);
    float _907 = fma(_897, _873, _899);
    float _909 = abs(_879);
    bool _911 = _909 == 0.0;
    bool _913 = !_895;
    bool _915 = _911 && _913;
    float _917 = -_841;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _921 = _901 * (-2.0);
    float _923 = -_905;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _927 = _907 * 0.15915493667125701904296875;
    bool _929 = !_407;
    float _931 = _929 ? _403 : as_type<float>(_431);
    float _933 = fma(_617, _921, _617);
    float _935 = abs(_879);
    bool _937 = _935 == 0.0;
    float _939 = _927 * 6.283185482025146484375;
    float _941 = sin(_939);
    float _943 = _355 + (-0.5);
    float _945 = _357 + (-0.5);
    float _947 = fma(_883, 0.5, 0.5);
    float _949 = -_397;
    int _951 = _505 ? as_type<int>(_949) : as_type<int>(_397);
    float _953 = _943 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _955 = as_type<int>(_947);
    int _957 = as_type<int>(_953);
    if (_915)
    {
        bool _959 = as_type<int>(_879) >= 0;
        _639 = _959;
    }
    bool _961 = _639;
    float _963 = _945 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _965 = -_947;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _969 = fma(_933, _873, _953);
    if (_915)
    {
        int _971 = _961 ? 0 : 1078530011;
        _955 = _971;
    }
    int _973 = _955;
    float _975 = fma(_849, _873, _963);
    bool _977 = !_411;
    float _979 = _977 ? _397 : as_type<float>(_951);
    float _981 = _979;
    if (_915)
    {
        int _983 = int(0x80000000) & as_type<int>(_835);
        int _985 = _973 | _983;
        _957 = _985;
    }
    int _987 = _957;
    bool _989 = !_895;
    bool _991 = _989 && _937;
    int _993 = _987;
    float _995 = as_type<float>(_987);
    if (!_991)
    {
        float _997 = abs(_835);
        bool _999 = _997 != as_type<float>(0x7f800000u /* inf */);
        bool _1001 = isnan(_997);
        bool _1003 = _999 || _1001;
        bool _1005 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1007 = _1003 || _1005;
        float _1009 = abs(_879);
        bool _1011 = _1009 == as_type<float>(0x7f800000u /* inf */);
        float _1013 = abs(_879);
        bool _1015 = _1013 == as_type<float>(0x7f800000u /* inf */);
        bool _1017 = !_1007;
        bool _1019 = _1015 && _1017;
        if (_1019)
        {
            bool _1021 = as_type<int>(_879) >= 0;
            _641 = _1021 ? (-1) : 0;
        }
        int _1023 = _641;
        if (_1019)
        {
            _993 = 1075235812;
        }
        int _1025 = _993;
        int _1027 = _1025;
        if (_1019)
        {
            int _1029 = ~_1023;
            int _1031 = (_1029 != 0) ? _1025 : 1061752795;
            _1027 = _1031;
        }
        int _1033 = _1027;
        float _1035 = as_type<float>(_1033);
        if (_1019)
        {
            int _1037 = int(0x80000000) & as_type<int>(_835);
            int _1039 = _1033 | _1037;
            _1035 = as_type<float>(_1039);
        }
        float _1041 = _1035;
        bool _1043 = !_1007;
        bool _1045 = _1043 && _1011;
        _995 = _1041;
        if (!_1045)
        {
            float _1047 = abs(_835);
            float _1049 = abs(_879);
            float _1051 = precise::max(_1047, _1049);
            float _1053 = abs(_835);
            float _1055 = abs(_879);
            float _1057 = _1053 + _1055;
            float _1059 = abs(_835);
            float _1061 = abs(_879);
            float _1063 = precise::min(_1059, _1061);
            float _1065 = 1.0 / _1051;
            float _1067 = abs(_835);
            float _1069 = abs(_879);
            bool _1071 = _1067 > _1069;
            bool _1073 = as_type<int>(_879) >= 0;
            bool _1075 = _1057 > as_type<float>(0x7f800000u /* inf */);
            bool _1077 = isnan(_1057);
            bool _1079 = _1075 || _1077;
            bool _1081 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1083 = _1079 || _1081;
            float _1085 = _1063 * _1065;
            int _1087 = as_type<int>(_835) & int(0x80000000);
            float _1089 = _1085 * _1085;
            float _1091 = _1089 + 11.33538818359375;
            float _1093 = fma(_1089, _1091, 28.84246826171875);
            float _1095 = fma(_1089, _1093, 19.6966705322265625);
            float _1097 = fma(_1089, -0.82336294651031494140625, -5.674867153167724609375);
            float _1099 = fma(_1089, _1097, -6.565555095672607421875);
            float _1101 = 1.0 / _1095;
            float _1103 = _1089 * _1099;
            float _1105 = _1085 * _1103;
            float _1107 = fma(_1105, _1101, _1085);
            float _1109 = _1107;
            _995 = _1057;
            if (_1071)
            {
                float _1111 = -_1107;
                float _1113 = _1111 + 1.57079637050628662109375;
                _1109 = _1113;
            }
            float _1115 = _1109;
            int _1117 = as_type<int>(_1115);
            if (!_1073)
            {
                float _1119 = -_1115;
                float _1121 = _1119 + 3.1415927410125732421875;
                _1117 = as_type<int>(_1121);
            }
            int _1123 = _1117;
            if (!_1083)
            {
                int _1125 = _1087 | _1123;
                _995 = as_type<float>(_1125);
            }
        }
    }
    float _1127 = _995;
    float _1129 = in.m_58.x;
    float _1131 = in.m_58.y;
    bool _1133 = !_625;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = _927 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    int _1141 = abs(_319);
    float _1143 = -_1127;
    float _1145 = _975 + _1143;
    int _1147 = abs(_1135);
    float _1149 = _969 * 0.15915493667125701904296875;
    int _1151 = abs(_323);
    float _1153 = _1145 * 0.15915493667125701904296875;
    float _1155 = _1149 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = float(_1141);
    float _1161 = _635 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1163 = float(_1147);
    int _1165 = as_type<int>(_155) & 2;
    bool _1167 = _1165 != 0;
    float _1169 = abs(_919);
    float _1171 = _1159 * _1169;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _1175 = _1167 ? 0.0 : 1.0;
    float _1177 = fma(_1163, _967, _1171);
    float _1179 = float(_1151);
    float _1181 = _1153 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1161);
    float _1187 = fma(_1175, _1173, 1.0);
    float _1189 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1191 = abs(_925);
    float _1193 = fma(_1179, _1191, _1177);
    float _1195 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1197 = _397 * _1187;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _403);
    float _1201 = _1153 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1193 * _1189;
    float _1207 = _1193 * _1195;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1197);
    float _1211 = _941 * _1157;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1217 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1219 = _1149 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1213 * _1209;
    float _1225 = _1215 * _1199;
    float _1227 = _1139 * _1183;
    float _1229 = _941 * _1183;
    float _1231 = _1183 * _1157;
    float _1233 = _1211 * _1225;
    float _1235 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1185);
    float _1237 = _941 * _1203;
    float _1239 = _1139 * _1203;
    float _1241 = _1203 * _1157;
    float _1243 = _1235 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = -_1227;
    float _1247 = fma(_1221, _1237, _1245);
    float _1249 = -_1225;
    float _1251 = _1221 * _1249;
    float _1253 = fma(_1221, _1229, _1239);
    float _1255 = fma(_1221, _1239, _1229);
    float _1257 = fma(_1247, _1223, _1233);
    float _1259 = fma(_1241, _1223, _1251);
    float _1261 = _1139 * _1157;
    float _1263 = -_1237;
    float _1265 = fma(_1221, _1227, _1263);
    float _1267 = fma(_1253, _1217, _1257);
    float _1269 = fma(_1231, _1217, _1259);
    float _1271 = _711 + _1267;
    float _1273 = _709 + _1269;
    float _1275 = _1261 * _1225;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1279 = _1271 + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1283 = _1273 + _1281;
    float _1285 = fma(_1255, _1223, _1275);
    float _1287 = _1279 * _1279;
    float _1289 = fma(_1265, _1217, _1285);
    float _1291 = fma(_1283, _1283, _1287);
    float _1293 = _1243 + _1289;
    float _1295 = sqrt(_1291);
    bool _1297 = _1295 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1223;
    float _1301 = _1217;
    float _1303 = _1271;
    float _1305 = _1139;
    float _1307 = _1295;
    float _1309 = _1289;
    if (!_1297)
    {
        _1299 = _1271;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (!_1297)
    {
        _1301 = _1273;
    }
    float _1315 = _1301;
    float _1317 = _1315;
    if (!_1297)
    {
        _1303 = _1293;
    }
    float _1319 = _1303;
    bool _1321 = !_1297;
    float _1323 = _1319;
    if (!_1321)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1329 = _1295 + _1327;
        float _1331 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1333 = rsqrt(_1291);
        float _1335 = _1329 * _1325;
        float _1337 = _1335 * 0.15915493667125701904296875;
        float _1339 = _1337 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = _1337 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = _1341 + (-1.0);
        float _1349 = fma(_1345, _1331, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1351 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = _1333 * _1349;
        float _1355 = fma(_1293, _1341, _1351);
        float _1357 = fma(_1283, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1359 = fma(_1279, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1323 = _1355;
        _1317 = _1357;
        _1313 = _1359;
        _1305 = _1333;
        _1307 = _1337;
        _1309 = _1347;
    }
    float _1361 = _1323;
    float _1363 = _1317;
    float _1365 = _1313;
    float _1367 = _1305;
    float _1369 = _1307;
    float _1371 = _1309;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1375 = _1361 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1363 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1383 = _1365 + _1381;
    float _1385 = _1375 * _1375;
    float _1387 = fma(_1379, _1379, _1385);
    float _1389 = fma(_1383, _1383, _1387);
    float _1391 = rsqrt(_1389);
    float _1393 = sqrt(_1389);
    float _1395 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1397 = _1379 * _1395;
    float _1399 = _1383 * _1395;
    float _1401 = _1397 * _1397;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 + _1403;
    float _1407 = sqrt(_1405);
    bool _1409 = _1407 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = _1407 + _1411;
    float _1415 = _1367;
    float _1417 = _1413;
    float _1419 = _1369;
    float _1421 = _1375;
    float _1423 = _1395;
    float _1425 = _1397;
    if (_1409)
    {
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1415 = _1427;
    }
    float _1429 = _1415;
    float _1431 = _1429;
    if (_1409)
    {
        float _1433 = _1413 * _1429;
        _1417 = _1433;
    }
    float _1435 = _1417;
    if (_1409)
    {
        float _1437 = rsqrt(_1405);
        _1431 = _1437;
    }
    float _1439 = _1431;
    float _1441 = _1439;
    if (_1409)
    {
        float _1443 = _1435 * 0.15915493667125701904296875;
        _1419 = _1443;
    }
    float _1445 = _1419;
    float _1447 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1449 = _1383;
    if (_1409)
    {
        float _1451 = _1445 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1449 = _1453;
    }
    float _1455 = _1449;
    float _1457 = precise::max(0.0, _1447);
    float _1459 = _1371;
    float _1461 = _1457;
    if (_1409)
    {
        float _1463 = _1445 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        _1459 = _1465;
    }
    float _1467 = _1459;
    float _1469 = -_1395;
    float _1471 = -_1457;
    float _1473 = fma(_1375, _1469, _1471);
    if (_1409)
    {
        float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1475;
    }
    float _1477 = _1421;
    float _1479 = _1455;
    float _1481 = _1477;
    if (_1409)
    {
        float _1483 = fma(_1455, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1479 = _1483;
    }
    float _1485 = _1479;
    float _1487 = _1485;
    if (!_1409)
    {
        _1481 = _1473;
    }
    float _1489 = _1481;
    float _1491 = _1489;
    if (_1409)
    {
        float _1493 = _1439 * _1485;
        _1423 = _1493;
    }
    float _1495 = _1423;
    if (!_1409)
    {
        _1487 = _1401;
    }
    float _1497 = _1487;
    float _1499 = _1497;
    float _1501 = _1467;
    if (_1409)
    {
        float _1503 = _1467 + (-1.0);
        _1461 = _1503;
    }
    float _1505 = _1461;
    float _1507 = _1505;
    if (_1409)
    {
        float _1509 = _1397 * _1495;
        _1425 = _1509;
    }
    float _1511 = _1425;
    if (_1409)
    {
        float _1513 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1513;
    }
    float _1515 = _1441;
    if (!_1409)
    {
        _1507 = _1399;
    }
    float _1517 = _1507;
    float _1519 = _1517;
    if (_1409)
    {
        float _1521 = _1399 * _1495;
        _1519 = _1521;
    }
    float _1523 = _1519;
    if (_1409)
    {
        float _1525 = _1511 * _1511;
        _1499 = _1525;
    }
    float _1527 = _1499;
    if (_1409)
    {
        float _1529 = fma(_1473, _1467, _1515);
        _1491 = _1529;
    }
    float _1531 = _1491;
    if (!_1409)
    {
        _1501 = _1403;
    }
    float _1533 = _1501;
    float _1535 = _1533;
    if (_1409)
    {
        float _1537 = _1523 * _1523;
        _1535 = _1537;
    }
    float _1539 = _1535;
    float _1541 = fma(_1531, _1531, _1527);
    float _1543 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1545 = _1541 + _1539;
    float _1547 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1543);
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1559 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1547);
    float _1561 = rsqrt(_1545);
    float _1563 = -_1553;
    float _1565 = _1563 + 1.0;
    float _1567 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1569 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1555);
    float _1571 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1573 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1575 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1567);
    float _1577 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1569);
    float _1579 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1571);
    float _1581 = abs(_1565);
    float _1583 = log2(_1581);
    float _1585 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1575);
    float _1587 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1589 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1579);
    float _1591 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1593 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1595 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1597 = _1561 * _1511;
    float _1599 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1601 = _1561 * _1531;
    float _1603 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1595);
    float _1605 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1607 = _1561 * _1523;
    float _1609 = -_1591;
    float _1611 = fma(_1609, _1557, 1.0);
    float _1613 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1603);
    float _1615 = -_1605;
    float _1617 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1615);
    float _1619 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1621 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1623 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1613);
    float _1625 = -_1607;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1617);
    float _1629 = log2(_1611);
    float _1631 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1633 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1621);
    float _1635 = fma(_1627, -0.5, 0.5);
    float _1637 = fma(_1627, 0.5, 0.5);
    float _1639 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1631);
    float _1641 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1633);
    float _1643 = _1601 + 1.0;
    float _1645 = 1.0 / _1623;
    float _1647 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1639);
    float _1649 = fma(_1637, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1651 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1647);
    float _1653 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1641);
    float _1655 = fma(_1637, _1649, -0.212114393711090087890625);
    float _1657 = exp2(_1619);
    float _1659 = _1629 * 0.693147182464599609375;
    float _1661 = fma(_1637, _1655, 1.570728778839111328125);
    float _1663 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1665 = sqrt(_1635);
    float _1667 = _1651 * _1645;
    float _1669 = _1653 * _1645;
    float _1671 = fma(_1667, 0.5, 0.5);
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = -_1601;
    float _1677 = fma(_1657, _1643, _1675);
    float3 _4897 = float3(_1671, _1673, _1663);
    float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4897, float3(0.0), isnan(_4897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4897, float3(0.0), isnan(_4897)), level(0.0)).x;
    float _1681 = _1665 * 0.636619746685028076171875;
    float _1683 = fma(_1677, 0.5, 0.5);
    float _1685 = -_1661;
    float _1687 = fma(_1681, _1685, 1.0);
    float3 _4918 = float3(_1671, _1673, _1663);
    float4 _1690 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4918, float3(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4918, float3(0.0), isnan(_4918)), level(0.0)).xyzw;
    float _1692 = _1690.x;
    float _1694 = _1690.y;
    float _1696 = _1690.z;
    float _1698 = _1690.w;
    float2 _4935 = float2(_1687, _1683);
    float3 _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4935, float2(0.0), isnan(_4935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4935, float2(0.0), isnan(_4935)), level(0.0)).xyz;
    float _1704 = _1702.x;
    float _1706 = _1702.y;
    float _1708 = _1702.z;
    float _1710 = in.m_56.w;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1714 = _1712 != 0;
    float _1716 = _753 * (-0.15915493667125701904296875);
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1720 = _1718 != 0;
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1726 = _1724 != 0;
    float _1728 = _791 * (-0.15915493667125701904296875);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1732 = _1730 != 0;
    float _1734 = -_861;
    float _1736 = _1734 + 1.0;
    bool _1738 = _165 > 0.5;
    float _1740 = -_789;
    float _1742 = _1740 + 1.0;
    float _1744 = _1716 * 6.283185482025146484375;
    float _1746 = cos(_1744);
    out.m_60.x = _1241;
    out.m_60.y = _1255;
    out.m_60.z = _1247;
    float _1748 = -_757;
    float _1750 = _1748 + 1.0;
    float _1752 = -_859;
    float _1754 = _1752 + 1.0;
    float _1756 = 0.0;
    float _1758 = _1671;
    float _1760 = _1673;
    bool _1762 = _1738;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1766 = _1653;
    float _1768 = _1651;
    if (_1714)
    {
        float _1770 = in.m_56.z;
        _1756 = _1770;
    }
    float _1772 = _1756;
    float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1720)
    {
        float _1776 = _1710 * 3.1415927410125732421875;
        _1758 = _1776;
    }
    float _1778 = _1758;
    bool _1780 = _1710 > 0.5;
    float _1782 = 0.0;
    float _1784 = _1778;
    bool _1786 = _1780;
    if (_1720)
    {
        float _1788 = _1778 * 0.15915493667125701904296875;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (_1726)
    {
        float _1792 = _165 * 3.1415927410125732421875;
        _1784 = _1792;
    }
    float _1794 = _1784;
    float _1796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1798 = _1794;
    if (_1726)
    {
        float _1800 = _1794 * 0.15915493667125701904296875;
        _1760 = _1800;
    }
    float _1802 = _1760;
    if (_1732)
    {
        float _1804 = _1710 * 3.1415927410125732421875;
        _1798 = _1804;
    }
    float _1806 = _1798;
    float _1808 = 0.0;
    float _1810 = _1806;
    if (_1720)
    {
        float _1812 = _1790 * 6.283185482025146484375;
        float _1814 = sin(_1812);
        _1808 = _1814;
    }
    float _1816 = _1808;
    float _1818 = 0.0;
    if (_1732)
    {
        float _1820 = _1806 * 0.15915493667125701904296875;
        _1818 = _1820;
    }
    float _1822 = _1818;
    if (_1714)
    {
        float _1824 = _1772 * 3.1415927410125732421875;
        _1810 = _1824;
    }
    float _1826 = _1810;
    float _1828 = _1826;
    if (_1714)
    {
        float _1830 = _1826 * 0.15915493667125701904296875;
        _1828 = _1830;
    }
    float _1832 = _1828;
    float _1834 = _1802;
    if (_1726)
    {
        float _1836 = _1802 * 6.283185482025146484375;
        float _1838 = sin(_1836);
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = -_403;
    int _1844 = _1780 ? as_type<int>(_1842) : as_type<int>(_403);
    float _1846 = _1772;
    if (_1732)
    {
        float _1848 = _1822 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1816;
    if (_1720)
    {
        bool _1856 = _1816 > 0.5;
        _643 = _1856;
    }
    bool _1858 = _643;
    if (!_1720)
    {
        _1854 = _397;
    }
    float _1860 = _1854;
    float _1862 = _1860;
    if (_1720)
    {
        float _1864 = -_397;
        float _1866 = _1858 ? _1864 : _397;
        _1862 = _1866;
    }
    float _1868 = _1862;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1872 = _1870 != 0;
    float _1874 = _1832;
    bool _1876 = _1872;
    if (_1714)
    {
        float _1878 = _1832 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1874 = _1880;
    }
    float _1882 = _1874;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1886 = _1884 != 0;
    if (_1726)
    {
        bool _1888 = _1840 > 0.5;
        _1786 = _1888;
    }
    bool _1890 = _1786;
    float _1892 = -_397;
    int _1894 = _1738 ? as_type<int>(_1892) : as_type<int>(_397);
    float _1896 = _1716 * 6.283185482025146484375;
    float _1898 = sin(_1896);
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_1732)
    {
        bool _1902 = _1852 > 0.5;
        _1762 = _1902;
    }
    bool _1904 = _1762;
    bool _1906 = !_1872;
    float _1908 = _1906 ? _397 : as_type<float>(_1894);
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1726)
    {
        _1900 = _403;
    }
    float _1912 = _1900;
    float _1914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1916 = _1912;
    if (_1714)
    {
        bool _1918 = _1882 > 0.5;
        _1876 = _1918;
    }
    bool _1920 = _1876;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1726)
    {
        float _1926 = -_403;
        float _1928 = _1890 ? _1926 : _403;
        _1916 = _1928;
    }
    float _1930 = _1916;
    float _1932 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1934 = !_1886;
    float _1936 = _1934 ? _403 : as_type<float>(_1844);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1898 * _1930;
    float _1944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    if (!_1714)
    {
        _1764 = _397;
    }
    float _1946 = _1764;
    float _1948 = -_1936;
    float _1950 = _1948 + 0.5;
    float _1952 = _1946;
    if (_1714)
    {
        float _1954 = -_397;
        float _1956 = _1920 ? _1954 : _397;
        _1952 = _1956;
    }
    float _1958 = _1952;
    float _1960 = _1908 + 0.5;
    out.m_62.x = _1938;
    out.m_62.y = _1940;
    out.m_62.z = _1932;
    float _1962 = _1746 * _1930;
    float _1964 = -_1942;
    float _1966 = fma(_1746, _1868, _1964);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1970 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1972 = -_931;
    float _1974 = _1972 + 0.5;
    float _1976 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1978 = fma(_1898, _1868, _1962);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1982 = _979 + 0.5;
    if (!_1732)
    {
        _981 = _403;
    }
    float _1984 = _981;
    float _1986 = _1976 * _1722;
    float _1988 = _1984;
    if (_1732)
    {
        float _1990 = -_403;
        float _1992 = _1904 ? _1990 : _403;
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1998 = _1970 * _1914;
    float _2000 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = _1728 * 6.283185482025146484375;
    float _2004 = sin(_2002);
    float _2006 = _1996 * _1774;
    float _2008 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2010 = _1958 + 0.5;
    float _2012 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2014 = _1994 + (-0.5);
    float _2016 = _2000 * _1968;
    float _2018 = fma(_2008, _2010, _801);
    float _2020 = _1728 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    float _2024 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2026 = _1966 + 0.5;
    float _2028 = -_2012;
    float _2030 = -_777;
    float _2032 = fma(_2028, _2014, _2030);
    out.m_64.x = _1986;
    out.m_64.y = _2016;
    out.m_64.z = _2006;
    out.m_64.w = _1998;
    bool _2034 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2036 = isnan(_1393);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2042 = _2038 || _2040;
    float _2044 = fma(_2024, _2026, _763);
    float _2046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2048 = _543 * _2004;
    float _2050 = _543 * _2022;
    float _2052 = -_2048;
    float _2054 = fma(_441, _2022, _2052);
    float _2056 = _403 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2060 = fma(_441, _2004, _2050);
    float _2062 = -_1736;
    float _2064 = fma(_1966, _2062, _2044);
    float _2066 = fma(_2056, _2056, 1.0);
    float _2068 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2070 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2072 = _2054 + 0.5;
    float _2074 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2078 = -_785;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_2070, _2072, _867);
    float _2084 = fma(_1742, _1994, _2032);
    float _2086 = -_853;
    float _2088 = _2086 + 1.0;
    float _2090 = -_2080;
    float _2092 = fma(_2090, _1958, _2018);
    float _2094 = -_2056;
    float _2096 = _1221 * _2094;
    float _2098 = _2060 + (-0.5);
    float _2100 = rsqrt(_2066);
    float _2102 = -_2088;
    float _2104 = fma(_2054, _2102, _2082);
    float _2106 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_66.x = _2092;
    out.m_66.y = _2084;
    float _2108 = fma(_1241, _2068, _2096);
    float _2110 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2112 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2106);
    float _2114 = _1261 * _2056;
    float _2116 = exp2(_2074);
    float _2118 = _1978 + (-0.5);
    float _2120 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2112);
    float _2122 = fma(_1255, _2068, _2114);
    float _2124 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2126 = -_2110;
    float _2128 = -_781;
    float _2130 = fma(_2126, _2118, _2128);
    float _2132 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2134 = _2056 * _2100;
    float _2136 = _1211 * _2056;
    float _2138 = _2132 + _1623;
    float _2140 = -_2124;
    float _2142 = -_863;
    float _2144 = fma(_2140, _2098, _2142);
    float _2146 = -_2134;
    float _2148 = _1231 * _2146;
    float _2150 = -_2134;
    float _2152 = _1265 * _2150;
    float _2154 = fma(_1247, _2068, _2136);
    float _2156 = -_2134;
    float _2158 = _1253 * _2156;
    float _2160 = -_2116;
    float _2162 = _2160 + 1.0;
    float _2164 = -_1221;
    float _2166 = fma(_2164, _2100, _2148);
    float _2168 = fma(_1261, _2100, _2152);
    float _2170 = fma(_1211, _2100, _2158);
    float _2172 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2174 = _2138 * 0.5;
    float _2176 = _1231 + _2108;
    float _2178 = _1253 + _2154;
    float _2180 = -_2172;
    float _2182 = _2180 + 1.0;
    float _2184 = _1265 + _2122;
    float _2186 = fma(_1978, _1750, _2130);
    float _2188 = fma(_2060, _1754, _2144);
    out.m_68.x = _2166;
    out.m_68.y = _2168;
    out.m_68.z = _2170;
    out.m_70.x = _2064;
    out.m_70.y = _2186;
    out.m_72.x = _2104;
    out.m_72.y = _2188;
    out.m_74.z = _2174;
    out.m_74.w = _1623;
    out.m_76.x = _2176;
    out.m_76.y = _2184;
    out.m_76.z = _2178;
    out.gl_Position.x = _1651;
    out.gl_Position.y = _1653;
    out.gl_Position.z = _2132;
    out.gl_Position.w = _1623;
    if (!_2042)
    {
        _1766 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2190 = _1766;
    float _2192 = _2190;
    float _2194 = _2190;
    if (!_2042)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2196 = _1768;
    float _2198 = _2172 * _1679;
    float _2200 = _1698 * _2198;
    float _2202 = _1698 * _2182;
    float _2204 = _1708 * _2198;
    float _2206 = fma(_1704, _2200, _1692);
    float _2208 = fma(_1706, _2200, _1694);
    float _2210 = _2200;
    float _2212 = _2196;
    float _2214 = _2196;
    if (!_2042)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2216 = _2210;
    float _2218 = fma(_1698, _2204, _1696);
    out.m_78.x = _2206;
    out.m_78.y = _2208;
    out.m_78.z = _2218;
    out.m_78.w = _2202;
    bool _2220 = !_2042;
    float _2222 = _2216;
    float _2224 = _2216;
    if (!_2220)
    {
        bool _2226 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2228 = isnan(_1393);
        bool _2230 = _2226 || _2228;
        bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2234 = _2230 || _2232;
        if (!_2234)
        {
            float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2238 = _1393 + _2236;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2242 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2240;
            float _2244 = 1.0 / _2242;
            float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2254 = _2238 * _2244;
            float _2256 = precise::clamp(_2254, 0.0, 1.0);
            float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2260 = _2258 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2262 = fma(_2256, _2252, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2264 = fma(_2256, _2260, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2266 = fma(_2256, _2248, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2214 = _2266;
            _2194 = _2264;
            _2224 = _2262;
            _2268 = true;
        }
        else
        {
            bool _2270 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2272 = isnan(_1393);
            bool _2274 = _2270 || _2272;
            bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2278 = _2274 || _2276;
            if (!_2278)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2280 = _2192;
            _2194 = _2280;
            if (!_2278)
            {
                _2212 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2282 = _2212;
            _2214 = _2282;
            if (!_2278)
            {
                _2222 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2284 = _2222;
            bool _2286 = !_2278;
            _2224 = _2284;
            if (!_2286)
            {
                bool _2288 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2290 = isnan(_1393);
                bool _2292 = _2288 || _2290;
                bool _2294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2296 = _2292 || _2294;
                if (!_2296)
                {
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2300 = _1393 + _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2304 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2302;
                    float _2306 = 1.0 / _2304;
                    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2316 = _2300 * _2306;
                    float _2318 = precise::clamp(_2316, 0.0, 1.0);
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2324 = fma(_2318, _2314, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2326 = fma(_2318, _2322, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2328 = fma(_2318, _2310, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2214 = _2328;
                    _2194 = _2326;
                    _2224 = _2324;
                    _2268 = true;
                }
                else
                {
                    _2214 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2224 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2268 = false;
    float _2330 = _2214;
    float _2332 = _2194;
    float _2334 = _2224;
    float _2336 = _2330 * 0.586610972881317138671875;
    bool _2338 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_80.x = 0.0;
    float _2340 = fma(_2332, 0.298911988735198974609375, _2336);
    float _2342 = fma(_2334, 0.114477999508380889892578125, _2340);
    float _2344 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2346 = -_2342;
    float _2348 = _2346 + _2332;
    float _2350 = -_2342;
    float _2352 = _2350 + _2330;
    float _2354 = -_2342;
    float _2356 = _2354 + _2334;
    out.m_51.x = _2344;
    float _2358 = fma(_2348, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    float _2360 = fma(_2352, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    float _2362 = fma(_2356, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    out.m_82.x = _2358;
    out.m_82.y = _2360;
    out.m_82.z = _2362;
    if (!_2338)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2364 = -_1361;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2368 = -_1363;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2372 = -_1365;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2376 = _2366 * _2366;
    float _2378 = fma(_2370, _2370, _2376);
    float _2380 = fma(_2374, _2374, _2378);
    float _2382 = sqrt(_2380);
    float _2384 = rsqrt(_2380);
    float _2386 = -_2382;
    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2392 = precise::clamp(_2390, 0.0, 1.0);
    float _2394 = _2370 * _2384;
    float _2396 = _2366 * _2384;
    float _2398 = abs(_2392);
    float _2400 = log2(_2398);
    float _2402 = _2374 * _2384;
    float _2404 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2406 = _2184 * _2396;
    float _2408 = -_2396;
    float _2410 = -_2404;
    float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2410);
    float _2414 = fma(_2176, _2394, _2406);
    float _2416 = -_2402;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2412);
    float _2420 = fma(_2178, _2402, _2414);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2426 = _2418 + _2424;
    float _2428 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = exp2(_2428);
    float _2436 = _2434 * _2432;
    float _2438 = _2422 * _2436;
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2442 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2444 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2440;
    out.m_80.y = _2442;
    out.m_80.z = _2444;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = in.m_46.w;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = -_98;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _107;
    bool _111 = _103 >= 1;
    float _113 = 0.0;
    int _115 = as_type<int>(_98);
    float _117 = _107;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2513 = as_type<float>(_125);
        out.gl_Position.z = _2513;
    }
    if (!_111)
    {
        return out;
    }
    bool _129 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_98);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = float(_103);
    bool _141 = _107 >= _139;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_51.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _127 = as_type<int>(_151);
    }
    int _153 = _127;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_153);
        out.gl_Position.z = _2569;
    }
    if (_145)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _163 = _161 != 0;
    float _165 = in.m_56.x;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = 0.0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _183 = _177;
    if (_163)
    {
        float _185 = in.m_56.y;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = 0.0;
    if (!_175)
    {
        float _191 = _177 * _177;
        float _193 = _191 * 0.5;
        _189 = _193;
    }
    float _195 = _189;
    float _197 = 0.0;
    float _199 = _195;
    if (_163)
    {
        float _201 = in.m_56.z;
        _197 = _201;
    }
    float _203 = _197;
    if (!_175)
    {
        float _205 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _205;
    }
    float _207 = _199;
    bool _209 = !_175;
    float _211 = _207;
    float _213 = _203;
    float _215 = _187;
    if (!_209)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _177 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _177);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = as_type<int>(_235);
        _211 = _245;
        _115 = as_type<int>(_233);
    }
    int _247 = _181;
    float _249 = _211;
    int _251 = _115;
    bool _253 = !_175;
    int _255 = _247;
    int _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _177 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = as_type<int>(_271);
        _183 = _277;
    }
    int _279 = _255;
    float _281 = _183;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    int _291 = _279;
    if (_163)
    {
        _257 = 0;
        _291 = 0;
    }
    int _293 = _257;
    int _295 = _291;
    int _297 = 0;
    int _299 = _293;
    int _301 = _295;
    if (_163)
    {
        _297 = as_type<int>(_165);
    }
    int _303 = _297;
    int _305 = 0;
    int _307 = _303;
    if (_163)
    {
        _305 = as_type<int>(_187);
    }
    int _309 = _305;
    int _311 = 0;
    int _313 = _309;
    if (_163)
    {
        _311 = as_type<int>(_203);
    }
    int _315 = _311;
    bool _317 = !_285;
    int _319 = _317 ? 0 : 1;
    bool _321 = !_289;
    int _323 = _321 ? 0 : 1;
    int _325 = _315;
    if (!_163)
    {
        float _327 = in.m_56.y;
        float _329 = _165 * 3.1415927410125732421875;
        float _331 = in.m_56.z;
        float _333 = _329 * 0.15915493667125701904296875;
        float _335 = _333 * 6.283185482025146484375;
        float _337 = sin(_335);
        float _339 = _327 * 3.1415927410125732421875;
        float _341 = _339 * 0.15915493667125701904296875;
        float _343 = _331 * 3.1415927410125732421875;
        float _345 = _343 * 0.15915493667125701904296875;
        float _347 = _341 * 6.283185482025146484375;
        float _349 = sin(_347);
        float _351 = _345 * 6.283185482025146484375;
        float _353 = sin(_351);
        _213 = _331;
        _215 = _327;
        _299 = 1;
        _313 = as_type<int>(_349);
        _307 = as_type<int>(_337);
        _325 = as_type<int>(_353);
        _301 = 2;
    }
    float _355 = _213;
    float _357 = _215;
    int _359 = _299;
    int _361 = _313;
    int _363 = _307;
    int _365 = _325;
    int _367 = _301;
    float _369 = _355 * 2.0;
    float _371 = _159 * _107;
    float _373 = in.m_58.w;
    float _375 = floor(_369);
    int _377 = as_type<int>(_155) & 1;
    bool _379 = _377 != 0;
    float _381 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _383 = as_type<int>(_155) & 2;
    bool _385 = _383 != 0;
    float _387 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _389 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _391 = _357 > 0.5;
    float _393 = exp2(_371);
    bool _395 = !_379;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _401 = !_385;
    float _403 = _401 ? (-0.5) : 0.5;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _415 = _413 != 0;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _419 = _417 != 0;
    float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _423 = -_397;
    int _425 = _391 ? as_type<int>(_423) : as_type<int>(_397);
    bool _427 = _359 != 1;
    float _429 = -_403;
    int _431 = _391 ? as_type<int>(_429) : as_type<int>(_403);
    bool _433 = _375 > 0.0;
    float _435 = -_393;
    float _437 = _435 + 1.0;
    bool _439 = !_415;
    float _441 = _439 ? _397 : as_type<float>(_425);
    bool _443 = !_427;
    float _445 = _443 ? as_type<float>(_361) : as_type<float>(_363);
    bool _447 = !_427;
    float _449 = _447 ? as_type<float>(_365) : as_type<float>(_361);
    bool _451 = _375 >= 0.0;
    bool _453 = isnan(_375);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = _399 * _421;
    bool _463 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _471 = _467 || _469;
    bool _473 = _367 != 2;
    float _475 = _165 * 2.0;
    int _477 = _459 ? 0 : 1;
    float _479 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _461);
    float _481 = _471 ? _437 : 0.0;
    float _483 = floor(_475);
    float _485 = in.m_46.x;
    float _487 = in.m_46.y;
    float _489 = in.m_46.z;
    int _491 = ~_477;
    int _493 = _491 + 1;
    int _495 = _493 + 1;
    int _497 = _495;
    if (!_433)
    {
        int _499 = ~_477;
        int _501 = _499 + 1;
        _497 = _501;
    }
    int _503 = _497;
    bool _505 = _355 > 0.5;
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _515 = -_403;
    int _517 = _505 ? as_type<int>(_515) : as_type<int>(_403);
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _521 = 0.0;
    if (_473)
    {
        _521 = _165;
    }
    float _523 = _521;
    float _525 = fma(as_type<float>(_363), (*spvDescriptorSet0.vp_c9)._m0[93].z, _513);
    float _527 = 0.0;
    float _529 = _523;
    if (_473)
    {
        _527 = _357;
    }
    float _531 = _527;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _535 = 0.0;
    float _537 = _531;
    if (_473)
    {
        _535 = _355;
    }
    float _539 = _535;
    bool _541 = !_419;
    float _543 = _541 ? _403 : as_type<float>(_517);
    float _545 = _539;
    if (!_473)
    {
        _529 = _355;
    }
    float _547 = _529;
    float _549 = fma(_281, _487, _387);
    float _551 = fma(_281, _489, _389);
    float _553 = fma(_281, _485, _381);
    if (!_473)
    {
        _537 = _165;
    }
    float _555 = _537;
    float _557 = as_type<float>(_363) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (!_473)
    {
        _545 = _357;
    }
    float _559 = _545;
    float _561 = as_type<float>(_361) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _573 = _571 != 0;
    float _575 = fma(_551, _373, _511);
    float _577 = _357 + _355;
    bool _579 = _483 > 0.0;
    float _581 = _165 + _355;
    float _583 = -_519;
    float _585 = fma(_557, 2.0, _583);
    float _587 = fma(_561, -2.0, _533);
    float _589 = _577 + (-1.0);
    bool _591 = !_565;
    int _593 = _591 ? 0 : 1;
    float _595 = fma(_553, _373, _507);
    float _597 = _581 + (-1.0);
    bool _599 = _483 >= 0.0;
    bool _601 = isnan(_483);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _611 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _613 = _357 * 2.0;
    int _615 = _607 ? 0 : 1;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _619 = fma(as_type<float>(_365), (*spvDescriptorSet0.vp_c9)._m0[94].z, _609);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _623 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _625 = _623 != 0;
    float _627 = _165 + _357;
    int _629 = ~_615;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = fma(_549, _373, _509);
    int _637 = _633;
    bool _639 = _505;
    int _641 = _411 ? (-1) : 0;
    bool _643 = _625;
    if (!_579)
    {
        int _645 = ~_615;
        int _647 = _645 + 1;
        _637 = _647;
    }
    int _649 = _637;
    float _651 = fma(as_type<float>(_361), (*spvDescriptorSet0.vp_c9)._m0[93].w, _621);
    float _653 = floor(_613);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _657 = _627 + (-1.0);
    float _659 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[98].z, _655);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _663 = _445 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _665 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _669 = -_661;
    float _671 = fma(_663, 2.0, _669);
    float _673 = _635 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _675 = _635 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _677 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[89].z, _667);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _681 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[4].x, _673);
    float _683 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    bool _685 = _653 >= 0.0;
    bool _687 = isnan(_653);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[98].w, _679);
    float _697 = _449 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _699 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[4].z, _681);
    float _701 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[6].z, _683);
    int _703 = _693 ? 0 : 1;
    float _705 = _555 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _707 = _653 > 0.0;
    float _709 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _701 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _709 + _715;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _721 = -_711;
    float _723 = _721 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _725 = fma(_697, -2.0, _713);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _729 = _547 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _731 = !_569;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_705, -2.0, _719);
    float _737 = abs(_717);
    float _739 = abs(_723);
    float _741 = precise::max(_737, _739);
    float _743 = -_727;
    float _745 = fma(_729, 2.0, _743);
    int _747 = ~_703;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[94].x, _619);
    int _755 = abs(_593);
    float _757 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[92].w, _651);
    int _759 = abs(_733);
    float _761 = -_107;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[91].x, _585);
    int _765 = _751;
    float _767 = _717;
    float _769 = _723;
    if (!_707)
    {
        int _771 = ~_703;
        int _773 = _771 + 1;
        _765 = _773;
    }
    int _775 = _765;
    float _777 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[96].y, _725);
    bool _779 = _741 >= 16.0;
    float _781 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[91].y, _587);
    float _783 = float(_649);
    float _785 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[97].z, _659);
    float _787 = float(_759);
    float _789 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[97].w, _695);
    float _791 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[89].x, _677);
    float _793 = floor(_479);
    float _795 = _787 * _783;
    float _797 = float(_503);
    float _799 = -_107;
    float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[96].x, _671);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _805 = 1.0 + _803;
    float _807 = float(_755);
    float _809 = _795 * (-2.0);
    float _811 = 1.0 / _805;
    float _813 = _807 * _797;
    bool _815 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _817 = isnan(1.0);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _823 = _819 || _821;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _827 = !_573;
    int _829 = _827 ? 0 : 1;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_779)
    {
        float _833 = _717 * 0.0625;
        _767 = _833;
    }
    float _835 = _767;
    float _837 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _825);
    float _839 = -_793;
    float _841 = _479 + _839;
    float _843 = _479 * 6.283185482025146484375;
    float _845 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[88].w, _831);
    int _847 = abs(_829);
    float _849 = fma(_611, _809, _611);
    float _851 = _843 * 0.15915493667125701904296875;
    float _853 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[87].z, _837);
    float _855 = _813 * (-2.0);
    float _857 = _165 + (-0.5);
    float _859 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[87].w, _845);
    float _861 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[92].z, _525);
    float _863 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[86].y, _735);
    float _865 = -_107;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[86].x, _745);
    float _869 = float(_775);
    if (_823)
    {
        float _871 = _481 * _811;
        _117 = _871;
    }
    float _873 = _117;
    float _875 = float(_847);
    if (_779)
    {
        float _877 = _723 * 0.0625;
        _769 = _877;
    }
    float _879 = _769;
    float _881 = _851 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = abs(_835);
    bool _887 = _885 != 0.0;
    bool _889 = isnan(_885);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = fma(_665, _855, _665);
    float _899 = _857 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _901 = _875 * _869;
    bool _903 = _841 < 0.5;
    float _905 = float(_903);
    float _907 = fma(_897, _873, _899);
    float _909 = abs(_879);
    bool _911 = _909 == 0.0;
    bool _913 = !_895;
    bool _915 = _911 && _913;
    float _917 = -_841;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _921 = _901 * (-2.0);
    float _923 = -_905;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _927 = _907 * 0.15915493667125701904296875;
    bool _929 = !_407;
    float _931 = _929 ? _403 : as_type<float>(_431);
    float _933 = fma(_617, _921, _617);
    float _935 = abs(_879);
    bool _937 = _935 == 0.0;
    float _939 = _927 * 6.283185482025146484375;
    float _941 = sin(_939);
    float _943 = _355 + (-0.5);
    float _945 = _357 + (-0.5);
    float _947 = fma(_883, 0.5, 0.5);
    float _949 = -_397;
    int _951 = _505 ? as_type<int>(_949) : as_type<int>(_397);
    float _953 = _943 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _955 = as_type<int>(_947);
    int _957 = as_type<int>(_953);
    if (_915)
    {
        bool _959 = as_type<int>(_879) >= 0;
        _639 = _959;
    }
    bool _961 = _639;
    float _963 = _945 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _965 = -_947;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _969 = fma(_933, _873, _953);
    if (_915)
    {
        int _971 = _961 ? 0 : 1078530011;
        _955 = _971;
    }
    int _973 = _955;
    float _975 = fma(_849, _873, _963);
    bool _977 = !_411;
    float _979 = _977 ? _397 : as_type<float>(_951);
    float _981 = _979;
    if (_915)
    {
        int _983 = int(0x80000000) & as_type<int>(_835);
        int _985 = _973 | _983;
        _957 = _985;
    }
    int _987 = _957;
    bool _989 = !_895;
    bool _991 = _989 && _937;
    int _993 = _987;
    float _995 = as_type<float>(_987);
    if (!_991)
    {
        float _997 = abs(_835);
        bool _999 = _997 != as_type<float>(0x7f800000u /* inf */);
        bool _1001 = isnan(_997);
        bool _1003 = _999 || _1001;
        bool _1005 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1007 = _1003 || _1005;
        float _1009 = abs(_879);
        bool _1011 = _1009 == as_type<float>(0x7f800000u /* inf */);
        float _1013 = abs(_879);
        bool _1015 = _1013 == as_type<float>(0x7f800000u /* inf */);
        bool _1017 = !_1007;
        bool _1019 = _1015 && _1017;
        if (_1019)
        {
            bool _1021 = as_type<int>(_879) >= 0;
            _641 = _1021 ? (-1) : 0;
        }
        int _1023 = _641;
        if (_1019)
        {
            _993 = 1075235812;
        }
        int _1025 = _993;
        int _1027 = _1025;
        if (_1019)
        {
            int _1029 = ~_1023;
            int _1031 = (_1029 != 0) ? _1025 : 1061752795;
            _1027 = _1031;
        }
        int _1033 = _1027;
        float _1035 = as_type<float>(_1033);
        if (_1019)
        {
            int _1037 = int(0x80000000) & as_type<int>(_835);
            int _1039 = _1033 | _1037;
            _1035 = as_type<float>(_1039);
        }
        float _1041 = _1035;
        bool _1043 = !_1007;
        bool _1045 = _1043 && _1011;
        _995 = _1041;
        if (!_1045)
        {
            float _1047 = abs(_835);
            float _1049 = abs(_879);
            float _1051 = precise::max(_1047, _1049);
            float _1053 = abs(_835);
            float _1055 = abs(_879);
            float _1057 = _1053 + _1055;
            float _1059 = abs(_835);
            float _1061 = abs(_879);
            float _1063 = precise::min(_1059, _1061);
            float _1065 = 1.0 / _1051;
            float _1067 = abs(_835);
            float _1069 = abs(_879);
            bool _1071 = _1067 > _1069;
            bool _1073 = as_type<int>(_879) >= 0;
            bool _1075 = _1057 > as_type<float>(0x7f800000u /* inf */);
            bool _1077 = isnan(_1057);
            bool _1079 = _1075 || _1077;
            bool _1081 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1083 = _1079 || _1081;
            float _1085 = _1063 * _1065;
            int _1087 = as_type<int>(_835) & int(0x80000000);
            float _1089 = _1085 * _1085;
            float _1091 = _1089 + 11.33538818359375;
            float _1093 = fma(_1089, _1091, 28.84246826171875);
            float _1095 = fma(_1089, _1093, 19.6966705322265625);
            float _1097 = fma(_1089, -0.82336294651031494140625, -5.674867153167724609375);
            float _1099 = fma(_1089, _1097, -6.565555095672607421875);
            float _1101 = 1.0 / _1095;
            float _1103 = _1089 * _1099;
            float _1105 = _1085 * _1103;
            float _1107 = fma(_1105, _1101, _1085);
            float _1109 = _1107;
            _995 = _1057;
            if (_1071)
            {
                float _1111 = -_1107;
                float _1113 = _1111 + 1.57079637050628662109375;
                _1109 = _1113;
            }
            float _1115 = _1109;
            int _1117 = as_type<int>(_1115);
            if (!_1073)
            {
                float _1119 = -_1115;
                float _1121 = _1119 + 3.1415927410125732421875;
                _1117 = as_type<int>(_1121);
            }
            int _1123 = _1117;
            if (!_1083)
            {
                int _1125 = _1087 | _1123;
                _995 = as_type<float>(_1125);
            }
        }
    }
    float _1127 = _995;
    float _1129 = in.m_58.x;
    float _1131 = in.m_58.y;
    bool _1133 = !_625;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = _927 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    int _1141 = abs(_319);
    float _1143 = -_1127;
    float _1145 = _975 + _1143;
    int _1147 = abs(_1135);
    float _1149 = _969 * 0.15915493667125701904296875;
    int _1151 = abs(_323);
    float _1153 = _1145 * 0.15915493667125701904296875;
    float _1155 = _1149 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = float(_1141);
    float _1161 = _635 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1163 = float(_1147);
    int _1165 = as_type<int>(_155) & 2;
    bool _1167 = _1165 != 0;
    float _1169 = abs(_919);
    float _1171 = _1159 * _1169;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _1175 = _1167 ? 0.0 : 1.0;
    float _1177 = fma(_1163, _967, _1171);
    float _1179 = float(_1151);
    float _1181 = _1153 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1161);
    float _1187 = fma(_1175, _1173, 1.0);
    float _1189 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1191 = abs(_925);
    float _1193 = fma(_1179, _1191, _1177);
    float _1195 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1197 = _397 * _1187;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _403);
    float _1201 = _1153 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1193 * _1189;
    float _1207 = _1193 * _1195;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1197);
    float _1211 = _941 * _1157;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1217 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1219 = _1149 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1213 * _1209;
    float _1225 = _1215 * _1199;
    float _1227 = _1139 * _1183;
    float _1229 = _941 * _1183;
    float _1231 = _1183 * _1157;
    float _1233 = _1211 * _1225;
    float _1235 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1185);
    float _1237 = _941 * _1203;
    float _1239 = _1139 * _1203;
    float _1241 = _1203 * _1157;
    float _1243 = _1235 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = -_1227;
    float _1247 = fma(_1221, _1237, _1245);
    float _1249 = -_1225;
    float _1251 = _1221 * _1249;
    float _1253 = fma(_1221, _1229, _1239);
    float _1255 = fma(_1221, _1239, _1229);
    float _1257 = fma(_1247, _1223, _1233);
    float _1259 = fma(_1241, _1223, _1251);
    float _1261 = _1139 * _1157;
    float _1263 = -_1237;
    float _1265 = fma(_1221, _1227, _1263);
    float _1267 = fma(_1253, _1217, _1257);
    float _1269 = fma(_1231, _1217, _1259);
    float _1271 = _711 + _1267;
    float _1273 = _709 + _1269;
    float _1275 = _1261 * _1225;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1279 = _1271 + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1283 = _1273 + _1281;
    float _1285 = fma(_1255, _1223, _1275);
    float _1287 = _1279 * _1279;
    float _1289 = fma(_1265, _1217, _1285);
    float _1291 = fma(_1283, _1283, _1287);
    float _1293 = _1243 + _1289;
    float _1295 = sqrt(_1291);
    bool _1297 = _1295 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1223;
    float _1301 = _1217;
    float _1303 = _1271;
    float _1305 = _1139;
    float _1307 = _1295;
    float _1309 = _1289;
    if (!_1297)
    {
        _1299 = _1271;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (!_1297)
    {
        _1301 = _1273;
    }
    float _1315 = _1301;
    float _1317 = _1315;
    if (!_1297)
    {
        _1303 = _1293;
    }
    float _1319 = _1303;
    bool _1321 = !_1297;
    float _1323 = _1319;
    if (!_1321)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1329 = _1295 + _1327;
        float _1331 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1333 = rsqrt(_1291);
        float _1335 = _1329 * _1325;
        float _1337 = _1335 * 0.15915493667125701904296875;
        float _1339 = _1337 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = _1337 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = _1341 + (-1.0);
        float _1349 = fma(_1345, _1331, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1351 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = _1333 * _1349;
        float _1355 = fma(_1293, _1341, _1351);
        float _1357 = fma(_1283, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1359 = fma(_1279, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1323 = _1355;
        _1317 = _1357;
        _1313 = _1359;
        _1305 = _1333;
        _1307 = _1337;
        _1309 = _1347;
    }
    float _1361 = _1323;
    float _1363 = _1317;
    float _1365 = _1313;
    float _1367 = _1305;
    float _1369 = _1307;
    float _1371 = _1309;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1375 = _1361 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1363 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1383 = _1365 + _1381;
    float _1385 = _1375 * _1375;
    float _1387 = fma(_1379, _1379, _1385);
    float _1389 = fma(_1383, _1383, _1387);
    float _1391 = rsqrt(_1389);
    float _1393 = sqrt(_1389);
    float _1395 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1397 = _1379 * _1395;
    float _1399 = _1383 * _1395;
    float _1401 = _1397 * _1397;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 + _1403;
    float _1407 = sqrt(_1405);
    bool _1409 = _1407 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = _1407 + _1411;
    float _1415 = _1367;
    float _1417 = _1413;
    float _1419 = _1369;
    float _1421 = _1375;
    float _1423 = _1395;
    float _1425 = _1397;
    if (_1409)
    {
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1415 = _1427;
    }
    float _1429 = _1415;
    float _1431 = _1429;
    if (_1409)
    {
        float _1433 = _1413 * _1429;
        _1417 = _1433;
    }
    float _1435 = _1417;
    if (_1409)
    {
        float _1437 = rsqrt(_1405);
        _1431 = _1437;
    }
    float _1439 = _1431;
    float _1441 = _1439;
    if (_1409)
    {
        float _1443 = _1435 * 0.15915493667125701904296875;
        _1419 = _1443;
    }
    float _1445 = _1419;
    float _1447 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1449 = _1383;
    if (_1409)
    {
        float _1451 = _1445 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1449 = _1453;
    }
    float _1455 = _1449;
    float _1457 = precise::max(0.0, _1447);
    float _1459 = _1371;
    float _1461 = _1457;
    if (_1409)
    {
        float _1463 = _1445 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        _1459 = _1465;
    }
    float _1467 = _1459;
    float _1469 = -_1395;
    float _1471 = -_1457;
    float _1473 = fma(_1375, _1469, _1471);
    if (_1409)
    {
        float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1475;
    }
    float _1477 = _1421;
    float _1479 = _1455;
    float _1481 = _1477;
    if (_1409)
    {
        float _1483 = fma(_1455, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1479 = _1483;
    }
    float _1485 = _1479;
    float _1487 = _1485;
    if (!_1409)
    {
        _1481 = _1473;
    }
    float _1489 = _1481;
    float _1491 = _1489;
    if (_1409)
    {
        float _1493 = _1439 * _1485;
        _1423 = _1493;
    }
    float _1495 = _1423;
    if (!_1409)
    {
        _1487 = _1401;
    }
    float _1497 = _1487;
    float _1499 = _1497;
    float _1501 = _1467;
    if (_1409)
    {
        float _1503 = _1467 + (-1.0);
        _1461 = _1503;
    }
    float _1505 = _1461;
    float _1507 = _1505;
    if (_1409)
    {
        float _1509 = _1397 * _1495;
        _1425 = _1509;
    }
    float _1511 = _1425;
    if (_1409)
    {
        float _1513 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1513;
    }
    float _1515 = _1441;
    if (!_1409)
    {
        _1507 = _1399;
    }
    float _1517 = _1507;
    float _1519 = _1517;
    if (_1409)
    {
        float _1521 = _1399 * _1495;
        _1519 = _1521;
    }
    float _1523 = _1519;
    if (_1409)
    {
        float _1525 = _1511 * _1511;
        _1499 = _1525;
    }
    float _1527 = _1499;
    if (_1409)
    {
        float _1529 = fma(_1473, _1467, _1515);
        _1491 = _1529;
    }
    float _1531 = _1491;
    if (!_1409)
    {
        _1501 = _1403;
    }
    float _1533 = _1501;
    float _1535 = _1533;
    if (_1409)
    {
        float _1537 = _1523 * _1523;
        _1535 = _1537;
    }
    float _1539 = _1535;
    float _1541 = fma(_1531, _1531, _1527);
    float _1543 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1545 = _1541 + _1539;
    float _1547 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1543);
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1559 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1547);
    float _1561 = rsqrt(_1545);
    float _1563 = -_1553;
    float _1565 = _1563 + 1.0;
    float _1567 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1569 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1555);
    float _1571 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1573 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1575 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1567);
    float _1577 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1569);
    float _1579 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1571);
    float _1581 = abs(_1565);
    float _1583 = log2(_1581);
    float _1585 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1575);
    float _1587 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1589 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1579);
    float _1591 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1593 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1595 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1597 = _1561 * _1511;
    float _1599 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1601 = _1561 * _1531;
    float _1603 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1595);
    float _1605 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1607 = _1561 * _1523;
    float _1609 = -_1591;
    float _1611 = fma(_1609, _1557, 1.0);
    float _1613 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1603);
    float _1615 = -_1605;
    float _1617 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1615);
    float _1619 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1621 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1623 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1613);
    float _1625 = -_1607;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1617);
    float _1629 = log2(_1611);
    float _1631 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1633 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1621);
    float _1635 = fma(_1627, -0.5, 0.5);
    float _1637 = fma(_1627, 0.5, 0.5);
    float _1639 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1631);
    float _1641 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1633);
    float _1643 = _1601 + 1.0;
    float _1645 = 1.0 / _1623;
    float _1647 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1639);
    float _1649 = fma(_1637, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1651 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1647);
    float _1653 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1641);
    float _1655 = fma(_1637, _1649, -0.212114393711090087890625);
    float _1657 = exp2(_1619);
    float _1659 = _1629 * 0.693147182464599609375;
    float _1661 = fma(_1637, _1655, 1.570728778839111328125);
    float _1663 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1665 = sqrt(_1635);
    float _1667 = _1651 * _1645;
    float _1669 = _1653 * _1645;
    float _1671 = fma(_1667, 0.5, 0.5);
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = -_1601;
    float _1677 = fma(_1657, _1643, _1675);
    float3 _4897 = float3(_1671, _1673, _1663);
    float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4897, float3(0.0), isnan(_4897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4897, float3(0.0), isnan(_4897)), level(0.0)).x;
    float _1681 = _1665 * 0.636619746685028076171875;
    float _1683 = fma(_1677, 0.5, 0.5);
    float _1685 = -_1661;
    float _1687 = fma(_1681, _1685, 1.0);
    float3 _4918 = float3(_1671, _1673, _1663);
    float4 _1690 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4918, float3(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4918, float3(0.0), isnan(_4918)), level(0.0)).xyzw;
    float _1692 = _1690.x;
    float _1694 = _1690.y;
    float _1696 = _1690.z;
    float _1698 = _1690.w;
    float2 _4935 = float2(_1687, _1683);
    float3 _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4935, float2(0.0), isnan(_4935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4935, float2(0.0), isnan(_4935)), level(0.0)).xyz;
    float _1704 = _1702.x;
    float _1706 = _1702.y;
    float _1708 = _1702.z;
    float _1710 = in.m_56.w;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1714 = _1712 != 0;
    float _1716 = _753 * (-0.15915493667125701904296875);
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1720 = _1718 != 0;
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1726 = _1724 != 0;
    float _1728 = _791 * (-0.15915493667125701904296875);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1732 = _1730 != 0;
    float _1734 = -_861;
    float _1736 = _1734 + 1.0;
    bool _1738 = _165 > 0.5;
    float _1740 = -_789;
    float _1742 = _1740 + 1.0;
    float _1744 = _1716 * 6.283185482025146484375;
    float _1746 = cos(_1744);
    out.m_60.x = _1241;
    out.m_60.y = _1255;
    out.m_60.z = _1247;
    float _1748 = -_757;
    float _1750 = _1748 + 1.0;
    float _1752 = -_859;
    float _1754 = _1752 + 1.0;
    float _1756 = 0.0;
    float _1758 = _1671;
    float _1760 = _1673;
    bool _1762 = _1738;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1766 = _1653;
    float _1768 = _1651;
    if (_1714)
    {
        float _1770 = in.m_56.z;
        _1756 = _1770;
    }
    float _1772 = _1756;
    float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1720)
    {
        float _1776 = _1710 * 3.1415927410125732421875;
        _1758 = _1776;
    }
    float _1778 = _1758;
    bool _1780 = _1710 > 0.5;
    float _1782 = 0.0;
    float _1784 = _1778;
    bool _1786 = _1780;
    if (_1720)
    {
        float _1788 = _1778 * 0.15915493667125701904296875;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (_1726)
    {
        float _1792 = _165 * 3.1415927410125732421875;
        _1784 = _1792;
    }
    float _1794 = _1784;
    float _1796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1798 = _1794;
    if (_1726)
    {
        float _1800 = _1794 * 0.15915493667125701904296875;
        _1760 = _1800;
    }
    float _1802 = _1760;
    if (_1732)
    {
        float _1804 = _1710 * 3.1415927410125732421875;
        _1798 = _1804;
    }
    float _1806 = _1798;
    float _1808 = 0.0;
    float _1810 = _1806;
    if (_1720)
    {
        float _1812 = _1790 * 6.283185482025146484375;
        float _1814 = sin(_1812);
        _1808 = _1814;
    }
    float _1816 = _1808;
    float _1818 = 0.0;
    if (_1732)
    {
        float _1820 = _1806 * 0.15915493667125701904296875;
        _1818 = _1820;
    }
    float _1822 = _1818;
    if (_1714)
    {
        float _1824 = _1772 * 3.1415927410125732421875;
        _1810 = _1824;
    }
    float _1826 = _1810;
    float _1828 = _1826;
    if (_1714)
    {
        float _1830 = _1826 * 0.15915493667125701904296875;
        _1828 = _1830;
    }
    float _1832 = _1828;
    float _1834 = _1802;
    if (_1726)
    {
        float _1836 = _1802 * 6.283185482025146484375;
        float _1838 = sin(_1836);
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = -_403;
    int _1844 = _1780 ? as_type<int>(_1842) : as_type<int>(_403);
    float _1846 = _1772;
    if (_1732)
    {
        float _1848 = _1822 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1816;
    if (_1720)
    {
        bool _1856 = _1816 > 0.5;
        _643 = _1856;
    }
    bool _1858 = _643;
    if (!_1720)
    {
        _1854 = _397;
    }
    float _1860 = _1854;
    float _1862 = _1860;
    if (_1720)
    {
        float _1864 = -_397;
        float _1866 = _1858 ? _1864 : _397;
        _1862 = _1866;
    }
    float _1868 = _1862;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1872 = _1870 != 0;
    float _1874 = _1832;
    bool _1876 = _1872;
    if (_1714)
    {
        float _1878 = _1832 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1874 = _1880;
    }
    float _1882 = _1874;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1886 = _1884 != 0;
    if (_1726)
    {
        bool _1888 = _1840 > 0.5;
        _1786 = _1888;
    }
    bool _1890 = _1786;
    float _1892 = -_397;
    int _1894 = _1738 ? as_type<int>(_1892) : as_type<int>(_397);
    float _1896 = _1716 * 6.283185482025146484375;
    float _1898 = sin(_1896);
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_1732)
    {
        bool _1902 = _1852 > 0.5;
        _1762 = _1902;
    }
    bool _1904 = _1762;
    bool _1906 = !_1872;
    float _1908 = _1906 ? _397 : as_type<float>(_1894);
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1726)
    {
        _1900 = _403;
    }
    float _1912 = _1900;
    float _1914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1916 = _1912;
    if (_1714)
    {
        bool _1918 = _1882 > 0.5;
        _1876 = _1918;
    }
    bool _1920 = _1876;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1726)
    {
        float _1926 = -_403;
        float _1928 = _1890 ? _1926 : _403;
        _1916 = _1928;
    }
    float _1930 = _1916;
    float _1932 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1934 = !_1886;
    float _1936 = _1934 ? _403 : as_type<float>(_1844);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1898 * _1930;
    float _1944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    if (!_1714)
    {
        _1764 = _397;
    }
    float _1946 = _1764;
    float _1948 = -_1936;
    float _1950 = _1948 + 0.5;
    float _1952 = _1946;
    if (_1714)
    {
        float _1954 = -_397;
        float _1956 = _1920 ? _1954 : _397;
        _1952 = _1956;
    }
    float _1958 = _1952;
    float _1960 = _1908 + 0.5;
    out.m_62.x = _1938;
    out.m_62.y = _1940;
    out.m_62.z = _1932;
    float _1962 = _1746 * _1930;
    float _1964 = -_1942;
    float _1966 = fma(_1746, _1868, _1964);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1970 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1972 = -_931;
    float _1974 = _1972 + 0.5;
    float _1976 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1978 = fma(_1898, _1868, _1962);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1982 = _979 + 0.5;
    if (!_1732)
    {
        _981 = _403;
    }
    float _1984 = _981;
    float _1986 = _1976 * _1722;
    float _1988 = _1984;
    if (_1732)
    {
        float _1990 = -_403;
        float _1992 = _1904 ? _1990 : _403;
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1998 = _1970 * _1914;
    float _2000 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = _1728 * 6.283185482025146484375;
    float _2004 = sin(_2002);
    float _2006 = _1996 * _1774;
    float _2008 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2010 = _1958 + 0.5;
    float _2012 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2014 = _1994 + (-0.5);
    float _2016 = _2000 * _1968;
    float _2018 = fma(_2008, _2010, _801);
    float _2020 = _1728 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    float _2024 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2026 = _1966 + 0.5;
    float _2028 = -_2012;
    float _2030 = -_777;
    float _2032 = fma(_2028, _2014, _2030);
    out.m_64.x = _1986;
    out.m_64.y = _2016;
    out.m_64.z = _2006;
    out.m_64.w = _1998;
    bool _2034 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2036 = isnan(_1393);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2042 = _2038 || _2040;
    float _2044 = fma(_2024, _2026, _763);
    float _2046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2048 = _543 * _2004;
    float _2050 = _543 * _2022;
    float _2052 = -_2048;
    float _2054 = fma(_441, _2022, _2052);
    float _2056 = _403 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2060 = fma(_441, _2004, _2050);
    float _2062 = -_1736;
    float _2064 = fma(_1966, _2062, _2044);
    float _2066 = fma(_2056, _2056, 1.0);
    float _2068 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2070 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2072 = _2054 + 0.5;
    float _2074 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2078 = -_785;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_2070, _2072, _867);
    float _2084 = fma(_1742, _1994, _2032);
    float _2086 = -_853;
    float _2088 = _2086 + 1.0;
    float _2090 = -_2080;
    float _2092 = fma(_2090, _1958, _2018);
    float _2094 = -_2056;
    float _2096 = _1221 * _2094;
    float _2098 = _2060 + (-0.5);
    float _2100 = rsqrt(_2066);
    float _2102 = -_2088;
    float _2104 = fma(_2054, _2102, _2082);
    float _2106 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_66.x = _2092;
    out.m_66.y = _2084;
    float _2108 = fma(_1241, _2068, _2096);
    float _2110 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2112 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2106);
    float _2114 = _1261 * _2056;
    float _2116 = exp2(_2074);
    float _2118 = _1978 + (-0.5);
    float _2120 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2112);
    float _2122 = fma(_1255, _2068, _2114);
    float _2124 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2126 = -_2110;
    float _2128 = -_781;
    float _2130 = fma(_2126, _2118, _2128);
    float _2132 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2134 = _2056 * _2100;
    float _2136 = _1211 * _2056;
    float _2138 = _2132 + _1623;
    float _2140 = -_2124;
    float _2142 = -_863;
    float _2144 = fma(_2140, _2098, _2142);
    float _2146 = -_2134;
    float _2148 = _1231 * _2146;
    float _2150 = -_2134;
    float _2152 = _1265 * _2150;
    float _2154 = fma(_1247, _2068, _2136);
    float _2156 = -_2134;
    float _2158 = _1253 * _2156;
    float _2160 = -_2116;
    float _2162 = _2160 + 1.0;
    float _2164 = -_1221;
    float _2166 = fma(_2164, _2100, _2148);
    float _2168 = fma(_1261, _2100, _2152);
    float _2170 = fma(_1211, _2100, _2158);
    float _2172 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2174 = _2138 * 0.5;
    float _2176 = _1231 + _2108;
    float _2178 = _1253 + _2154;
    float _2180 = -_2172;
    float _2182 = _2180 + 1.0;
    float _2184 = _1265 + _2122;
    float _2186 = fma(_1978, _1750, _2130);
    float _2188 = fma(_2060, _1754, _2144);
    out.m_68.x = _2166;
    out.m_68.y = _2168;
    out.m_68.z = _2170;
    out.m_70.x = _2064;
    out.m_70.y = _2186;
    out.m_72.x = _2104;
    out.m_72.y = _2188;
    out.m_74.z = _2174;
    out.m_74.w = _1623;
    out.m_76.x = _2176;
    out.m_76.y = _2184;
    out.m_76.z = _2178;
    out.gl_Position.x = _1651;
    out.gl_Position.y = _1653;
    out.gl_Position.z = _2132;
    out.gl_Position.w = _1623;
    if (!_2042)
    {
        _1766 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2190 = _1766;
    float _2192 = _2190;
    float _2194 = _2190;
    if (!_2042)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2196 = _1768;
    float _2198 = _2172 * _1679;
    float _2200 = _1698 * _2198;
    float _2202 = _1698 * _2182;
    float _2204 = _1708 * _2198;
    float _2206 = fma(_1704, _2200, _1692);
    float _2208 = fma(_1706, _2200, _1694);
    float _2210 = _2200;
    float _2212 = _2196;
    float _2214 = _2196;
    if (!_2042)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2216 = _2210;
    float _2218 = fma(_1698, _2204, _1696);
    out.m_78.x = _2206;
    out.m_78.y = _2208;
    out.m_78.z = _2218;
    out.m_78.w = _2202;
    bool _2220 = !_2042;
    float _2222 = _2216;
    float _2224 = _2216;
    if (!_2220)
    {
        bool _2226 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2228 = isnan(_1393);
        bool _2230 = _2226 || _2228;
        bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2234 = _2230 || _2232;
        if (!_2234)
        {
            float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2238 = _1393 + _2236;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2242 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2240;
            float _2244 = 1.0 / _2242;
            float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2254 = _2238 * _2244;
            float _2256 = precise::clamp(_2254, 0.0, 1.0);
            float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2260 = _2258 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2262 = fma(_2256, _2252, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2264 = fma(_2256, _2260, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2266 = fma(_2256, _2248, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2214 = _2266;
            _2194 = _2264;
            _2224 = _2262;
            _2268 = true;
        }
        else
        {
            bool _2270 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2272 = isnan(_1393);
            bool _2274 = _2270 || _2272;
            bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2278 = _2274 || _2276;
            if (!_2278)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2280 = _2192;
            _2194 = _2280;
            if (!_2278)
            {
                _2212 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2282 = _2212;
            _2214 = _2282;
            if (!_2278)
            {
                _2222 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2284 = _2222;
            bool _2286 = !_2278;
            _2224 = _2284;
            if (!_2286)
            {
                bool _2288 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2290 = isnan(_1393);
                bool _2292 = _2288 || _2290;
                bool _2294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2296 = _2292 || _2294;
                if (!_2296)
                {
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2300 = _1393 + _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2304 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2302;
                    float _2306 = 1.0 / _2304;
                    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2316 = _2300 * _2306;
                    float _2318 = precise::clamp(_2316, 0.0, 1.0);
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2324 = fma(_2318, _2314, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2326 = fma(_2318, _2322, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2328 = fma(_2318, _2310, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2214 = _2328;
                    _2194 = _2326;
                    _2224 = _2324;
                    _2268 = true;
                }
                else
                {
                    _2214 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2224 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2268 = false;
    float _2330 = _2214;
    float _2332 = _2194;
    float _2334 = _2224;
    float _2336 = _2330 * 0.586610972881317138671875;
    bool _2338 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_80.x = 0.0;
    float _2340 = fma(_2332, 0.298911988735198974609375, _2336);
    float _2342 = fma(_2334, 0.114477999508380889892578125, _2340);
    float _2344 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2346 = -_2342;
    float _2348 = _2346 + _2332;
    float _2350 = -_2342;
    float _2352 = _2350 + _2330;
    float _2354 = -_2342;
    float _2356 = _2354 + _2334;
    out.m_51.x = _2344;
    float _2358 = fma(_2348, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    float _2360 = fma(_2352, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    float _2362 = fma(_2356, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    out.m_82.x = _2358;
    out.m_82.y = _2360;
    out.m_82.z = _2362;
    if (!_2338)
    {
        return out;
    }
    float _2364 = -_1361;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2368 = -_1363;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2372 = -_1365;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2376 = _2366 * _2366;
    float _2378 = fma(_2370, _2370, _2376);
    float _2380 = fma(_2374, _2374, _2378);
    float _2382 = sqrt(_2380);
    float _2384 = rsqrt(_2380);
    float _2386 = -_2382;
    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2392 = precise::clamp(_2390, 0.0, 1.0);
    float _2394 = _2370 * _2384;
    float _2396 = _2366 * _2384;
    float _2398 = abs(_2392);
    float _2400 = log2(_2398);
    float _2402 = _2374 * _2384;
    float _2404 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2406 = _2184 * _2396;
    float _2408 = -_2396;
    float _2410 = -_2404;
    float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2410);
    float _2414 = fma(_2176, _2394, _2406);
    float _2416 = -_2402;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2412);
    float _2420 = fma(_2178, _2402, _2414);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2426 = _2418 + _2424;
    float _2428 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = exp2(_2428);
    float _2436 = _2434 * _2432;
    float _2438 = _2422 * _2436;
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2442 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2444 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2440;
    out.m_80.y = _2442;
    out.m_80.z = _2444;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = in.m_46.w;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = -_98;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _107;
    bool _111 = _103 >= 1;
    float _113 = 0.0;
    int _115 = as_type<int>(_98);
    float _117 = _107;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2513 = as_type<float>(_125);
        out.gl_Position.z = _2513;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _129 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_98);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = float(_103);
    bool _141 = _107 >= _139;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_51.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _127 = as_type<int>(_151);
    }
    int _153 = _127;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_153);
        out.gl_Position.z = _2569;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _163 = _161 != 0;
    float _165 = in.m_56.x;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = 0.0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _183 = _177;
    if (_163)
    {
        float _185 = in.m_56.y;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = 0.0;
    if (!_175)
    {
        float _191 = _177 * _177;
        float _193 = _191 * 0.5;
        _189 = _193;
    }
    float _195 = _189;
    float _197 = 0.0;
    float _199 = _195;
    if (_163)
    {
        float _201 = in.m_56.z;
        _197 = _201;
    }
    float _203 = _197;
    if (!_175)
    {
        float _205 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _205;
    }
    float _207 = _199;
    bool _209 = !_175;
    float _211 = _207;
    float _213 = _203;
    float _215 = _187;
    if (!_209)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _177 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _177);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = as_type<int>(_235);
        _211 = _245;
        _115 = as_type<int>(_233);
    }
    int _247 = _181;
    float _249 = _211;
    int _251 = _115;
    bool _253 = !_175;
    int _255 = _247;
    int _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _177 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = as_type<int>(_271);
        _183 = _277;
    }
    int _279 = _255;
    float _281 = _183;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    int _291 = _279;
    if (_163)
    {
        _257 = 0;
        _291 = 0;
    }
    int _293 = _257;
    int _295 = _291;
    int _297 = 0;
    int _299 = _293;
    int _301 = _295;
    if (_163)
    {
        _297 = as_type<int>(_165);
    }
    int _303 = _297;
    int _305 = 0;
    int _307 = _303;
    if (_163)
    {
        _305 = as_type<int>(_187);
    }
    int _309 = _305;
    int _311 = 0;
    int _313 = _309;
    if (_163)
    {
        _311 = as_type<int>(_203);
    }
    int _315 = _311;
    bool _317 = !_285;
    int _319 = _317 ? 0 : 1;
    bool _321 = !_289;
    int _323 = _321 ? 0 : 1;
    int _325 = _315;
    if (!_163)
    {
        float _327 = in.m_56.y;
        float _329 = _165 * 3.1415927410125732421875;
        float _331 = in.m_56.z;
        float _333 = _329 * 0.15915493667125701904296875;
        float _335 = _333 * 6.283185482025146484375;
        float _337 = sin(_335);
        float _339 = _327 * 3.1415927410125732421875;
        float _341 = _339 * 0.15915493667125701904296875;
        float _343 = _331 * 3.1415927410125732421875;
        float _345 = _343 * 0.15915493667125701904296875;
        float _347 = _341 * 6.283185482025146484375;
        float _349 = sin(_347);
        float _351 = _345 * 6.283185482025146484375;
        float _353 = sin(_351);
        _213 = _331;
        _215 = _327;
        _299 = 1;
        _313 = as_type<int>(_349);
        _307 = as_type<int>(_337);
        _325 = as_type<int>(_353);
        _301 = 2;
    }
    float _355 = _213;
    float _357 = _215;
    int _359 = _299;
    int _361 = _313;
    int _363 = _307;
    int _365 = _325;
    int _367 = _301;
    float _369 = _355 * 2.0;
    float _371 = _159 * _107;
    float _373 = in.m_58.w;
    float _375 = floor(_369);
    int _377 = as_type<int>(_155) & 1;
    bool _379 = _377 != 0;
    float _381 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _383 = as_type<int>(_155) & 2;
    bool _385 = _383 != 0;
    float _387 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _389 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _391 = _357 > 0.5;
    float _393 = exp2(_371);
    bool _395 = !_379;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _401 = !_385;
    float _403 = _401 ? (-0.5) : 0.5;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _415 = _413 != 0;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _419 = _417 != 0;
    float _421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _423 = -_397;
    int _425 = _391 ? as_type<int>(_423) : as_type<int>(_397);
    bool _427 = _359 != 1;
    float _429 = -_403;
    int _431 = _391 ? as_type<int>(_429) : as_type<int>(_403);
    bool _433 = _375 > 0.0;
    float _435 = -_393;
    float _437 = _435 + 1.0;
    bool _439 = !_415;
    float _441 = _439 ? _397 : as_type<float>(_425);
    bool _443 = !_427;
    float _445 = _443 ? as_type<float>(_361) : as_type<float>(_363);
    bool _447 = !_427;
    float _449 = _447 ? as_type<float>(_365) : as_type<float>(_361);
    bool _451 = _375 >= 0.0;
    bool _453 = isnan(_375);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = _399 * _421;
    bool _463 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _471 = _467 || _469;
    bool _473 = _367 != 2;
    float _475 = _165 * 2.0;
    int _477 = _459 ? 0 : 1;
    float _479 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _461);
    float _481 = _471 ? _437 : 0.0;
    float _483 = floor(_475);
    float _485 = in.m_46.x;
    float _487 = in.m_46.y;
    float _489 = in.m_46.z;
    int _491 = ~_477;
    int _493 = _491 + 1;
    int _495 = _493 + 1;
    int _497 = _495;
    if (!_433)
    {
        int _499 = ~_477;
        int _501 = _499 + 1;
        _497 = _501;
    }
    int _503 = _497;
    bool _505 = _355 > 0.5;
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _515 = -_403;
    int _517 = _505 ? as_type<int>(_515) : as_type<int>(_403);
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _521 = 0.0;
    if (_473)
    {
        _521 = _165;
    }
    float _523 = _521;
    float _525 = fma(as_type<float>(_363), (*spvDescriptorSet0.vp_c9)._m0[93].z, _513);
    float _527 = 0.0;
    float _529 = _523;
    if (_473)
    {
        _527 = _357;
    }
    float _531 = _527;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _535 = 0.0;
    float _537 = _531;
    if (_473)
    {
        _535 = _355;
    }
    float _539 = _535;
    bool _541 = !_419;
    float _543 = _541 ? _403 : as_type<float>(_517);
    float _545 = _539;
    if (!_473)
    {
        _529 = _355;
    }
    float _547 = _529;
    float _549 = fma(_281, _487, _387);
    float _551 = fma(_281, _489, _389);
    float _553 = fma(_281, _485, _381);
    if (!_473)
    {
        _537 = _165;
    }
    float _555 = _537;
    float _557 = as_type<float>(_363) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (!_473)
    {
        _545 = _357;
    }
    float _559 = _545;
    float _561 = as_type<float>(_361) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _565 = _563 != 0;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _573 = _571 != 0;
    float _575 = fma(_551, _373, _511);
    float _577 = _357 + _355;
    bool _579 = _483 > 0.0;
    float _581 = _165 + _355;
    float _583 = -_519;
    float _585 = fma(_557, 2.0, _583);
    float _587 = fma(_561, -2.0, _533);
    float _589 = _577 + (-1.0);
    bool _591 = !_565;
    int _593 = _591 ? 0 : 1;
    float _595 = fma(_553, _373, _507);
    float _597 = _581 + (-1.0);
    bool _599 = _483 >= 0.0;
    bool _601 = isnan(_483);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _611 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _613 = _357 * 2.0;
    int _615 = _607 ? 0 : 1;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _619 = fma(as_type<float>(_365), (*spvDescriptorSet0.vp_c9)._m0[94].z, _609);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _623 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _625 = _623 != 0;
    float _627 = _165 + _357;
    int _629 = ~_615;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = fma(_549, _373, _509);
    int _637 = _633;
    bool _639 = _505;
    int _641 = _411 ? (-1) : 0;
    bool _643 = _625;
    if (!_579)
    {
        int _645 = ~_615;
        int _647 = _645 + 1;
        _637 = _647;
    }
    int _649 = _637;
    float _651 = fma(as_type<float>(_361), (*spvDescriptorSet0.vp_c9)._m0[93].w, _621);
    float _653 = floor(_613);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _657 = _627 + (-1.0);
    float _659 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[98].z, _655);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _663 = _445 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _665 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _669 = -_661;
    float _671 = fma(_663, 2.0, _669);
    float _673 = _635 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _675 = _635 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _677 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[89].z, _667);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _681 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[4].x, _673);
    float _683 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    bool _685 = _653 >= 0.0;
    bool _687 = isnan(_653);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[98].w, _679);
    float _697 = _449 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _699 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[4].z, _681);
    float _701 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[6].z, _683);
    int _703 = _693 ? 0 : 1;
    float _705 = _555 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _707 = _653 > 0.0;
    float _709 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _711 = _701 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _717 = _709 + _715;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _721 = -_711;
    float _723 = _721 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _725 = fma(_697, -2.0, _713);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _729 = _547 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _731 = !_569;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_705, -2.0, _719);
    float _737 = abs(_717);
    float _739 = abs(_723);
    float _741 = precise::max(_737, _739);
    float _743 = -_727;
    float _745 = fma(_729, 2.0, _743);
    int _747 = ~_703;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[94].x, _619);
    int _755 = abs(_593);
    float _757 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[92].w, _651);
    int _759 = abs(_733);
    float _761 = -_107;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[91].x, _585);
    int _765 = _751;
    float _767 = _717;
    float _769 = _723;
    if (!_707)
    {
        int _771 = ~_703;
        int _773 = _771 + 1;
        _765 = _773;
    }
    int _775 = _765;
    float _777 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[96].y, _725);
    bool _779 = _741 >= 16.0;
    float _781 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[91].y, _587);
    float _783 = float(_649);
    float _785 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[97].z, _659);
    float _787 = float(_759);
    float _789 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[97].w, _695);
    float _791 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[89].x, _677);
    float _793 = floor(_479);
    float _795 = _787 * _783;
    float _797 = float(_503);
    float _799 = -_107;
    float _801 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[96].x, _671);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _805 = 1.0 + _803;
    float _807 = float(_755);
    float _809 = _795 * (-2.0);
    float _811 = 1.0 / _805;
    float _813 = _807 * _797;
    bool _815 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _817 = isnan(1.0);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _823 = _819 || _821;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _827 = !_573;
    int _829 = _827 ? 0 : 1;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_779)
    {
        float _833 = _717 * 0.0625;
        _767 = _833;
    }
    float _835 = _767;
    float _837 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _825);
    float _839 = -_793;
    float _841 = _479 + _839;
    float _843 = _479 * 6.283185482025146484375;
    float _845 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[88].w, _831);
    int _847 = abs(_829);
    float _849 = fma(_611, _809, _611);
    float _851 = _843 * 0.15915493667125701904296875;
    float _853 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[87].z, _837);
    float _855 = _813 * (-2.0);
    float _857 = _165 + (-0.5);
    float _859 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[87].w, _845);
    float _861 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[92].z, _525);
    float _863 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[86].y, _735);
    float _865 = -_107;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[86].x, _745);
    float _869 = float(_775);
    if (_823)
    {
        float _871 = _481 * _811;
        _117 = _871;
    }
    float _873 = _117;
    float _875 = float(_847);
    if (_779)
    {
        float _877 = _723 * 0.0625;
        _769 = _877;
    }
    float _879 = _769;
    float _881 = _851 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = abs(_835);
    bool _887 = _885 != 0.0;
    bool _889 = isnan(_885);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = fma(_665, _855, _665);
    float _899 = _857 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _901 = _875 * _869;
    bool _903 = _841 < 0.5;
    float _905 = float(_903);
    float _907 = fma(_897, _873, _899);
    float _909 = abs(_879);
    bool _911 = _909 == 0.0;
    bool _913 = !_895;
    bool _915 = _911 && _913;
    float _917 = -_841;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _921 = _901 * (-2.0);
    float _923 = -_905;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _927 = _907 * 0.15915493667125701904296875;
    bool _929 = !_407;
    float _931 = _929 ? _403 : as_type<float>(_431);
    float _933 = fma(_617, _921, _617);
    float _935 = abs(_879);
    bool _937 = _935 == 0.0;
    float _939 = _927 * 6.283185482025146484375;
    float _941 = sin(_939);
    float _943 = _355 + (-0.5);
    float _945 = _357 + (-0.5);
    float _947 = fma(_883, 0.5, 0.5);
    float _949 = -_397;
    int _951 = _505 ? as_type<int>(_949) : as_type<int>(_397);
    float _953 = _943 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _955 = as_type<int>(_947);
    int _957 = as_type<int>(_953);
    if (_915)
    {
        bool _959 = as_type<int>(_879) >= 0;
        _639 = _959;
    }
    bool _961 = _639;
    float _963 = _945 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _965 = -_947;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _969 = fma(_933, _873, _953);
    if (_915)
    {
        int _971 = _961 ? 0 : 1078530011;
        _955 = _971;
    }
    int _973 = _955;
    float _975 = fma(_849, _873, _963);
    bool _977 = !_411;
    float _979 = _977 ? _397 : as_type<float>(_951);
    float _981 = _979;
    if (_915)
    {
        int _983 = int(0x80000000) & as_type<int>(_835);
        int _985 = _973 | _983;
        _957 = _985;
    }
    int _987 = _957;
    bool _989 = !_895;
    bool _991 = _989 && _937;
    int _993 = _987;
    float _995 = as_type<float>(_987);
    if (!_991)
    {
        float _997 = abs(_835);
        bool _999 = _997 != as_type<float>(0x7f800000u /* inf */);
        bool _1001 = isnan(_997);
        bool _1003 = _999 || _1001;
        bool _1005 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1007 = _1003 || _1005;
        float _1009 = abs(_879);
        bool _1011 = _1009 == as_type<float>(0x7f800000u /* inf */);
        float _1013 = abs(_879);
        bool _1015 = _1013 == as_type<float>(0x7f800000u /* inf */);
        bool _1017 = !_1007;
        bool _1019 = _1015 && _1017;
        if (_1019)
        {
            bool _1021 = as_type<int>(_879) >= 0;
            _641 = _1021 ? (-1) : 0;
        }
        int _1023 = _641;
        if (_1019)
        {
            _993 = 1075235812;
        }
        int _1025 = _993;
        int _1027 = _1025;
        if (_1019)
        {
            int _1029 = ~_1023;
            int _1031 = (_1029 != 0) ? _1025 : 1061752795;
            _1027 = _1031;
        }
        int _1033 = _1027;
        float _1035 = as_type<float>(_1033);
        if (_1019)
        {
            int _1037 = int(0x80000000) & as_type<int>(_835);
            int _1039 = _1033 | _1037;
            _1035 = as_type<float>(_1039);
        }
        float _1041 = _1035;
        bool _1043 = !_1007;
        bool _1045 = _1043 && _1011;
        _995 = _1041;
        if (!_1045)
        {
            float _1047 = abs(_835);
            float _1049 = abs(_879);
            float _1051 = precise::max(_1047, _1049);
            float _1053 = abs(_835);
            float _1055 = abs(_879);
            float _1057 = _1053 + _1055;
            float _1059 = abs(_835);
            float _1061 = abs(_879);
            float _1063 = precise::min(_1059, _1061);
            float _1065 = 1.0 / _1051;
            float _1067 = abs(_835);
            float _1069 = abs(_879);
            bool _1071 = _1067 > _1069;
            bool _1073 = as_type<int>(_879) >= 0;
            bool _1075 = _1057 > as_type<float>(0x7f800000u /* inf */);
            bool _1077 = isnan(_1057);
            bool _1079 = _1075 || _1077;
            bool _1081 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1083 = _1079 || _1081;
            float _1085 = _1063 * _1065;
            int _1087 = as_type<int>(_835) & int(0x80000000);
            float _1089 = _1085 * _1085;
            float _1091 = _1089 + 11.33538818359375;
            float _1093 = fma(_1089, _1091, 28.84246826171875);
            float _1095 = fma(_1089, _1093, 19.6966705322265625);
            float _1097 = fma(_1089, -0.82336294651031494140625, -5.674867153167724609375);
            float _1099 = fma(_1089, _1097, -6.565555095672607421875);
            float _1101 = 1.0 / _1095;
            float _1103 = _1089 * _1099;
            float _1105 = _1085 * _1103;
            float _1107 = fma(_1105, _1101, _1085);
            float _1109 = _1107;
            _995 = _1057;
            if (_1071)
            {
                float _1111 = -_1107;
                float _1113 = _1111 + 1.57079637050628662109375;
                _1109 = _1113;
            }
            float _1115 = _1109;
            int _1117 = as_type<int>(_1115);
            if (!_1073)
            {
                float _1119 = -_1115;
                float _1121 = _1119 + 3.1415927410125732421875;
                _1117 = as_type<int>(_1121);
            }
            int _1123 = _1117;
            if (!_1083)
            {
                int _1125 = _1087 | _1123;
                _995 = as_type<float>(_1125);
            }
        }
    }
    float _1127 = _995;
    float _1129 = in.m_58.x;
    float _1131 = in.m_58.y;
    bool _1133 = !_625;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = _927 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    int _1141 = abs(_319);
    float _1143 = -_1127;
    float _1145 = _975 + _1143;
    int _1147 = abs(_1135);
    float _1149 = _969 * 0.15915493667125701904296875;
    int _1151 = abs(_323);
    float _1153 = _1145 * 0.15915493667125701904296875;
    float _1155 = _1149 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = float(_1141);
    float _1161 = _635 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1163 = float(_1147);
    int _1165 = as_type<int>(_155) & 2;
    bool _1167 = _1165 != 0;
    float _1169 = abs(_919);
    float _1171 = _1159 * _1169;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _1175 = _1167 ? 0.0 : 1.0;
    float _1177 = fma(_1163, _967, _1171);
    float _1179 = float(_1151);
    float _1181 = _1153 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1161);
    float _1187 = fma(_1175, _1173, 1.0);
    float _1189 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1191 = abs(_925);
    float _1193 = fma(_1179, _1191, _1177);
    float _1195 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1197 = _397 * _1187;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _403);
    float _1201 = _1153 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1193 * _1189;
    float _1207 = _1193 * _1195;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1197);
    float _1211 = _941 * _1157;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1217 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1219 = _1149 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1213 * _1209;
    float _1225 = _1215 * _1199;
    float _1227 = _1139 * _1183;
    float _1229 = _941 * _1183;
    float _1231 = _1183 * _1157;
    float _1233 = _1211 * _1225;
    float _1235 = fma(_575, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1185);
    float _1237 = _941 * _1203;
    float _1239 = _1139 * _1203;
    float _1241 = _1203 * _1157;
    float _1243 = _1235 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = -_1227;
    float _1247 = fma(_1221, _1237, _1245);
    float _1249 = -_1225;
    float _1251 = _1221 * _1249;
    float _1253 = fma(_1221, _1229, _1239);
    float _1255 = fma(_1221, _1239, _1229);
    float _1257 = fma(_1247, _1223, _1233);
    float _1259 = fma(_1241, _1223, _1251);
    float _1261 = _1139 * _1157;
    float _1263 = -_1237;
    float _1265 = fma(_1221, _1227, _1263);
    float _1267 = fma(_1253, _1217, _1257);
    float _1269 = fma(_1231, _1217, _1259);
    float _1271 = _711 + _1267;
    float _1273 = _709 + _1269;
    float _1275 = _1261 * _1225;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1279 = _1271 + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1283 = _1273 + _1281;
    float _1285 = fma(_1255, _1223, _1275);
    float _1287 = _1279 * _1279;
    float _1289 = fma(_1265, _1217, _1285);
    float _1291 = fma(_1283, _1283, _1287);
    float _1293 = _1243 + _1289;
    float _1295 = sqrt(_1291);
    bool _1297 = _1295 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1223;
    float _1301 = _1217;
    float _1303 = _1271;
    float _1305 = _1139;
    float _1307 = _1295;
    float _1309 = _1289;
    if (!_1297)
    {
        _1299 = _1271;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (!_1297)
    {
        _1301 = _1273;
    }
    float _1315 = _1301;
    float _1317 = _1315;
    if (!_1297)
    {
        _1303 = _1293;
    }
    float _1319 = _1303;
    bool _1321 = !_1297;
    float _1323 = _1319;
    if (!_1321)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1329 = _1295 + _1327;
        float _1331 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1333 = rsqrt(_1291);
        float _1335 = _1329 * _1325;
        float _1337 = _1335 * 0.15915493667125701904296875;
        float _1339 = _1337 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = _1337 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = _1341 + (-1.0);
        float _1349 = fma(_1345, _1331, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1351 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = _1333 * _1349;
        float _1355 = fma(_1293, _1341, _1351);
        float _1357 = fma(_1283, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1359 = fma(_1279, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1323 = _1355;
        _1317 = _1357;
        _1313 = _1359;
        _1305 = _1333;
        _1307 = _1337;
        _1309 = _1347;
    }
    float _1361 = _1323;
    float _1363 = _1317;
    float _1365 = _1313;
    float _1367 = _1305;
    float _1369 = _1307;
    float _1371 = _1309;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1375 = _1361 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1363 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1383 = _1365 + _1381;
    float _1385 = _1375 * _1375;
    float _1387 = fma(_1379, _1379, _1385);
    float _1389 = fma(_1383, _1383, _1387);
    float _1391 = rsqrt(_1389);
    float _1393 = sqrt(_1389);
    float _1395 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1397 = _1379 * _1395;
    float _1399 = _1383 * _1395;
    float _1401 = _1397 * _1397;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 + _1403;
    float _1407 = sqrt(_1405);
    bool _1409 = _1407 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = _1407 + _1411;
    float _1415 = _1367;
    float _1417 = _1413;
    float _1419 = _1369;
    float _1421 = _1375;
    float _1423 = _1395;
    float _1425 = _1397;
    if (_1409)
    {
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1415 = _1427;
    }
    float _1429 = _1415;
    float _1431 = _1429;
    if (_1409)
    {
        float _1433 = _1413 * _1429;
        _1417 = _1433;
    }
    float _1435 = _1417;
    if (_1409)
    {
        float _1437 = rsqrt(_1405);
        _1431 = _1437;
    }
    float _1439 = _1431;
    float _1441 = _1439;
    if (_1409)
    {
        float _1443 = _1435 * 0.15915493667125701904296875;
        _1419 = _1443;
    }
    float _1445 = _1419;
    float _1447 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1449 = _1383;
    if (_1409)
    {
        float _1451 = _1445 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1449 = _1453;
    }
    float _1455 = _1449;
    float _1457 = precise::max(0.0, _1447);
    float _1459 = _1371;
    float _1461 = _1457;
    if (_1409)
    {
        float _1463 = _1445 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        _1459 = _1465;
    }
    float _1467 = _1459;
    float _1469 = -_1395;
    float _1471 = -_1457;
    float _1473 = fma(_1375, _1469, _1471);
    if (_1409)
    {
        float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1475;
    }
    float _1477 = _1421;
    float _1479 = _1455;
    float _1481 = _1477;
    if (_1409)
    {
        float _1483 = fma(_1455, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1479 = _1483;
    }
    float _1485 = _1479;
    float _1487 = _1485;
    if (!_1409)
    {
        _1481 = _1473;
    }
    float _1489 = _1481;
    float _1491 = _1489;
    if (_1409)
    {
        float _1493 = _1439 * _1485;
        _1423 = _1493;
    }
    float _1495 = _1423;
    if (!_1409)
    {
        _1487 = _1401;
    }
    float _1497 = _1487;
    float _1499 = _1497;
    float _1501 = _1467;
    if (_1409)
    {
        float _1503 = _1467 + (-1.0);
        _1461 = _1503;
    }
    float _1505 = _1461;
    float _1507 = _1505;
    if (_1409)
    {
        float _1509 = _1397 * _1495;
        _1425 = _1509;
    }
    float _1511 = _1425;
    if (_1409)
    {
        float _1513 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1513;
    }
    float _1515 = _1441;
    if (!_1409)
    {
        _1507 = _1399;
    }
    float _1517 = _1507;
    float _1519 = _1517;
    if (_1409)
    {
        float _1521 = _1399 * _1495;
        _1519 = _1521;
    }
    float _1523 = _1519;
    if (_1409)
    {
        float _1525 = _1511 * _1511;
        _1499 = _1525;
    }
    float _1527 = _1499;
    if (_1409)
    {
        float _1529 = fma(_1473, _1467, _1515);
        _1491 = _1529;
    }
    float _1531 = _1491;
    if (!_1409)
    {
        _1501 = _1403;
    }
    float _1533 = _1501;
    float _1535 = _1533;
    if (_1409)
    {
        float _1537 = _1523 * _1523;
        _1535 = _1537;
    }
    float _1539 = _1535;
    float _1541 = fma(_1531, _1531, _1527);
    float _1543 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1545 = _1541 + _1539;
    float _1547 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1543);
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1559 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1547);
    float _1561 = rsqrt(_1545);
    float _1563 = -_1553;
    float _1565 = _1563 + 1.0;
    float _1567 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1569 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1555);
    float _1571 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1573 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1575 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1567);
    float _1577 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1569);
    float _1579 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1571);
    float _1581 = abs(_1565);
    float _1583 = log2(_1581);
    float _1585 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1575);
    float _1587 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1589 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1579);
    float _1591 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1593 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1595 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1597 = _1561 * _1511;
    float _1599 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1601 = _1561 * _1531;
    float _1603 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1595);
    float _1605 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1607 = _1561 * _1523;
    float _1609 = -_1591;
    float _1611 = fma(_1609, _1557, 1.0);
    float _1613 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1603);
    float _1615 = -_1605;
    float _1617 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1615);
    float _1619 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1621 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1623 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1613);
    float _1625 = -_1607;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1617);
    float _1629 = log2(_1611);
    float _1631 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1633 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1621);
    float _1635 = fma(_1627, -0.5, 0.5);
    float _1637 = fma(_1627, 0.5, 0.5);
    float _1639 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1631);
    float _1641 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1633);
    float _1643 = _1601 + 1.0;
    float _1645 = 1.0 / _1623;
    float _1647 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1639);
    float _1649 = fma(_1637, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1651 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1647);
    float _1653 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1641);
    float _1655 = fma(_1637, _1649, -0.212114393711090087890625);
    float _1657 = exp2(_1619);
    float _1659 = _1629 * 0.693147182464599609375;
    float _1661 = fma(_1637, _1655, 1.570728778839111328125);
    float _1663 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1665 = sqrt(_1635);
    float _1667 = _1651 * _1645;
    float _1669 = _1653 * _1645;
    float _1671 = fma(_1667, 0.5, 0.5);
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = -_1601;
    float _1677 = fma(_1657, _1643, _1675);
    float3 _4897 = float3(_1671, _1673, _1663);
    float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4897, float3(0.0), isnan(_4897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4897, float3(0.0), isnan(_4897)), level(0.0)).x;
    float _1681 = _1665 * 0.636619746685028076171875;
    float _1683 = fma(_1677, 0.5, 0.5);
    float _1685 = -_1661;
    float _1687 = fma(_1681, _1685, 1.0);
    float3 _4918 = float3(_1671, _1673, _1663);
    float4 _1690 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4918, float3(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4918, float3(0.0), isnan(_4918)), level(0.0)).xyzw;
    float _1692 = _1690.x;
    float _1694 = _1690.y;
    float _1696 = _1690.z;
    float _1698 = _1690.w;
    float2 _4935 = float2(_1687, _1683);
    float3 _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4935, float2(0.0), isnan(_4935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4935, float2(0.0), isnan(_4935)), level(0.0)).xyz;
    float _1704 = _1702.x;
    float _1706 = _1702.y;
    float _1708 = _1702.z;
    float _1710 = in.m_56.w;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1714 = _1712 != 0;
    float _1716 = _753 * (-0.15915493667125701904296875);
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1720 = _1718 != 0;
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1726 = _1724 != 0;
    float _1728 = _791 * (-0.15915493667125701904296875);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1732 = _1730 != 0;
    float _1734 = -_861;
    float _1736 = _1734 + 1.0;
    bool _1738 = _165 > 0.5;
    float _1740 = -_789;
    float _1742 = _1740 + 1.0;
    float _1744 = _1716 * 6.283185482025146484375;
    float _1746 = cos(_1744);
    out.m_60.x = _1241;
    out.m_60.y = _1255;
    out.m_60.z = _1247;
    float _1748 = -_757;
    float _1750 = _1748 + 1.0;
    float _1752 = -_859;
    float _1754 = _1752 + 1.0;
    float _1756 = 0.0;
    float _1758 = _1671;
    float _1760 = _1673;
    bool _1762 = _1738;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1766 = _1653;
    float _1768 = _1651;
    if (_1714)
    {
        float _1770 = in.m_56.z;
        _1756 = _1770;
    }
    float _1772 = _1756;
    float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1720)
    {
        float _1776 = _1710 * 3.1415927410125732421875;
        _1758 = _1776;
    }
    float _1778 = _1758;
    bool _1780 = _1710 > 0.5;
    float _1782 = 0.0;
    float _1784 = _1778;
    bool _1786 = _1780;
    if (_1720)
    {
        float _1788 = _1778 * 0.15915493667125701904296875;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (_1726)
    {
        float _1792 = _165 * 3.1415927410125732421875;
        _1784 = _1792;
    }
    float _1794 = _1784;
    float _1796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1798 = _1794;
    if (_1726)
    {
        float _1800 = _1794 * 0.15915493667125701904296875;
        _1760 = _1800;
    }
    float _1802 = _1760;
    if (_1732)
    {
        float _1804 = _1710 * 3.1415927410125732421875;
        _1798 = _1804;
    }
    float _1806 = _1798;
    float _1808 = 0.0;
    float _1810 = _1806;
    if (_1720)
    {
        float _1812 = _1790 * 6.283185482025146484375;
        float _1814 = sin(_1812);
        _1808 = _1814;
    }
    float _1816 = _1808;
    float _1818 = 0.0;
    if (_1732)
    {
        float _1820 = _1806 * 0.15915493667125701904296875;
        _1818 = _1820;
    }
    float _1822 = _1818;
    if (_1714)
    {
        float _1824 = _1772 * 3.1415927410125732421875;
        _1810 = _1824;
    }
    float _1826 = _1810;
    float _1828 = _1826;
    if (_1714)
    {
        float _1830 = _1826 * 0.15915493667125701904296875;
        _1828 = _1830;
    }
    float _1832 = _1828;
    float _1834 = _1802;
    if (_1726)
    {
        float _1836 = _1802 * 6.283185482025146484375;
        float _1838 = sin(_1836);
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = -_403;
    int _1844 = _1780 ? as_type<int>(_1842) : as_type<int>(_403);
    float _1846 = _1772;
    if (_1732)
    {
        float _1848 = _1822 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1816;
    if (_1720)
    {
        bool _1856 = _1816 > 0.5;
        _643 = _1856;
    }
    bool _1858 = _643;
    if (!_1720)
    {
        _1854 = _397;
    }
    float _1860 = _1854;
    float _1862 = _1860;
    if (_1720)
    {
        float _1864 = -_397;
        float _1866 = _1858 ? _1864 : _397;
        _1862 = _1866;
    }
    float _1868 = _1862;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1872 = _1870 != 0;
    float _1874 = _1832;
    bool _1876 = _1872;
    if (_1714)
    {
        float _1878 = _1832 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1874 = _1880;
    }
    float _1882 = _1874;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1886 = _1884 != 0;
    if (_1726)
    {
        bool _1888 = _1840 > 0.5;
        _1786 = _1888;
    }
    bool _1890 = _1786;
    float _1892 = -_397;
    int _1894 = _1738 ? as_type<int>(_1892) : as_type<int>(_397);
    float _1896 = _1716 * 6.283185482025146484375;
    float _1898 = sin(_1896);
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_1732)
    {
        bool _1902 = _1852 > 0.5;
        _1762 = _1902;
    }
    bool _1904 = _1762;
    bool _1906 = !_1872;
    float _1908 = _1906 ? _397 : as_type<float>(_1894);
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (!_1726)
    {
        _1900 = _403;
    }
    float _1912 = _1900;
    float _1914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1916 = _1912;
    if (_1714)
    {
        bool _1918 = _1882 > 0.5;
        _1876 = _1918;
    }
    bool _1920 = _1876;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1726)
    {
        float _1926 = -_403;
        float _1928 = _1890 ? _1926 : _403;
        _1916 = _1928;
    }
    float _1930 = _1916;
    float _1932 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1934 = !_1886;
    float _1936 = _1934 ? _403 : as_type<float>(_1844);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1898 * _1930;
    float _1944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    if (!_1714)
    {
        _1764 = _397;
    }
    float _1946 = _1764;
    float _1948 = -_1936;
    float _1950 = _1948 + 0.5;
    float _1952 = _1946;
    if (_1714)
    {
        float _1954 = -_397;
        float _1956 = _1920 ? _1954 : _397;
        _1952 = _1956;
    }
    float _1958 = _1952;
    float _1960 = _1908 + 0.5;
    out.m_62.x = _1938;
    out.m_62.y = _1940;
    out.m_62.z = _1932;
    float _1962 = _1746 * _1930;
    float _1964 = -_1942;
    float _1966 = fma(_1746, _1868, _1964);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1970 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1972 = -_931;
    float _1974 = _1972 + 0.5;
    float _1976 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1978 = fma(_1898, _1868, _1962);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1982 = _979 + 0.5;
    if (!_1732)
    {
        _981 = _403;
    }
    float _1984 = _981;
    float _1986 = _1976 * _1722;
    float _1988 = _1984;
    if (_1732)
    {
        float _1990 = -_403;
        float _1992 = _1904 ? _1990 : _403;
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1998 = _1970 * _1914;
    float _2000 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = _1728 * 6.283185482025146484375;
    float _2004 = sin(_2002);
    float _2006 = _1996 * _1774;
    float _2008 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2010 = _1958 + 0.5;
    float _2012 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2014 = _1994 + (-0.5);
    float _2016 = _2000 * _1968;
    float _2018 = fma(_2008, _2010, _801);
    float _2020 = _1728 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    float _2024 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2026 = _1966 + 0.5;
    float _2028 = -_2012;
    float _2030 = -_777;
    float _2032 = fma(_2028, _2014, _2030);
    out.m_64.x = _1986;
    out.m_64.y = _2016;
    out.m_64.z = _2006;
    out.m_64.w = _1998;
    bool _2034 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2036 = isnan(_1393);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2042 = _2038 || _2040;
    float _2044 = fma(_2024, _2026, _763);
    float _2046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2048 = _543 * _2004;
    float _2050 = _543 * _2022;
    float _2052 = -_2048;
    float _2054 = fma(_441, _2022, _2052);
    float _2056 = _403 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2060 = fma(_441, _2004, _2050);
    float _2062 = -_1736;
    float _2064 = fma(_1966, _2062, _2044);
    float _2066 = fma(_2056, _2056, 1.0);
    float _2068 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2070 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2072 = _2054 + 0.5;
    float _2074 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2078 = -_785;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_2070, _2072, _867);
    float _2084 = fma(_1742, _1994, _2032);
    float _2086 = -_853;
    float _2088 = _2086 + 1.0;
    float _2090 = -_2080;
    float _2092 = fma(_2090, _1958, _2018);
    float _2094 = -_2056;
    float _2096 = _1221 * _2094;
    float _2098 = _2060 + (-0.5);
    float _2100 = rsqrt(_2066);
    float _2102 = -_2088;
    float _2104 = fma(_2054, _2102, _2082);
    float _2106 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_66.x = _2092;
    out.m_66.y = _2084;
    float _2108 = fma(_1241, _2068, _2096);
    float _2110 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2112 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2106);
    float _2114 = _1261 * _2056;
    float _2116 = exp2(_2074);
    float _2118 = _1978 + (-0.5);
    float _2120 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2112);
    float _2122 = fma(_1255, _2068, _2114);
    float _2124 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2126 = -_2110;
    float _2128 = -_781;
    float _2130 = fma(_2126, _2118, _2128);
    float _2132 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2134 = _2056 * _2100;
    float _2136 = _1211 * _2056;
    float _2138 = _2132 + _1623;
    float _2140 = -_2124;
    float _2142 = -_863;
    float _2144 = fma(_2140, _2098, _2142);
    float _2146 = -_2134;
    float _2148 = _1231 * _2146;
    float _2150 = -_2134;
    float _2152 = _1265 * _2150;
    float _2154 = fma(_1247, _2068, _2136);
    float _2156 = -_2134;
    float _2158 = _1253 * _2156;
    float _2160 = -_2116;
    float _2162 = _2160 + 1.0;
    float _2164 = -_1221;
    float _2166 = fma(_2164, _2100, _2148);
    float _2168 = fma(_1261, _2100, _2152);
    float _2170 = fma(_1211, _2100, _2158);
    float _2172 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2174 = _2138 * 0.5;
    float _2176 = _1231 + _2108;
    float _2178 = _1253 + _2154;
    float _2180 = -_2172;
    float _2182 = _2180 + 1.0;
    float _2184 = _1265 + _2122;
    float _2186 = fma(_1978, _1750, _2130);
    float _2188 = fma(_2060, _1754, _2144);
    out.m_68.x = _2166;
    out.m_68.y = _2168;
    out.m_68.z = _2170;
    out.m_70.x = _2064;
    out.m_70.y = _2186;
    out.m_72.x = _2104;
    out.m_72.y = _2188;
    out.m_74.z = _2174;
    out.m_74.w = _1623;
    out.m_76.x = _2176;
    out.m_76.y = _2184;
    out.m_76.z = _2178;
    out.gl_Position.x = _1651;
    out.gl_Position.y = _1653;
    out.gl_Position.z = _2132;
    out.gl_Position.w = _1623;
    if (!_2042)
    {
        _1766 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2190 = _1766;
    float _2192 = _2190;
    float _2194 = _2190;
    if (!_2042)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2196 = _1768;
    float _2198 = _2172 * _1679;
    float _2200 = _1698 * _2198;
    float _2202 = _1698 * _2182;
    float _2204 = _1708 * _2198;
    float _2206 = fma(_1704, _2200, _1692);
    float _2208 = fma(_1706, _2200, _1694);
    float _2210 = _2200;
    float _2212 = _2196;
    float _2214 = _2196;
    if (!_2042)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2216 = _2210;
    float _2218 = fma(_1698, _2204, _1696);
    out.m_78.x = _2206;
    out.m_78.y = _2208;
    out.m_78.z = _2218;
    out.m_78.w = _2202;
    bool _2220 = !_2042;
    float _2222 = _2216;
    float _2224 = _2216;
    if (!_2220)
    {
        bool _2226 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2228 = isnan(_1393);
        bool _2230 = _2226 || _2228;
        bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2234 = _2230 || _2232;
        if (!_2234)
        {
            float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2238 = _1393 + _2236;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2242 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2240;
            float _2244 = 1.0 / _2242;
            float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2254 = _2238 * _2244;
            float _2256 = precise::clamp(_2254, 0.0, 1.0);
            float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2260 = _2258 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2262 = fma(_2256, _2252, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2264 = fma(_2256, _2260, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2266 = fma(_2256, _2248, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2214 = _2266;
            _2194 = _2264;
            _2224 = _2262;
            _2268 = true;
        }
        else
        {
            bool _2270 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2272 = isnan(_1393);
            bool _2274 = _2270 || _2272;
            bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2278 = _2274 || _2276;
            if (!_2278)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2280 = _2192;
            _2194 = _2280;
            if (!_2278)
            {
                _2212 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2282 = _2212;
            _2214 = _2282;
            if (!_2278)
            {
                _2222 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2284 = _2222;
            bool _2286 = !_2278;
            _2224 = _2284;
            if (!_2286)
            {
                bool _2288 = _1393 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2290 = isnan(_1393);
                bool _2292 = _2288 || _2290;
                bool _2294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2296 = _2292 || _2294;
                if (!_2296)
                {
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2300 = _1393 + _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2304 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2302;
                    float _2306 = 1.0 / _2304;
                    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2316 = _2300 * _2306;
                    float _2318 = precise::clamp(_2316, 0.0, 1.0);
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2324 = fma(_2318, _2314, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2326 = fma(_2318, _2322, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2328 = fma(_2318, _2310, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2214 = _2328;
                    _2194 = _2326;
                    _2224 = _2324;
                    _2268 = true;
                }
                else
                {
                    _2214 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2224 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2268 = false;
    float _2330 = _2214;
    float _2332 = _2194;
    float _2334 = _2224;
    float _2336 = _2330 * 0.586610972881317138671875;
    bool _2338 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_80.x = 0.0;
    float _2340 = fma(_2332, 0.298911988735198974609375, _2336);
    float _2342 = fma(_2334, 0.114477999508380889892578125, _2340);
    float _2344 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2346 = -_2342;
    float _2348 = _2346 + _2332;
    float _2350 = -_2342;
    float _2352 = _2350 + _2330;
    float _2354 = -_2342;
    float _2356 = _2354 + _2334;
    out.m_51.x = _2344;
    float _2358 = fma(_2348, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    float _2360 = fma(_2352, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    float _2362 = fma(_2356, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2342);
    out.m_82.x = _2358;
    out.m_82.y = _2360;
    out.m_82.z = _2362;
    if (!_2338)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2364 = -_1361;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2368 = -_1363;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2372 = -_1365;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2376 = _2366 * _2366;
    float _2378 = fma(_2370, _2370, _2376);
    float _2380 = fma(_2374, _2374, _2378);
    float _2382 = sqrt(_2380);
    float _2384 = rsqrt(_2380);
    float _2386 = -_2382;
    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2392 = precise::clamp(_2390, 0.0, 1.0);
    float _2394 = _2370 * _2384;
    float _2396 = _2366 * _2384;
    float _2398 = abs(_2392);
    float _2400 = log2(_2398);
    float _2402 = _2374 * _2384;
    float _2404 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2406 = _2184 * _2396;
    float _2408 = -_2396;
    float _2410 = -_2404;
    float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2410);
    float _2414 = fma(_2176, _2394, _2406);
    float _2416 = -_2402;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2412);
    float _2420 = fma(_2178, _2402, _2414);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2426 = _2418 + _2424;
    float _2428 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = exp2(_2428);
    float _2436 = _2434 * _2432;
    float _2438 = _2422 * _2436;
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2442 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2444 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2440;
    out.m_80.y = _2442;
    out.m_80.z = _2444;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

