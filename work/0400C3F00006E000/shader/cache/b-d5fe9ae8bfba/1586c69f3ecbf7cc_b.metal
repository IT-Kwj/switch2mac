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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_45 [[user(locn3), flat]];
    float4 m_41 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_51 [[user(locn7), flat]];
    float4 m_43 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _65;
    float _99 = _97 * _71;
    float _101 = _97 * _77;
    float _103 = _97 * _83;
    float _105 = _97 * _89;
    float _107 = 1.0 / _99;
    float _109 = _97 * _95;
    float2 _589 = float2(_103, _109);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).w;
    float _113 = _101 * _107;
    float _115 = _105 * _107;
    float2 _606 = float2(_113, _115);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_606, float2(0.0), isnan(_606))).x;
    float _119 = in.m_43.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_39.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_43.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_43.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_45.x;
    float _145 = _97 * _123;
    float _147 = _97 * _129;
    float _149 = _97 * _135;
    float _151 = _145 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _153 = _147 * _107;
    float _155 = _97 * _141;
    float _157 = in.m_47.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[2].x, _151);
    float _165 = fma(_143, 0.60000002384185791015625, 0.4000000059604644775390625);
    float _167 = -_145;
    float _169 = _167 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _171 = fma(_155, (*spvDescriptorSet0.fp_c8)._m0[2].z, _163);
    float _173 = fma(_143, -0.800000011920928955078125, _165);
    float _175 = -_149;
    float _177 = _175 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _179 = _169 * _169;
    float _181 = _171 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _183 = -_155;
    float _185 = _183 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _187 = 1.0 / _173;
    float _189 = fma(_181, -0.5, -0.5);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = fma(_177, _177, _179);
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = _191 * _191;
    float _201 = fma(_191, -2.0, 3.0);
    float _203 = fma(_185, _185, _193);
    float _205 = in.m_49.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _201 * _199;
    float _213 = 1.0 / _197;
    float _215 = sqrt(_203);
    float _217 = _97 * _161;
    float _219 = -_217;
    float _221 = _219 + 1.0;
    float _223 = precise::max(_215, 0.5);
    float _225 = fma(_143, -0.800000011920928955078125, _111);
    float _227 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _229 = _225 * _187;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _235 = fma(_117, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
    float _237 = 1.0 / _235;
    float _239 = fma(_231, -2.0, 3.0);
    float _241 = _231 * _231;
    float _243 = _239 * _241;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = _213 * _245;
    float _249 = _243 * _221;
    float _251 = precise::min(_223, 1.5);
    float _253 = _249 * _211;
    float _255 = _97 * _209;
    float _257 = _251 + (-0.5);
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _261 = -_247;
    float _263 = fma(_237, _259, _261);
    float _265 = _253 * _257;
    float _267 = _263 * _227;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = 0.0 + _265;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _273 * _269;
    float _277 = _275 * _255;
    bool _281 = _277 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _283 = isnan(_277);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _289 = _285 || _287;
    float _291 = in.m_41.z;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_41.w;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _247;
    if (!_289)
    {
        discard_fragment();
    }
    float _305 = _97 * _295;
    float _307 = _97 * _301;
    float2 _892 = float2(_305, _307);
    float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_892, float2(0.0), isnan(_892))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_892, float2(0.0), isnan(_892))).xyz;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float _319 = in.m_51.w;
    float _321 = in.m_51.z;
    float _323 = in.m_53.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_47.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_53.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_55.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_53.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_55.z;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_53.w;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = _319 * 78.233001708984375;
    float _373 = fma(_321, 12.98980045318603515625, _371);
    float _375 = _97 * _351;
    float _377 = _373 * 0.15915493667125701904296875;
    float _379 = in.m_45.y;
    float _381 = _377 * 6.283185482025146484375;
    float _383 = sin(_381);
    float _385 = _383 * 43758.546875;
    float _387 = floor(_385);
    float _389 = fma(_379, -0.20000000298023223876953125, _215);
    float _391 = _97 * _339;
    float _393 = _97 * _363;
    float _395 = -_387;
    float _397 = _385 + _395;
    float _399 = _97 * _345;
    float _401 = _97 * _357;
    float _403 = fma(_397, 6.283185482025146484375, _389);
    float _405 = _97 * _333;
    float _407 = -_399;
    float _409 = _407 + _375;
    float _411 = -_401;
    float _413 = _411 + _393;
    float _415 = _403 * 0.15915493667125701904296875;
    float _417 = _97 * _327;
    float _419 = _97 * _369;
    float _421 = -_417;
    float _423 = _421 + _405;
    float _425 = _415 * 6.283185482025146484375;
    float _427 = sin(_425);
    float _429 = fma(_427, 0.5, 0.5);
    float _431 = fma(_429, _423, _417);
    float _433 = fma(_429, _409, _399);
    float _435 = -_391;
    float _437 = _435 + 1.0;
    float _439 = fma(_429, _413, _401);
    float _441 = precise::min(_223, 2.0);
    float _443 = _431 * _437;
    float _445 = _433 * _437;
    float _447 = _439 * _437;
    float _449 = _313 * _313;
    float _451 = _315 * _315;
    float _453 = _317 * _317;
    float _455 = fma(_441, -0.666666686534881591796875, 1.33333337306976318359375);
    float _457 = fma(_449, _391, _443);
    float _459 = fma(_451, _391, _445);
    float _461 = fma(_453, _391, _447);
    float _463 = fma(_455, _455, _457);
    float _465 = fma(_455, _455, _459);
    float _467 = fma(_455, _455, _461);
    float _469 = _419 * _463;
    float _471 = _419 * _465;
    float _473 = _419 * _467;
    if (!_289)
    {
        out.m_58.x = _469;
        out.m_58.y = _471;
        out.m_58.z = _473;
        out.m_58.w = _265;
        return out;
    }
    float _475 = _471 * 0.715200006961822509765625;
    bool _477 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _479 = fma(_469, 0.2125999927520751953125, _475);
    float _481 = fma(_473, 0.072200000286102294921875, _479);
    float _483 = 0.0 + _277;
    float _485 = precise::clamp(_483, 0.0, 1.0);
    float _487 = 1.0 / _481;
    float _489 = _485;
    if (_477)
    {
        float _491 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _493 = _247 + _491;
        _303 = _493;
    }
    float _495 = _303;
    float _497 = _495;
    if (_477)
    {
        float _499 = _495 * 8.0;
        float _501 = precise::clamp(_499, 0.0, 1.0);
        _497 = _501;
    }
    float _503 = _497;
    if (_477)
    {
        float _505 = _485 * _503;
        _489 = _505;
    }
    float _507 = _489;
    float _509 = 0.0 + _507;
    float _511 = precise::clamp(_509, 0.0, 1.0);
    float _513 = _487 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _515 = precise::clamp(_513, 0.0, 1.0);
    float _517 = fma(_515, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _519 = _469 * _517;
    float _521 = _471 * _517;
    float _523 = _473 * _517;
    out.m_58.x = _519;
    out.m_58.y = _521;
    out.m_58.z = _523;
    out.m_58.w = _511;
    return out;
}

