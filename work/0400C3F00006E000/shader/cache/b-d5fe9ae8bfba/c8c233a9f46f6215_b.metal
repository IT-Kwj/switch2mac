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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_38.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_38.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_38.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_40.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_40.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _64;
    float _104 = _102 * _70;
    float _106 = _102 * _76;
    float _108 = _102 * _82;
    float _110 = _102 * _88;
    float _112 = _102 * _94;
    float _114 = _102 * _100;
    float2 _578 = float2(_104, _106);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float2 _597 = float2(_108, _110);
    float4 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_597, float2(0.0), isnan(_597))).xyzw;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float _135 = _127.w;
    float2 _613 = float2(_112, _114);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_613, float2(0.0), isnan(_613))).w;
    float _139 = in.m_42.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_44.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_46.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_44.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_44.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_42.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _102 * _173;
    float _177 = _125 + _135;
    float _179 = _102 * _155;
    float _181 = -_137;
    float _183 = _177 + _181;
    float _185 = _102 * _143;
    float _187 = _102 * _149;
    float _189 = -_185;
    float _191 = _183 + _189;
    float _193 = _187 * _191;
    float _195 = 0.0 + _193;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _179;
    bool _203 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _205 = isnan(_199);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _211 = _207 || _209;
    float _213 = in.m_42.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_44.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_42.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    if (!_211)
    {
        discard_fragment();
    }
    float _231 = _129 * _129;
    float _233 = _131 * _131;
    float _235 = _102 * _167;
    float _237 = fma(_119, _119, _231);
    float _239 = fma(_121, _121, _233);
    float _241 = _133 * _133;
    float _243 = fma(_123, _123, _241);
    float _245 = _102 * _217;
    float _247 = _102 * _161;
    float _249 = _102 * _223;
    float _251 = _102 * _229;
    float _253 = -_247;
    float _255 = _245 + _253;
    float _257 = -_249;
    float _259 = _175 + _257;
    float _261 = -_235;
    float _263 = _251 + _261;
    float _265 = fma(_239, _255, _247);
    float _267 = fma(_237, _259, _249);
    float _269 = fma(_243, _263, _235);
    if (!_211)
    {
        out.m_49.x = _267;
        out.m_49.y = _265;
        out.m_49.z = _269;
        out.m_49.w = _193;
        return out;
    }
    float _271 = in.m_51.w;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _102 * _275;
    bool _279 = _277 != 1.0;
    bool _281 = isnan(_277);
    bool _283 = _279 || _281;
    bool _285 = isnan(1.0);
    bool _287 = _283 || _285;
    bool _289 = !_287;
    if (!_289)
    {
        float _291 = gl_FragCoord.x;
        float _293 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _295 = _291 / _293;
        float _297 = gl_FragCoord.y;
        float _299 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _301 = _297 / _299;
        float _303 = _277 * 256.0;
        float _305 = trunc(_303);
        int _308 = int(_305);
        float _310 = trunc(_295);
        int _312 = int(_310);
        float _314 = trunc(_301);
        int _316 = int(_314);
        int _318 = _312 + 2;
        int _320 = _318 >> 1;
        uint _323 = uint(int(uint(_316) >> uint(1)));
        int _325 = _320 ^ int(_323);
        int _327 = _325 << 16;
        int _329 = _327 ^ _320;
        int _331 = 983055 & _329;
        int _333 = _331 << 6;
        int _335 = _333 + _331;
        int _337 = _335 & 13369548;
        uint _339 = uint(int(uint(_337) >> uint(3)));
        int _341 = _337 | int(_339);
        uint _343 = uint(int(uint(_308) >> uint(7)));
        int _345 = int(_343) + _308;
        int _347 = _341 & 5570560;
        int _349 = _341 & 85;
        uint _351 = uint(int(uint(_347) >> uint(15)));
        int _353 = int(_351) + _349;
        bool _355 = uint(_345) > uint(_353);
        if (!_355)
        {
            discard_fragment();
        }
        if (!_355)
        {
            out.m_49.x = _267;
            out.m_49.y = _265;
            out.m_49.z = _269;
            out.m_49.w = _199;
            return out;
        }
    }
    float _357 = in.m_53.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_53.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_53.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_51.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _102 * _361;
    float _383 = _102 * _367;
    float _385 = _102 * _373;
    float _387 = _381 * _381;
    float _389 = fma(_383, _383, _387);
    float _391 = fma(_385, _385, _389);
    float _393 = rsqrt(_391);
    float _395 = _383 * _393;
    float _397 = _381 * _393;
    float _399 = _385 * _393;
    float _401 = abs(_395);
    float _403 = abs(_397);
    float _405 = precise::max(_401, _403);
    float _407 = abs(_399);
    float _409 = precise::max(_407, _405);
    float _411 = _102 * _379;
    float _413 = 1.0 / _409;
    float _415 = precise::min(_411, 1.0);
    float _417 = -_413;
    float _419 = _399 * _417;
    float _421 = _395 * _413;
    float _423 = _397 * _413;
    float3 _1043 = float3(_421, _423, _419);
    float3 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1043, float3(0.0), isnan(_1043)), level(_415)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1043, float3(0.0), isnan(_1043)), level(_415)).xyz;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = in.m_55.x;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_55.y;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_55.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_57.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_57.y;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_57.z;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = _102 * _439;
    float _473 = _102 * _445;
    float _475 = _102 * _451;
    float _477 = _102 * _457;
    float _479 = _102 * _463;
    float _481 = _102 * _469;
    float _483 = fma(_429, 0.20999999344348907470703125, _471);
    float _485 = fma(_431, 0.20999999344348907470703125, _473);
    float _487 = fma(_433, 0.20999999344348907470703125, _475);
    float _489 = _483 + _477;
    float _491 = _485 + _479;
    float _493 = _487 + _481;
    float _495 = _267 * _489;
    float _497 = _265 * _491;
    float _499 = _269 * _493;
    float _501 = 0.0 + _199;
    float _503 = precise::clamp(_501, 0.0, 1.0);
    out.m_49.x = _495;
    out.m_49.y = _497;
    out.m_49.z = _499;
    out.m_49.w = _503;
    return out;
}

