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
    texture2d<float> vp_t_tcb_2C [[id(6)]];
    sampler vp_t_tcb_2CSmplr [[id(7)]];
    texture2d<float> vp_t_tcb_28 [[id(8)]];
    sampler vp_t_tcb_28Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    sampler vp_t_tcb_2CSmplr_w [[id(12)]];
    sampler vp_t_tcb_28Smplr_w [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(0)]];
    float4 m_41 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
    float4 m_54 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_52 [[attribute(9)]];
    float4 m_62 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _867 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_41.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_44.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1153 = as_type<float>(_111);
        out.gl_Position.z = _1153;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_46.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_125)
    {
        float _131 = float(_95);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _129 >= _133;
    bool _137 = !_125;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_44.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1222 = as_type<float>(_147);
        out.gl_Position.z = _1222;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_48.x;
    float _151 = in.m_48.y;
    float _153 = in.m_48.z;
    float _155 = in.m_50.x;
    float _157 = in.m_50.y;
    float _159 = in.m_50.z;
    float _161 = in.m_41.x;
    float _163 = in.m_41.y;
    float _165 = in.m_41.z;
    float _167 = _149 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _169 = _151 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _171 = _153 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _155);
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _177 = _171 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = _173 * _175;
    float _183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _157);
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _159);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _191 = _183 * _185;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _187 * _177;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    float _199 = _191 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _203 = _191 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _205 = _197 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[10].x, _199);
    float _209 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[8].x, _203);
    float _213 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _215 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[10].z, _207);
    float _217 = _209 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _219 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[8].z, _211);
    float _221 = _191 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _223 = _205 + _215;
    float _225 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _213);
    float _227 = _217 + _219;
    float _229 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[9].x, _221);
    float _231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _233 = _223 + _231;
    float _235 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _225);
    float _237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _239 = _227 + _237;
    float _241 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[9].z, _229);
    float _243 = _233 * _233;
    float _245 = _235 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _247 = fma(_239, _239, _243);
    float _249 = fma(_205, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = _245 + _241;
    float _253 = sqrt(_247);
    float _255 = fma(_217, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _257 = floor(_249);
    bool _259 = _253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _263 = _253 + _261;
    float _265 = floor(_255);
    float _267 = 0.0;
    float _269 = _251;
    float _271 = _247;
    float _273 = _263;
    float _275 = _227;
    float _277 = _223;
    if (_259)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _267 = _279;
    }
    float _281 = _267;
    if (_259)
    {
        float _283 = _251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _269 = _283;
    }
    float _285 = _269;
    float _287 = -_265;
    float _289 = _255 + _287;
    if (_259)
    {
        float _291 = rsqrt(_247);
        _271 = _291;
    }
    float _293 = _271;
    if (_259)
    {
        float _295 = _263 * _281;
        _273 = _295;
    }
    float _297 = _273;
    float _299 = _297;
    if (_259)
    {
        float _301 = _297 * 0.15915493667125701904296875;
        _299 = _301;
    }
    float _303 = _299;
    float _305 = _303;
    if (_259)
    {
        float _307 = _303 * 6.283185482025146484375;
        float _309 = sin(_307);
        _305 = _309;
    }
    float _311 = _305;
    float _313 = _311;
    if (_259)
    {
        float _315 = fma(_311, _285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _313 = _315;
    }
    float _317 = _313;
    float _319 = _317;
    if (_259)
    {
        float _321 = _293 * _317;
        _319 = _321;
    }
    float _323 = _319;
    if (_259)
    {
        float _325 = fma(_239, _323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _275 = _325;
    }
    float _327 = _275;
    if (_259)
    {
        float _329 = fma(_233, _323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _277 = _329;
    }
    float _331 = _277;
    float _333 = -_257;
    float _335 = _249 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _339 = _327 + _337;
    float _341 = fma(_327, 6.2500002968590706586837768554688e-05, 0.5);
    float _343 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _345 = _331 + _343;
    float _347 = fma(_331, 6.2500002968590706586837768554688e-05, 0.5);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _351 = fma(_345, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _1589 = float2(_341, _347);
    float _353 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_1589, float2(0.0), isnan(_1589)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_1589, float2(0.0), isnan(_1589)), level(0.0)).y;
    float2 _1599 = float2(_349, _351);
    float _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_1599, float2(0.0), isnan(_1599)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_1599, float2(0.0), isnan(_1599)), level(0.0)).x;
    float2 _1607 = float2(_289, _335);
    float _357 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_1607, float2(0.0), isnan(_1607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_1607, float2(0.0), isnan(_1607)), level(0.0)).x;
    float _359 = _245 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _361 = in.m_52.y;
    float _363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _365 = fma(_217, (*spvDescriptorSet0.vp_c8)._m0[11].x, _359);
    float _367 = _245 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _369 = in.m_52.x;
    float _371 = fma(_205, (*spvDescriptorSet0.vp_c8)._m0[11].z, _365);
    float _373 = fma(_217, (*spvDescriptorSet0.vp_c8)._m0[10].x, _367);
    float _375 = in.m_54.x;
    float _377 = in.m_54.y;
    float _379 = _371 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _381 = fma(_205, (*spvDescriptorSet0.vp_c8)._m0[10].z, _373);
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _385 = _383 != 0;
    float _387 = 1.0 / _379;
    float _389 = _381 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _393 = _391 != 0;
    float _395 = _363 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _397 = _389 + _379;
    float _399 = _335;
    float _401 = _361;
    if (_385)
    {
        float _403 = in.m_54.x;
        _399 = _403;
    }
    float _405 = _399;
    float _407 = 0.0;
    if (_385)
    {
        _407 = _369;
    }
    float _409 = _407;
    float _411 = _397 * _387;
    float _413 = _411 * 0.5;
    float _415 = -_361;
    float _417 = _415 + 1.0;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _421 = _377 > 0.5;
    float _423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _425 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[30].w, _423);
    float _427 = _375 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _429 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[78].z, _419);
    float _431 = _409;
    if (_393)
    {
        float _433 = _421 ? _417 : _361;
        _401 = _433;
    }
    float _435 = _401;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = 1.0 / _425;
    float _443 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _445 = -_437;
    float _447 = fma(_427, 2.0, _445);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _451 = _157 != 0.0;
    bool _453 = isnan(_157);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_443, -2.0, _439);
    float _463 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].w, _449);
    float _465 = in.m_56.x;
    float _467 = in.m_56.y;
    float _469 = in.m_56.z;
    bool _471 = _155 == 0.0;
    bool _473 = !_459;
    bool _475 = _471 && _473;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _479 = _405 > 0.5;
    bool _481 = _479 && _385;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _485 = _159 == 0.0;
    bool _487 = _485 && _475;
    float _489 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _493 = _441 * _491;
    float _495 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = abs(_493);
    float _499 = log2(_497);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _505 = _489;
    if (_481)
    {
        float _507 = -_409;
        float _509 = _507 + 1.0;
        _431 = _509;
    }
    float _511 = _431;
    float _513 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _519 = fma(_395, _435, -0.5);
    float _521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _461);
    float _523 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _463);
    float _525 = -_129;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _447);
    float _529 = _469;
    float _531 = _465;
    float _533 = _467;
    if (!_487)
    {
        float _535 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _469);
        _529 = _535;
    }
    float _537 = _529;
    if (!_487)
    {
        float _539 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _465);
        _531 = _539;
    }
    float _541 = _531;
    float _543 = _499 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_487)
    {
        float _547 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _467);
        _533 = _547;
    }
    float _549 = _533;
    float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _553 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _489;
    out.m_58.y = _495;
    out.m_58.z = _513;
    out.m_58.w = _545;
    float _557 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _549 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _561 = -_521;
    float _563 = fma(_523, _519, _561);
    bool _565 = _493 <= 8000.0;
    bool _567 = isnan(_493);
    bool _569 = _565 || _567;
    bool _571 = isnan(8000.0);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = exp2(_543);
    out.m_60.x = _553;
    out.m_60.y = _555;
    out.m_60.z = _557;
    float _579 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[8].x, _559);
    float _581 = in.m_62.z;
    float _583 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _429);
    if (!_385)
    {
        _505 = _369;
    }
    float _585 = _505;
    float _587 = _551 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _589 = _585;
    if (_385)
    {
        _589 = _511;
    }
    float _591 = _589;
    float _593 = _549 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _595 = _549 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _597 = fma(_577, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = fma(_587, _591, -0.5);
    float _603 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[9].x, _593);
    float _605 = fma(_599, -2.0, 3.0);
    float _607 = _599 * _599;
    float _609 = fma(_583, _601, _527);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[10].x, _595);
    float _613 = in.m_64.x;
    float _615 = _607 * _605;
    float _617 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[8].z, _579);
    float _619 = _563 + 0.5;
    float _621 = in.m_62.x;
    float _623 = -_615;
    float _625 = _623 + 1.0;
    float _627 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[9].z, _603);
    float _629 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[10].z, _611);
    float _631 = in.m_62.y;
    float _633 = fma(_625, (*spvDescriptorSet0.vp_c15)._m0[654].w, _615);
    float _635 = _609 + 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _327 + _637;
    float _641 = in.m_62.w;
    float _643 = _575 * _633;
    out.m_66.x = _635;
    out.m_66.y = _619;
    out.m_68.z = _581;
    out.m_70.x = _617;
    out.m_70.y = _627;
    out.m_70.z = _629;
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _647 = _331 + _645;
    out.m_68.x = _621;
    out.m_68.y = _631;
    out.m_68.w = _641;
    float _649 = fma(_353, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _651 = fma(_355, 100.0, _649);
    float _653 = _643 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _655 = -_357;
    float _657 = _655 + 1.0;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _651 + _659;
    float _663 = _651 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _665 = _657 * _653;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    float _669 = _661 * _661;
    float _671 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[0].x, _663);
    float _673 = -_667;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _677 = _651 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _679 = fma(_639, _639, _669);
    float _681 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[0].z, _671);
    float _683 = _675 * _613;
    float _685 = _651 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _687 = fma(_647, _647, _679);
    float _689 = _651 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _691 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[2].x, _677);
    float _693 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[3].x, _685);
    float _695 = _681 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _697 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[1].x, _689);
    float _699 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[2].z, _691);
    float _701 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[3].z, _693);
    float _703 = sqrt(_687);
    float _705 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[1].z, _697);
    float _707 = _699 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _709 = _701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _711 = _683 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _715 = _713 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _717 = _713 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _719 = _713 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _723 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[4].x, _715);
    float _725 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[5].x, _717);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[6].x, _719);
    float _729 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[7].x, _721);
    float _731 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[4].z, _723);
    float _733 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[5].z, _725);
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[6].z, _727);
    float _737 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[7].z, _729);
    float _739 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _731);
    float _741 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _733);
    float _743 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _735);
    float _745 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _737);
    out.m_72.x = _711;
    bool _747 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _749 = isnan(_703);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _755 = _751 || _753;
    out.gl_Position.x = _739;
    out.gl_Position.y = _741;
    out.gl_Position.z = _743;
    out.gl_Position.w = _745;
    float _757 = _707;
    float _759 = _735;
    float _761 = _713;
    float _763 = _733;
    float _765 = _695;
    float _767 = _731;
    if (!_755)
    {
        _757 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _769 = _757;
    float _771 = _769;
    float _773 = _769;
    if (!_755)
    {
        _759 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _775 = _759;
    float _777 = _775;
    float _779 = _775;
    if (!_755)
    {
        _761 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _781 = _761;
    float _783 = _781;
    float _785 = _781;
    if (!_755)
    {
        _763 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _787 = _763;
    float _789 = _787;
    float _791 = _787;
    if (!_755)
    {
        _765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _793 = _765;
    float _795 = _793;
    float _797 = _793;
    if (!_755)
    {
        _767 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _799 = _767;
    bool _801 = !_755;
    float _803 = _799;
    float _805 = _799;
    if (!_801)
    {
        bool _807 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _809 = isnan(_703);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _815 = _811 || _813;
        if (!_815)
        {
            float _817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _819 = _703 + _817;
            float _821 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _823 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _821;
            float _825 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _827 = _825 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _829 = 1.0 / _823;
            float _831 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _833 = _831 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _835 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _837 = _835 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _839 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _841 = _839 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _843 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _845 = _843 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _847 = _819 * _829;
            float _849 = precise::clamp(_847, 0.0, 1.0);
            float _851 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _853 = _851 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _855 = fma(_849, _827, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _857 = fma(_849, _853, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _859 = fma(_849, _833, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _861 = fma(_849, _837, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _863 = fma(_849, _841, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _865 = fma(_849, _845, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _779 = _855;
            _797 = _863;
            _773 = _859;
            _791 = _861;
            _785 = _857;
            _805 = _865;
            _867 = true;
        }
        else
        {
            bool _869 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _871 = isnan(_703);
            bool _873 = _869 || _871;
            bool _875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _877 = _873 || _875;
            if (!_877)
            {
                _771 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _879 = _771;
            _773 = _879;
            if (!_877)
            {
                _777 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _881 = _777;
            _779 = _881;
            if (!_877)
            {
                _783 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _883 = _783;
            _785 = _883;
            if (!_877)
            {
                _789 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _885 = _789;
            _791 = _885;
            if (!_877)
            {
                _795 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _887 = _795;
            _797 = _887;
            if (!_877)
            {
                _803 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _889 = _803;
            bool _891 = !_877;
            _805 = _889;
            if (!_891)
            {
                bool _893 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _895 = isnan(_703);
                bool _897 = _893 || _895;
                bool _899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _901 = _897 || _899;
                if (!_901)
                {
                    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _905 = _703 + _903;
                    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _909 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _907;
                    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _913 = _911 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _915 = 1.0 / _909;
                    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _919 = _917 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _923 = _921 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _927 = _925 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _931 = _929 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _933 = _905 * _915;
                    float _935 = precise::clamp(_933, 0.0, 1.0);
                    float _937 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _939 = _937 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _941 = fma(_935, _913, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _943 = fma(_935, _939, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _945 = fma(_935, _919, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _947 = fma(_935, _923, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _949 = fma(_935, _927, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _951 = fma(_935, _931, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _779 = _941;
                    _797 = _949;
                    _773 = _945;
                    _791 = _947;
                    _785 = _943;
                    _805 = _951;
                    _867 = true;
                }
                else
                {
                    _779 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _797 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _773 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _791 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _785 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _805 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _867 = false;
    float _953 = _779;
    float _955 = _797;
    float _957 = _773;
    float _959 = _791;
    float _961 = _785;
    float _963 = _805;
    float _965 = fma(_627, -0.5, 0.5);
    float _967 = precise::clamp(_965, 0.0, 1.0);
    float _969 = -_953;
    float _971 = _969 + _955;
    float _973 = -_957;
    float _975 = _973 + _959;
    float _977 = -_961;
    float _979 = _977 + _963;
    bool _981 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _983 = fma(_967, _971, _953);
    float _985 = fma(_967, _975, _957);
    float _987 = fma(_967, _979, _961);
    float _989 = _983 * 0.586610972881317138671875;
    out.m_74.x = 0.0;
    float _991 = fma(_985, 0.298911988735198974609375, _989);
    out.m_44.x = 1.0;
    float _993 = fma(_987, 0.114477999508380889892578125, _991);
    float _995 = -_993;
    float _997 = _985 + _995;
    float _999 = -_993;
    float _1001 = _983 + _999;
    float _1003 = -_993;
    float _1005 = _987 + _1003;
    float _1007 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    float _1013 = fma(_1005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    out.m_72.w = _1007;
    out.m_76.x = _1009;
    out.m_76.y = _1011;
    out.m_76.z = _1013;
    if (!_981)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1015 = -_651;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1019 = -_327;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1023 = -_331;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1027 = _1017 * _1017;
    float _1029 = fma(_1021, _1021, _1027);
    float _1031 = fma(_1025, _1025, _1029);
    float _1033 = sqrt(_1031);
    float _1035 = rsqrt(_1031);
    float _1037 = -_1033;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1041 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1043 = precise::clamp(_1041, 0.0, 1.0);
    float _1045 = _1021 * _1035;
    float _1047 = _1017 * _1035;
    float _1049 = abs(_1043);
    float _1051 = log2(_1049);
    float _1053 = _1025 * _1035;
    float _1055 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1057 = _627 * _1047;
    float _1059 = -_1047;
    float _1061 = -_1055;
    float _1063 = fma(_1059, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1061);
    float _1065 = fma(_617, _1045, _1057);
    float _1067 = -_1053;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1063);
    float _1071 = fma(_629, _1053, _1065);
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1077 = _1069 + _1075;
    float _1079 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1081 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = exp2(_1079);
    float _1087 = _1085 * _1083;
    float _1089 = _1073 * _1087;
    float _1091 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1093 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_74.x = _1091;
    out.m_74.y = _1093;
    out.m_74.z = _1095;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _867 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_41.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_44.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1153 = as_type<float>(_111);
        out.gl_Position.z = _1153;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_46.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_125)
    {
        float _131 = float(_95);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _129 >= _133;
    bool _137 = !_125;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_44.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1222 = as_type<float>(_147);
        out.gl_Position.z = _1222;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_48.x;
    float _151 = in.m_48.y;
    float _153 = in.m_48.z;
    float _155 = in.m_50.x;
    float _157 = in.m_50.y;
    float _159 = in.m_50.z;
    float _161 = in.m_41.x;
    float _163 = in.m_41.y;
    float _165 = in.m_41.z;
    float _167 = _149 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _169 = _151 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _171 = _153 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _155);
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _177 = _171 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = _173 * _175;
    float _183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _157);
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _159);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _191 = _183 * _185;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _187 * _177;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    float _199 = _191 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _203 = _191 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _205 = _197 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[10].x, _199);
    float _209 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[8].x, _203);
    float _213 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _215 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[10].z, _207);
    float _217 = _209 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _219 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[8].z, _211);
    float _221 = _191 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _223 = _205 + _215;
    float _225 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _213);
    float _227 = _217 + _219;
    float _229 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[9].x, _221);
    float _231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _233 = _223 + _231;
    float _235 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _225);
    float _237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _239 = _227 + _237;
    float _241 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[9].z, _229);
    float _243 = _233 * _233;
    float _245 = _235 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _247 = fma(_239, _239, _243);
    float _249 = fma(_205, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = _245 + _241;
    float _253 = sqrt(_247);
    float _255 = fma(_217, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _257 = floor(_249);
    bool _259 = _253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _263 = _253 + _261;
    float _265 = floor(_255);
    float _267 = 0.0;
    float _269 = _251;
    float _271 = _247;
    float _273 = _263;
    float _275 = _227;
    float _277 = _223;
    if (_259)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _267 = _279;
    }
    float _281 = _267;
    if (_259)
    {
        float _283 = _251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _269 = _283;
    }
    float _285 = _269;
    float _287 = -_265;
    float _289 = _255 + _287;
    if (_259)
    {
        float _291 = rsqrt(_247);
        _271 = _291;
    }
    float _293 = _271;
    if (_259)
    {
        float _295 = _263 * _281;
        _273 = _295;
    }
    float _297 = _273;
    float _299 = _297;
    if (_259)
    {
        float _301 = _297 * 0.15915493667125701904296875;
        _299 = _301;
    }
    float _303 = _299;
    float _305 = _303;
    if (_259)
    {
        float _307 = _303 * 6.283185482025146484375;
        float _309 = sin(_307);
        _305 = _309;
    }
    float _311 = _305;
    float _313 = _311;
    if (_259)
    {
        float _315 = fma(_311, _285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _313 = _315;
    }
    float _317 = _313;
    float _319 = _317;
    if (_259)
    {
        float _321 = _293 * _317;
        _319 = _321;
    }
    float _323 = _319;
    if (_259)
    {
        float _325 = fma(_239, _323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _275 = _325;
    }
    float _327 = _275;
    if (_259)
    {
        float _329 = fma(_233, _323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _277 = _329;
    }
    float _331 = _277;
    float _333 = -_257;
    float _335 = _249 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _339 = _327 + _337;
    float _341 = fma(_327, 6.2500002968590706586837768554688e-05, 0.5);
    float _343 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _345 = _331 + _343;
    float _347 = fma(_331, 6.2500002968590706586837768554688e-05, 0.5);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _351 = fma(_345, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _1589 = float2(_341, _347);
    float _353 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_1589, float2(0.0), isnan(_1589)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_1589, float2(0.0), isnan(_1589)), level(0.0)).y;
    float2 _1599 = float2(_349, _351);
    float _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_1599, float2(0.0), isnan(_1599)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_1599, float2(0.0), isnan(_1599)), level(0.0)).x;
    float2 _1607 = float2(_289, _335);
    float _357 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_1607, float2(0.0), isnan(_1607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_1607, float2(0.0), isnan(_1607)), level(0.0)).x;
    float _359 = _245 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _361 = in.m_52.y;
    float _363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _365 = fma(_217, (*spvDescriptorSet0.vp_c8)._m0[11].x, _359);
    float _367 = _245 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _369 = in.m_52.x;
    float _371 = fma(_205, (*spvDescriptorSet0.vp_c8)._m0[11].z, _365);
    float _373 = fma(_217, (*spvDescriptorSet0.vp_c8)._m0[10].x, _367);
    float _375 = in.m_54.x;
    float _377 = in.m_54.y;
    float _379 = _371 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _381 = fma(_205, (*spvDescriptorSet0.vp_c8)._m0[10].z, _373);
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _385 = _383 != 0;
    float _387 = 1.0 / _379;
    float _389 = _381 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _393 = _391 != 0;
    float _395 = _363 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _397 = _389 + _379;
    float _399 = _335;
    float _401 = _361;
    if (_385)
    {
        float _403 = in.m_54.x;
        _399 = _403;
    }
    float _405 = _399;
    float _407 = 0.0;
    if (_385)
    {
        _407 = _369;
    }
    float _409 = _407;
    float _411 = _397 * _387;
    float _413 = _411 * 0.5;
    float _415 = -_361;
    float _417 = _415 + 1.0;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _421 = _377 > 0.5;
    float _423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _425 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[30].w, _423);
    float _427 = _375 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _429 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[78].z, _419);
    float _431 = _409;
    if (_393)
    {
        float _433 = _421 ? _417 : _361;
        _401 = _433;
    }
    float _435 = _401;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = 1.0 / _425;
    float _443 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _445 = -_437;
    float _447 = fma(_427, 2.0, _445);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _451 = _157 != 0.0;
    bool _453 = isnan(_157);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_443, -2.0, _439);
    float _463 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].w, _449);
    float _465 = in.m_56.x;
    float _467 = in.m_56.y;
    float _469 = in.m_56.z;
    bool _471 = _155 == 0.0;
    bool _473 = !_459;
    bool _475 = _471 && _473;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _479 = _405 > 0.5;
    bool _481 = _479 && _385;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _485 = _159 == 0.0;
    bool _487 = _485 && _475;
    float _489 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _493 = _441 * _491;
    float _495 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = abs(_493);
    float _499 = log2(_497);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _505 = _489;
    if (_481)
    {
        float _507 = -_409;
        float _509 = _507 + 1.0;
        _431 = _509;
    }
    float _511 = _431;
    float _513 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _519 = fma(_395, _435, -0.5);
    float _521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _461);
    float _523 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _463);
    float _525 = -_129;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _447);
    float _529 = _469;
    float _531 = _465;
    float _533 = _467;
    if (!_487)
    {
        float _535 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _469);
        _529 = _535;
    }
    float _537 = _529;
    if (!_487)
    {
        float _539 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _465);
        _531 = _539;
    }
    float _541 = _531;
    float _543 = _499 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_487)
    {
        float _547 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _467);
        _533 = _547;
    }
    float _549 = _533;
    float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _553 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _489;
    out.m_58.y = _495;
    out.m_58.z = _513;
    out.m_58.w = _545;
    float _557 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _549 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _561 = -_521;
    float _563 = fma(_523, _519, _561);
    bool _565 = _493 <= 8000.0;
    bool _567 = isnan(_493);
    bool _569 = _565 || _567;
    bool _571 = isnan(8000.0);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = exp2(_543);
    out.m_60.x = _553;
    out.m_60.y = _555;
    out.m_60.z = _557;
    float _579 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[8].x, _559);
    float _581 = in.m_62.z;
    float _583 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _429);
    if (!_385)
    {
        _505 = _369;
    }
    float _585 = _505;
    float _587 = _551 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _589 = _585;
    if (_385)
    {
        _589 = _511;
    }
    float _591 = _589;
    float _593 = _549 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _595 = _549 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _597 = fma(_577, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = fma(_587, _591, -0.5);
    float _603 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[9].x, _593);
    float _605 = fma(_599, -2.0, 3.0);
    float _607 = _599 * _599;
    float _609 = fma(_583, _601, _527);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[10].x, _595);
    float _613 = in.m_64.x;
    float _615 = _607 * _605;
    float _617 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[8].z, _579);
    float _619 = _563 + 0.5;
    float _621 = in.m_62.x;
    float _623 = -_615;
    float _625 = _623 + 1.0;
    float _627 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[9].z, _603);
    float _629 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[10].z, _611);
    float _631 = in.m_62.y;
    float _633 = fma(_625, (*spvDescriptorSet0.vp_c15)._m0[654].w, _615);
    float _635 = _609 + 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _327 + _637;
    float _641 = in.m_62.w;
    float _643 = _575 * _633;
    out.m_66.x = _635;
    out.m_66.y = _619;
    out.m_68.z = _581;
    out.m_70.x = _617;
    out.m_70.y = _627;
    out.m_70.z = _629;
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _647 = _331 + _645;
    out.m_68.x = _621;
    out.m_68.y = _631;
    out.m_68.w = _641;
    float _649 = fma(_353, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _651 = fma(_355, 100.0, _649);
    float _653 = _643 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _655 = -_357;
    float _657 = _655 + 1.0;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _651 + _659;
    float _663 = _651 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _665 = _657 * _653;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    float _669 = _661 * _661;
    float _671 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[0].x, _663);
    float _673 = -_667;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _677 = _651 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _679 = fma(_639, _639, _669);
    float _681 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[0].z, _671);
    float _683 = _675 * _613;
    float _685 = _651 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _687 = fma(_647, _647, _679);
    float _689 = _651 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _691 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[2].x, _677);
    float _693 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[3].x, _685);
    float _695 = _681 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _697 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[1].x, _689);
    float _699 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[2].z, _691);
    float _701 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[3].z, _693);
    float _703 = sqrt(_687);
    float _705 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[1].z, _697);
    float _707 = _699 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _709 = _701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _711 = _683 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _715 = _713 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _717 = _713 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _719 = _713 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _723 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[4].x, _715);
    float _725 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[5].x, _717);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[6].x, _719);
    float _729 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[7].x, _721);
    float _731 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[4].z, _723);
    float _733 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[5].z, _725);
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[6].z, _727);
    float _737 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[7].z, _729);
    float _739 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _731);
    float _741 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _733);
    float _743 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _735);
    float _745 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _737);
    out.m_72.x = _711;
    bool _747 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _749 = isnan(_703);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _755 = _751 || _753;
    out.gl_Position.x = _739;
    out.gl_Position.y = _741;
    out.gl_Position.z = _743;
    out.gl_Position.w = _745;
    float _757 = _707;
    float _759 = _735;
    float _761 = _713;
    float _763 = _733;
    float _765 = _695;
    float _767 = _731;
    if (!_755)
    {
        _757 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _769 = _757;
    float _771 = _769;
    float _773 = _769;
    if (!_755)
    {
        _759 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _775 = _759;
    float _777 = _775;
    float _779 = _775;
    if (!_755)
    {
        _761 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _781 = _761;
    float _783 = _781;
    float _785 = _781;
    if (!_755)
    {
        _763 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _787 = _763;
    float _789 = _787;
    float _791 = _787;
    if (!_755)
    {
        _765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _793 = _765;
    float _795 = _793;
    float _797 = _793;
    if (!_755)
    {
        _767 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _799 = _767;
    bool _801 = !_755;
    float _803 = _799;
    float _805 = _799;
    if (!_801)
    {
        bool _807 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _809 = isnan(_703);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _815 = _811 || _813;
        if (!_815)
        {
            float _817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _819 = _703 + _817;
            float _821 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _823 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _821;
            float _825 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _827 = _825 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _829 = 1.0 / _823;
            float _831 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _833 = _831 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _835 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _837 = _835 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _839 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _841 = _839 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _843 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _845 = _843 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _847 = _819 * _829;
            float _849 = precise::clamp(_847, 0.0, 1.0);
            float _851 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _853 = _851 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _855 = fma(_849, _827, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _857 = fma(_849, _853, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _859 = fma(_849, _833, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _861 = fma(_849, _837, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _863 = fma(_849, _841, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _865 = fma(_849, _845, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _779 = _855;
            _797 = _863;
            _773 = _859;
            _791 = _861;
            _785 = _857;
            _805 = _865;
            _867 = true;
        }
        else
        {
            bool _869 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _871 = isnan(_703);
            bool _873 = _869 || _871;
            bool _875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _877 = _873 || _875;
            if (!_877)
            {
                _771 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _879 = _771;
            _773 = _879;
            if (!_877)
            {
                _777 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _881 = _777;
            _779 = _881;
            if (!_877)
            {
                _783 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _883 = _783;
            _785 = _883;
            if (!_877)
            {
                _789 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _885 = _789;
            _791 = _885;
            if (!_877)
            {
                _795 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _887 = _795;
            _797 = _887;
            if (!_877)
            {
                _803 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _889 = _803;
            bool _891 = !_877;
            _805 = _889;
            if (!_891)
            {
                bool _893 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _895 = isnan(_703);
                bool _897 = _893 || _895;
                bool _899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _901 = _897 || _899;
                if (!_901)
                {
                    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _905 = _703 + _903;
                    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _909 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _907;
                    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _913 = _911 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _915 = 1.0 / _909;
                    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _919 = _917 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _923 = _921 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _927 = _925 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _931 = _929 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _933 = _905 * _915;
                    float _935 = precise::clamp(_933, 0.0, 1.0);
                    float _937 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _939 = _937 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _941 = fma(_935, _913, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _943 = fma(_935, _939, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _945 = fma(_935, _919, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _947 = fma(_935, _923, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _949 = fma(_935, _927, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _951 = fma(_935, _931, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _779 = _941;
                    _797 = _949;
                    _773 = _945;
                    _791 = _947;
                    _785 = _943;
                    _805 = _951;
                    _867 = true;
                }
                else
                {
                    _779 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _797 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _773 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _791 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _785 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _805 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _867 = false;
    float _953 = _779;
    float _955 = _797;
    float _957 = _773;
    float _959 = _791;
    float _961 = _785;
    float _963 = _805;
    float _965 = fma(_627, -0.5, 0.5);
    float _967 = precise::clamp(_965, 0.0, 1.0);
    float _969 = -_953;
    float _971 = _969 + _955;
    float _973 = -_957;
    float _975 = _973 + _959;
    float _977 = -_961;
    float _979 = _977 + _963;
    bool _981 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _983 = fma(_967, _971, _953);
    float _985 = fma(_967, _975, _957);
    float _987 = fma(_967, _979, _961);
    float _989 = _983 * 0.586610972881317138671875;
    out.m_74.x = 0.0;
    float _991 = fma(_985, 0.298911988735198974609375, _989);
    out.m_44.x = 1.0;
    float _993 = fma(_987, 0.114477999508380889892578125, _991);
    float _995 = -_993;
    float _997 = _985 + _995;
    float _999 = -_993;
    float _1001 = _983 + _999;
    float _1003 = -_993;
    float _1005 = _987 + _1003;
    float _1007 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    float _1013 = fma(_1005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    out.m_72.w = _1007;
    out.m_76.x = _1009;
    out.m_76.y = _1011;
    out.m_76.z = _1013;
    if (!_981)
    {
        return out;
    }
    float _1015 = -_651;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1019 = -_327;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1023 = -_331;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1027 = _1017 * _1017;
    float _1029 = fma(_1021, _1021, _1027);
    float _1031 = fma(_1025, _1025, _1029);
    float _1033 = sqrt(_1031);
    float _1035 = rsqrt(_1031);
    float _1037 = -_1033;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1041 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1043 = precise::clamp(_1041, 0.0, 1.0);
    float _1045 = _1021 * _1035;
    float _1047 = _1017 * _1035;
    float _1049 = abs(_1043);
    float _1051 = log2(_1049);
    float _1053 = _1025 * _1035;
    float _1055 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1057 = _627 * _1047;
    float _1059 = -_1047;
    float _1061 = -_1055;
    float _1063 = fma(_1059, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1061);
    float _1065 = fma(_617, _1045, _1057);
    float _1067 = -_1053;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1063);
    float _1071 = fma(_629, _1053, _1065);
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1077 = _1069 + _1075;
    float _1079 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1081 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = exp2(_1079);
    float _1087 = _1085 * _1083;
    float _1089 = _1073 * _1087;
    float _1091 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1093 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_74.x = _1091;
    out.m_74.y = _1093;
    out.m_74.z = _1095;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _867 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_41.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_44.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1153 = as_type<float>(_111);
        out.gl_Position.z = _1153;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_46.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_125)
    {
        float _131 = float(_95);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _129 >= _133;
    bool _137 = !_125;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_44.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1222 = as_type<float>(_147);
        out.gl_Position.z = _1222;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_48.x;
    float _151 = in.m_48.y;
    float _153 = in.m_48.z;
    float _155 = in.m_50.x;
    float _157 = in.m_50.y;
    float _159 = in.m_50.z;
    float _161 = in.m_41.x;
    float _163 = in.m_41.y;
    float _165 = in.m_41.z;
    float _167 = _149 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _169 = _151 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _171 = _153 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _155);
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _177 = _171 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _179 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = _173 * _175;
    float _183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _157);
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _159);
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _191 = _183 * _185;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _187 * _177;
    float _197 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    float _199 = _191 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _203 = _191 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _205 = _197 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[10].x, _199);
    float _209 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[8].x, _203);
    float _213 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _215 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[10].z, _207);
    float _217 = _209 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _219 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[8].z, _211);
    float _221 = _191 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _223 = _205 + _215;
    float _225 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _213);
    float _227 = _217 + _219;
    float _229 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[9].x, _221);
    float _231 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _233 = _223 + _231;
    float _235 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _225);
    float _237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _239 = _227 + _237;
    float _241 = fma(_195, (*spvDescriptorSet0.vp_c10)._m0[9].z, _229);
    float _243 = _233 * _233;
    float _245 = _235 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _247 = fma(_239, _239, _243);
    float _249 = fma(_205, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = _245 + _241;
    float _253 = sqrt(_247);
    float _255 = fma(_217, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _257 = floor(_249);
    bool _259 = _253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _263 = _253 + _261;
    float _265 = floor(_255);
    float _267 = 0.0;
    float _269 = _251;
    float _271 = _247;
    float _273 = _263;
    float _275 = _227;
    float _277 = _223;
    if (_259)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _267 = _279;
    }
    float _281 = _267;
    if (_259)
    {
        float _283 = _251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _269 = _283;
    }
    float _285 = _269;
    float _287 = -_265;
    float _289 = _255 + _287;
    if (_259)
    {
        float _291 = rsqrt(_247);
        _271 = _291;
    }
    float _293 = _271;
    if (_259)
    {
        float _295 = _263 * _281;
        _273 = _295;
    }
    float _297 = _273;
    float _299 = _297;
    if (_259)
    {
        float _301 = _297 * 0.15915493667125701904296875;
        _299 = _301;
    }
    float _303 = _299;
    float _305 = _303;
    if (_259)
    {
        float _307 = _303 * 6.283185482025146484375;
        float _309 = sin(_307);
        _305 = _309;
    }
    float _311 = _305;
    float _313 = _311;
    if (_259)
    {
        float _315 = fma(_311, _285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _313 = _315;
    }
    float _317 = _313;
    float _319 = _317;
    if (_259)
    {
        float _321 = _293 * _317;
        _319 = _321;
    }
    float _323 = _319;
    if (_259)
    {
        float _325 = fma(_239, _323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _275 = _325;
    }
    float _327 = _275;
    if (_259)
    {
        float _329 = fma(_233, _323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _277 = _329;
    }
    float _331 = _277;
    float _333 = -_257;
    float _335 = _249 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _339 = _327 + _337;
    float _341 = fma(_327, 6.2500002968590706586837768554688e-05, 0.5);
    float _343 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _345 = _331 + _343;
    float _347 = fma(_331, 6.2500002968590706586837768554688e-05, 0.5);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _351 = fma(_345, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _1589 = float2(_341, _347);
    float _353 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_1589, float2(0.0), isnan(_1589)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_1589, float2(0.0), isnan(_1589)), level(0.0)).y;
    float2 _1599 = float2(_349, _351);
    float _355 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_1599, float2(0.0), isnan(_1599)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_1599, float2(0.0), isnan(_1599)), level(0.0)).x;
    float2 _1607 = float2(_289, _335);
    float _357 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_1607, float2(0.0), isnan(_1607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_1607, float2(0.0), isnan(_1607)), level(0.0)).x;
    float _359 = _245 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _361 = in.m_52.y;
    float _363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _365 = fma(_217, (*spvDescriptorSet0.vp_c8)._m0[11].x, _359);
    float _367 = _245 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _369 = in.m_52.x;
    float _371 = fma(_205, (*spvDescriptorSet0.vp_c8)._m0[11].z, _365);
    float _373 = fma(_217, (*spvDescriptorSet0.vp_c8)._m0[10].x, _367);
    float _375 = in.m_54.x;
    float _377 = in.m_54.y;
    float _379 = _371 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _381 = fma(_205, (*spvDescriptorSet0.vp_c8)._m0[10].z, _373);
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _385 = _383 != 0;
    float _387 = 1.0 / _379;
    float _389 = _381 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _393 = _391 != 0;
    float _395 = _363 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _397 = _389 + _379;
    float _399 = _335;
    float _401 = _361;
    if (_385)
    {
        float _403 = in.m_54.x;
        _399 = _403;
    }
    float _405 = _399;
    float _407 = 0.0;
    if (_385)
    {
        _407 = _369;
    }
    float _409 = _407;
    float _411 = _397 * _387;
    float _413 = _411 * 0.5;
    float _415 = -_361;
    float _417 = _415 + 1.0;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _421 = _377 > 0.5;
    float _423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _425 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[30].w, _423);
    float _427 = _375 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _429 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[78].z, _419);
    float _431 = _409;
    if (_393)
    {
        float _433 = _421 ? _417 : _361;
        _401 = _433;
    }
    float _435 = _401;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = 1.0 / _425;
    float _443 = _377 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _445 = -_437;
    float _447 = fma(_427, 2.0, _445);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _451 = _157 != 0.0;
    bool _453 = isnan(_157);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_443, -2.0, _439);
    float _463 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[78].w, _449);
    float _465 = in.m_56.x;
    float _467 = in.m_56.y;
    float _469 = in.m_56.z;
    bool _471 = _155 == 0.0;
    bool _473 = !_459;
    bool _475 = _471 && _473;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _479 = _405 > 0.5;
    bool _481 = _479 && _385;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _485 = _159 == 0.0;
    bool _487 = _485 && _475;
    float _489 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _493 = _441 * _491;
    float _495 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = abs(_493);
    float _499 = log2(_497);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _505 = _489;
    if (_481)
    {
        float _507 = -_409;
        float _509 = _507 + 1.0;
        _431 = _509;
    }
    float _511 = _431;
    float _513 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _519 = fma(_395, _435, -0.5);
    float _521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _461);
    float _523 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _463);
    float _525 = -_129;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _447);
    float _529 = _469;
    float _531 = _465;
    float _533 = _467;
    if (!_487)
    {
        float _535 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _469);
        _529 = _535;
    }
    float _537 = _529;
    if (!_487)
    {
        float _539 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _465);
        _531 = _539;
    }
    float _541 = _531;
    float _543 = _499 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_487)
    {
        float _547 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _467);
        _533 = _547;
    }
    float _549 = _533;
    float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _553 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _489;
    out.m_58.y = _495;
    out.m_58.z = _513;
    out.m_58.w = _545;
    float _557 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _549 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _561 = -_521;
    float _563 = fma(_523, _519, _561);
    bool _565 = _493 <= 8000.0;
    bool _567 = isnan(_493);
    bool _569 = _565 || _567;
    bool _571 = isnan(8000.0);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = exp2(_543);
    out.m_60.x = _553;
    out.m_60.y = _555;
    out.m_60.z = _557;
    float _579 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[8].x, _559);
    float _581 = in.m_62.z;
    float _583 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _429);
    if (!_385)
    {
        _505 = _369;
    }
    float _585 = _505;
    float _587 = _551 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _589 = _585;
    if (_385)
    {
        _589 = _511;
    }
    float _591 = _589;
    float _593 = _549 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _595 = _549 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _597 = fma(_577, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = fma(_587, _591, -0.5);
    float _603 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[9].x, _593);
    float _605 = fma(_599, -2.0, 3.0);
    float _607 = _599 * _599;
    float _609 = fma(_583, _601, _527);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c10)._m0[10].x, _595);
    float _613 = in.m_64.x;
    float _615 = _607 * _605;
    float _617 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[8].z, _579);
    float _619 = _563 + 0.5;
    float _621 = in.m_62.x;
    float _623 = -_615;
    float _625 = _623 + 1.0;
    float _627 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[9].z, _603);
    float _629 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[10].z, _611);
    float _631 = in.m_62.y;
    float _633 = fma(_625, (*spvDescriptorSet0.vp_c15)._m0[654].w, _615);
    float _635 = _609 + 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _327 + _637;
    float _641 = in.m_62.w;
    float _643 = _575 * _633;
    out.m_66.x = _635;
    out.m_66.y = _619;
    out.m_68.z = _581;
    out.m_70.x = _617;
    out.m_70.y = _627;
    out.m_70.z = _629;
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _647 = _331 + _645;
    out.m_68.x = _621;
    out.m_68.y = _631;
    out.m_68.w = _641;
    float _649 = fma(_353, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _651 = fma(_355, 100.0, _649);
    float _653 = _643 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _655 = -_357;
    float _657 = _655 + 1.0;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _651 + _659;
    float _663 = _651 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _665 = _657 * _653;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    float _669 = _661 * _661;
    float _671 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[0].x, _663);
    float _673 = -_667;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _677 = _651 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _679 = fma(_639, _639, _669);
    float _681 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[0].z, _671);
    float _683 = _675 * _613;
    float _685 = _651 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _687 = fma(_647, _647, _679);
    float _689 = _651 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _691 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[2].x, _677);
    float _693 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[3].x, _685);
    float _695 = _681 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _697 = fma(_327, (*spvDescriptorSet0.vp_c8)._m0[1].x, _689);
    float _699 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[2].z, _691);
    float _701 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[3].z, _693);
    float _703 = sqrt(_687);
    float _705 = fma(_331, (*spvDescriptorSet0.vp_c8)._m0[1].z, _697);
    float _707 = _699 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _709 = _701 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _711 = _683 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _713 = _705 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _715 = _713 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _717 = _713 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _719 = _713 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _721 = _713 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _723 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[4].x, _715);
    float _725 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[5].x, _717);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[6].x, _719);
    float _729 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[7].x, _721);
    float _731 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[4].z, _723);
    float _733 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[5].z, _725);
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[6].z, _727);
    float _737 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[7].z, _729);
    float _739 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[4].w, _731);
    float _741 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[5].w, _733);
    float _743 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[6].w, _735);
    float _745 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[7].w, _737);
    out.m_72.x = _711;
    bool _747 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _749 = isnan(_703);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _755 = _751 || _753;
    out.gl_Position.x = _739;
    out.gl_Position.y = _741;
    out.gl_Position.z = _743;
    out.gl_Position.w = _745;
    float _757 = _707;
    float _759 = _735;
    float _761 = _713;
    float _763 = _733;
    float _765 = _695;
    float _767 = _731;
    if (!_755)
    {
        _757 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _769 = _757;
    float _771 = _769;
    float _773 = _769;
    if (!_755)
    {
        _759 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _775 = _759;
    float _777 = _775;
    float _779 = _775;
    if (!_755)
    {
        _761 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _781 = _761;
    float _783 = _781;
    float _785 = _781;
    if (!_755)
    {
        _763 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _787 = _763;
    float _789 = _787;
    float _791 = _787;
    if (!_755)
    {
        _765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _793 = _765;
    float _795 = _793;
    float _797 = _793;
    if (!_755)
    {
        _767 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _799 = _767;
    bool _801 = !_755;
    float _803 = _799;
    float _805 = _799;
    if (!_801)
    {
        bool _807 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _809 = isnan(_703);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _815 = _811 || _813;
        if (!_815)
        {
            float _817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _819 = _703 + _817;
            float _821 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _823 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _821;
            float _825 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _827 = _825 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _829 = 1.0 / _823;
            float _831 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _833 = _831 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _835 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _837 = _835 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _839 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _841 = _839 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _843 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _845 = _843 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _847 = _819 * _829;
            float _849 = precise::clamp(_847, 0.0, 1.0);
            float _851 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _853 = _851 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _855 = fma(_849, _827, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _857 = fma(_849, _853, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _859 = fma(_849, _833, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _861 = fma(_849, _837, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _863 = fma(_849, _841, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _865 = fma(_849, _845, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _779 = _855;
            _797 = _863;
            _773 = _859;
            _791 = _861;
            _785 = _857;
            _805 = _865;
            _867 = true;
        }
        else
        {
            bool _869 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _871 = isnan(_703);
            bool _873 = _869 || _871;
            bool _875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _877 = _873 || _875;
            if (!_877)
            {
                _771 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _879 = _771;
            _773 = _879;
            if (!_877)
            {
                _777 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _881 = _777;
            _779 = _881;
            if (!_877)
            {
                _783 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _883 = _783;
            _785 = _883;
            if (!_877)
            {
                _789 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _885 = _789;
            _791 = _885;
            if (!_877)
            {
                _795 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _887 = _795;
            _797 = _887;
            if (!_877)
            {
                _803 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _889 = _803;
            bool _891 = !_877;
            _805 = _889;
            if (!_891)
            {
                bool _893 = _703 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _895 = isnan(_703);
                bool _897 = _893 || _895;
                bool _899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _901 = _897 || _899;
                if (!_901)
                {
                    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _905 = _703 + _903;
                    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _909 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _907;
                    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _913 = _911 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _915 = 1.0 / _909;
                    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _919 = _917 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _923 = _921 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _927 = _925 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _931 = _929 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _933 = _905 * _915;
                    float _935 = precise::clamp(_933, 0.0, 1.0);
                    float _937 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _939 = _937 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _941 = fma(_935, _913, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _943 = fma(_935, _939, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _945 = fma(_935, _919, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _947 = fma(_935, _923, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _949 = fma(_935, _927, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _951 = fma(_935, _931, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _779 = _941;
                    _797 = _949;
                    _773 = _945;
                    _791 = _947;
                    _785 = _943;
                    _805 = _951;
                    _867 = true;
                }
                else
                {
                    _779 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _797 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _773 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _791 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _785 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _805 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _867 = false;
    float _953 = _779;
    float _955 = _797;
    float _957 = _773;
    float _959 = _791;
    float _961 = _785;
    float _963 = _805;
    float _965 = fma(_627, -0.5, 0.5);
    float _967 = precise::clamp(_965, 0.0, 1.0);
    float _969 = -_953;
    float _971 = _969 + _955;
    float _973 = -_957;
    float _975 = _973 + _959;
    float _977 = -_961;
    float _979 = _977 + _963;
    bool _981 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _983 = fma(_967, _971, _953);
    float _985 = fma(_967, _975, _957);
    float _987 = fma(_967, _979, _961);
    float _989 = _983 * 0.586610972881317138671875;
    out.m_74.x = 0.0;
    float _991 = fma(_985, 0.298911988735198974609375, _989);
    out.m_44.x = 1.0;
    float _993 = fma(_987, 0.114477999508380889892578125, _991);
    float _995 = -_993;
    float _997 = _985 + _995;
    float _999 = -_993;
    float _1001 = _983 + _999;
    float _1003 = -_993;
    float _1005 = _987 + _1003;
    float _1007 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    float _1013 = fma(_1005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _993);
    out.m_72.w = _1007;
    out.m_76.x = _1009;
    out.m_76.y = _1011;
    out.m_76.z = _1013;
    if (!_981)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1015 = -_651;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1019 = -_327;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1023 = -_331;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1027 = _1017 * _1017;
    float _1029 = fma(_1021, _1021, _1027);
    float _1031 = fma(_1025, _1025, _1029);
    float _1033 = sqrt(_1031);
    float _1035 = rsqrt(_1031);
    float _1037 = -_1033;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1041 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1043 = precise::clamp(_1041, 0.0, 1.0);
    float _1045 = _1021 * _1035;
    float _1047 = _1017 * _1035;
    float _1049 = abs(_1043);
    float _1051 = log2(_1049);
    float _1053 = _1025 * _1035;
    float _1055 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1057 = _627 * _1047;
    float _1059 = -_1047;
    float _1061 = -_1055;
    float _1063 = fma(_1059, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1061);
    float _1065 = fma(_617, _1045, _1057);
    float _1067 = -_1053;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1063);
    float _1071 = fma(_629, _1053, _1065);
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1077 = _1069 + _1075;
    float _1079 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1081 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = exp2(_1079);
    float _1087 = _1085 * _1083;
    float _1089 = _1073 * _1087;
    float _1091 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1093 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_74.x = _1091;
    out.m_74.y = _1093;
    out.m_74.z = _1095;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

