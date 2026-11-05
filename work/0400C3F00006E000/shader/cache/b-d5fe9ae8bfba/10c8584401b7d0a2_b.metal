#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5040 = false;
    bool _5022 = false;
    bool _4878 = false;
    bool _4860 = false;
    bool _4716 = false;
    bool _4698 = false;
    bool _4554 = false;
    bool _4536 = false;
    bool _4392 = false;
    bool _4374 = false;
    bool _4230 = false;
    bool _4212 = false;
    bool _4068 = false;
    bool _4050 = false;
    bool _3906 = false;
    bool _3888 = false;
    bool _3744 = false;
    bool _3726 = false;
    bool _3582 = false;
    bool _3564 = false;
    bool _3420 = false;
    bool _3402 = false;
    bool _3258 = false;
    bool _3240 = false;
    bool _3096 = false;
    bool _3078 = false;
    bool _2934 = false;
    bool _2916 = false;
    bool _2772 = false;
    bool _2754 = false;
    bool _2644 = false;
    bool _2610 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _6872 = float2(_60, _62);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6872, float2(0.0), isnan(_6872)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6872, float2(0.0), isnan(_6872)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float2 _6896 = float2(_60, _62);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6896, float2(0.0), isnan(_6896)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6896, float2(0.0), isnan(_6896)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float2 _6914 = float2(_60, _62);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6914, float2(0.0), isnan(_6914)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6914, float2(0.0), isnan(_6914)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float2 _6934 = float2(_60, _62);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6934, float2(0.0), isnan(_6934)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6934, float2(0.0), isnan(_6934)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float2 _6953 = float2(_60, _62);
    float4 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6953, float2(0.0), isnan(_6953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6953, float2(0.0), isnan(_6953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyzw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _105.w;
    float2 _6972 = float2(_60, _62);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6972, float2(0.0), isnan(_6972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6972, float2(0.0), isnan(_6972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float2 _6991 = float2(_60, _62);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6991, float2(0.0), isnan(_6991)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6991, float2(0.0), isnan(_6991)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _7010 = float2(_60, _62);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7010, float2(0.0), isnan(_7010)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7010, float2(0.0), isnan(_7010)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float2 _7029 = float2(_60, _62);
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7029, float2(0.0), isnan(_7029)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7029, float2(0.0), isnan(_7029)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float2 _7048 = float2(_60, _62);
    float4 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7048, float2(0.0), isnan(_7048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7048, float2(0.0), isnan(_7048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyzw;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    float2 _7067 = float2(_60, _62);
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7067, float2(0.0), isnan(_7067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7067, float2(0.0), isnan(_7067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float2 _7086 = float2(_60, _62);
    float4 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7086, float2(0.0), isnan(_7086)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7086, float2(0.0), isnan(_7086)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float2 _7105 = float2(_60, _62);
    float4 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7105, float2(0.0), isnan(_7105)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7105, float2(0.0), isnan(_7105)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyzw;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float _193 = _185.w;
    float2 _7124 = float2(_60, _62);
    float4 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7124, float2(0.0), isnan(_7124)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7124, float2(0.0), isnan(_7124)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyzw;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _195.w;
    float2 _7143 = float2(_60, _62);
    float4 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7143, float2(0.0), isnan(_7143)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7143, float2(0.0), isnan(_7143)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyzw;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _205.w;
    float2 _7162 = float2(_60, _62);
    float4 _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7162, float2(0.0), isnan(_7162)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7162, float2(0.0), isnan(_7162)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyzw;
    float _217 = _215.x;
    float _219 = _215.y;
    float _221 = _215.z;
    float _223 = _215.w;
    float _225 = _77 + _67;
    float _227 = _79 + _69;
    float _229 = _81 + _71;
    float _231 = _87 + _225;
    float _233 = _89 + _227;
    float _235 = _91 + _229;
    float _237 = _97 + _231;
    float _239 = _99 + _233;
    float _241 = _101 + _235;
    float _243 = _107 + _237;
    float _245 = _109 + _239;
    float _247 = _111 + _241;
    float _249 = _117 + _243;
    float _251 = _119 + _245;
    float _253 = _121 + _247;
    float _255 = _127 + _249;
    float _257 = _129 + _251;
    float _259 = _131 + _253;
    float _261 = _137 + _255;
    float _263 = _139 + _257;
    float _265 = _141 + _259;
    float _267 = _147 + _261;
    float _269 = _149 + _263;
    float _271 = _151 + _265;
    float _273 = _157 + _267;
    float _275 = _159 + _269;
    float _277 = _161 + _271;
    float _279 = _167 + _273;
    float _281 = _169 + _275;
    float _283 = _171 + _277;
    float _285 = _177 + _279;
    float _287 = _179 + _281;
    float _289 = _181 + _283;
    float _291 = _187 + _285;
    float _293 = _189 + _287;
    float _295 = _191 + _289;
    float _297 = _197 + _291;
    float _299 = _199 + _293;
    float _301 = _201 + _295;
    float _303 = _207 + _297;
    float _305 = _209 + _299;
    float _307 = _211 + _301;
    float _309 = _217 + _303;
    float _311 = _219 + _305;
    float _313 = _221 + _307;
    float _315 = fma(_309, -0.0625, _67);
    float _317 = fma(_311, -0.0625, _69);
    float _319 = fma(_313, -0.0625, _71);
    float _321 = fma(_311, -0.0625, _79);
    float _323 = fma(_309, -0.0625, _77);
    float _325 = _317 * _317;
    float _327 = _315 * _317;
    float _329 = _317 * _319;
    float _331 = fma(_313, -0.0625, _81);
    float _333 = _315 * _315;
    float _335 = _315 * _319;
    float _337 = fma(_321, _321, _325);
    float _339 = fma(_323, _321, _327);
    float _341 = fma(_321, _331, _329);
    float _343 = fma(_323, _323, _333);
    float _345 = fma(_323, _331, _335);
    float _347 = _319 * _319;
    float _349 = fma(_311, -0.0625, _89);
    float _351 = fma(_309, -0.0625, _87);
    float _353 = fma(_313, -0.0625, _91);
    float _355 = fma(_331, _331, _347);
    float _357 = fma(_349, _349, _337);
    float _359 = fma(_351, _349, _339);
    float _361 = fma(_349, _353, _341);
    float _363 = fma(_351, _351, _343);
    float _365 = fma(_351, _353, _345);
    float _367 = fma(_311, -0.0625, _99);
    float _369 = fma(_309, -0.0625, _97);
    float _371 = fma(_313, -0.0625, _101);
    float _373 = fma(_353, _353, _355);
    float _375 = fma(_367, _367, _357);
    float _377 = fma(_369, _367, _359);
    float _379 = fma(_367, _371, _361);
    float _381 = fma(_369, _369, _363);
    float _383 = fma(_369, _371, _365);
    float _385 = fma(_311, -0.0625, _109);
    float _387 = fma(_309, -0.0625, _107);
    float _389 = fma(_313, -0.0625, _111);
    float _391 = fma(_371, _371, _373);
    float _393 = fma(_385, _385, _375);
    float _395 = fma(_387, _385, _377);
    float _397 = fma(_385, _389, _379);
    float _399 = fma(_387, _387, _381);
    float _401 = fma(_387, _389, _383);
    float _403 = fma(_311, -0.0625, _119);
    float _405 = fma(_309, -0.0625, _117);
    float _407 = fma(_313, -0.0625, _121);
    float _409 = fma(_389, _389, _391);
    float _411 = fma(_403, _403, _393);
    float _413 = fma(_405, _403, _395);
    float _415 = fma(_403, _407, _397);
    float _417 = fma(_405, _405, _399);
    float _419 = fma(_405, _407, _401);
    float _421 = fma(_311, -0.0625, _129);
    float _423 = fma(_309, -0.0625, _127);
    float _425 = fma(_313, -0.0625, _131);
    float _427 = fma(_407, _407, _409);
    float _429 = fma(_421, _421, _411);
    float _431 = fma(_423, _421, _413);
    float _433 = fma(_421, _425, _415);
    float _435 = fma(_423, _423, _417);
    float _437 = fma(_423, _425, _419);
    float _439 = fma(_311, -0.0625, _139);
    float _441 = fma(_309, -0.0625, _137);
    float _443 = fma(_313, -0.0625, _141);
    float _445 = fma(_425, _425, _427);
    float _447 = fma(_439, _439, _429);
    float _449 = fma(_441, _439, _431);
    float _451 = fma(_439, _443, _433);
    float _453 = fma(_441, _441, _435);
    float _455 = fma(_441, _443, _437);
    float _457 = fma(_311, -0.0625, _149);
    float _459 = fma(_309, -0.0625, _147);
    float _461 = fma(_313, -0.0625, _151);
    float _463 = fma(_443, _443, _445);
    float _465 = fma(_457, _457, _447);
    float _467 = fma(_459, _457, _449);
    float _469 = fma(_457, _461, _451);
    float _471 = fma(_459, _459, _453);
    float _473 = fma(_459, _461, _455);
    float _475 = fma(_311, -0.0625, _159);
    float _477 = fma(_309, -0.0625, _157);
    float _479 = fma(_313, -0.0625, _161);
    float _481 = fma(_461, _461, _463);
    float _483 = fma(_475, _475, _465);
    float _485 = fma(_477, _475, _467);
    float _487 = fma(_475, _479, _469);
    float _489 = fma(_477, _477, _471);
    float _491 = fma(_477, _479, _473);
    float _493 = fma(_311, -0.0625, _169);
    float _495 = fma(_309, -0.0625, _167);
    float _497 = fma(_313, -0.0625, _171);
    float _499 = fma(_479, _479, _481);
    float _501 = fma(_493, _493, _483);
    float _503 = fma(_495, _493, _485);
    float _505 = fma(_493, _497, _487);
    float _507 = fma(_495, _495, _489);
    float _509 = fma(_495, _497, _491);
    float _511 = fma(_311, -0.0625, _179);
    float _513 = fma(_309, -0.0625, _177);
    float _515 = fma(_313, -0.0625, _181);
    float _517 = fma(_497, _497, _499);
    float _519 = fma(_511, _511, _501);
    float _521 = fma(_513, _511, _503);
    float _523 = fma(_511, _515, _505);
    float _525 = fma(_513, _513, _507);
    float _527 = fma(_513, _515, _509);
    float _529 = fma(_311, -0.0625, _189);
    float _531 = fma(_309, -0.0625, _187);
    float _533 = fma(_313, -0.0625, _191);
    float _535 = fma(_515, _515, _517);
    float _537 = fma(_529, _529, _519);
    float _539 = fma(_531, _529, _521);
    float _541 = fma(_529, _533, _523);
    float _543 = fma(_531, _531, _525);
    float _545 = fma(_531, _533, _527);
    float _547 = fma(_311, -0.0625, _199);
    float _549 = fma(_309, -0.0625, _197);
    float _551 = fma(_313, -0.0625, _201);
    float _553 = fma(_533, _533, _535);
    float _555 = fma(_547, _547, _537);
    float _557 = fma(_549, _547, _539);
    float _559 = fma(_547, _551, _541);
    float _561 = fma(_549, _549, _543);
    float _563 = fma(_549, _551, _545);
    float _565 = fma(_311, -0.0625, _209);
    float _567 = fma(_309, -0.0625, _207);
    float _569 = fma(_313, -0.0625, _211);
    float _571 = fma(_309, -0.0625, _217);
    float _573 = fma(_565, _565, _555);
    float _575 = fma(_567, _565, _557);
    float _577 = fma(_565, _569, _559);
    float _579 = fma(_311, -0.0625, _219);
    float _581 = fma(_551, _551, _553);
    float _583 = fma(_313, -0.0625, _221);
    float _585 = fma(_567, _567, _561);
    float _587 = fma(_579, _579, _573);
    float _589 = fma(_571, _579, _575);
    float _591 = fma(_567, _569, _563);
    float _593 = fma(_579, _583, _577);
    float _595 = fma(_571, _571, _585);
    float _597 = _587 + _589;
    float _599 = fma(_569, _569, _581);
    float _601 = fma(_571, _583, _591);
    float _603 = _595 + _589;
    float _605 = _593 + _597;
    float _607 = fma(_583, _583, _599);
    float _609 = _593 + _601;
    float _611 = _601 + _603;
    float _613 = _605 * _605;
    float _615 = _607 + _609;
    float _617 = fma(_611, _611, _613);
    float _619 = fma(_615, _615, _617);
    float _621 = rsqrt(_619);
    float _623 = _605 * _621;
    float _625 = _611 * _621;
    float _627 = _615 * _621;
    float _629 = _587 * _623;
    float _631 = _589 * _623;
    float _633 = fma(_589, _625, _629);
    float _635 = _593 * _623;
    float _637 = fma(_595, _625, _631);
    float _639 = fma(_593, _627, _633);
    float _641 = fma(_601, _625, _635);
    float _643 = fma(_601, _627, _637);
    float _645 = _639 * _639;
    float _647 = fma(_607, _627, _641);
    float _649 = fma(_643, _643, _645);
    float _651 = fma(_647, _647, _649);
    float _653 = rsqrt(_651);
    float _655 = _639 * _653;
    float _657 = _643 * _653;
    float _659 = _647 * _653;
    float _661 = _587 * _655;
    float _663 = _589 * _655;
    float _665 = _593 * _655;
    float _667 = fma(_589, _657, _661);
    float _669 = fma(_595, _657, _663);
    float _671 = fma(_601, _657, _665);
    float _673 = fma(_593, _659, _667);
    float _675 = fma(_601, _659, _669);
    float _677 = fma(_607, _659, _671);
    float _679 = _673 * _673;
    float _681 = fma(_675, _675, _679);
    float _683 = fma(_677, _677, _681);
    float _685 = rsqrt(_683);
    float _687 = _673 * _685;
    float _689 = _675 * _685;
    float _691 = _677 * _685;
    float _693 = _587 * _687;
    float _695 = _589 * _687;
    float _697 = _593 * _687;
    float _699 = fma(_589, _689, _693);
    float _701 = fma(_595, _689, _695);
    float _703 = fma(_601, _689, _697);
    float _705 = fma(_593, _691, _699);
    float _707 = fma(_601, _691, _701);
    float _709 = fma(_607, _691, _703);
    float _711 = _705 * _705;
    float _713 = fma(_707, _707, _711);
    float _715 = fma(_709, _709, _713);
    float _717 = rsqrt(_715);
    float _719 = _705 * _717;
    float _721 = _707 * _717;
    float _723 = _709 * _717;
    float _725 = _587 * _719;
    float _727 = _589 * _719;
    float _729 = _593 * _719;
    float _731 = fma(_589, _721, _725);
    float _733 = fma(_595, _721, _727);
    float _735 = fma(_601, _721, _729);
    float _737 = fma(_593, _723, _731);
    float _739 = fma(_601, _723, _733);
    float _741 = fma(_607, _723, _735);
    float _743 = _737 * _737;
    float _745 = fma(_739, _739, _743);
    float _747 = fma(_741, _741, _745);
    float _749 = rsqrt(_747);
    float _751 = _737 * _749;
    float _753 = _739 * _749;
    float _755 = _741 * _749;
    float _757 = _587 * _751;
    float _759 = _589 * _751;
    float _761 = _593 * _751;
    float _763 = fma(_589, _753, _757);
    float _765 = fma(_595, _753, _759);
    float _767 = fma(_601, _753, _761);
    float _769 = fma(_593, _755, _763);
    float _771 = fma(_601, _755, _765);
    float _773 = fma(_607, _755, _767);
    float _775 = _769 * _769;
    float _777 = fma(_771, _771, _775);
    float _779 = fma(_773, _773, _777);
    float _781 = rsqrt(_779);
    float _783 = _769 * _781;
    float _785 = _771 * _781;
    float _787 = _773 * _781;
    float _789 = _587 * _783;
    float _791 = _589 * _783;
    float _793 = _593 * _783;
    float _795 = fma(_589, _785, _789);
    float _797 = fma(_595, _785, _791);
    float _799 = fma(_601, _785, _793);
    float _801 = fma(_593, _787, _795);
    float _803 = fma(_601, _787, _797);
    float _805 = fma(_607, _787, _799);
    float _807 = _801 * _801;
    float _809 = fma(_803, _803, _807);
    float _811 = fma(_805, _805, _809);
    float _813 = rsqrt(_811);
    float _815 = _801 * _813;
    float _817 = _803 * _813;
    float _819 = _805 * _813;
    float _821 = _587 * _815;
    float _823 = _589 * _815;
    float _825 = fma(_589, _817, _821);
    float _827 = _593 * _815;
    float _829 = fma(_595, _817, _823);
    float _831 = fma(_593, _819, _825);
    float _833 = fma(_601, _817, _827);
    float _835 = fma(_601, _819, _829);
    float _837 = _831 * _831;
    float _839 = fma(_607, _819, _833);
    float _841 = fma(_835, _835, _837);
    float _843 = fma(_839, _839, _841);
    float _845 = rsqrt(_843);
    float _847 = _831 * _845;
    float _849 = _835 * _845;
    float _851 = _839 * _845;
    float _853 = _79 * _847;
    float _855 = _69 * _847;
    float _857 = _89 * _847;
    float _859 = fma(_77, _849, _853);
    float _861 = fma(_67, _849, _855);
    float _863 = fma(_87, _849, _857);
    float _865 = fma(_81, _851, _859);
    float _867 = fma(_71, _851, _861);
    float _869 = fma(_91, _851, _863);
    bool _873 = _865 >= _867;
    bool _875 = isnan(_865);
    bool _877 = _873 || _875;
    bool _879 = isnan(_867);
    bool _881 = _877 || _879;
    float _883 = 0.0;
    float _885 = _863;
    float _887 = _595;
    float _889 = _859;
    float _891 = _845;
    float _893 = _817;
    float _895 = _805;
    float _897 = _815;
    float _899 = _865;
    float _901 = _789;
    float _903 = _869;
    float _905 = _869;
    float _907 = _847;
    float _909 = _849;
    spvUnsafeArray<uint, 4> _24;
    if (!_881)
    {
        _883 = _67;
    }
    float _911 = _883;
    float _913 = _911;
    float _915 = _911;
    if (!_881)
    {
        _885 = _69;
    }
    float _917 = _885;
    float _919 = _917;
    float _921 = _917;
    if (!_881)
    {
        _887 = _71;
    }
    float _923 = _887;
    float _925 = _923;
    float _927 = _923;
    if (!_881)
    {
        _889 = _865;
    }
    float _929 = _889;
    float _931 = _929;
    float _933 = _929;
    if (!_881)
    {
        _891 = _867;
    }
    float _935 = _891;
    float _937 = _935;
    float _939 = _935;
    if (!_881)
    {
        _893 = _77;
    }
    float _941 = _893;
    float _943 = _941;
    float _945 = _941;
    if (!_881)
    {
        _895 = _79;
    }
    float _947 = _895;
    float _949 = _947;
    float _951 = _947;
    if (!_881)
    {
        _897 = _81;
    }
    float _953 = _897;
    bool _955 = !_881;
    float _957 = _953;
    float _959 = _953;
    if (!_955)
    {
        bool _961 = _865 > _867;
        if (!_961)
        {
            _931 = _865;
        }
        float _963 = _931;
        float _965 = _963;
        if (!_961)
        {
            _937 = _865;
        }
        float _967 = _937;
        float _969 = _967;
        if (!_961)
        {
            _943 = _77;
        }
        float _971 = _943;
        float _973 = _971;
        if (!_961)
        {
            _949 = _79;
        }
        float _975 = _949;
        float _977 = _975;
        if (!_961)
        {
            _957 = _81;
        }
        float _979 = _957;
        float _981 = _979;
        if (!_961)
        {
            _913 = _77;
        }
        float _983 = _913;
        float _985 = _983;
        if (!_961)
        {
            _919 = _79;
        }
        float _987 = _919;
        float _989 = _987;
        if (!_961)
        {
            _925 = _81;
        }
        float _991 = _925;
        _927 = _991;
        if (_961)
        {
            _965 = _867;
        }
        float _993 = _965;
        _933 = _993;
        if (_961)
        {
            _969 = _865;
        }
        float _995 = _969;
        _939 = _995;
        if (_961)
        {
            _973 = _67;
        }
        float _997 = _973;
        _945 = _997;
        if (_961)
        {
            _977 = _69;
        }
        float _999 = _977;
        _951 = _999;
        if (_961)
        {
            _981 = _71;
        }
        float _1001 = _981;
        _959 = _1001;
        if (_961)
        {
            _985 = _77;
        }
        float _1003 = _985;
        _915 = _1003;
        if (_961)
        {
            _989 = _79;
        }
        float _1005 = _989;
        _921 = _1005;
        if (_961)
        {
            _927 = _81;
        }
    }
    float _1007 = _939;
    float _1009 = _933;
    float _1011 = _915;
    float _1013 = _921;
    float _1015 = _927;
    float _1017 = _945;
    float _1019 = _951;
    float _1021 = _959;
    bool _1023 = _1007 >= _869;
    bool _1025 = isnan(_1007);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(_869);
    bool _1031 = _1027 || _1029;
    float _1033 = _99 * _847;
    float _1035 = fma(_97, _849, _1033);
    float _1037 = fma(_101, _851, _1035);
    float _1039 = _1035;
    float _1041 = _1009;
    float _1043 = _1017;
    float _1045 = _1019;
    float _1047 = _1009;
    float _1049 = _1017;
    float _1051 = _1019;
    float _1053 = _1021;
    float _1055 = _1007;
    float _1057 = _1015;
    float _1059 = _1037;
    float _1061 = _1037;
    if (!_1031)
    {
        _899 = _87;
    }
    float _1063 = _899;
    float _1065 = _1063;
    float _1067 = _1063;
    if (!_1031)
    {
        _1039 = _89;
    }
    float _1069 = _1039;
    float _1071 = _1069;
    float _1073 = _1069;
    if (!_1031)
    {
        _901 = _91;
    }
    float _1075 = _901;
    bool _1077 = !_1031;
    float _1079 = _1075;
    float _1081 = _1075;
    if (!_1077)
    {
        bool _1083 = _1009 > _869;
        if (_1083)
        {
            _1041 = _869;
        }
        float _1085 = _1041;
        _1047 = _1085;
        if (!_1083)
        {
            _1065 = _1011;
        }
        float _1087 = _1065;
        float _1089 = _1087;
        if (!_1083)
        {
            _1071 = _1013;
        }
        float _1091 = _1071;
        float _1093 = _1091;
        if (!_1083)
        {
            _1079 = _1015;
        }
        float _1095 = _1079;
        float _1097 = _1095;
        if (!_1083)
        {
            _903 = _1007;
        }
        float _1099 = _903;
        float _1101 = _1099;
        if (_1083)
        {
            _1089 = _1011;
        }
        float _1103 = _1089;
        _1067 = _1103;
        if (_1083)
        {
            _1093 = _1013;
        }
        float _1105 = _1093;
        _1073 = _1105;
        if (_1083)
        {
            _1097 = _1015;
        }
        float _1107 = _1097;
        _1081 = _1107;
        if (_1083)
        {
            _1101 = _1007;
        }
        float _1109 = _1101;
        _905 = _1109;
        if (_1083)
        {
            _1043 = _87;
        }
        float _1111 = _1043;
        _1049 = _1111;
        if (_1083)
        {
            _1045 = _89;
        }
        float _1113 = _1045;
        _1051 = _1113;
        if (_1083)
        {
            _1053 = _91;
        }
    }
    float _1115 = _905;
    float _1117 = _1047;
    float _1119 = _1067;
    float _1121 = _1073;
    float _1123 = _1081;
    float _1125 = _1049;
    float _1127 = _1051;
    float _1129 = _1053;
    bool _1131 = _1115 >= _1037;
    bool _1133 = isnan(_1115);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(_1037);
    bool _1139 = _1135 || _1137;
    float _1141 = _109 * _847;
    float _1143 = fma(_107, _849, _1141);
    float _1145 = fma(_111, _851, _1143);
    float _1147 = _1143;
    float _1149 = _1117;
    float _1151 = _1125;
    float _1153 = _1127;
    float _1155 = _1117;
    float _1157 = _1125;
    float _1159 = _1127;
    float _1161 = _1129;
    float _1163 = _1119;
    float _1165 = _1123;
    float _1167 = _1145;
    float _1169 = _1145;
    if (!_1139)
    {
        _1055 = _97;
    }
    float _1171 = _1055;
    float _1173 = _1171;
    float _1175 = _1171;
    if (!_1139)
    {
        _1057 = _99;
    }
    float _1177 = _1057;
    float _1179 = _1177;
    float _1181 = _1177;
    if (!_1139)
    {
        _1147 = _101;
    }
    float _1183 = _1147;
    bool _1185 = !_1139;
    float _1187 = _1183;
    float _1189 = _1183;
    if (!_1185)
    {
        bool _1191 = _1117 > _1037;
        if (_1191)
        {
            _1149 = _1037;
        }
        float _1193 = _1149;
        _1155 = _1193;
        if (!_1191)
        {
            _1173 = _1119;
        }
        float _1195 = _1173;
        float _1197 = _1195;
        if (!_1191)
        {
            _1179 = _1121;
        }
        float _1199 = _1179;
        float _1201 = _1199;
        if (!_1191)
        {
            _1187 = _1123;
        }
        float _1203 = _1187;
        float _1205 = _1203;
        if (!_1191)
        {
            _1059 = _1115;
        }
        float _1207 = _1059;
        float _1209 = _1207;
        if (_1191)
        {
            _1197 = _1119;
        }
        float _1211 = _1197;
        _1175 = _1211;
        if (_1191)
        {
            _1201 = _1121;
        }
        float _1213 = _1201;
        _1181 = _1213;
        if (_1191)
        {
            _1205 = _1123;
        }
        float _1215 = _1205;
        _1189 = _1215;
        if (_1191)
        {
            _1209 = _1115;
        }
        float _1217 = _1209;
        _1061 = _1217;
        if (_1191)
        {
            _1151 = _97;
        }
        float _1219 = _1151;
        _1157 = _1219;
        if (_1191)
        {
            _1153 = _99;
        }
        float _1221 = _1153;
        _1159 = _1221;
        if (_1191)
        {
            _1161 = _101;
        }
    }
    float _1223 = _1061;
    float _1225 = _1155;
    float _1227 = _1175;
    float _1229 = _1181;
    float _1231 = _1189;
    float _1233 = _1157;
    float _1235 = _1159;
    float _1237 = _1161;
    bool _1239 = _1223 >= _1145;
    bool _1241 = isnan(_1223);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan(_1145);
    bool _1247 = _1243 || _1245;
    float _1249 = _119 * _847;
    float _1251 = fma(_117, _849, _1249);
    float _1253 = fma(_121, _851, _1251);
    float _1255 = _1251;
    float _1257 = _1225;
    float _1259 = _1233;
    float _1261 = _1235;
    float _1263 = _1225;
    float _1265 = _1233;
    float _1267 = _1235;
    float _1269 = _1237;
    float _1271 = _1227;
    float _1273 = _1229;
    float _1275 = _1253;
    float _1277 = _1253;
    float _1279 = _1223;
    if (!_1247)
    {
        _1163 = _107;
    }
    float _1281 = _1163;
    float _1283 = _1281;
    float _1285 = _1281;
    if (!_1247)
    {
        _1255 = _109;
    }
    float _1287 = _1255;
    float _1289 = _1287;
    float _1291 = _1287;
    if (!_1247)
    {
        _1165 = _111;
    }
    float _1293 = _1165;
    bool _1295 = !_1247;
    float _1297 = _1293;
    float _1299 = _1293;
    if (!_1295)
    {
        bool _1301 = _1225 > _1145;
        if (_1301)
        {
            _1257 = _1145;
        }
        float _1303 = _1257;
        _1263 = _1303;
        if (!_1301)
        {
            _1283 = _1227;
        }
        float _1305 = _1283;
        float _1307 = _1305;
        if (!_1301)
        {
            _1289 = _1229;
        }
        float _1309 = _1289;
        float _1311 = _1309;
        if (!_1301)
        {
            _1297 = _1231;
        }
        float _1313 = _1297;
        float _1315 = _1313;
        if (!_1301)
        {
            _1167 = _1223;
        }
        float _1317 = _1167;
        float _1319 = _1317;
        if (_1301)
        {
            _1307 = _1227;
        }
        float _1321 = _1307;
        _1285 = _1321;
        if (_1301)
        {
            _1311 = _1229;
        }
        float _1323 = _1311;
        _1291 = _1323;
        if (_1301)
        {
            _1315 = _1231;
        }
        float _1325 = _1315;
        _1299 = _1325;
        if (_1301)
        {
            _1319 = _1223;
        }
        float _1327 = _1319;
        _1169 = _1327;
        if (_1301)
        {
            _1259 = _107;
        }
        float _1329 = _1259;
        _1265 = _1329;
        if (_1301)
        {
            _1261 = _109;
        }
        float _1331 = _1261;
        _1267 = _1331;
        if (_1301)
        {
            _1269 = _111;
        }
    }
    float _1333 = _1169;
    float _1335 = _1263;
    float _1337 = _1285;
    float _1339 = _1291;
    float _1341 = _1299;
    float _1343 = _1265;
    float _1345 = _1267;
    float _1347 = _1269;
    bool _1349 = _1333 >= _1253;
    bool _1351 = isnan(_1333);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(_1253);
    bool _1357 = _1353 || _1355;
    float _1359 = _129 * _847;
    float _1361 = fma(_127, _849, _1359);
    float _1363 = fma(_131, _851, _1361);
    float _1365 = _1361;
    float _1367 = _1335;
    float _1369 = _1343;
    float _1371 = _1345;
    float _1373 = _1335;
    float _1375 = _1343;
    float _1377 = _1345;
    float _1379 = _1347;
    float _1381 = _1341;
    float _1383 = _1333;
    float _1385 = _1363;
    float _1387 = _1363;
    if (!_1357)
    {
        _1271 = _117;
    }
    float _1389 = _1271;
    float _1391 = _1389;
    float _1393 = _1389;
    if (!_1357)
    {
        _1273 = _119;
    }
    float _1395 = _1273;
    float _1397 = _1395;
    float _1399 = _1395;
    if (!_1357)
    {
        _1365 = _121;
    }
    float _1401 = _1365;
    bool _1403 = !_1357;
    float _1405 = _1401;
    float _1407 = _1401;
    if (!_1403)
    {
        bool _1409 = _1335 > _1253;
        if (_1409)
        {
            _1367 = _1253;
        }
        float _1411 = _1367;
        _1373 = _1411;
        if (!_1409)
        {
            _1391 = _1337;
        }
        float _1413 = _1391;
        float _1415 = _1413;
        if (!_1409)
        {
            _1397 = _1339;
        }
        float _1417 = _1397;
        float _1419 = _1417;
        if (!_1409)
        {
            _1405 = _1341;
        }
        float _1421 = _1405;
        float _1423 = _1421;
        if (!_1409)
        {
            _1275 = _1333;
        }
        float _1425 = _1275;
        float _1427 = _1425;
        if (_1409)
        {
            _1415 = _1337;
        }
        float _1429 = _1415;
        _1393 = _1429;
        if (_1409)
        {
            _1419 = _1339;
        }
        float _1431 = _1419;
        _1399 = _1431;
        if (_1409)
        {
            _1423 = _1341;
        }
        float _1433 = _1423;
        _1407 = _1433;
        if (_1409)
        {
            _1427 = _1333;
        }
        float _1435 = _1427;
        _1277 = _1435;
        if (_1409)
        {
            _1369 = _117;
        }
        float _1437 = _1369;
        _1375 = _1437;
        if (_1409)
        {
            _1371 = _119;
        }
        float _1439 = _1371;
        _1377 = _1439;
        if (_1409)
        {
            _1379 = _121;
        }
    }
    float _1441 = _1277;
    float _1443 = _1373;
    float _1445 = _1393;
    float _1447 = _1399;
    float _1449 = _1407;
    float _1451 = _1375;
    float _1453 = _1377;
    float _1455 = _1379;
    bool _1457 = _1441 >= _1363;
    bool _1459 = isnan(_1441);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(_1363);
    bool _1465 = _1461 || _1463;
    float _1467 = _139 * _847;
    float _1469 = fma(_137, _849, _1467);
    float _1471 = fma(_141, _851, _1469);
    float _1473 = _1443;
    float _1475 = _1451;
    float _1477 = _1453;
    float _1479 = _1443;
    float _1481 = _1451;
    float _1483 = _1453;
    float _1485 = _1455;
    float _1487 = _1445;
    float _1489 = _1447;
    float _1491 = _1471;
    float _1493 = _1471;
    if (!_1465)
    {
        _1381 = _127;
    }
    float _1495 = _1381;
    float _1497 = _1495;
    float _1499 = _1495;
    if (!_1465)
    {
        _1279 = _129;
    }
    float _1501 = _1279;
    float _1503 = _1501;
    float _1505 = _1501;
    if (!_1465)
    {
        _1383 = _131;
    }
    float _1507 = _1383;
    bool _1509 = !_1465;
    float _1511 = _1507;
    float _1513 = _1507;
    if (!_1509)
    {
        bool _1515 = _1443 > _1363;
        if (_1515)
        {
            _1473 = _1363;
        }
        float _1517 = _1473;
        _1479 = _1517;
        if (!_1515)
        {
            _1497 = _1445;
        }
        float _1519 = _1497;
        float _1521 = _1519;
        if (!_1515)
        {
            _1503 = _1447;
        }
        float _1523 = _1503;
        float _1525 = _1523;
        if (!_1515)
        {
            _1511 = _1449;
        }
        float _1527 = _1511;
        float _1529 = _1527;
        if (!_1515)
        {
            _1385 = _1441;
        }
        float _1531 = _1385;
        float _1533 = _1531;
        if (_1515)
        {
            _1521 = _1445;
        }
        float _1535 = _1521;
        _1499 = _1535;
        if (_1515)
        {
            _1525 = _1447;
        }
        float _1537 = _1525;
        _1505 = _1537;
        if (_1515)
        {
            _1529 = _1449;
        }
        float _1539 = _1529;
        _1513 = _1539;
        if (_1515)
        {
            _1533 = _1441;
        }
        float _1541 = _1533;
        _1387 = _1541;
        if (_1515)
        {
            _1475 = _127;
        }
        float _1543 = _1475;
        _1481 = _1543;
        if (_1515)
        {
            _1477 = _129;
        }
        float _1545 = _1477;
        _1483 = _1545;
        if (_1515)
        {
            _1485 = _131;
        }
    }
    float _1547 = _1387;
    float _1549 = _1479;
    float _1551 = _1499;
    float _1553 = _1505;
    float _1555 = _1513;
    float _1557 = _1481;
    float _1559 = _1483;
    float _1561 = _1485;
    bool _1563 = _1547 >= _1471;
    bool _1565 = isnan(_1547);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan(_1471);
    bool _1571 = _1567 || _1569;
    float _1573 = _149 * _847;
    float _1575 = fma(_147, _849, _1573);
    float _1577 = fma(_151, _851, _1575);
    float _1579 = _1575;
    float _1581 = _1549;
    float _1583 = _1557;
    float _1585 = _1559;
    float _1587 = _1549;
    float _1589 = _1557;
    float _1591 = _1559;
    float _1593 = _1561;
    float _1595 = _1555;
    float _1597 = _1551;
    float _1599 = _1577;
    float _1601 = _1577;
    if (!_1571)
    {
        _1487 = _137;
    }
    float _1603 = _1487;
    float _1605 = _1603;
    float _1607 = _1603;
    if (!_1571)
    {
        _1489 = _139;
    }
    float _1609 = _1489;
    float _1611 = _1609;
    float _1613 = _1609;
    if (!_1571)
    {
        _1579 = _141;
    }
    float _1615 = _1579;
    bool _1617 = !_1571;
    float _1619 = _1615;
    float _1621 = _1615;
    if (!_1617)
    {
        bool _1623 = _1549 > _1471;
        if (_1623)
        {
            _1581 = _1471;
        }
        float _1625 = _1581;
        _1587 = _1625;
        if (!_1623)
        {
            _1605 = _1551;
        }
        float _1627 = _1605;
        float _1629 = _1627;
        if (!_1623)
        {
            _1611 = _1553;
        }
        float _1631 = _1611;
        float _1633 = _1631;
        if (!_1623)
        {
            _1619 = _1555;
        }
        float _1635 = _1619;
        float _1637 = _1635;
        if (!_1623)
        {
            _1491 = _1547;
        }
        float _1639 = _1491;
        float _1641 = _1639;
        if (_1623)
        {
            _1629 = _1551;
        }
        float _1643 = _1629;
        _1607 = _1643;
        if (_1623)
        {
            _1633 = _1553;
        }
        float _1645 = _1633;
        _1613 = _1645;
        if (_1623)
        {
            _1637 = _1555;
        }
        float _1647 = _1637;
        _1621 = _1647;
        if (_1623)
        {
            _1641 = _1547;
        }
        float _1649 = _1641;
        _1493 = _1649;
        if (_1623)
        {
            _1583 = _137;
        }
        float _1651 = _1583;
        _1589 = _1651;
        if (_1623)
        {
            _1585 = _139;
        }
        float _1653 = _1585;
        _1591 = _1653;
        if (_1623)
        {
            _1593 = _141;
        }
    }
    float _1655 = _1493;
    float _1657 = _1587;
    float _1659 = _1607;
    float _1661 = _1613;
    float _1663 = _1621;
    float _1665 = _1589;
    float _1667 = _1591;
    float _1669 = _1593;
    bool _1671 = _1655 >= _1577;
    bool _1673 = isnan(_1655);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan(_1577);
    bool _1679 = _1675 || _1677;
    float _1681 = _159 * _847;
    float _1683 = fma(_157, _849, _1681);
    float _1685 = fma(_161, _851, _1683);
    float _1687 = _1683;
    float _1689 = _1657;
    float _1691 = _1665;
    float _1693 = _1667;
    float _1695 = _1657;
    float _1697 = _1665;
    float _1699 = _1667;
    float _1701 = _1669;
    float _1703 = _1661;
    float _1705 = _1659;
    float _1707 = _1685;
    float _1709 = _1685;
    if (!_1679)
    {
        _1595 = _147;
    }
    float _1711 = _1595;
    float _1713 = _1711;
    float _1715 = _1711;
    if (!_1679)
    {
        _1687 = _149;
    }
    float _1717 = _1687;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1679)
    {
        _1597 = _151;
    }
    float _1723 = _1597;
    bool _1725 = !_1679;
    float _1727 = _1723;
    float _1729 = _1723;
    if (!_1725)
    {
        bool _1731 = _1657 > _1577;
        if (_1731)
        {
            _1689 = _1577;
        }
        float _1733 = _1689;
        _1695 = _1733;
        if (!_1731)
        {
            _1713 = _1659;
        }
        float _1735 = _1713;
        float _1737 = _1735;
        if (!_1731)
        {
            _1719 = _1661;
        }
        float _1739 = _1719;
        float _1741 = _1739;
        if (!_1731)
        {
            _1727 = _1663;
        }
        float _1743 = _1727;
        float _1745 = _1743;
        if (!_1731)
        {
            _1599 = _1655;
        }
        float _1747 = _1599;
        float _1749 = _1747;
        if (_1731)
        {
            _1737 = _1659;
        }
        float _1751 = _1737;
        _1715 = _1751;
        if (_1731)
        {
            _1741 = _1661;
        }
        float _1753 = _1741;
        _1721 = _1753;
        if (_1731)
        {
            _1745 = _1663;
        }
        float _1755 = _1745;
        _1729 = _1755;
        if (_1731)
        {
            _1749 = _1655;
        }
        float _1757 = _1749;
        _1601 = _1757;
        if (_1731)
        {
            _1691 = _147;
        }
        float _1759 = _1691;
        _1697 = _1759;
        if (_1731)
        {
            _1693 = _149;
        }
        float _1761 = _1693;
        _1699 = _1761;
        if (_1731)
        {
            _1701 = _151;
        }
    }
    float _1763 = _1601;
    float _1765 = _1695;
    float _1767 = _1715;
    float _1769 = _1721;
    float _1771 = _1729;
    float _1773 = _1697;
    float _1775 = _1699;
    float _1777 = _1701;
    bool _1779 = _1763 >= _1685;
    bool _1781 = isnan(_1763);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(_1685);
    bool _1787 = _1783 || _1785;
    float _1789 = _169 * _847;
    float _1791 = fma(_167, _849, _1789);
    float _1793 = fma(_171, _851, _1791);
    float _1795 = _1791;
    float _1797 = _1765;
    float _1799 = _1773;
    float _1801 = _1775;
    float _1803 = _1765;
    float _1805 = _1773;
    float _1807 = _1775;
    float _1809 = _1777;
    float _1811 = _1771;
    float _1813 = _1763;
    float _1815 = _1793;
    float _1817 = _1793;
    if (!_1787)
    {
        _1795 = _157;
    }
    float _1819 = _1795;
    float _1821 = _1819;
    float _1823 = _1819;
    if (!_1787)
    {
        _1703 = _159;
    }
    float _1825 = _1703;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1787)
    {
        _1705 = _161;
    }
    float _1831 = _1705;
    bool _1833 = !_1787;
    float _1835 = _1831;
    float _1837 = _1831;
    if (!_1833)
    {
        bool _1839 = _1765 > _1685;
        if (_1839)
        {
            _1797 = _1685;
        }
        float _1841 = _1797;
        _1803 = _1841;
        if (!_1839)
        {
            _1821 = _1767;
        }
        float _1843 = _1821;
        float _1845 = _1843;
        if (!_1839)
        {
            _1827 = _1769;
        }
        float _1847 = _1827;
        float _1849 = _1847;
        if (!_1839)
        {
            _1835 = _1771;
        }
        float _1851 = _1835;
        float _1853 = _1851;
        if (!_1839)
        {
            _1707 = _1763;
        }
        float _1855 = _1707;
        float _1857 = _1855;
        if (_1839)
        {
            _1845 = _1767;
        }
        float _1859 = _1845;
        _1823 = _1859;
        if (_1839)
        {
            _1849 = _1769;
        }
        float _1861 = _1849;
        _1829 = _1861;
        if (_1839)
        {
            _1853 = _1771;
        }
        float _1863 = _1853;
        _1837 = _1863;
        if (_1839)
        {
            _1857 = _1763;
        }
        float _1865 = _1857;
        _1709 = _1865;
        if (_1839)
        {
            _1799 = _157;
        }
        float _1867 = _1799;
        _1805 = _1867;
        if (_1839)
        {
            _1801 = _159;
        }
        float _1869 = _1801;
        _1807 = _1869;
        if (_1839)
        {
            _1809 = _161;
        }
    }
    float _1871 = _1709;
    float _1873 = _1803;
    float _1875 = _1823;
    float _1877 = _1829;
    float _1879 = _1837;
    float _1881 = _1805;
    float _1883 = _1807;
    float _1885 = _1809;
    bool _1887 = _1871 >= _1793;
    bool _1889 = isnan(_1871);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(_1793);
    bool _1895 = _1891 || _1893;
    float _1897 = _179 * _847;
    float _1899 = fma(_177, _849, _1897);
    float _1901 = fma(_181, _851, _1899);
    float _1903 = _1899;
    float _1905 = _1873;
    float _1907 = _1881;
    float _1909 = _1883;
    float _1911 = _1873;
    float _1913 = _1881;
    float _1915 = _1883;
    float _1917 = _1885;
    float _1919 = _1877;
    float _1921 = _1879;
    float _1923 = _1901;
    float _1925 = _1901;
    if (!_1895)
    {
        _1811 = _167;
    }
    float _1927 = _1811;
    float _1929 = _1927;
    float _1931 = _1927;
    if (!_1895)
    {
        _1903 = _169;
    }
    float _1933 = _1903;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1895)
    {
        _1813 = _171;
    }
    float _1939 = _1813;
    bool _1941 = !_1895;
    float _1943 = _1939;
    float _1945 = _1939;
    if (!_1941)
    {
        bool _1947 = _1873 > _1793;
        if (_1947)
        {
            _1905 = _1793;
        }
        float _1949 = _1905;
        _1911 = _1949;
        if (!_1947)
        {
            _1929 = _1875;
        }
        float _1951 = _1929;
        float _1953 = _1951;
        if (!_1947)
        {
            _1935 = _1877;
        }
        float _1955 = _1935;
        float _1957 = _1955;
        if (!_1947)
        {
            _1943 = _1879;
        }
        float _1959 = _1943;
        float _1961 = _1959;
        if (!_1947)
        {
            _1815 = _1871;
        }
        float _1963 = _1815;
        float _1965 = _1963;
        if (_1947)
        {
            _1953 = _1875;
        }
        float _1967 = _1953;
        _1931 = _1967;
        if (_1947)
        {
            _1957 = _1877;
        }
        float _1969 = _1957;
        _1937 = _1969;
        if (_1947)
        {
            _1961 = _1879;
        }
        float _1971 = _1961;
        _1945 = _1971;
        if (_1947)
        {
            _1965 = _1871;
        }
        float _1973 = _1965;
        _1817 = _1973;
        if (_1947)
        {
            _1907 = _167;
        }
        float _1975 = _1907;
        _1913 = _1975;
        if (_1947)
        {
            _1909 = _169;
        }
        float _1977 = _1909;
        _1915 = _1977;
        if (_1947)
        {
            _1917 = _171;
        }
    }
    float _1979 = _1817;
    float _1981 = _1911;
    float _1983 = _1931;
    float _1985 = _1937;
    float _1987 = _1945;
    float _1989 = _1913;
    float _1991 = _1915;
    float _1993 = _1917;
    bool _1995 = _1979 >= _1901;
    bool _1997 = isnan(_1979);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(_1901);
    bool _2003 = _1999 || _2001;
    float _2005 = _189 * _847;
    float _2007 = fma(_187, _849, _2005);
    float _2009 = fma(_191, _851, _2007);
    float _2011 = _2007;
    float _2013 = _1981;
    float _2015 = _1989;
    float _2017 = _1991;
    float _2019 = _1981;
    float _2021 = _1989;
    float _2023 = _1991;
    float _2025 = _1993;
    float _2027 = _1983;
    float _2029 = _1987;
    float _2031 = _2009;
    float _2033 = _2009;
    if (!_2003)
    {
        _2011 = _177;
    }
    float _2035 = _2011;
    float _2037 = _2035;
    float _2039 = _2035;
    if (!_2003)
    {
        _1919 = _179;
    }
    float _2041 = _1919;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_2003)
    {
        _1921 = _181;
    }
    float _2047 = _1921;
    bool _2049 = !_2003;
    float _2051 = _2047;
    float _2053 = _2047;
    if (!_2049)
    {
        bool _2055 = _1981 > _1901;
        if (_2055)
        {
            _2013 = _1901;
        }
        float _2057 = _2013;
        _2019 = _2057;
        if (!_2055)
        {
            _2037 = _1983;
        }
        float _2059 = _2037;
        float _2061 = _2059;
        if (!_2055)
        {
            _2043 = _1985;
        }
        float _2063 = _2043;
        float _2065 = _2063;
        if (!_2055)
        {
            _2051 = _1987;
        }
        float _2067 = _2051;
        float _2069 = _2067;
        if (!_2055)
        {
            _1923 = _1979;
        }
        float _2071 = _1923;
        float _2073 = _2071;
        if (_2055)
        {
            _2061 = _1983;
        }
        float _2075 = _2061;
        _2039 = _2075;
        if (_2055)
        {
            _2065 = _1985;
        }
        float _2077 = _2065;
        _2045 = _2077;
        if (_2055)
        {
            _2069 = _1987;
        }
        float _2079 = _2069;
        _2053 = _2079;
        if (_2055)
        {
            _2073 = _1979;
        }
        float _2081 = _2073;
        _1925 = _2081;
        if (_2055)
        {
            _2015 = _177;
        }
        float _2083 = _2015;
        _2021 = _2083;
        if (_2055)
        {
            _2017 = _179;
        }
        float _2085 = _2017;
        _2023 = _2085;
        if (_2055)
        {
            _2025 = _181;
        }
    }
    float _2087 = _1925;
    float _2089 = _2019;
    float _2091 = _2039;
    float _2093 = _2045;
    float _2095 = _2053;
    float _2097 = _2021;
    float _2099 = _2023;
    float _2101 = _2025;
    bool _2103 = _2087 >= _2009;
    bool _2105 = isnan(_2087);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(_2009);
    bool _2111 = _2107 || _2109;
    float _2113 = _199 * _847;
    float _2115 = fma(_197, _849, _2113);
    float _2117 = fma(_201, _851, _2115);
    float _2119 = _2115;
    float _2121 = _2089;
    float _2123 = _2097;
    float _2125 = _2099;
    float _2127 = _2089;
    float _2129 = _2097;
    float _2131 = _2099;
    float _2133 = _2101;
    float _2135 = _2093;
    float _2137 = _2095;
    float _2139 = _2117;
    float _2141 = _2117;
    if (!_2111)
    {
        _2027 = _187;
    }
    float _2143 = _2027;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2111)
    {
        _2119 = _189;
    }
    float _2149 = _2119;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2111)
    {
        _2029 = _191;
    }
    float _2155 = _2029;
    bool _2157 = !_2111;
    float _2159 = _2155;
    float _2161 = _2155;
    if (!_2157)
    {
        bool _2163 = _2089 > _2009;
        if (_2163)
        {
            _2121 = _2009;
        }
        float _2165 = _2121;
        _2127 = _2165;
        if (!_2163)
        {
            _2145 = _2091;
        }
        float _2167 = _2145;
        float _2169 = _2167;
        if (!_2163)
        {
            _2151 = _2093;
        }
        float _2171 = _2151;
        float _2173 = _2171;
        if (!_2163)
        {
            _2159 = _2095;
        }
        float _2175 = _2159;
        float _2177 = _2175;
        if (!_2163)
        {
            _2031 = _2087;
        }
        float _2179 = _2031;
        float _2181 = _2179;
        if (_2163)
        {
            _2169 = _2091;
        }
        float _2183 = _2169;
        _2147 = _2183;
        if (_2163)
        {
            _2173 = _2093;
        }
        float _2185 = _2173;
        _2153 = _2185;
        if (_2163)
        {
            _2177 = _2095;
        }
        float _2187 = _2177;
        _2161 = _2187;
        if (_2163)
        {
            _2181 = _2087;
        }
        float _2189 = _2181;
        _2033 = _2189;
        if (_2163)
        {
            _2123 = _187;
        }
        float _2191 = _2123;
        _2129 = _2191;
        if (_2163)
        {
            _2125 = _189;
        }
        float _2193 = _2125;
        _2131 = _2193;
        if (_2163)
        {
            _2133 = _191;
        }
    }
    float _2195 = _2033;
    float _2197 = _2127;
    float _2199 = _2147;
    float _2201 = _2153;
    float _2203 = _2161;
    float _2205 = _2129;
    float _2207 = _2131;
    float _2209 = _2133;
    bool _2211 = _2195 >= _2117;
    bool _2213 = isnan(_2195);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(_2117);
    bool _2219 = _2215 || _2217;
    float _2221 = _209 * _847;
    float _2223 = fma(_207, _849, _2221);
    float _2225 = fma(_211, _851, _2223);
    float _2227 = _2223;
    float _2229 = _2197;
    float _2231 = _2205;
    float _2233 = _2207;
    float _2235 = _2205;
    float _2237 = _2207;
    float _2239 = _2197;
    float _2241 = _2209;
    float _2243 = _2203;
    float _2245 = _2199;
    float _2247 = _2225;
    float _2249 = _2225;
    if (!_2219)
    {
        _2227 = _197;
    }
    float _2251 = _2227;
    float _2253 = _2251;
    float _2255 = _2251;
    if (!_2219)
    {
        _2135 = _199;
    }
    float _2257 = _2135;
    float _2259 = _2257;
    float _2261 = _2257;
    if (!_2219)
    {
        _2137 = _201;
    }
    float _2263 = _2137;
    bool _2265 = !_2219;
    float _2267 = _2263;
    float _2269 = _2263;
    if (!_2265)
    {
        bool _2271 = _2197 > _2117;
        if (_2271)
        {
            _2229 = _2117;
        }
        float _2273 = _2229;
        _2239 = _2273;
        if (!_2271)
        {
            _2253 = _2199;
        }
        float _2275 = _2253;
        float _2277 = _2275;
        if (!_2271)
        {
            _2259 = _2201;
        }
        float _2279 = _2259;
        float _2281 = _2279;
        if (!_2271)
        {
            _2267 = _2203;
        }
        float _2283 = _2267;
        float _2285 = _2283;
        if (!_2271)
        {
            _2139 = _2195;
        }
        float _2287 = _2139;
        float _2289 = _2287;
        if (_2271)
        {
            _2277 = _2199;
        }
        float _2291 = _2277;
        _2255 = _2291;
        if (_2271)
        {
            _2281 = _2201;
        }
        float _2293 = _2281;
        _2261 = _2293;
        if (_2271)
        {
            _2285 = _2203;
        }
        float _2295 = _2285;
        _2269 = _2295;
        if (_2271)
        {
            _2289 = _2195;
        }
        float _2297 = _2289;
        _2141 = _2297;
        if (_2271)
        {
            _2231 = _197;
        }
        float _2299 = _2231;
        _2235 = _2299;
        if (_2271)
        {
            _2233 = _199;
        }
        float _2301 = _2233;
        _2237 = _2301;
        if (_2271)
        {
            _2241 = _201;
        }
    }
    float _2303 = _2141;
    float _2305 = _2235;
    float _2307 = _2237;
    float _2309 = _2239;
    float _2311 = _2255;
    float _2313 = _2261;
    float _2315 = _2269;
    float _2317 = _2241;
    bool _2319 = _2303 >= _2225;
    bool _2321 = isnan(_2303);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan(_2225);
    bool _2327 = _2323 || _2325;
    float _2329 = _219 * _847;
    float _2331 = fma(_217, _849, _2329);
    float _2333 = fma(_221, _851, _2331);
    float _2335 = _2331;
    float _2337 = _2309;
    float _2339 = _2317;
    float _2341 = _2309;
    float _2343 = _2307;
    float _2345 = _2305;
    if (!_2327)
    {
        _907 = _2305;
    }
    float _2347 = _907;
    float _2349 = _2347;
    float _2351 = _2347;
    if (!_2327)
    {
        _2335 = _2307;
    }
    float _2353 = _2335;
    float _2355 = _2353;
    float _2357 = _2353;
    if (!_2327)
    {
        _909 = _207;
    }
    float _2359 = _909;
    float _2361 = _2359;
    float _2363 = _2359;
    if (!_2327)
    {
        _2243 = _209;
    }
    float _2365 = _2243;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2327)
    {
        _2245 = _211;
    }
    float _2371 = _2245;
    bool _2373 = !_2327;
    float _2375 = _2371;
    float _2377 = _2371;
    if (!_2373)
    {
        bool _2379 = _2309 > _2225;
        if (_2379)
        {
            _2337 = _2225;
        }
        float _2381 = _2337;
        _2341 = _2381;
        if (!_2379)
        {
            _2361 = _2311;
        }
        float _2383 = _2361;
        float _2385 = _2383;
        if (!_2379)
        {
            _2367 = _2313;
        }
        float _2387 = _2367;
        float _2389 = _2387;
        if (!_2379)
        {
            _2375 = _2315;
        }
        float _2391 = _2375;
        float _2393 = _2391;
        if (!_2379)
        {
            _2247 = _2303;
        }
        float _2395 = _2247;
        float _2397 = _2395;
        if (!_2379)
        {
            _2349 = _2305;
        }
        float _2399 = _2349;
        float _2401 = _2399;
        if (!_2379)
        {
            _2355 = _2307;
        }
        float _2403 = _2355;
        float _2405 = _2403;
        if (_2379)
        {
            _2385 = _2311;
        }
        float _2407 = _2385;
        _2363 = _2407;
        if (_2379)
        {
            _2389 = _2313;
        }
        float _2409 = _2389;
        _2369 = _2409;
        if (_2379)
        {
            _2393 = _2315;
        }
        float _2411 = _2393;
        _2377 = _2411;
        if (_2379)
        {
            _2397 = _2303;
        }
        float _2413 = _2397;
        _2249 = _2413;
        if (_2379)
        {
            _2401 = _207;
        }
        float _2415 = _2401;
        _2351 = _2415;
        if (_2379)
        {
            _2405 = _209;
        }
        float _2417 = _2405;
        _2357 = _2417;
        if (_2379)
        {
            _2339 = _211;
        }
    }
    float _2419 = _2249;
    float _2421 = _2351;
    float _2423 = _2339;
    float _2425 = _2341;
    float _2427 = _2363;
    float _2429 = _2369;
    float _2431 = _2377;
    float _2433 = _2357;
    bool _2435 = _2419 >= _2333;
    bool _2437 = isnan(_2419);
    bool _2439 = _2435 || _2437;
    bool _2441 = isnan(_2333);
    bool _2443 = _2439 || _2441;
    float _2445 = _2433;
    float _2447 = _2433;
    if (!_2443)
    {
        _2343 = _2421;
    }
    float _2449 = _2343;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2443)
    {
        _2345 = _2423;
    }
    float _2455 = _2345;
    float _2457 = 0.0;
    float _2459 = _2455;
    float _2461 = _2455;
    if (!_2443)
    {
        _2457 = _217;
    }
    float _2463 = _2457;
    float _2465 = 0.0;
    float _2467 = _2463;
    float _2469 = _2463;
    if (!_2443)
    {
        _2465 = _219;
    }
    float _2471 = _2465;
    float _2473 = 0.0;
    float _2475 = _2471;
    float _2477 = _2471;
    if (!_2443)
    {
        _2473 = _221;
    }
    float _2479 = _2473;
    bool _2481 = !_2443;
    float _2483 = _2479;
    float _2485 = _2479;
    if (!_2481)
    {
        bool _2487 = _2425 > _2333;
        if (!_2487)
        {
            _2467 = _2427;
        }
        float _2489 = _2467;
        float _2491 = _2489;
        if (!_2487)
        {
            _2475 = _2429;
        }
        float _2493 = _2475;
        float _2495 = _2493;
        if (!_2487)
        {
            _2483 = _2431;
        }
        float _2497 = _2483;
        float _2499 = _2497;
        if (!_2487)
        {
            _2451 = _2421;
        }
        float _2501 = _2451;
        float _2503 = _2501;
        if (!_2487)
        {
            _2459 = _2423;
        }
        float _2505 = _2459;
        _2461 = _2505;
        if (_2487)
        {
            _2491 = _2427;
        }
        float _2507 = _2491;
        _2469 = _2507;
        if (_2487)
        {
            _2495 = _2429;
        }
        float _2509 = _2495;
        _2477 = _2509;
        if (_2487)
        {
            _2499 = _2431;
        }
        float _2511 = _2499;
        _2485 = _2511;
        if (_2487)
        {
            _2503 = _217;
        }
        float _2513 = _2503;
        _2453 = _2513;
        if (_2487)
        {
            _2445 = _219;
        }
        float _2515 = _2445;
        _2447 = _2515;
        if (_2487)
        {
            _2461 = _221;
        }
    }
    float _2517 = _2447;
    float _2519 = _2477;
    float _2521 = _2453;
    float _2523 = _2469;
    float _2525 = _2461;
    float _2527 = _2485;
    float _2529 = -_2517;
    float _2531 = _2519 + _2529;
    float _2533 = -_2521;
    float _2535 = _2523 + _2533;
    float _2537 = -_2525;
    float _2539 = _2527 + _2537;
    float _2541 = -_2517;
    float _2543 = _79 + _2541;
    float _2545 = _2531 * _2531;
    float _2547 = _2531 * _2543;
    float _2549 = fma(_2535, _2535, _2545);
    float _2551 = -_2521;
    float _2553 = _77 + _2551;
    float _2555 = -_2525;
    float _2557 = _81 + _2555;
    float _2559 = fma(_2539, _2539, _2549);
    float _2561 = fma(_2535, _2553, _2547);
    float _2563 = fma(_2539, _2557, _2561);
    float _2565 = 1.0 / _2559;
    float _2567 = _2565 * 3.0;
    float _2569 = _2567 * _2563;
    float _2571 = rint(_2569);
    float _2573 = precise::max(0.0, _2571);
    float _2575 = precise::min(_2573, 3.0);
    float _2577 = trunc(_2575);
    int _2580 = int(_2577);
    bool _2582 = _2580 >= 2;
    bool _2584 = !_2582;
    float _2586 = _2535;
    float _2588 = _2531;
    float _2590 = _2539;
    float _2592 = _2521;
    float _2594 = _2523;
    float _2596 = _2517;
    float _2598 = _2519;
    float _2600 = _2525;
    float _2602 = _2527;
    float _2612;
    float _2614;
    float _2616;
    float _2618;
    float _2620;
    float _2622;
    float _2624;
    float _2626;
    float _2628;
    float _2630;
    float _2632;
    float _2634;
    float _2636;
    float _2638;
    float _2640;
    float _2642;
    if (!_2584)
    {
        bool _2604 = _2580 >= 3;
        bool _2606 = !_2604;
        if (!_2606)
        {
            bool _2608 = _2580 != 3;
            _2610 = _2608;
            if (!_2610)
            {
                _2612 = _77;
                _2614 = _79;
                _2616 = _81;
                _2618 = 1.0;
                _2620 = 0.0;
                _2622 = 0.0;
                _2624 = 0.0;
                _2626 = 0.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = true;
            }
        }
        else
        {
            _2612 = 0.0;
            _2614 = 0.0;
            _2616 = 0.0;
            _2618 = 0.0;
            _2620 = 0.0;
            _2622 = 0.0;
            _2624 = 0.0;
            _2626 = 0.0;
            _2628 = _77;
            _2630 = _79;
            _2632 = _81;
            _2634 = 1.0;
            _2636 = 0.0;
            _2638 = 0.0;
            _2640 = 0.0;
            _2642 = 0.0;
            _2644 = true;
        }
    }
    if ((!_2644) || _2610)
    {
        bool _2646;
        if (!_2610)
        {
            _2646 = _2580 >= 1;
        }
        if ((!_2646) || _2610)
        {
            bool _2648;
            if (!_2610)
            {
                _2648 = _2580 != 0;
            }
            if ((!_2648) && (!_2610))
            {
                _2612 = 0.0;
                _2614 = 0.0;
                _2616 = 0.0;
                _2618 = 0.0;
                _2620 = _77;
                _2622 = _79;
                _2624 = _81;
                _2626 = 1.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = true;
            }
            else
            {
                _2610 = false;
                _2612 = 0.0;
                _2614 = 0.0;
                _2616 = 0.0;
                _2618 = 0.0;
                _2620 = 0.0;
                _2622 = 0.0;
                _2624 = 0.0;
                _2626 = 0.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = true;
            }
        }
        else
        {
            _2612 = 0.0;
            _2614 = 0.0;
            _2616 = 0.0;
            _2618 = 0.0;
            _2620 = 0.0;
            _2622 = 0.0;
            _2624 = 0.0;
            _2626 = 0.0;
            _2628 = 0.0;
            _2630 = 0.0;
            _2632 = 0.0;
            _2634 = 0.0;
            _2636 = _77;
            _2638 = _79;
            _2640 = _81;
            _2642 = 1.0;
        }
    }
    _2644 = false;
    float _2650 = _2612;
    float _2652 = _2614;
    float _2654 = _2616;
    float _2656 = _2618;
    float _2658 = _2620;
    float _2660 = _2622;
    float _2662 = _2624;
    float _2664 = _2626;
    float _2666 = _2628;
    float _2668 = _2630;
    float _2670 = _2632;
    float _2672 = _2634;
    float _2674 = _2636;
    float _2676 = _2638;
    float _2678 = _2640;
    float _2680 = _2642;
    float _2682 = -_2517;
    float _2684 = _69 + _2682;
    float _2686 = -_2521;
    float _2688 = _67 + _2686;
    float _2690 = _2531 * _2684;
    float _2692 = -_2525;
    float _2694 = _71 + _2692;
    float _2696 = fma(_2535, _2688, _2690);
    float _2698 = fma(_2539, _2694, _2696);
    float _2700 = _2567 * _2698;
    float _2702 = rint(_2700);
    float _2704 = precise::max(0.0, _2702);
    float _2706 = precise::min(_2704, 3.0);
    float _2708 = trunc(_2706);
    int _2710 = int(_2708);
    bool _2712 = _2710 >= 2;
    bool _2714 = !_2712;
    float _2716 = as_type<float>(_2710);
    float _2718 = _2702;
    float _2720 = _2696;
    float _2722 = _2690;
    float _2724 = _2650;
    float _2726 = _2652;
    float _2728 = _2654;
    float _2730 = _2656;
    float _2732 = _2666;
    float _2734 = _2668;
    float _2736 = _2670;
    float _2738 = _2672;
    float _2740 = _2674;
    float _2742 = _2676;
    float _2744 = _2678;
    float _2746 = _2680;
    float _2764;
    float _2766;
    float _2768;
    float _2770;
    if (!_2714)
    {
        bool _2748 = _2710 >= 3;
        bool _2750 = !_2748;
        if (!_2750)
        {
            bool _2752 = _2710 != 3;
            _2754 = _2752;
            if (!_2754)
            {
                float _2756 = _67 + _2650;
                float _2758 = _69 + _2652;
                float _2760 = _71 + _2654;
                float _2762 = _2656 + 1.0;
                _2724 = _2756;
                _2726 = _2758;
                _2728 = _2760;
                _2730 = _2762;
                _2764 = _2658;
                _2766 = _2660;
                _2768 = _2662;
                _2770 = _2664;
                _2772 = true;
            }
        }
        else
        {
            float _2774 = _67 + _2666;
            float _2776 = _69 + _2668;
            float _2778 = _71 + _2670;
            float _2780 = _2672 + 1.0;
            _2764 = _2658;
            _2766 = _2660;
            _2768 = _2662;
            _2770 = _2664;
            _2732 = _2774;
            _2734 = _2776;
            _2736 = _2778;
            _2738 = _2780;
            _2772 = true;
        }
    }
    if ((!_2772) || _2754)
    {
        bool _2782;
        if (!_2754)
        {
            _2782 = _2710 >= 1;
        }
        if ((!_2782) || _2754)
        {
            if (!_2754)
            {
                bool _2784 = _2710 != 0;
                if (!_2784)
                {
                    float _2786 = _67 + _2658;
                    _2716 = _2786;
                }
                float _2788 = _2716;
                _2764 = _2788;
                if (!_2784)
                {
                    float _2790 = _69 + _2660;
                    _2718 = _2790;
                }
                float _2792 = _2718;
                _2766 = _2792;
                if (!_2784)
                {
                    float _2794 = _71 + _2662;
                    _2720 = _2794;
                }
                float _2796 = _2720;
                _2768 = _2796;
                if (!_2784)
                {
                    float _2798 = _2664 + 1.0;
                    _2722 = _2798;
                }
                float _2800 = _2722;
                bool _2802 = !_2784;
                _2770 = _2800;
                _2772 = _2802;
            }
            if ((!_2772) || _2754)
            {
                _2754 = false;
                _2764 = _2658;
                _2766 = _2660;
                _2768 = _2662;
                _2770 = _2664;
                _2772 = true;
            }
        }
        else
        {
            float _2804 = _67 + _2674;
            float _2806 = _69 + _2676;
            float _2808 = _71 + _2678;
            float _2810 = _2680 + 1.0;
            _2764 = _2658;
            _2766 = _2660;
            _2768 = _2662;
            _2770 = _2664;
            _2740 = _2804;
            _2742 = _2806;
            _2744 = _2808;
            _2746 = _2810;
        }
    }
    _2772 = false;
    float _2812 = _2724;
    float _2814 = _2726;
    float _2816 = _2728;
    float _2818 = _2730;
    float _2820 = _2764;
    float _2822 = _2766;
    float _2824 = _2768;
    float _2826 = _2770;
    float _2828 = _2732;
    float _2830 = _2734;
    float _2832 = _2736;
    float _2834 = _2738;
    float _2836 = _2740;
    float _2838 = _2742;
    float _2840 = _2744;
    float _2842 = _2746;
    float _2844 = -_2517;
    float _2846 = _89 + _2844;
    float _2848 = -_2521;
    float _2850 = _87 + _2848;
    float _2852 = _2531 * _2846;
    float _2854 = -_2525;
    float _2856 = _91 + _2854;
    float _2858 = fma(_2535, _2850, _2852);
    float _2860 = fma(_2539, _2856, _2858);
    float _2862 = _2567 * _2860;
    float _2864 = rint(_2862);
    float _2866 = precise::max(0.0, _2864);
    float _2868 = precise::min(_2866, 3.0);
    float _2870 = trunc(_2868);
    int _2872 = int(_2870);
    bool _2874 = _2872 >= 2;
    bool _2876 = !_2874;
    float _2878 = _2864;
    float _2880 = as_type<float>(_2872);
    float _2882 = _2852;
    float _2884 = _2858;
    float _2886 = _2812;
    float _2888 = _2814;
    float _2890 = _2816;
    float _2892 = _2818;
    float _2894 = _2828;
    float _2896 = _2830;
    float _2898 = _2832;
    float _2900 = _2834;
    float _2902 = _2836;
    float _2904 = _2838;
    float _2906 = _2840;
    float _2908 = _2842;
    float _2926;
    float _2928;
    float _2930;
    float _2932;
    if (!_2876)
    {
        bool _2910 = _2872 >= 3;
        bool _2912 = !_2910;
        if (!_2912)
        {
            bool _2914 = _2872 != 3;
            _2916 = _2914;
            if (!_2916)
            {
                float _2918 = _87 + _2812;
                float _2920 = _89 + _2814;
                float _2922 = _91 + _2816;
                float _2924 = _2818 + 1.0;
                _2886 = _2918;
                _2888 = _2920;
                _2890 = _2922;
                _2892 = _2924;
                _2926 = _2820;
                _2928 = _2822;
                _2930 = _2824;
                _2932 = _2826;
                _2934 = true;
            }
        }
        else
        {
            float _2936 = _87 + _2828;
            float _2938 = _89 + _2830;
            float _2940 = _91 + _2832;
            float _2942 = _2834 + 1.0;
            _2926 = _2820;
            _2928 = _2822;
            _2930 = _2824;
            _2932 = _2826;
            _2894 = _2936;
            _2896 = _2938;
            _2898 = _2940;
            _2900 = _2942;
            _2934 = true;
        }
    }
    if ((!_2934) || _2916)
    {
        bool _2944;
        if (!_2916)
        {
            _2944 = _2872 >= 1;
        }
        if ((!_2944) || _2916)
        {
            if (!_2916)
            {
                bool _2946 = _2872 != 0;
                if (!_2946)
                {
                    float _2948 = _87 + _2820;
                    _2878 = _2948;
                }
                float _2950 = _2878;
                _2926 = _2950;
                if (!_2946)
                {
                    float _2952 = _89 + _2822;
                    _2880 = _2952;
                }
                float _2954 = _2880;
                _2928 = _2954;
                if (!_2946)
                {
                    float _2956 = _91 + _2824;
                    _2882 = _2956;
                }
                float _2958 = _2882;
                _2930 = _2958;
                if (!_2946)
                {
                    float _2960 = _2826 + 1.0;
                    _2884 = _2960;
                }
                float _2962 = _2884;
                bool _2964 = !_2946;
                _2932 = _2962;
                _2934 = _2964;
            }
            if ((!_2934) || _2916)
            {
                _2916 = false;
                _2926 = _2820;
                _2928 = _2822;
                _2930 = _2824;
                _2932 = _2826;
                _2934 = true;
            }
        }
        else
        {
            float _2966 = _87 + _2836;
            float _2968 = _89 + _2838;
            float _2970 = _91 + _2840;
            float _2972 = _2842 + 1.0;
            _2926 = _2820;
            _2928 = _2822;
            _2930 = _2824;
            _2932 = _2826;
            _2902 = _2966;
            _2904 = _2968;
            _2906 = _2970;
            _2908 = _2972;
        }
    }
    _2934 = false;
    float _2974 = _2886;
    float _2976 = _2888;
    float _2978 = _2890;
    float _2980 = _2892;
    float _2982 = _2926;
    float _2984 = _2928;
    float _2986 = _2930;
    float _2988 = _2932;
    float _2990 = _2894;
    float _2992 = _2896;
    float _2994 = _2898;
    float _2996 = _2900;
    float _2998 = _2902;
    float _3000 = _2904;
    float _3002 = _2906;
    float _3004 = _2908;
    float _3006 = -_2517;
    float _3008 = _99 + _3006;
    float _3010 = -_2521;
    float _3012 = _97 + _3010;
    float _3014 = _2531 * _3008;
    float _3016 = -_2525;
    float _3018 = _101 + _3016;
    float _3020 = fma(_2535, _3012, _3014);
    float _3022 = fma(_2539, _3018, _3020);
    float _3024 = _2567 * _3022;
    float _3026 = rint(_3024);
    float _3028 = precise::max(0.0, _3026);
    float _3030 = precise::min(_3028, 3.0);
    float _3032 = trunc(_3030);
    int _3034 = int(_3032);
    bool _3036 = _3034 >= 2;
    bool _3038 = !_3036;
    float _3040 = as_type<float>(_3034);
    float _3042 = _3026;
    float _3044 = _3020;
    float _3046 = _3014;
    float _3048 = _2974;
    float _3050 = _2976;
    float _3052 = _2978;
    float _3054 = _2980;
    float _3056 = _2990;
    float _3058 = _2992;
    float _3060 = _2994;
    float _3062 = _2996;
    float _3064 = _2998;
    float _3066 = _3000;
    float _3068 = _3002;
    float _3070 = _3004;
    float _3088;
    float _3090;
    float _3092;
    float _3094;
    if (!_3038)
    {
        bool _3072 = _3034 >= 3;
        bool _3074 = !_3072;
        if (!_3074)
        {
            bool _3076 = _3034 != 3;
            _3078 = _3076;
            if (!_3078)
            {
                float _3080 = _97 + _2974;
                float _3082 = _99 + _2976;
                float _3084 = _101 + _2978;
                float _3086 = _2980 + 1.0;
                _3048 = _3080;
                _3050 = _3082;
                _3052 = _3084;
                _3054 = _3086;
                _3088 = _2982;
                _3090 = _2984;
                _3092 = _2986;
                _3094 = _2988;
                _3096 = true;
            }
        }
        else
        {
            float _3098 = _97 + _2990;
            float _3100 = _99 + _2992;
            float _3102 = _101 + _2994;
            float _3104 = _2996 + 1.0;
            _3088 = _2982;
            _3090 = _2984;
            _3092 = _2986;
            _3094 = _2988;
            _3056 = _3098;
            _3058 = _3100;
            _3060 = _3102;
            _3062 = _3104;
            _3096 = true;
        }
    }
    if ((!_3096) || _3078)
    {
        bool _3106;
        if (!_3078)
        {
            _3106 = _3034 >= 1;
        }
        if ((!_3106) || _3078)
        {
            if (!_3078)
            {
                bool _3108 = _3034 != 0;
                if (!_3108)
                {
                    float _3110 = _97 + _2982;
                    _3040 = _3110;
                }
                float _3112 = _3040;
                _3088 = _3112;
                if (!_3108)
                {
                    float _3114 = _99 + _2984;
                    _3042 = _3114;
                }
                float _3116 = _3042;
                _3090 = _3116;
                if (!_3108)
                {
                    float _3118 = _101 + _2986;
                    _3044 = _3118;
                }
                float _3120 = _3044;
                _3092 = _3120;
                if (!_3108)
                {
                    float _3122 = _2988 + 1.0;
                    _3046 = _3122;
                }
                float _3124 = _3046;
                bool _3126 = !_3108;
                _3094 = _3124;
                _3096 = _3126;
            }
            if ((!_3096) || _3078)
            {
                _3078 = false;
                _3088 = _2982;
                _3090 = _2984;
                _3092 = _2986;
                _3094 = _2988;
                _3096 = true;
            }
        }
        else
        {
            float _3128 = _97 + _2998;
            float _3130 = _99 + _3000;
            float _3132 = _101 + _3002;
            float _3134 = _3004 + 1.0;
            _3088 = _2982;
            _3090 = _2984;
            _3092 = _2986;
            _3094 = _2988;
            _3064 = _3128;
            _3066 = _3130;
            _3068 = _3132;
            _3070 = _3134;
        }
    }
    _3096 = false;
    float _3136 = _3048;
    float _3138 = _3050;
    float _3140 = _3052;
    float _3142 = _3054;
    float _3144 = _3088;
    float _3146 = _3090;
    float _3148 = _3092;
    float _3150 = _3094;
    float _3152 = _3056;
    float _3154 = _3058;
    float _3156 = _3060;
    float _3158 = _3062;
    float _3160 = _3064;
    float _3162 = _3066;
    float _3164 = _3068;
    float _3166 = _3070;
    float _3168 = -_2517;
    float _3170 = _109 + _3168;
    float _3172 = -_2521;
    float _3174 = _107 + _3172;
    float _3176 = _2531 * _3170;
    float _3178 = -_2525;
    float _3180 = _111 + _3178;
    float _3182 = fma(_2535, _3174, _3176);
    float _3184 = fma(_2539, _3180, _3182);
    float _3186 = _2567 * _3184;
    float _3188 = rint(_3186);
    float _3190 = precise::max(0.0, _3188);
    float _3192 = precise::min(_3190, 3.0);
    float _3194 = trunc(_3192);
    int _3196 = int(_3194);
    bool _3198 = _3196 >= 2;
    bool _3200 = !_3198;
    float _3202 = _3188;
    float _3204 = as_type<float>(_3196);
    float _3206 = _3176;
    float _3208 = _3182;
    float _3210 = _3136;
    float _3212 = _3138;
    float _3214 = _3140;
    float _3216 = _3142;
    float _3218 = _3152;
    float _3220 = _3154;
    float _3222 = _3156;
    float _3224 = _3158;
    float _3226 = _3160;
    float _3228 = _3162;
    float _3230 = _3164;
    float _3232 = _3166;
    float _3250;
    float _3252;
    float _3254;
    float _3256;
    if (!_3200)
    {
        bool _3234 = _3196 >= 3;
        bool _3236 = !_3234;
        if (!_3236)
        {
            bool _3238 = _3196 != 3;
            _3240 = _3238;
            if (!_3240)
            {
                float _3242 = _107 + _3136;
                float _3244 = _109 + _3138;
                float _3246 = _111 + _3140;
                float _3248 = _3142 + 1.0;
                _3210 = _3242;
                _3212 = _3244;
                _3214 = _3246;
                _3216 = _3248;
                _3250 = _3144;
                _3252 = _3146;
                _3254 = _3148;
                _3256 = _3150;
                _3258 = true;
            }
        }
        else
        {
            float _3260 = _107 + _3152;
            float _3262 = _109 + _3154;
            float _3264 = _111 + _3156;
            float _3266 = _3158 + 1.0;
            _3250 = _3144;
            _3252 = _3146;
            _3254 = _3148;
            _3256 = _3150;
            _3218 = _3260;
            _3220 = _3262;
            _3222 = _3264;
            _3224 = _3266;
            _3258 = true;
        }
    }
    if ((!_3258) || _3240)
    {
        bool _3268;
        if (!_3240)
        {
            _3268 = _3196 >= 1;
        }
        if ((!_3268) || _3240)
        {
            if (!_3240)
            {
                bool _3270 = _3196 != 0;
                if (!_3270)
                {
                    float _3272 = _107 + _3144;
                    _3202 = _3272;
                }
                float _3274 = _3202;
                _3250 = _3274;
                if (!_3270)
                {
                    float _3276 = _109 + _3146;
                    _3204 = _3276;
                }
                float _3278 = _3204;
                _3252 = _3278;
                if (!_3270)
                {
                    float _3280 = _111 + _3148;
                    _3206 = _3280;
                }
                float _3282 = _3206;
                _3254 = _3282;
                if (!_3270)
                {
                    float _3284 = _3150 + 1.0;
                    _3208 = _3284;
                }
                float _3286 = _3208;
                bool _3288 = !_3270;
                _3256 = _3286;
                _3258 = _3288;
            }
            if ((!_3258) || _3240)
            {
                _3240 = false;
                _3250 = _3144;
                _3252 = _3146;
                _3254 = _3148;
                _3256 = _3150;
                _3258 = true;
            }
        }
        else
        {
            float _3290 = _107 + _3160;
            float _3292 = _109 + _3162;
            float _3294 = _111 + _3164;
            float _3296 = _3166 + 1.0;
            _3250 = _3144;
            _3252 = _3146;
            _3254 = _3148;
            _3256 = _3150;
            _3226 = _3290;
            _3228 = _3292;
            _3230 = _3294;
            _3232 = _3296;
        }
    }
    _3258 = false;
    float _3298 = _3210;
    float _3300 = _3212;
    float _3302 = _3214;
    float _3304 = _3216;
    float _3306 = _3250;
    float _3308 = _3252;
    float _3310 = _3254;
    float _3312 = _3256;
    float _3314 = _3218;
    float _3316 = _3220;
    float _3318 = _3222;
    float _3320 = _3224;
    float _3322 = _3226;
    float _3324 = _3228;
    float _3326 = _3230;
    float _3328 = _3232;
    float _3330 = -_2517;
    float _3332 = _119 + _3330;
    float _3334 = -_2521;
    float _3336 = _117 + _3334;
    float _3338 = _2531 * _3332;
    float _3340 = -_2525;
    float _3342 = _121 + _3340;
    float _3344 = fma(_2535, _3336, _3338);
    float _3346 = fma(_2539, _3342, _3344);
    float _3348 = _2567 * _3346;
    float _3350 = rint(_3348);
    float _3352 = precise::max(0.0, _3350);
    float _3354 = precise::min(_3352, 3.0);
    float _3356 = trunc(_3354);
    int _3358 = int(_3356);
    bool _3360 = _3358 >= 2;
    bool _3362 = !_3360;
    float _3364 = as_type<float>(_3358);
    float _3366 = _3350;
    float _3368 = _3344;
    float _3370 = _3338;
    float _3372 = _3298;
    float _3374 = _3300;
    float _3376 = _3302;
    float _3378 = _3304;
    float _3380 = _3314;
    float _3382 = _3316;
    float _3384 = _3318;
    float _3386 = _3320;
    float _3388 = _3322;
    float _3390 = _3324;
    float _3392 = _3326;
    float _3394 = _3328;
    float _3412;
    float _3414;
    float _3416;
    float _3418;
    if (!_3362)
    {
        bool _3396 = _3358 >= 3;
        bool _3398 = !_3396;
        if (!_3398)
        {
            bool _3400 = _3358 != 3;
            _3402 = _3400;
            if (!_3402)
            {
                float _3404 = _117 + _3298;
                float _3406 = _119 + _3300;
                float _3408 = _121 + _3302;
                float _3410 = _3304 + 1.0;
                _3372 = _3404;
                _3374 = _3406;
                _3376 = _3408;
                _3378 = _3410;
                _3412 = _3306;
                _3414 = _3308;
                _3416 = _3310;
                _3418 = _3312;
                _3420 = true;
            }
        }
        else
        {
            float _3422 = _117 + _3314;
            float _3424 = _119 + _3316;
            float _3426 = _121 + _3318;
            float _3428 = _3320 + 1.0;
            _3412 = _3306;
            _3414 = _3308;
            _3416 = _3310;
            _3418 = _3312;
            _3380 = _3422;
            _3382 = _3424;
            _3384 = _3426;
            _3386 = _3428;
            _3420 = true;
        }
    }
    if ((!_3420) || _3402)
    {
        bool _3430;
        if (!_3402)
        {
            _3430 = _3358 >= 1;
        }
        if ((!_3430) || _3402)
        {
            if (!_3402)
            {
                bool _3432 = _3358 != 0;
                if (!_3432)
                {
                    float _3434 = _117 + _3306;
                    _3364 = _3434;
                }
                float _3436 = _3364;
                _3412 = _3436;
                if (!_3432)
                {
                    float _3438 = _119 + _3308;
                    _3366 = _3438;
                }
                float _3440 = _3366;
                _3414 = _3440;
                if (!_3432)
                {
                    float _3442 = _121 + _3310;
                    _3368 = _3442;
                }
                float _3444 = _3368;
                _3416 = _3444;
                if (!_3432)
                {
                    float _3446 = _3312 + 1.0;
                    _3370 = _3446;
                }
                float _3448 = _3370;
                bool _3450 = !_3432;
                _3418 = _3448;
                _3420 = _3450;
            }
            if ((!_3420) || _3402)
            {
                _3402 = false;
                _3412 = _3306;
                _3414 = _3308;
                _3416 = _3310;
                _3418 = _3312;
                _3420 = true;
            }
        }
        else
        {
            float _3452 = _117 + _3322;
            float _3454 = _119 + _3324;
            float _3456 = _121 + _3326;
            float _3458 = _3328 + 1.0;
            _3412 = _3306;
            _3414 = _3308;
            _3416 = _3310;
            _3418 = _3312;
            _3388 = _3452;
            _3390 = _3454;
            _3392 = _3456;
            _3394 = _3458;
        }
    }
    _3420 = false;
    float _3460 = _3372;
    float _3462 = _3374;
    float _3464 = _3376;
    float _3466 = _3378;
    float _3468 = _3412;
    float _3470 = _3414;
    float _3472 = _3416;
    float _3474 = _3418;
    float _3476 = _3380;
    float _3478 = _3382;
    float _3480 = _3384;
    float _3482 = _3386;
    float _3484 = _3388;
    float _3486 = _3390;
    float _3488 = _3392;
    float _3490 = _3394;
    float _3492 = -_2517;
    float _3494 = _129 + _3492;
    float _3496 = -_2521;
    float _3498 = _127 + _3496;
    float _3500 = _2531 * _3494;
    float _3502 = -_2525;
    float _3504 = _131 + _3502;
    float _3506 = fma(_2535, _3498, _3500);
    float _3508 = fma(_2539, _3504, _3506);
    float _3510 = _2567 * _3508;
    float _3512 = rint(_3510);
    float _3514 = precise::max(0.0, _3512);
    float _3516 = precise::min(_3514, 3.0);
    float _3518 = trunc(_3516);
    int _3520 = int(_3518);
    bool _3522 = _3520 >= 2;
    bool _3524 = !_3522;
    float _3526 = _3512;
    float _3528 = as_type<float>(_3520);
    float _3530 = _3500;
    float _3532 = _3506;
    float _3534 = _3460;
    float _3536 = _3462;
    float _3538 = _3464;
    float _3540 = _3466;
    float _3542 = _3476;
    float _3544 = _3478;
    float _3546 = _3480;
    float _3548 = _3482;
    float _3550 = _3484;
    float _3552 = _3486;
    float _3554 = _3488;
    float _3556 = _3490;
    float _3574;
    float _3576;
    float _3578;
    float _3580;
    if (!_3524)
    {
        bool _3558 = _3520 >= 3;
        bool _3560 = !_3558;
        if (!_3560)
        {
            bool _3562 = _3520 != 3;
            _3564 = _3562;
            if (!_3564)
            {
                float _3566 = _127 + _3460;
                float _3568 = _129 + _3462;
                float _3570 = _131 + _3464;
                float _3572 = _3466 + 1.0;
                _3534 = _3566;
                _3536 = _3568;
                _3538 = _3570;
                _3540 = _3572;
                _3574 = _3468;
                _3576 = _3470;
                _3578 = _3472;
                _3580 = _3474;
                _3582 = true;
            }
        }
        else
        {
            float _3584 = _127 + _3476;
            float _3586 = _129 + _3478;
            float _3588 = _131 + _3480;
            float _3590 = _3482 + 1.0;
            _3574 = _3468;
            _3576 = _3470;
            _3578 = _3472;
            _3580 = _3474;
            _3542 = _3584;
            _3544 = _3586;
            _3546 = _3588;
            _3548 = _3590;
            _3582 = true;
        }
    }
    if ((!_3582) || _3564)
    {
        bool _3592;
        if (!_3564)
        {
            _3592 = _3520 >= 1;
        }
        if ((!_3592) || _3564)
        {
            if (!_3564)
            {
                bool _3594 = _3520 != 0;
                if (!_3594)
                {
                    float _3596 = _127 + _3468;
                    _3526 = _3596;
                }
                float _3598 = _3526;
                _3574 = _3598;
                if (!_3594)
                {
                    float _3600 = _129 + _3470;
                    _3528 = _3600;
                }
                float _3602 = _3528;
                _3576 = _3602;
                if (!_3594)
                {
                    float _3604 = _131 + _3472;
                    _3530 = _3604;
                }
                float _3606 = _3530;
                _3578 = _3606;
                if (!_3594)
                {
                    float _3608 = _3474 + 1.0;
                    _3532 = _3608;
                }
                float _3610 = _3532;
                bool _3612 = !_3594;
                _3580 = _3610;
                _3582 = _3612;
            }
            if ((!_3582) || _3564)
            {
                _3564 = false;
                _3574 = _3468;
                _3576 = _3470;
                _3578 = _3472;
                _3580 = _3474;
                _3582 = true;
            }
        }
        else
        {
            float _3614 = _127 + _3484;
            float _3616 = _129 + _3486;
            float _3618 = _131 + _3488;
            float _3620 = _3490 + 1.0;
            _3574 = _3468;
            _3576 = _3470;
            _3578 = _3472;
            _3580 = _3474;
            _3550 = _3614;
            _3552 = _3616;
            _3554 = _3618;
            _3556 = _3620;
        }
    }
    _3582 = false;
    float _3622 = _3534;
    float _3624 = _3536;
    float _3626 = _3538;
    float _3628 = _3540;
    float _3630 = _3574;
    float _3632 = _3576;
    float _3634 = _3578;
    float _3636 = _3580;
    float _3638 = _3542;
    float _3640 = _3544;
    float _3642 = _3546;
    float _3644 = _3548;
    float _3646 = _3550;
    float _3648 = _3552;
    float _3650 = _3554;
    float _3652 = _3556;
    float _3654 = -_2517;
    float _3656 = _139 + _3654;
    float _3658 = -_2521;
    float _3660 = _137 + _3658;
    float _3662 = _2531 * _3656;
    float _3664 = -_2525;
    float _3666 = _141 + _3664;
    float _3668 = fma(_2535, _3660, _3662);
    float _3670 = fma(_2539, _3666, _3668);
    float _3672 = _2567 * _3670;
    float _3674 = rint(_3672);
    float _3676 = precise::max(0.0, _3674);
    float _3678 = precise::min(_3676, 3.0);
    float _3680 = trunc(_3678);
    int _3682 = int(_3680);
    bool _3684 = _3682 >= 2;
    bool _3686 = !_3684;
    float _3688 = _3662;
    float _3690 = _3668;
    float _3692 = _3674;
    float _3694 = as_type<float>(_3682);
    float _3696 = _3622;
    float _3698 = _3624;
    float _3700 = _3626;
    float _3702 = _3628;
    float _3704 = _3638;
    float _3706 = _3640;
    float _3708 = _3642;
    float _3710 = _3644;
    float _3712 = _3646;
    float _3714 = _3648;
    float _3716 = _3650;
    float _3718 = _3652;
    float _3736;
    float _3738;
    float _3740;
    float _3742;
    if (!_3686)
    {
        bool _3720 = _3682 >= 3;
        bool _3722 = !_3720;
        if (!_3722)
        {
            bool _3724 = _3682 != 3;
            _3726 = _3724;
            if (!_3726)
            {
                float _3728 = _137 + _3622;
                float _3730 = _139 + _3624;
                float _3732 = _141 + _3626;
                float _3734 = _3628 + 1.0;
                _3696 = _3728;
                _3698 = _3730;
                _3700 = _3732;
                _3702 = _3734;
                _3736 = _3630;
                _3738 = _3632;
                _3740 = _3634;
                _3742 = _3636;
                _3744 = true;
            }
        }
        else
        {
            float _3746 = _137 + _3638;
            float _3748 = _139 + _3640;
            float _3750 = _141 + _3642;
            float _3752 = _3644 + 1.0;
            _3736 = _3630;
            _3738 = _3632;
            _3740 = _3634;
            _3742 = _3636;
            _3704 = _3746;
            _3706 = _3748;
            _3708 = _3750;
            _3710 = _3752;
            _3744 = true;
        }
    }
    if ((!_3744) || _3726)
    {
        bool _3754;
        if (!_3726)
        {
            _3754 = _3682 >= 1;
        }
        if ((!_3754) || _3726)
        {
            if (!_3726)
            {
                bool _3756 = _3682 != 0;
                if (!_3756)
                {
                    float _3758 = _137 + _3630;
                    _3688 = _3758;
                }
                float _3760 = _3688;
                _3736 = _3760;
                if (!_3756)
                {
                    float _3762 = _139 + _3632;
                    _3690 = _3762;
                }
                float _3764 = _3690;
                _3738 = _3764;
                if (!_3756)
                {
                    float _3766 = _141 + _3634;
                    _3692 = _3766;
                }
                float _3768 = _3692;
                _3740 = _3768;
                if (!_3756)
                {
                    float _3770 = _3636 + 1.0;
                    _3694 = _3770;
                }
                float _3772 = _3694;
                bool _3774 = !_3756;
                _3742 = _3772;
                _3744 = _3774;
            }
            if ((!_3744) || _3726)
            {
                _3726 = false;
                _3736 = _3630;
                _3738 = _3632;
                _3740 = _3634;
                _3742 = _3636;
                _3744 = true;
            }
        }
        else
        {
            float _3776 = _137 + _3646;
            float _3778 = _139 + _3648;
            float _3780 = _141 + _3650;
            float _3782 = _3652 + 1.0;
            _3736 = _3630;
            _3738 = _3632;
            _3740 = _3634;
            _3742 = _3636;
            _3712 = _3776;
            _3714 = _3778;
            _3716 = _3780;
            _3718 = _3782;
        }
    }
    _3744 = false;
    float _3784 = _3696;
    float _3786 = _3698;
    float _3788 = _3700;
    float _3790 = _3702;
    float _3792 = _3736;
    float _3794 = _3738;
    float _3796 = _3740;
    float _3798 = _3742;
    float _3800 = _3704;
    float _3802 = _3706;
    float _3804 = _3708;
    float _3806 = _3710;
    float _3808 = _3712;
    float _3810 = _3714;
    float _3812 = _3716;
    float _3814 = _3718;
    float _3816 = -_2517;
    float _3818 = _149 + _3816;
    float _3820 = -_2521;
    float _3822 = _147 + _3820;
    float _3824 = _2531 * _3818;
    float _3826 = -_2525;
    float _3828 = _151 + _3826;
    float _3830 = fma(_2535, _3822, _3824);
    float _3832 = fma(_2539, _3828, _3830);
    float _3834 = _2567 * _3832;
    float _3836 = rint(_3834);
    float _3838 = precise::max(0.0, _3836);
    float _3840 = precise::min(_3838, 3.0);
    float _3842 = trunc(_3840);
    int _3844 = int(_3842);
    bool _3846 = _3844 >= 2;
    bool _3848 = !_3846;
    float _3850 = _3836;
    float _3852 = as_type<float>(_3844);
    float _3854 = _3824;
    float _3856 = _3830;
    float _3858 = _3784;
    float _3860 = _3786;
    float _3862 = _3788;
    float _3864 = _3790;
    float _3866 = _3800;
    float _3868 = _3802;
    float _3870 = _3804;
    float _3872 = _3806;
    float _3874 = _3808;
    float _3876 = _3810;
    float _3878 = _3812;
    float _3880 = _3814;
    float _3898;
    float _3900;
    float _3902;
    float _3904;
    if (!_3848)
    {
        bool _3882 = _3844 >= 3;
        bool _3884 = !_3882;
        if (!_3884)
        {
            bool _3886 = _3844 != 3;
            _3888 = _3886;
            if (!_3888)
            {
                float _3890 = _147 + _3784;
                float _3892 = _149 + _3786;
                float _3894 = _151 + _3788;
                float _3896 = _3790 + 1.0;
                _3858 = _3890;
                _3860 = _3892;
                _3862 = _3894;
                _3864 = _3896;
                _3898 = _3792;
                _3900 = _3794;
                _3902 = _3796;
                _3904 = _3798;
                _3906 = true;
            }
        }
        else
        {
            float _3908 = _147 + _3800;
            float _3910 = _149 + _3802;
            float _3912 = _151 + _3804;
            float _3914 = _3806 + 1.0;
            _3898 = _3792;
            _3900 = _3794;
            _3902 = _3796;
            _3904 = _3798;
            _3866 = _3908;
            _3868 = _3910;
            _3870 = _3912;
            _3872 = _3914;
            _3906 = true;
        }
    }
    if ((!_3906) || _3888)
    {
        bool _3916;
        if (!_3888)
        {
            _3916 = _3844 >= 1;
        }
        if ((!_3916) || _3888)
        {
            if (!_3888)
            {
                bool _3918 = _3844 != 0;
                if (!_3918)
                {
                    float _3920 = _147 + _3792;
                    _3850 = _3920;
                }
                float _3922 = _3850;
                _3898 = _3922;
                if (!_3918)
                {
                    float _3924 = _149 + _3794;
                    _3852 = _3924;
                }
                float _3926 = _3852;
                _3900 = _3926;
                if (!_3918)
                {
                    float _3928 = _151 + _3796;
                    _3854 = _3928;
                }
                float _3930 = _3854;
                _3902 = _3930;
                if (!_3918)
                {
                    float _3932 = _3798 + 1.0;
                    _3856 = _3932;
                }
                float _3934 = _3856;
                bool _3936 = !_3918;
                _3904 = _3934;
                _3906 = _3936;
            }
            if ((!_3906) || _3888)
            {
                _3888 = false;
                _3898 = _3792;
                _3900 = _3794;
                _3902 = _3796;
                _3904 = _3798;
                _3906 = true;
            }
        }
        else
        {
            float _3938 = _147 + _3808;
            float _3940 = _149 + _3810;
            float _3942 = _151 + _3812;
            float _3944 = _3814 + 1.0;
            _3898 = _3792;
            _3900 = _3794;
            _3902 = _3796;
            _3904 = _3798;
            _3874 = _3938;
            _3876 = _3940;
            _3878 = _3942;
            _3880 = _3944;
        }
    }
    _3906 = false;
    float _3946 = _3858;
    float _3948 = _3860;
    float _3950 = _3862;
    float _3952 = _3864;
    float _3954 = _3898;
    float _3956 = _3900;
    float _3958 = _3902;
    float _3960 = _3904;
    float _3962 = _3866;
    float _3964 = _3868;
    float _3966 = _3870;
    float _3968 = _3872;
    float _3970 = _3874;
    float _3972 = _3876;
    float _3974 = _3878;
    float _3976 = _3880;
    float _3978 = -_2517;
    float _3980 = _159 + _3978;
    float _3982 = -_2521;
    float _3984 = _157 + _3982;
    float _3986 = _2531 * _3980;
    float _3988 = -_2525;
    float _3990 = _161 + _3988;
    float _3992 = fma(_2535, _3984, _3986);
    float _3994 = fma(_2539, _3990, _3992);
    float _3996 = _2567 * _3994;
    float _3998 = rint(_3996);
    float _4000 = precise::max(0.0, _3998);
    float _4002 = precise::min(_4000, 3.0);
    float _4004 = trunc(_4002);
    int _4006 = int(_4004);
    bool _4008 = _4006 >= 2;
    bool _4010 = !_4008;
    float _4012 = as_type<float>(_4006);
    float _4014 = _3998;
    float _4016 = _3992;
    float _4018 = _3986;
    float _4020 = _3946;
    float _4022 = _3948;
    float _4024 = _3950;
    float _4026 = _3952;
    float _4028 = _3962;
    float _4030 = _3964;
    float _4032 = _3966;
    float _4034 = _3968;
    float _4036 = _3970;
    float _4038 = _3972;
    float _4040 = _3974;
    float _4042 = _3976;
    float _4060;
    float _4062;
    float _4064;
    float _4066;
    if (!_4010)
    {
        bool _4044 = _4006 >= 3;
        bool _4046 = !_4044;
        if (!_4046)
        {
            bool _4048 = _4006 != 3;
            _4050 = _4048;
            if (!_4050)
            {
                float _4052 = _157 + _3946;
                float _4054 = _159 + _3948;
                float _4056 = _161 + _3950;
                float _4058 = _3952 + 1.0;
                _4020 = _4052;
                _4022 = _4054;
                _4024 = _4056;
                _4026 = _4058;
                _4060 = _3954;
                _4062 = _3956;
                _4064 = _3958;
                _4066 = _3960;
                _4068 = true;
            }
        }
        else
        {
            float _4070 = _157 + _3962;
            float _4072 = _159 + _3964;
            float _4074 = _161 + _3966;
            float _4076 = _3968 + 1.0;
            _4060 = _3954;
            _4062 = _3956;
            _4064 = _3958;
            _4066 = _3960;
            _4028 = _4070;
            _4030 = _4072;
            _4032 = _4074;
            _4034 = _4076;
            _4068 = true;
        }
    }
    if ((!_4068) || _4050)
    {
        bool _4078;
        if (!_4050)
        {
            _4078 = _4006 >= 1;
        }
        if ((!_4078) || _4050)
        {
            if (!_4050)
            {
                bool _4080 = _4006 != 0;
                if (!_4080)
                {
                    float _4082 = _157 + _3954;
                    _4012 = _4082;
                }
                float _4084 = _4012;
                _4060 = _4084;
                if (!_4080)
                {
                    float _4086 = _159 + _3956;
                    _4014 = _4086;
                }
                float _4088 = _4014;
                _4062 = _4088;
                if (!_4080)
                {
                    float _4090 = _161 + _3958;
                    _4016 = _4090;
                }
                float _4092 = _4016;
                _4064 = _4092;
                if (!_4080)
                {
                    float _4094 = _3960 + 1.0;
                    _4018 = _4094;
                }
                float _4096 = _4018;
                bool _4098 = !_4080;
                _4066 = _4096;
                _4068 = _4098;
            }
            if ((!_4068) || _4050)
            {
                _4050 = false;
                _4060 = _3954;
                _4062 = _3956;
                _4064 = _3958;
                _4066 = _3960;
                _4068 = true;
            }
        }
        else
        {
            float _4100 = _157 + _3970;
            float _4102 = _159 + _3972;
            float _4104 = _161 + _3974;
            float _4106 = _3976 + 1.0;
            _4060 = _3954;
            _4062 = _3956;
            _4064 = _3958;
            _4066 = _3960;
            _4036 = _4100;
            _4038 = _4102;
            _4040 = _4104;
            _4042 = _4106;
        }
    }
    _4068 = false;
    float _4108 = _4020;
    float _4110 = _4022;
    float _4112 = _4024;
    float _4114 = _4026;
    float _4116 = _4060;
    float _4118 = _4062;
    float _4120 = _4064;
    float _4122 = _4066;
    float _4124 = _4028;
    float _4126 = _4030;
    float _4128 = _4032;
    float _4130 = _4034;
    float _4132 = _4036;
    float _4134 = _4038;
    float _4136 = _4040;
    float _4138 = _4042;
    float _4140 = -_2517;
    float _4142 = _169 + _4140;
    float _4144 = -_2521;
    float _4146 = _167 + _4144;
    float _4148 = _2531 * _4142;
    float _4150 = -_2525;
    float _4152 = _171 + _4150;
    float _4154 = fma(_2535, _4146, _4148);
    float _4156 = fma(_2539, _4152, _4154);
    float _4158 = _2567 * _4156;
    float _4160 = rint(_4158);
    float _4162 = precise::max(0.0, _4160);
    float _4164 = precise::min(_4162, 3.0);
    float _4166 = trunc(_4164);
    int _4168 = int(_4166);
    bool _4170 = _4168 >= 2;
    bool _4172 = !_4170;
    float _4174 = _4160;
    float _4176 = as_type<float>(_4168);
    float _4178 = _4148;
    float _4180 = _4154;
    float _4182 = _4108;
    float _4184 = _4110;
    float _4186 = _4112;
    float _4188 = _4114;
    float _4190 = _4124;
    float _4192 = _4126;
    float _4194 = _4128;
    float _4196 = _4130;
    float _4198 = _4132;
    float _4200 = _4134;
    float _4202 = _4136;
    float _4204 = _4138;
    float _4222;
    float _4224;
    float _4226;
    float _4228;
    if (!_4172)
    {
        bool _4206 = _4168 >= 3;
        bool _4208 = !_4206;
        if (!_4208)
        {
            bool _4210 = _4168 != 3;
            _4212 = _4210;
            if (!_4212)
            {
                float _4214 = _167 + _4108;
                float _4216 = _169 + _4110;
                float _4218 = _171 + _4112;
                float _4220 = _4114 + 1.0;
                _4182 = _4214;
                _4184 = _4216;
                _4186 = _4218;
                _4188 = _4220;
                _4222 = _4116;
                _4224 = _4118;
                _4226 = _4120;
                _4228 = _4122;
                _4230 = true;
            }
        }
        else
        {
            float _4232 = _167 + _4124;
            float _4234 = _169 + _4126;
            float _4236 = _171 + _4128;
            float _4238 = _4130 + 1.0;
            _4222 = _4116;
            _4224 = _4118;
            _4226 = _4120;
            _4228 = _4122;
            _4190 = _4232;
            _4192 = _4234;
            _4194 = _4236;
            _4196 = _4238;
            _4230 = true;
        }
    }
    if ((!_4230) || _4212)
    {
        bool _4240;
        if (!_4212)
        {
            _4240 = _4168 >= 1;
        }
        if ((!_4240) || _4212)
        {
            if (!_4212)
            {
                bool _4242 = _4168 != 0;
                if (!_4242)
                {
                    float _4244 = _167 + _4116;
                    _4174 = _4244;
                }
                float _4246 = _4174;
                _4222 = _4246;
                if (!_4242)
                {
                    float _4248 = _169 + _4118;
                    _4176 = _4248;
                }
                float _4250 = _4176;
                _4224 = _4250;
                if (!_4242)
                {
                    float _4252 = _171 + _4120;
                    _4178 = _4252;
                }
                float _4254 = _4178;
                _4226 = _4254;
                if (!_4242)
                {
                    float _4256 = _4122 + 1.0;
                    _4180 = _4256;
                }
                float _4258 = _4180;
                bool _4260 = !_4242;
                _4228 = _4258;
                _4230 = _4260;
            }
            if ((!_4230) || _4212)
            {
                _4212 = false;
                _4222 = _4116;
                _4224 = _4118;
                _4226 = _4120;
                _4228 = _4122;
                _4230 = true;
            }
        }
        else
        {
            float _4262 = _167 + _4132;
            float _4264 = _169 + _4134;
            float _4266 = _171 + _4136;
            float _4268 = _4138 + 1.0;
            _4222 = _4116;
            _4224 = _4118;
            _4226 = _4120;
            _4228 = _4122;
            _4198 = _4262;
            _4200 = _4264;
            _4202 = _4266;
            _4204 = _4268;
        }
    }
    _4230 = false;
    float _4270 = _4182;
    float _4272 = _4184;
    float _4274 = _4186;
    float _4276 = _4188;
    float _4278 = _4222;
    float _4280 = _4224;
    float _4282 = _4226;
    float _4284 = _4228;
    float _4286 = _4190;
    float _4288 = _4192;
    float _4290 = _4194;
    float _4292 = _4196;
    float _4294 = _4198;
    float _4296 = _4200;
    float _4298 = _4202;
    float _4300 = _4204;
    float _4302 = -_2517;
    float _4304 = _179 + _4302;
    float _4306 = -_2521;
    float _4308 = _177 + _4306;
    float _4310 = _2531 * _4304;
    float _4312 = -_2525;
    float _4314 = _181 + _4312;
    float _4316 = fma(_2535, _4308, _4310);
    float _4318 = fma(_2539, _4314, _4316);
    float _4320 = _2567 * _4318;
    float _4322 = rint(_4320);
    float _4324 = precise::max(0.0, _4322);
    float _4326 = precise::min(_4324, 3.0);
    float _4328 = trunc(_4326);
    int _4330 = int(_4328);
    bool _4332 = _4330 >= 2;
    bool _4334 = !_4332;
    float _4336 = as_type<float>(_4330);
    float _4338 = _4322;
    float _4340 = _4316;
    float _4342 = _4310;
    float _4344 = _4270;
    float _4346 = _4272;
    float _4348 = _4274;
    float _4350 = _4276;
    float _4352 = _4286;
    float _4354 = _4288;
    float _4356 = _4290;
    float _4358 = _4292;
    float _4360 = _4294;
    float _4362 = _4296;
    float _4364 = _4298;
    float _4366 = _4300;
    float _4384;
    float _4386;
    float _4388;
    float _4390;
    if (!_4334)
    {
        bool _4368 = _4330 >= 3;
        bool _4370 = !_4368;
        if (!_4370)
        {
            bool _4372 = _4330 != 3;
            _4374 = _4372;
            if (!_4374)
            {
                float _4376 = _177 + _4270;
                float _4378 = _179 + _4272;
                float _4380 = _181 + _4274;
                float _4382 = _4276 + 1.0;
                _4344 = _4376;
                _4346 = _4378;
                _4348 = _4380;
                _4350 = _4382;
                _4384 = _4278;
                _4386 = _4280;
                _4388 = _4282;
                _4390 = _4284;
                _4392 = true;
            }
        }
        else
        {
            float _4394 = _177 + _4286;
            float _4396 = _179 + _4288;
            float _4398 = _181 + _4290;
            float _4400 = _4292 + 1.0;
            _4384 = _4278;
            _4386 = _4280;
            _4388 = _4282;
            _4390 = _4284;
            _4352 = _4394;
            _4354 = _4396;
            _4356 = _4398;
            _4358 = _4400;
            _4392 = true;
        }
    }
    if ((!_4392) || _4374)
    {
        bool _4402;
        if (!_4374)
        {
            _4402 = _4330 >= 1;
        }
        if ((!_4402) || _4374)
        {
            if (!_4374)
            {
                bool _4404 = _4330 != 0;
                if (!_4404)
                {
                    float _4406 = _177 + _4278;
                    _4336 = _4406;
                }
                float _4408 = _4336;
                _4384 = _4408;
                if (!_4404)
                {
                    float _4410 = _179 + _4280;
                    _4338 = _4410;
                }
                float _4412 = _4338;
                _4386 = _4412;
                if (!_4404)
                {
                    float _4414 = _181 + _4282;
                    _4340 = _4414;
                }
                float _4416 = _4340;
                _4388 = _4416;
                if (!_4404)
                {
                    float _4418 = _4284 + 1.0;
                    _4342 = _4418;
                }
                float _4420 = _4342;
                bool _4422 = !_4404;
                _4390 = _4420;
                _4392 = _4422;
            }
            if ((!_4392) || _4374)
            {
                _4374 = false;
                _4384 = _4278;
                _4386 = _4280;
                _4388 = _4282;
                _4390 = _4284;
                _4392 = true;
            }
        }
        else
        {
            float _4424 = _177 + _4294;
            float _4426 = _179 + _4296;
            float _4428 = _181 + _4298;
            float _4430 = _4300 + 1.0;
            _4384 = _4278;
            _4386 = _4280;
            _4388 = _4282;
            _4390 = _4284;
            _4360 = _4424;
            _4362 = _4426;
            _4364 = _4428;
            _4366 = _4430;
        }
    }
    _4392 = false;
    float _4432 = _4344;
    float _4434 = _4346;
    float _4436 = _4348;
    float _4438 = _4350;
    float _4440 = _4384;
    float _4442 = _4386;
    float _4444 = _4388;
    float _4446 = _4390;
    float _4448 = _4352;
    float _4450 = _4354;
    float _4452 = _4356;
    float _4454 = _4358;
    float _4456 = _4360;
    float _4458 = _4362;
    float _4460 = _4364;
    float _4462 = _4366;
    float _4464 = -_2517;
    float _4466 = _189 + _4464;
    float _4468 = -_2521;
    float _4470 = _187 + _4468;
    float _4472 = _2531 * _4466;
    float _4474 = -_2525;
    float _4476 = _191 + _4474;
    float _4478 = fma(_2535, _4470, _4472);
    float _4480 = fma(_2539, _4476, _4478);
    float _4482 = _2567 * _4480;
    float _4484 = rint(_4482);
    float _4486 = precise::max(0.0, _4484);
    float _4488 = precise::min(_4486, 3.0);
    float _4490 = trunc(_4488);
    int _4492 = int(_4490);
    bool _4494 = _4492 >= 2;
    bool _4496 = !_4494;
    float _4498 = _4484;
    float _4500 = as_type<float>(_4492);
    float _4502 = _4472;
    float _4504 = _4478;
    float _4506 = _4432;
    float _4508 = _4434;
    float _4510 = _4436;
    float _4512 = _4438;
    float _4514 = _4448;
    float _4516 = _4450;
    float _4518 = _4452;
    float _4520 = _4454;
    float _4522 = _4456;
    float _4524 = _4458;
    float _4526 = _4460;
    float _4528 = _4462;
    float _4546;
    float _4548;
    float _4550;
    float _4552;
    if (!_4496)
    {
        bool _4530 = _4492 >= 3;
        bool _4532 = !_4530;
        if (!_4532)
        {
            bool _4534 = _4492 != 3;
            _4536 = _4534;
            if (!_4536)
            {
                float _4538 = _187 + _4432;
                float _4540 = _189 + _4434;
                float _4542 = _191 + _4436;
                float _4544 = _4438 + 1.0;
                _4506 = _4538;
                _4508 = _4540;
                _4510 = _4542;
                _4512 = _4544;
                _4546 = _4440;
                _4548 = _4442;
                _4550 = _4444;
                _4552 = _4446;
                _4554 = true;
            }
        }
        else
        {
            float _4556 = _187 + _4448;
            float _4558 = _189 + _4450;
            float _4560 = _191 + _4452;
            float _4562 = _4454 + 1.0;
            _4546 = _4440;
            _4548 = _4442;
            _4550 = _4444;
            _4552 = _4446;
            _4514 = _4556;
            _4516 = _4558;
            _4518 = _4560;
            _4520 = _4562;
            _4554 = true;
        }
    }
    if ((!_4554) || _4536)
    {
        bool _4564;
        if (!_4536)
        {
            _4564 = _4492 >= 1;
        }
        if ((!_4564) || _4536)
        {
            if (!_4536)
            {
                bool _4566 = _4492 != 0;
                if (!_4566)
                {
                    float _4568 = _187 + _4440;
                    _4498 = _4568;
                }
                float _4570 = _4498;
                _4546 = _4570;
                if (!_4566)
                {
                    float _4572 = _189 + _4442;
                    _4500 = _4572;
                }
                float _4574 = _4500;
                _4548 = _4574;
                if (!_4566)
                {
                    float _4576 = _191 + _4444;
                    _4502 = _4576;
                }
                float _4578 = _4502;
                _4550 = _4578;
                if (!_4566)
                {
                    float _4580 = _4446 + 1.0;
                    _4504 = _4580;
                }
                float _4582 = _4504;
                bool _4584 = !_4566;
                _4552 = _4582;
                _4554 = _4584;
            }
            if ((!_4554) || _4536)
            {
                _4536 = false;
                _4546 = _4440;
                _4548 = _4442;
                _4550 = _4444;
                _4552 = _4446;
                _4554 = true;
            }
        }
        else
        {
            float _4586 = _187 + _4456;
            float _4588 = _189 + _4458;
            float _4590 = _191 + _4460;
            float _4592 = _4462 + 1.0;
            _4546 = _4440;
            _4548 = _4442;
            _4550 = _4444;
            _4552 = _4446;
            _4522 = _4586;
            _4524 = _4588;
            _4526 = _4590;
            _4528 = _4592;
        }
    }
    _4554 = false;
    float _4594 = _4506;
    float _4596 = _4508;
    float _4598 = _4510;
    float _4600 = _4512;
    float _4602 = _4546;
    float _4604 = _4548;
    float _4606 = _4550;
    float _4608 = _4552;
    float _4610 = _4514;
    float _4612 = _4516;
    float _4614 = _4518;
    float _4616 = _4520;
    float _4618 = _4522;
    float _4620 = _4524;
    float _4622 = _4526;
    float _4624 = _4528;
    float _4626 = -_2517;
    float _4628 = _199 + _4626;
    float _4630 = -_2521;
    float _4632 = _197 + _4630;
    float _4634 = _2531 * _4628;
    float _4636 = -_2525;
    float _4638 = _201 + _4636;
    float _4640 = fma(_2535, _4632, _4634);
    float _4642 = fma(_2539, _4638, _4640);
    float _4644 = _2567 * _4642;
    float _4646 = rint(_4644);
    float _4648 = precise::max(0.0, _4646);
    float _4650 = precise::min(_4648, 3.0);
    float _4652 = trunc(_4650);
    int _4654 = int(_4652);
    bool _4656 = _4654 >= 2;
    bool _4658 = !_4656;
    float _4660 = as_type<float>(_4654);
    float _4662 = _4646;
    float _4664 = _4640;
    float _4666 = _4634;
    float _4668 = _4594;
    float _4670 = _4596;
    float _4672 = _4598;
    float _4674 = _4600;
    float _4676 = _4610;
    float _4678 = _4612;
    float _4680 = _4614;
    float _4682 = _4616;
    float _4684 = _4618;
    float _4686 = _4620;
    float _4688 = _4622;
    float _4690 = _4624;
    float _4708;
    float _4710;
    float _4712;
    float _4714;
    if (!_4658)
    {
        bool _4692 = _4654 >= 3;
        bool _4694 = !_4692;
        if (!_4694)
        {
            bool _4696 = _4654 != 3;
            _4698 = _4696;
            if (!_4698)
            {
                float _4700 = _197 + _4594;
                float _4702 = _199 + _4596;
                float _4704 = _201 + _4598;
                float _4706 = _4600 + 1.0;
                _4668 = _4700;
                _4670 = _4702;
                _4672 = _4704;
                _4674 = _4706;
                _4708 = _4602;
                _4710 = _4604;
                _4712 = _4606;
                _4714 = _4608;
                _4716 = true;
            }
        }
        else
        {
            float _4718 = _197 + _4610;
            float _4720 = _199 + _4612;
            float _4722 = _201 + _4614;
            float _4724 = _4616 + 1.0;
            _4708 = _4602;
            _4710 = _4604;
            _4712 = _4606;
            _4714 = _4608;
            _4676 = _4718;
            _4678 = _4720;
            _4680 = _4722;
            _4682 = _4724;
            _4716 = true;
        }
    }
    if ((!_4716) || _4698)
    {
        bool _4726;
        if (!_4698)
        {
            _4726 = _4654 >= 1;
        }
        if ((!_4726) || _4698)
        {
            if (!_4698)
            {
                bool _4728 = _4654 != 0;
                if (!_4728)
                {
                    float _4730 = _197 + _4602;
                    _4660 = _4730;
                }
                float _4732 = _4660;
                _4708 = _4732;
                if (!_4728)
                {
                    float _4734 = _199 + _4604;
                    _4662 = _4734;
                }
                float _4736 = _4662;
                _4710 = _4736;
                if (!_4728)
                {
                    float _4738 = _201 + _4606;
                    _4664 = _4738;
                }
                float _4740 = _4664;
                _4712 = _4740;
                if (!_4728)
                {
                    float _4742 = _4608 + 1.0;
                    _4666 = _4742;
                }
                float _4744 = _4666;
                bool _4746 = !_4728;
                _4714 = _4744;
                _4716 = _4746;
            }
            if ((!_4716) || _4698)
            {
                _4698 = false;
                _4708 = _4602;
                _4710 = _4604;
                _4712 = _4606;
                _4714 = _4608;
                _4716 = true;
            }
        }
        else
        {
            float _4748 = _197 + _4618;
            float _4750 = _199 + _4620;
            float _4752 = _201 + _4622;
            float _4754 = _4624 + 1.0;
            _4708 = _4602;
            _4710 = _4604;
            _4712 = _4606;
            _4714 = _4608;
            _4684 = _4748;
            _4686 = _4750;
            _4688 = _4752;
            _4690 = _4754;
        }
    }
    _4716 = false;
    float _4756 = _4668;
    float _4758 = _4670;
    float _4760 = _4672;
    float _4762 = _4674;
    float _4764 = _4708;
    float _4766 = _4710;
    float _4768 = _4712;
    float _4770 = _4714;
    float _4772 = _4676;
    float _4774 = _4678;
    float _4776 = _4680;
    float _4778 = _4682;
    float _4780 = _4684;
    float _4782 = _4686;
    float _4784 = _4688;
    float _4786 = _4690;
    float _4788 = -_2517;
    float _4790 = _209 + _4788;
    float _4792 = -_2521;
    float _4794 = _207 + _4792;
    float _4796 = _2531 * _4790;
    float _4798 = -_2525;
    float _4800 = _211 + _4798;
    float _4802 = fma(_2535, _4794, _4796);
    float _4804 = fma(_2539, _4800, _4802);
    float _4806 = _2567 * _4804;
    float _4808 = rint(_4806);
    float _4810 = precise::max(0.0, _4808);
    float _4812 = precise::min(_4810, 3.0);
    float _4814 = trunc(_4812);
    int _4816 = int(_4814);
    bool _4818 = _4816 >= 2;
    bool _4820 = !_4818;
    float _4822 = _4808;
    float _4824 = as_type<float>(_4816);
    float _4826 = _4796;
    float _4828 = _4802;
    float _4830 = _4756;
    float _4832 = _4758;
    float _4834 = _4760;
    float _4836 = _4762;
    float _4838 = _4772;
    float _4840 = _4774;
    float _4842 = _4776;
    float _4844 = _4778;
    float _4846 = _4780;
    float _4848 = _4782;
    float _4850 = _4784;
    float _4852 = _4786;
    float _4870;
    float _4872;
    float _4874;
    float _4876;
    if (!_4820)
    {
        bool _4854 = _4816 >= 3;
        bool _4856 = !_4854;
        if (!_4856)
        {
            bool _4858 = _4816 != 3;
            _4860 = _4858;
            if (!_4860)
            {
                float _4862 = _207 + _4756;
                float _4864 = _209 + _4758;
                float _4866 = _211 + _4760;
                float _4868 = _4762 + 1.0;
                _4830 = _4862;
                _4832 = _4864;
                _4834 = _4866;
                _4836 = _4868;
                _4870 = _4764;
                _4872 = _4766;
                _4874 = _4768;
                _4876 = _4770;
                _4878 = true;
            }
        }
        else
        {
            float _4880 = _207 + _4772;
            float _4882 = _209 + _4774;
            float _4884 = _211 + _4776;
            float _4886 = _4778 + 1.0;
            _4870 = _4764;
            _4872 = _4766;
            _4874 = _4768;
            _4876 = _4770;
            _4838 = _4880;
            _4840 = _4882;
            _4842 = _4884;
            _4844 = _4886;
            _4878 = true;
        }
    }
    if ((!_4878) || _4860)
    {
        bool _4888;
        if (!_4860)
        {
            _4888 = _4816 >= 1;
        }
        if ((!_4888) || _4860)
        {
            if (!_4860)
            {
                bool _4890 = _4816 != 0;
                if (!_4890)
                {
                    float _4892 = _207 + _4764;
                    _4822 = _4892;
                }
                float _4894 = _4822;
                _4870 = _4894;
                if (!_4890)
                {
                    float _4896 = _209 + _4766;
                    _4824 = _4896;
                }
                float _4898 = _4824;
                _4872 = _4898;
                if (!_4890)
                {
                    float _4900 = _211 + _4768;
                    _4826 = _4900;
                }
                float _4902 = _4826;
                _4874 = _4902;
                if (!_4890)
                {
                    float _4904 = _4770 + 1.0;
                    _4828 = _4904;
                }
                float _4906 = _4828;
                bool _4908 = !_4890;
                _4876 = _4906;
                _4878 = _4908;
            }
            if ((!_4878) || _4860)
            {
                _4860 = false;
                _4870 = _4764;
                _4872 = _4766;
                _4874 = _4768;
                _4876 = _4770;
                _4878 = true;
            }
        }
        else
        {
            float _4910 = _207 + _4780;
            float _4912 = _209 + _4782;
            float _4914 = _211 + _4784;
            float _4916 = _4786 + 1.0;
            _4870 = _4764;
            _4872 = _4766;
            _4874 = _4768;
            _4876 = _4770;
            _4846 = _4910;
            _4848 = _4912;
            _4850 = _4914;
            _4852 = _4916;
        }
    }
    _4878 = false;
    float _4918 = _4830;
    float _4920 = _4832;
    float _4922 = _4834;
    float _4924 = _4836;
    float _4926 = _4870;
    float _4928 = _4872;
    float _4930 = _4874;
    float _4932 = _4876;
    float _4934 = _4838;
    float _4936 = _4840;
    float _4938 = _4842;
    float _4940 = _4844;
    float _4942 = _4846;
    float _4944 = _4848;
    float _4946 = _4850;
    float _4948 = _4852;
    float _4950 = -_2517;
    float _4952 = _219 + _4950;
    float _4954 = -_2521;
    float _4956 = _217 + _4954;
    float _4958 = _2531 * _4952;
    float _4960 = -_2525;
    float _4962 = _221 + _4960;
    float _4964 = fma(_2535, _4956, _4958);
    float _4966 = fma(_2539, _4962, _4964);
    float _4968 = _2567 * _4966;
    float _4970 = rint(_4968);
    float _4972 = precise::max(0.0, _4970);
    float _4974 = precise::min(_4972, 3.0);
    float _4976 = trunc(_4974);
    int _4978 = int(_4976);
    bool _4980 = _4978 >= 2;
    bool _4982 = !_4980;
    float _4984 = as_type<float>(_4978);
    float _4986 = _4970;
    float _4988 = _4964;
    float _4990 = _4958;
    float _4992 = _4934;
    float _4994 = _4936;
    float _4996 = _4942;
    float _4998 = _4944;
    float _5000 = _4948;
    float _5002 = _4940;
    float _5004 = _4924;
    float _5006 = _4946;
    float _5008 = _4938;
    float _5010 = _4918;
    float _5012 = _4920;
    float _5014 = _4922;
    float _5032;
    float _5034;
    float _5036;
    float _5038;
    if (!_4982)
    {
        bool _5016 = _4978 >= 3;
        bool _5018 = !_5016;
        if (!_5018)
        {
            bool _5020 = _4978 != 3;
            _5022 = _5020;
            if (!_5022)
            {
                float _5024 = _217 + _4918;
                float _5026 = _219 + _4920;
                float _5028 = _221 + _4922;
                float _5030 = _4924 + 1.0;
                _5032 = _4926;
                _5034 = _4932;
                _5004 = _5030;
                _5036 = _4928;
                _5038 = _4930;
                _5010 = _5024;
                _5012 = _5026;
                _5014 = _5028;
                _5040 = true;
            }
        }
        else
        {
            float _5042 = _217 + _4934;
            float _5044 = _219 + _4936;
            float _5046 = _221 + _4938;
            float _5048 = _4940 + 1.0;
            _4992 = _5042;
            _4994 = _5044;
            _5002 = _5048;
            _5032 = _4926;
            _5034 = _4932;
            _5036 = _4928;
            _5008 = _5046;
            _5038 = _4930;
            _5040 = true;
        }
    }
    if ((!_5040) || _5022)
    {
        bool _5050;
        if (!_5022)
        {
            _5050 = _4978 >= 1;
        }
        if ((!_5050) || _5022)
        {
            if (!_5022)
            {
                bool _5052 = _4978 != 0;
                if (!_5052)
                {
                    float _5054 = _217 + _4926;
                    _4984 = _5054;
                }
                float _5056 = _4984;
                _5032 = _5056;
                if (!_5052)
                {
                    float _5058 = _219 + _4928;
                    _4986 = _5058;
                }
                float _5060 = _4986;
                _5036 = _5060;
                if (!_5052)
                {
                    float _5062 = _221 + _4930;
                    _4988 = _5062;
                }
                float _5064 = _4988;
                _5038 = _5064;
                if (!_5052)
                {
                    float _5066 = _4932 + 1.0;
                    _4990 = _5066;
                }
                float _5068 = _4990;
                bool _5070 = !_5052;
                _5034 = _5068;
                _5040 = _5070;
            }
            if ((!_5040) || _5022)
            {
                _5022 = false;
                _5032 = _4926;
                _5034 = _4932;
                _5036 = _4928;
                _5038 = _4930;
                _5040 = true;
            }
        }
        else
        {
            float _5072 = _217 + _4942;
            float _5074 = _219 + _4944;
            float _5076 = _221 + _4946;
            float _5078 = _4948 + 1.0;
            _4996 = _5072;
            _4998 = _5074;
            _5000 = _5078;
            _5032 = _4926;
            _5034 = _4932;
            _5036 = _4928;
            _5006 = _5076;
            _5038 = _4930;
        }
    }
    _5040 = false;
    float _5080 = _4992;
    float _5082 = _4994;
    float _5084 = _4996;
    float _5086 = _4998;
    float _5088 = _5000;
    float _5090 = _5002;
    float _5092 = _5032;
    float _5094 = _5034;
    float _5096 = _5004;
    float _5098 = _5036;
    float _5100 = _5006;
    float _5102 = _5008;
    float _5104 = _5038;
    float _5106 = _5010;
    float _5108 = _5012;
    float _5110 = _5014;
    float _5112 = _5080 * 6.0;
    float _5114 = _5082 * 6.0;
    float _5116 = _5084 * 6.0;
    float _5118 = _5086 * 6.0;
    float _5120 = fma(_5084, 3.0, _5112);
    float _5122 = fma(_5086, 3.0, _5114);
    float _5124 = _5088 * 4.0;
    float _5126 = fma(_5090, 4.0, _5088);
    _24[1] = as_type<uint>(_217);
    float _5128 = fma(_5092, 9.0, _5116);
    float _5130 = fma(_5094, 9.0, _5124);
    float _5132 = fma(_5096, 9.0, _5126);
    _24[0] = as_type<uint>(_221);
    float _5134 = precise::max(_133, _143);
    float _5136 = fma(_5098, 9.0, _5118);
    float _5138 = precise::max(_173, _183);
    float _5140 = _5100 * 6.0;
    float _5142 = precise::max(_113, _123);
    float _5144 = _5102 * 6.0;
    float _5146 = _5090 + _5088;
    float _5148 = precise::max(_153, _163);
    float _5150 = fma(_5104, 9.0, _5140);
    float _5152 = precise::max(_5142, _5134);
    float _5154 = fma(_5100, 3.0, _5144);
    float _5156 = precise::max(_5148, _5138);
    float _5158 = as_type<float>(_24[1]);
    float _5160 = precise::max(_83, _73);
    float _5162 = _5130 + _5090;
    float _5164 = precise::max(_93, _103);
    float _5166 = as_type<float>(_24[0]);
    float _5168 = precise::max(_193, _203);
    float _5170 = _5162 * _5132;
    float _5172 = precise::max(_5160, _5164);
    float _5174 = _5146 * 2.0;
    float _5176 = precise::max(_213, _223);
    float _5178 = -_5170;
    float _5180 = fma(_5174, _5174, _5178);
    bool _5182 = _5180 != 0.0;
    bool _5184 = isnan(_5180);
    bool _5186 = _5182 || _5184;
    bool _5188 = isnan(0.0);
    bool _5190 = _5186 || _5188;
    float _5192 = precise::max(_5168, _5176);
    float _5194 = precise::max(_5172, _5152);
    float _5196 = precise::max(_5156, _5192);
    float _5198 = fma(_5080, 3.0, _5128);
    float _5200 = fma(_5102, 3.0, _5150);
    float _5202 = fma(_5082, 3.0, _5136);
    float _5204 = fma(_5106, 9.0, _5120);
    float _5206 = fma(_5108, 9.0, _5122);
    float _5208 = fma(_5110, 9.0, _5154);
    float _5210 = precise::max(_5194, _5196);
    bool _5212 = !_5190;
    if (!_5212)
    {
        float _5214 = 1.0 / _5180;
        float _5216 = _5162 * _5204;
        float _5218 = _5198 * _5132;
        float _5220 = -_5216;
        float _5222 = fma(_5198, _5174, _5220);
        float _5224 = -_5218;
        float _5226 = fma(_5204, _5174, _5224);
        float _5228 = _5162 * _5206;
        float _5230 = _5202 * _5132;
        float _5232 = _5162 * _5208;
        float _5234 = _5200 * _5132;
        float _5236 = -_5228;
        float _5238 = fma(_5202, _5174, _5236);
        float _5240 = -_5230;
        float _5242 = fma(_5206, _5174, _5240);
        float _5244 = -_5232;
        float _5246 = fma(_5200, _5174, _5244);
        float _5248 = -_5234;
        float _5250 = fma(_5208, _5174, _5248);
        float _5252 = _5242 * _5214;
        float _5254 = _5222 * _5214;
        float _5256 = _5238 * _5214;
        float _5258 = _5246 * _5214;
        float _5260 = _5226 * _5214;
        float _5262 = _5250 * _5214;
        float _5264 = -_5252;
        float _5266 = _5256 + _5264;
        float _5268 = -_5260;
        float _5270 = _5254 + _5268;
        float _5272 = -_5262;
        float _5274 = _5258 + _5272;
        _2586 = _5270;
        _2588 = _5266;
        _2590 = _5274;
        _2592 = _5260;
        _2594 = _5254;
        _2596 = _5252;
        _2598 = _5256;
        _2600 = _5262;
        _2602 = _5258;
    }
    float _5276 = _2586;
    float _5278 = _2588;
    float _5280 = _2590;
    float _5282 = _2592;
    float _5284 = _2594;
    float _5286 = _2596;
    float _5288 = _2598;
    float _5290 = _2600;
    float _5292 = _2602;
    float _5294 = fma(_5276, 496.0, 0.5);
    float _5296 = precise::clamp(_5294, 0.0, 1.0);
    float _5298 = fma(_5278, 1008.0, 0.5);
    float _5300 = precise::clamp(_5298, 0.0, 1.0);
    float _5302 = fma(_5276, -31.0, 1.0);
    float _5304 = precise::clamp(_5302, 0.0, 1.0);
    float _5306 = fma(_5280, 496.0, 0.5);
    float _5308 = precise::clamp(_5306, 0.0, 1.0);
    float _5310 = _5296 + (-0.5);
    float _5312 = fma(_5278, -63.0, 1.0);
    float _5314 = precise::clamp(_5312, 0.0, 1.0);
    float _5316 = _5300 + (-0.5);
    float _5318 = fma(_5280, -31.0, 1.0);
    float _5320 = precise::clamp(_5318, 0.0, 1.0);
    float _5322 = _5304 * _5310;
    float _5324 = _5308 + (-0.5);
    float _5326 = _5314 * _5316;
    float _5328 = _5326 * 2.0;
    float _5330 = _5210 * 255.0;
    float _5332 = fma(_5322, -0.0322580635547637939453125, _5282);
    float _5334 = precise::clamp(_5332, 0.0, 1.0);
    float _5336 = _5320 * _5324;
    float _5338 = fma(_5322, 0.0322580635547637939453125, _5284);
    float _5340 = precise::clamp(_5338, 0.0, 1.0);
    float _5342 = fma(_5328, -0.01587301678955554962158203125, _5286);
    float _5344 = precise::clamp(_5342, 0.0, 1.0);
    float _5346 = fma(_5328, 0.01587301678955554962158203125, _5288);
    float _5348 = precise::clamp(_5346, 0.0, 1.0);
    float _5350 = fma(_5336, -0.0322580635547637939453125, _5290);
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = _5340 * 31.0;
    float _5356 = fma(_5336, 0.0322580635547637939453125, _5292);
    float _5358 = precise::clamp(_5356, 0.0, 1.0);
    float _5360 = _5334 * 31.0;
    float _5362 = _5344 * 63.0;
    float _5364 = _5348 * 63.0;
    float _5366 = _5352 * 31.0;
    float _5368 = _5358 * 31.0;
    float _5370 = trunc(_5330);
    float _5372 = precise::max(_5370, 0.0);
    uint _5375 = uint(_5372);
    float _5377 = precise::min(_83, _73);
    float _5379 = precise::min(_113, _123);
    float _5381 = precise::min(_153, _163);
    float _5383 = precise::min(_173, _183);
    float _5385 = rint(_5354);
    float _5387 = precise::min(_193, _203);
    float _5389 = precise::min(_213, _223);
    float _5391 = precise::min(_5381, _5383);
    float _5393 = precise::min(_5387, _5389);
    float _5395 = rint(_5364);
    float _5397 = precise::min(_5391, _5393);
    float _5399 = rint(_5360);
    float _5401 = _5385 + 0.5;
    float _5403 = rint(_5362);
    float _5405 = _5395 + 0.5;
    float _5407 = rint(_5366);
    float _5409 = _5399 + 0.5;
    float _5411 = rint(_5368);
    float _5413 = precise::min(_93, _103);
    float _5415 = precise::min(_5377, _5413);
    float _5417 = precise::min(_133, _143);
    float _5419 = trunc(_5401);
    float _5421 = precise::max(_5419, 0.0);
    uint _5423 = uint(_5421);
    float _5425 = precise::min(_5379, _5417);
    float _5427 = _5403 + 0.5;
    float _5429 = precise::min(_5415, _5425);
    float _5431 = _5411 + 0.5;
    float _5433 = trunc(_5405);
    float _5435 = precise::max(_5433, 0.0);
    uint _5437 = uint(_5435);
    float _5439 = precise::min(_5429, _5397);
    float _5441 = _5407 + 0.5;
    float _5443 = _5439 * 255.0;
    float _5445 = trunc(_5409);
    float _5447 = precise::max(_5445, 0.0);
    uint _5449 = uint(_5447);
    int _5451 = int(_5423) << 11;
    float _5453 = trunc(_5427);
    float _5455 = precise::max(_5453, 0.0);
    uint _5457 = uint(_5455);
    int _5459 = int(_5437) << 5;
    float _5461 = trunc(_5431);
    float _5463 = precise::max(_5461, 0.0);
    uint _5465 = uint(_5463);
    int _5467 = int(_5449) << 11;
    float _5469 = trunc(_5441);
    float _5471 = precise::max(_5469, 0.0);
    uint _5473 = uint(_5471);
    int _5475 = int(_5457) << 5;
    float _5477 = trunc(_5443);
    float _5479 = precise::max(_5477, 0.0);
    uint _5481 = uint(_5479);
    int _5483 = _5451 | _5459;
    int _5485 = int(_5465) | _5483;
    int _5487 = _5467 | _5475;
    int _5489 = int(_5473) | _5487;
    bool _5491 = _5485 != _5489;
    bool _5493 = _5375 > _5481;
    int _5495 = int(_5481) << 8;
    int _5497 = _5495 & 65280;
    int _5499 = int(_5457);
    int _5501 = _5495;
    int _5503 = _5459;
    int _5505 = _5497;
    int _5507 = as_type<int>(_5399);
    int _5509 = _5485;
    int _5511 = _5489;
    if (!_5491)
    {
        _5499 = _5485;
    }
    int _5513 = _5499;
    int _5515 = 255 & int(_5375);
    int _5517 = _5497 | _5515;
    int _5519 = _5513;
    if (!_5493)
    {
        _5501 = 0;
    }
    int _5521 = _5501;
    int _5523 = _5521;
    if (!_5491)
    {
        _5503 = 0;
    }
    int _5525 = _5503;
    int _5527 = _5525;
    if (!_5491)
    {
        _5505 = 0;
    }
    int _5529 = _5505;
    bool _5531 = !_5491;
    int _5533 = _5529;
    if (!_5531)
    {
        float _5535 = _5399 * 0.0322580635547637939453125;
        float _5537 = _5395 * 0.01587301678955554962158203125;
        float _5539 = _5403 * 0.01587301678955554962158203125;
        bool _5541 = uint(_5485) >= uint(_5489);
        float _5543 = _5385 * 0.0322580635547637939453125;
        float _5545 = _5411 * 0.0322580635547637939453125;
        float _5547 = _5407 * 0.0322580635547637939453125;
        bool _5549 = !_5541;
        float _5551 = _5549 ? _5537 : _5539;
        bool _5553 = !_5541;
        float _5555 = _5553 ? _5539 : _5537;
        bool _5557 = !_5541;
        float _5559 = _5557 ? _5543 : _5535;
        float _5561 = -_5551;
        float _5563 = _139 + _5561;
        bool _5565 = !_5541;
        float _5567 = _5565 ? _5535 : _5543;
        float _5569 = -_5551;
        float _5571 = _5569 + _5555;
        bool _5573 = !_5541;
        float _5575 = _5573 ? _5545 : _5547;
        float _5577 = -_5559;
        float _5579 = _137 + _5577;
        bool _5581 = !_5541;
        float _5583 = _5581 ? _5547 : _5545;
        float _5585 = -_5559;
        float _5587 = _5585 + _5567;
        float _5589 = -_5559;
        float _5591 = _127 + _5589;
        float _5593 = -_5559;
        float _5595 = _117 + _5593;
        float _5597 = -_5559;
        float _5599 = _107 + _5597;
        float _5601 = -_5559;
        float _5603 = _97 + _5601;
        float _5605 = -_5559;
        float _5607 = _87 + _5605;
        float _5609 = -_5559;
        float _5611 = _67 + _5609;
        float _5613 = -_5559;
        float _5615 = _77 + _5613;
        float _5617 = -_5559;
        float _5619 = _5158 + _5617;
        float _5621 = -_5559;
        float _5623 = _207 + _5621;
        float _5625 = -_5559;
        float _5627 = _197 + _5625;
        float _5629 = -_5559;
        float _5631 = _187 + _5629;
        float _5633 = -_5559;
        float _5635 = _177 + _5633;
        float _5637 = -_5559;
        float _5639 = _167 + _5637;
        float _5641 = -_5559;
        float _5643 = _157 + _5641;
        float _5645 = -_5559;
        float _5647 = _147 + _5645;
        float _5649 = _5571 * _5571;
        float _5651 = -_5575;
        float _5653 = _5651 + _5583;
        float _5655 = -_5551;
        float _5657 = _129 + _5655;
        float _5659 = -_5575;
        float _5661 = _141 + _5659;
        float _5663 = fma(_5587, _5587, _5649);
        float _5665 = -_5575;
        float _5667 = _131 + _5665;
        float _5669 = -_5551;
        float _5671 = _119 + _5669;
        float _5673 = -_5551;
        float _5675 = _109 + _5673;
        float _5677 = fma(_5653, _5653, _5663);
        float _5679 = -_5575;
        float _5681 = _121 + _5679;
        float _5683 = -_5551;
        float _5685 = _99 + _5683;
        float _5687 = -_5551;
        float _5689 = _89 + _5687;
        float _5691 = 1.0 / _5677;
        float _5693 = -_5551;
        float _5695 = _69 + _5693;
        float _5697 = -_5551;
        float _5699 = _79 + _5697;
        float _5701 = -_5551;
        float _5703 = _219 + _5701;
        float _5705 = -_5551;
        float _5707 = _209 + _5705;
        float _5709 = -_5551;
        float _5711 = _199 + _5709;
        float _5713 = -_5551;
        float _5715 = _189 + _5713;
        float _5717 = -_5551;
        float _5719 = _179 + _5717;
        float _5721 = -_5551;
        float _5723 = _169 + _5721;
        float _5725 = -_5551;
        float _5727 = _159 + _5725;
        float _5729 = -_5551;
        float _5731 = _149 + _5729;
        float _5733 = -_5575;
        float _5735 = _111 + _5733;
        float _5737 = -_5575;
        float _5739 = _101 + _5737;
        float _5741 = -_5575;
        float _5743 = _91 + _5741;
        float _5745 = -_5575;
        float _5747 = _71 + _5745;
        float _5749 = _5571 * _5691;
        float _5751 = _5587 * _5691;
        float _5753 = _5653 * _5691;
        float _5755 = _5749 * _5563;
        float _5757 = _5749 * _5657;
        float _5759 = _5749 * _5671;
        float _5761 = _5749 * _5675;
        float _5763 = fma(_5751, _5579, _5755);
        float _5765 = fma(_5751, _5591, _5757);
        float _5767 = fma(_5751, _5595, _5759);
        float _5769 = fma(_5751, _5599, _5761);
        float _5771 = fma(_5753, _5661, _5763);
        float _5773 = fma(_5753, _5667, _5765);
        float _5775 = fma(_5753, _5681, _5767);
        float _5777 = _5749 * _5685;
        float _5779 = _5749 * _5731;
        bool _5781 = _5771 >= 0.5;
        float _5783 = _5749 * _5689;
        bool _5785 = _5773 >= 0.5;
        float _5787 = _5749 * _5695;
        bool _5789 = _5771 >= 0.833000004291534423828125;
        float _5791 = _5749 * _5699;
        bool _5793 = _5771 >= 0.16599999368190765380859375;
        float _5795 = _5749 * _5703;
        float _5797 = _5749 * _5707;
        float _5799 = _5749 * _5711;
        float _5801 = _5749 * _5715;
        float _5803 = _5749 * _5719;
        float _5805 = _5749 * _5723;
        float _5807 = _5749 * _5727;
        int _5809 = _5789 ? 0 : 32768;
        float _5811 = fma(_5753, _5735, _5769);
        bool _5813 = _5773 >= 0.833000004291534423828125;
        float _5815 = fma(_5751, _5603, _5777);
        int _5817 = _5809;
        if (!_5781)
        {
            int _5819 = _5793 ? 49152 : 16384;
            _5817 = _5819;
        }
        int _5821 = _5817;
        float _5823 = fma(_5751, _5607, _5783);
        bool _5825 = _5773 >= 0.16599999368190765380859375;
        float _5827 = fma(_5751, _5611, _5787);
        float _5829 = fma(_5751, _5615, _5791);
        bool _5831 = _5775 >= 0.5;
        float _5833 = fma(_5751, _5619, _5795);
        float _5835 = fma(_5751, _5623, _5797);
        float _5837 = fma(_5751, _5627, _5799);
        float _5839 = fma(_5751, _5631, _5801);
        float _5841 = fma(_5751, _5635, _5803);
        float _5843 = fma(_5751, _5639, _5805);
        float _5845 = fma(_5751, _5643, _5807);
        float _5847 = fma(_5751, _5647, _5779);
        int _5849 = _5813 ? 0 : 8192;
        float _5851 = fma(_5753, _5739, _5815);
        bool _5853 = _5811 >= 0.5;
        float _5855 = fma(_5753, _5743, _5823);
        int _5857 = _5849;
        if (!_5785)
        {
            int _5859 = _5825 ? 12288 : 4096;
            _5857 = _5859;
        }
        int _5861 = _5857;
        float _5863 = fma(_5753, _5747, _5827);
        bool _5865 = _5811 >= 0.833000004291534423828125;
        float _5867 = -_5575;
        float _5869 = _5166 + _5867;
        bool _5871 = _5775 >= 0.833000004291534423828125;
        float _5873 = -_5575;
        float _5875 = _211 + _5873;
        bool _5877 = _5775 >= 0.16599999368190765380859375;
        float _5879 = fma(_5753, _5869, _5833);
        int _5881 = _5865 ? 0 : 512;
        float _5883 = fma(_5753, _5875, _5835);
        bool _5885 = _5851 >= 0.5;
        float _5887 = -_5575;
        float _5889 = _201 + _5887;
        int _5891 = _5871 ? 0 : 2048;
        float _5893 = -_5575;
        float _5895 = _191 + _5893;
        bool _5897 = _5811 >= 0.16599999368190765380859375;
        float _5899 = fma(_5753, _5889, _5837);
        float _5901 = fma(_5753, _5895, _5839);
        int _5903 = _5891;
        int _5905 = _5881;
        if (!_5831)
        {
            int _5907 = _5877 ? 3072 : 1024;
            _5903 = _5907;
        }
        int _5909 = _5903;
        float _5911 = -_5575;
        float _5913 = _181 + _5911;
        bool _5915 = _5855 >= 0.5;
        float _5917 = -_5575;
        float _5919 = _161 + _5917;
        if (!_5853)
        {
            int _5921 = _5897 ? 768 : 256;
            _5905 = _5921;
        }
        int _5923 = _5905;
        float _5925 = fma(_5753, _5913, _5841);
        bool _5927 = _5851 >= 0.833000004291534423828125;
        float _5929 = -_5575;
        float _5931 = _171 + _5929;
        bool _5933 = _5855 >= 0.833000004291534423828125;
        float _5935 = fma(_5753, _5919, _5845);
        bool _5937 = _5851 >= 0.16599999368190765380859375;
        float _5939 = fma(_5753, _5931, _5843);
        int _5941 = _5927 ? 0 : 128;
        float _5943 = -_5575;
        float _5945 = _81 + _5943;
        int _5947 = _5933 ? 0 : 32;
        float _5949 = -_5575;
        float _5951 = _151 + _5949;
        bool _5953 = _5863 >= 0.5;
        float _5955 = fma(_5753, _5945, _5829);
        bool _5957 = _5855 >= 0.16599999368190765380859375;
        float _5959 = fma(_5753, _5951, _5847);
        int _5961 = _5941;
        int _5963 = _5947;
        if (!_5885)
        {
            int _5965 = _5937 ? 192 : 64;
            _5961 = _5965;
        }
        int _5967 = _5961;
        bool _5969 = _5863 >= 0.833000004291534423828125;
        if (!_5915)
        {
            int _5971 = _5957 ? 48 : 16;
            _5963 = _5971;
        }
        int _5973 = _5963;
        int _5975 = _5969 ? 0 : 8;
        bool _5977 = _5879 >= 0.5;
        bool _5979 = _5863 >= 0.16599999368190765380859375;
        bool _5981 = _5883 >= 0.5;
        bool _5983 = _5879 >= 0.833000004291534423828125;
        int _5985 = _5975;
        if (!_5953)
        {
            int _5987 = _5979 ? 12 : 4;
            _5985 = _5987;
        }
        int _5989 = _5985;
        bool _5991 = _5883 >= 0.833000004291534423828125;
        bool _5993 = _5879 >= 0.16599999368190765380859375;
        int _5995 = _5983 ? 0 : int(0x80000000);
        bool _5997 = _5883 >= 0.16599999368190765380859375;
        int _5999 = _5991 ? 0 : 536870912;
        bool _6001 = _5899 >= 0.5;
        int _6003 = _5995;
        int _6005 = _5999;
        if (!_5977)
        {
            int _6007 = _5993 ? (-1073741824) : 1073741824;
            _6003 = _6007;
        }
        int _6009 = _6003;
        bool _6011 = _5901 >= 0.5;
        if (!_5981)
        {
            int _6013 = _5997 ? 805306368 : 268435456;
            _6005 = _6013;
        }
        int _6015 = _6005;
        bool _6017 = _5899 >= 0.833000004291534423828125;
        bool _6019 = _5901 >= 0.833000004291534423828125;
        int _6021 = _6017 ? 0 : 134217728;
        bool _6023 = _5899 >= 0.16599999368190765380859375;
        bool _6025 = _5925 >= 0.5;
        int _6027 = _6019 ? 0 : 33554432;
        bool _6029 = _5901 >= 0.16599999368190765380859375;
        int _6031 = _6021;
        int _6033 = _6027;
        if (!_6001)
        {
            int _6035 = _6023 ? 201326592 : 67108864;
            _6031 = _6035;
        }
        int _6037 = _6031;
        bool _6039 = _5925 >= 0.833000004291534423828125;
        if (!_6011)
        {
            int _6041 = _6029 ? 50331648 : 16777216;
            _6033 = _6041;
        }
        int _6043 = _6033;
        bool _6045 = _5935 >= 0.5;
        bool _6047 = _5925 >= 0.16599999368190765380859375;
        int _6049 = _6039 ? 0 : 8388608;
        bool _6051 = _5939 >= 0.5;
        bool _6053 = _5939 >= 0.833000004291534423828125;
        int _6055 = _6049;
        if (!_6025)
        {
            int _6057 = _6047 ? 12582912 : 4194304;
            _6055 = _6057;
        }
        int _6059 = _6055;
        bool _6061 = _5935 >= 0.833000004291534423828125;
        int _6063 = _6053 ? 0 : 2097152;
        bool _6065 = _5935 >= 0.16599999368190765380859375;
        int _6067 = _6061 ? 0 : 524288;
        bool _6069 = _5939 >= 0.16599999368190765380859375;
        int _6071 = _6067;
        int _6073 = _6063;
        if (!_6045)
        {
            int _6075 = _6065 ? 786432 : 262144;
            _6071 = _6075;
        }
        int _6077 = _6071;
        bool _6079 = _5955 >= 0.5;
        bool _6081 = _5959 >= 0.5;
        if (!_6051)
        {
            int _6083 = _6069 ? 3145728 : 1048576;
            _6073 = _6083;
        }
        int _6085 = _6073;
        bool _6087 = _5955 >= 0.833000004291534423828125;
        int _6089 = _6037 + _6009;
        int _6091 = _6089 + _6015;
        int _6093 = _5909 + _5821;
        int _6095 = _6093 + _5861;
        bool _6097 = _5959 >= 0.833000004291534423828125;
        int _6099 = _6087 ? 0 : 2;
        bool _6101 = _5955 >= 0.16599999368190765380859375;
        bool _6103 = _5959 >= 0.16599999368190765380859375;
        int _6105 = _6059 + _6091;
        int _6107 = _6105 + _6043;
        int _6109 = _5967 + _6095;
        int _6111 = _6109 + _5923;
        int _6113 = _6097 ? 0 : 131072;
        int _6115 = _6099;
        int _6117 = _6113;
        _5507 = 3;
        if (!_6079)
        {
            int _6119 = _6101 ? 3 : 1;
            _6115 = _6119;
        }
        int _6121 = _6115;
        if (!_6081)
        {
            int _6123 = _6103 ? 196608 : 65536;
            _6117 = _6123;
        }
        int _6125 = _6117;
        int _6127 = _6077 + _6107;
        int _6129 = _6127 + _6085;
        int _6131 = _5989 + _6111;
        int _6133 = _6131 + _5973;
        bool _6135 = !_5541;
        int _6137 = _6135 ? _5489 : _5485;
        bool _6139 = !_5541;
        int _6141 = _6139 ? _5485 : _5489;
        int _6143 = _6129 + _6125;
        int _6145 = _6133 + _6121;
        _5519 = _6137;
        _5533 = _6143;
        _5527 = _6145;
        _5509 = _6141;
    }
    int _6147 = _5519;
    int _6149 = _5507;
    int _6151 = _5533;
    int _6153 = _5527;
    int _6155 = _5509;
    int _6157 = _6149;
    if (!_5493)
    {
        _6157 = 0;
    }
    int _6159 = _6157;
    int _6161 = _6159;
    if (!_5493)
    {
        _5511 = 0;
    }
    int _6163 = _5511;
    bool _6165 = !_5493;
    int _6167 = _6163;
    if (!_6165)
    {
        float _6169 = -_5439;
        float _6171 = _5210 + _6169;
        float _6173 = -_5439;
        float _6175 = _93 + _6173;
        float _6177 = -_5439;
        float _6179 = _83 + _6177;
        float _6181 = -_5439;
        float _6183 = _73 + _6181;
        float _6185 = -_5439;
        float _6187 = _123 + _6185;
        float _6189 = 1.0 / _6171;
        float _6191 = -_5439;
        float _6193 = _133 + _6191;
        float _6195 = -_5439;
        float _6197 = _183 + _6195;
        float _6199 = -_5439;
        float _6201 = _143 + _6199;
        float _6203 = -_5439;
        float _6205 = _153 + _6203;
        float _6207 = -_5439;
        float _6209 = _163 + _6207;
        float _6211 = -_5439;
        float _6213 = _203 + _6211;
        float _6215 = -_5439;
        float _6217 = _213 + _6215;
        float _6219 = -_5439;
        float _6221 = _223 + _6219;
        float _6223 = _6175 * _6189;
        float _6225 = -_5439;
        float _6227 = _103 + _6225;
        float _6229 = _6179 * _6189;
        float _6231 = _6183 * _6189;
        float _6233 = _6227 * _6189;
        float _6235 = -_5439;
        float _6237 = _113 + _6235;
        float _6239 = fma(_6229, -1.99999904632568359375, 1.99999904632568359375);
        float _6241 = fma(_6229, -7.99999904632568359375, 7.99999904632568359375);
        float _6243 = fma(_6231, -1.99999904632568359375, 1.99999904632568359375);
        float _6245 = fma(_6231, -7.99999904632568359375, 7.99999904632568359375);
        float _6247 = fma(_6223, -1.99999904632568359375, 1.99999904632568359375);
        float _6249 = fma(_6223, -7.99999904632568359375, 7.99999904632568359375);
        float _6251 = _6237 * _6189;
        float _6253 = -_6229;
        float _6255 = _6253 + 0.5;
        float _6257 = -_6231;
        float _6259 = _6257 + 0.5;
        float _6261 = trunc(_6239);
        float _6263 = precise::max(_6261, 0.0);
        uint _6265 = uint(_6263);
        float _6267 = fma(_6233, -1.99999904632568359375, 1.99999904632568359375);
        float _6269 = fma(_6233, -7.99999904632568359375, 7.99999904632568359375);
        float _6271 = fma(_6251, -1.99999904632568359375, 1.99999904632568359375);
        float _6273 = fma(_6251, -7.99999904632568359375, 7.99999904632568359375);
        float _6275 = _6187 * _6189;
        float _6277 = _6193 * _6189;
        float _6279 = -_6223;
        float _6281 = _6279 + 0.5;
        float _6283 = trunc(_6241);
        float _6285 = precise::max(_6283, 0.0);
        uint _6287 = uint(_6285);
        float _6289 = _6197 * _6189;
        float _6291 = -_5439;
        float _6293 = _193 + _6291;
        float _6295 = abs(_6255);
        bool _6297 = _6295 >= 0.375;
        float _6299 = fma(_6275, -1.99999904632568359375, 1.99999904632568359375);
        float _6301 = abs(_6259);
        bool _6303 = _6301 >= 0.375;
        float _6305 = fma(_6275, -7.99999904632568359375, 7.99999904632568359375);
        float _6307 = fma(_6277, -1.99999904632568359375, 1.99999904632568359375);
        float _6309 = trunc(_6243);
        float _6311 = precise::max(_6309, 0.0);
        uint _6313 = uint(_6311);
        float _6315 = fma(_6277, -7.99999904632568359375, 7.99999904632568359375);
        float _6317 = _6201 * _6189;
        float _6319 = _6205 * _6189;
        float _6321 = -_6233;
        float _6323 = _6321 + 0.5;
        float _6325 = -_6251;
        float _6327 = _6325 + 0.5;
        float _6329 = _6209 * _6189;
        float _6331 = abs(_6281);
        bool _6333 = _6331 >= 0.375;
        float _6335 = trunc(_6245);
        float _6337 = precise::max(_6335, 0.0);
        uint _6339 = uint(_6337);
        float _6341 = -_5439;
        float _6343 = _173 + _6341;
        float _6345 = _6293 * _6189;
        float _6347 = fma(_6317, -1.99999904632568359375, 1.99999904632568359375);
        float _6349 = fma(_6317, -7.99999904632568359375, 7.99999904632568359375);
        float _6351 = fma(_6319, -1.99999904632568359375, 1.99999904632568359375);
        float _6353 = fma(_6319, -7.99999904632568359375, 7.99999904632568359375);
        float _6355 = -_6275;
        float _6357 = _6355 + 0.5;
        float _6359 = trunc(_6247);
        float _6361 = precise::max(_6359, 0.0);
        uint _6363 = uint(_6361);
        float _6365 = -_6277;
        float _6367 = _6365 + 0.5;
        float _6369 = abs(_6323);
        bool _6371 = _6369 >= 0.375;
        float _6373 = fma(_6329, -1.99999904632568359375, 1.99999904632568359375);
        float _6375 = abs(_6327);
        bool _6377 = _6375 >= 0.375;
        float _6379 = fma(_6329, -7.99999904632568359375, 7.99999904632568359375);
        float _6381 = _6343 * _6189;
        float _6383 = _6213 * _6189;
        float _6385 = trunc(_6249);
        float _6387 = precise::max(_6385, 0.0);
        uint _6389 = uint(_6387);
        float _6391 = _6217 * _6189;
        float _6393 = _6221 * _6189;
        float _6395 = fma(_6345, -7.99999904632568359375, 7.99999904632568359375);
        float _6397 = -_6317;
        float _6399 = _6397 + 0.5;
        float _6401 = -_6319;
        float _6403 = _6401 + 0.5;
        float _6405 = abs(_6357);
        bool _6407 = _6405 >= 0.375;
        float _6409 = fma(_6381, -1.99999904632568359375, 1.99999904632568359375);
        float _6411 = trunc(_6267);
        float _6413 = precise::max(_6411, 0.0);
        uint _6415 = uint(_6413);
        float _6417 = abs(_6367);
        bool _6419 = _6417 >= 0.375;
        float _6421 = fma(_6381, -7.99999904632568359375, 7.99999904632568359375);
        float _6423 = fma(_6289, -1.99999904632568359375, 1.99999904632568359375);
        float _6425 = fma(_6289, -7.99999904632568359375, 7.99999904632568359375);
        float _6427 = -_6329;
        float _6429 = _6427 + 0.5;
        int _6431 = int(_6265);
        int _6433 = int(_6313);
        int _6435 = int(_6363);
        int _6437 = int(_6415);
        if (!_6297)
        {
            int _6439 = int(_6287) + 1;
            _6431 = _6439;
        }
        int _6441 = _6431;
        float _6443 = fma(_6345, -1.99999904632568359375, 1.99999904632568359375);
        float _6445 = trunc(_6269);
        float _6447 = precise::max(_6445, 0.0);
        uint _6449 = uint(_6447);
        if (!_6303)
        {
            int _6451 = int(_6339) + 1;
            _6433 = _6451;
        }
        int _6453 = _6433;
        float _6455 = fma(_6383, -1.99999904632568359375, 1.99999904632568359375);
        float _6457 = abs(_6399);
        bool _6459 = _6457 >= 0.375;
        float _6461 = -_6381;
        float _6463 = _6461 + 0.5;
        float _6465 = abs(_6403);
        bool _6467 = _6465 >= 0.375;
        float _6469 = -_6289;
        float _6471 = _6469 + 0.5;
        if (!_6333)
        {
            int _6473 = int(_6389) + 1;
            _6435 = _6473;
        }
        int _6475 = _6435;
        float _6477 = trunc(_6271);
        float _6479 = precise::max(_6477, 0.0);
        uint _6481 = uint(_6479);
        float _6483 = abs(_6429);
        bool _6485 = _6483 >= 0.375;
        float _6487 = fma(_6391, -1.99999904632568359375, 1.99999904632568359375);
        float _6489 = -_6345;
        float _6491 = _6489 + 0.5;
        float _6493 = fma(_6393, -1.99999904632568359375, 1.99999904632568359375);
        int _6495 = _6453 << 3;
        float _6497 = trunc(_6273);
        float _6499 = precise::max(_6497, 0.0);
        uint _6501 = uint(_6499);
        int _6503 = int(_6481);
        if (!_6371)
        {
            int _6505 = int(_6449) + 1;
            _6437 = _6505;
        }
        int _6507 = _6437;
        float _6509 = abs(_6463);
        bool _6511 = _6509 >= 0.375;
        int _6513 = _6441 | _6495;
        int _6515 = _6507 << 9;
        float _6517 = trunc(_6299);
        float _6519 = precise::max(_6517, 0.0);
        uint _6521 = uint(_6519);
        float _6523 = trunc(_6305);
        float _6525 = precise::max(_6523, 0.0);
        uint _6527 = uint(_6525);
        int _6529 = int(_6521);
        if (!_6377)
        {
            int _6531 = int(_6501) + 1;
            _6503 = _6531;
        }
        int _6533 = _6503;
        float _6535 = abs(_6471);
        bool _6537 = _6535 >= 0.375;
        float _6539 = trunc(_6307);
        float _6541 = precise::max(_6539, 0.0);
        uint _6543 = uint(_6541);
        float _6545 = trunc(_6315);
        float _6547 = precise::max(_6545, 0.0);
        uint _6549 = uint(_6547);
        int _6551 = int(_6543);
        if (!_6407)
        {
            int _6553 = int(_6527) + 1;
            _6529 = _6553;
        }
        int _6555 = _6529;
        float _6557 = abs(_6491);
        bool _6559 = _6557 >= 0.375;
        int _6561 = _6555 << 15;
        float _6563 = trunc(_6347);
        float _6565 = precise::max(_6563, 0.0);
        uint _6567 = uint(_6565);
        float _6569 = trunc(_6349);
        float _6571 = precise::max(_6569, 0.0);
        uint _6573 = uint(_6571);
        int _6575 = int(_6567);
        if (!_6419)
        {
            int _6577 = int(_6549) + 1;
            _6551 = _6577;
        }
        int _6579 = _6551;
        float _6581 = trunc(_6351);
        float _6583 = precise::max(_6581, 0.0);
        uint _6585 = uint(_6583);
        float _6587 = trunc(_6353);
        float _6589 = precise::max(_6587, 0.0);
        uint _6591 = uint(_6589);
        int _6593 = int(_6585);
        if (!_6459)
        {
            int _6595 = int(_6573) + 1;
            _6575 = _6595;
        }
        int _6597 = _6575;
        int _6599 = _6597 << 21;
        float _6601 = trunc(_6395);
        float _6603 = precise::max(_6601, 0.0);
        uint _6605 = uint(_6603);
        float _6607 = trunc(_6373);
        float _6609 = precise::max(_6607, 0.0);
        uint _6611 = uint(_6609);
        float _6613 = fma(_6383, -7.99999904632568359375, 7.99999904632568359375);
        float _6615 = -_6383;
        float _6617 = _6615 + 0.5;
        int _6619 = int(_6611);
        if (!_6467)
        {
            int _6621 = int(_6591) + 1;
            _6593 = _6621;
        }
        int _6623 = _6593;
        float _6625 = abs(_6617);
        bool _6627 = _6625 >= 0.375;
        float _6629 = trunc(_6379);
        float _6631 = precise::max(_6629, 0.0);
        uint _6633 = uint(_6631);
        float _6635 = trunc(_6409);
        float _6637 = precise::max(_6635, 0.0);
        uint _6639 = uint(_6637);
        float _6641 = trunc(_6421);
        float _6643 = precise::max(_6641, 0.0);
        uint _6645 = uint(_6643);
        int _6647 = int(_6639);
        if (!_6485)
        {
            int _6649 = int(_6633) + 1;
            _6619 = _6649;
        }
        int _6651 = _6619;
        float _6653 = trunc(_6423);
        float _6655 = precise::max(_6653, 0.0);
        uint _6657 = uint(_6655);
        float _6659 = trunc(_6425);
        float _6661 = precise::max(_6659, 0.0);
        uint _6663 = uint(_6661);
        int _6665 = int(_6657);
        if (!_6511)
        {
            int _6667 = int(_6645) + 1;
            _6647 = _6667;
        }
        int _6669 = _6647;
        int _6671 = _6669 << 6;
        float _6673 = trunc(_6613);
        float _6675 = precise::max(_6673, 0.0);
        uint _6677 = uint(_6675);
        float _6679 = trunc(_6443);
        float _6681 = precise::max(_6679, 0.0);
        uint _6683 = uint(_6681);
        float _6685 = fma(_6391, -7.99999904632568359375, 7.99999904632568359375);
        float _6687 = fma(_6393, -7.99999904632568359375, 7.99999904632568359375);
        float _6689 = -_6391;
        float _6691 = _6689 + 0.5;
        float _6693 = -_6393;
        float _6695 = _6693 + 0.5;
        if (!_6537)
        {
            int _6697 = int(_6663) + 1;
            _6665 = _6697;
        }
        int _6699 = _6665;
        float _6701 = trunc(_6455);
        float _6703 = precise::max(_6701, 0.0);
        uint _6705 = uint(_6703);
        float _6707 = abs(_6691);
        bool _6709 = _6707 >= 0.375;
        float _6711 = abs(_6695);
        bool _6713 = _6711 >= 0.375;
        int _6715 = _6699 << 9;
        float _6717 = trunc(_6487);
        float _6719 = precise::max(_6717, 0.0);
        uint _6721 = uint(_6719);
        int _6723 = int(_6683);
        int _6725 = int(_6721);
        if (!_6559)
        {
            int _6727 = int(_6605) + 1;
            _6723 = _6727;
        }
        int _6729 = _6723;
        int _6731 = _6729 << 12;
        float _6733 = trunc(_6685);
        float _6735 = precise::max(_6733, 0.0);
        uint _6737 = uint(_6735);
        int _6739 = int(_6705);
        if (!_6627)
        {
            int _6741 = int(_6677) + 1;
            _6739 = _6741;
        }
        int _6743 = _6739;
        int _6745 = _6743 << 15;
        float _6747 = trunc(_6493);
        float _6749 = precise::max(_6747, 0.0);
        uint _6751 = uint(_6749);
        int _6753 = _6651 << 3;
        int _6755 = _6623 | _6753;
        float _6757 = trunc(_6687);
        float _6759 = precise::max(_6757, 0.0);
        uint _6761 = uint(_6759);
        int _6763 = _6475 << 6;
        int _6765 = _6755 | _6671;
        int _6767 = _6715 | _6765;
        int _6769 = _6513 | _6763;
        int _6771 = _6515 | _6769;
        int _6773 = _6533 << 12;
        int _6775 = int(_6751);
        if (!_6709)
        {
            int _6777 = int(_6737) + 1;
            _6725 = _6777;
        }
        int _6779 = _6725;
        int _6781 = _6771 | _6773;
        int _6783 = _6561 | _6781;
        int _6785 = _6767 | _6731;
        int _6787 = _6745 | _6785;
        int _6789 = _6579 << 18;
        if (!_6713)
        {
            int _6791 = int(_6761) + 1;
            _6775 = _6791;
        }
        int _6793 = _6775;
        int _6795 = _6779 << 18;
        int _6797 = _6793 << 21;
        int _6799 = _6783 | _6789;
        int _6801 = _6599 | _6799;
        int _6803 = _6787 | _6795;
        int _6805 = _6797 | _6803;
        uint _6807 = uint(int(uint(_6801) >> uint(16)));
        int _6809 = _6805 << 8;
        uint _6811 = uint(int(uint(_6805) >> uint(8)));
        int _6813 = 65280 & _6809;
        int _6815 = int(_6807) | _6813;
        int _6817 = _6801 << 16;
        int _6819 = int(_6811) << 16;
        _5523 = _6817;
        _6167 = _6819;
        _6161 = _6815;
    }
    int _6821 = _5523;
    int _6823 = _6167;
    int _6825 = _6161;
    int _6827 = _6147 & 65535;
    int _6829 = _6821 | _5517;
    int _6831 = _6823 | _6825;
    int _6833 = _6151 | _6153;
    int _6835 = _6155 << 16;
    int _6837 = _6835 + _6827;
    out.m_37.x = as_type<float>(_6829);
    out.m_37.y = as_type<float>(_6831);
    out.m_37.z = as_type<float>(_6837);
    out.m_37.w = as_type<float>(_6833);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5040 = false;
    bool _5022 = false;
    bool _4878 = false;
    bool _4860 = false;
    bool _4716 = false;
    bool _4698 = false;
    bool _4554 = false;
    bool _4536 = false;
    bool _4392 = false;
    bool _4374 = false;
    bool _4230 = false;
    bool _4212 = false;
    bool _4068 = false;
    bool _4050 = false;
    bool _3906 = false;
    bool _3888 = false;
    bool _3744 = false;
    bool _3726 = false;
    bool _3582 = false;
    bool _3564 = false;
    bool _3420 = false;
    bool _3402 = false;
    bool _3258 = false;
    bool _3240 = false;
    bool _3096 = false;
    bool _3078 = false;
    bool _2934 = false;
    bool _2916 = false;
    bool _2772 = false;
    bool _2754 = false;
    bool _2644 = false;
    bool _2610 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _6872 = float2(_60, _62);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6872, float2(0.0), isnan(_6872)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6872, float2(0.0), isnan(_6872)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float2 _6896 = float2(_60, _62);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6896, float2(0.0), isnan(_6896)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6896, float2(0.0), isnan(_6896)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float2 _6914 = float2(_60, _62);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6914, float2(0.0), isnan(_6914)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6914, float2(0.0), isnan(_6914)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float2 _6934 = float2(_60, _62);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6934, float2(0.0), isnan(_6934)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6934, float2(0.0), isnan(_6934)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float2 _6953 = float2(_60, _62);
    float4 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6953, float2(0.0), isnan(_6953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6953, float2(0.0), isnan(_6953)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyzw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _105.w;
    float2 _6972 = float2(_60, _62);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6972, float2(0.0), isnan(_6972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6972, float2(0.0), isnan(_6972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float2 _6991 = float2(_60, _62);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6991, float2(0.0), isnan(_6991)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6991, float2(0.0), isnan(_6991)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _7010 = float2(_60, _62);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7010, float2(0.0), isnan(_7010)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7010, float2(0.0), isnan(_7010)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float2 _7029 = float2(_60, _62);
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7029, float2(0.0), isnan(_7029)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7029, float2(0.0), isnan(_7029)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float2 _7048 = float2(_60, _62);
    float4 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7048, float2(0.0), isnan(_7048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7048, float2(0.0), isnan(_7048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyzw;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    float2 _7067 = float2(_60, _62);
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7067, float2(0.0), isnan(_7067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7067, float2(0.0), isnan(_7067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float2 _7086 = float2(_60, _62);
    float4 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7086, float2(0.0), isnan(_7086)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7086, float2(0.0), isnan(_7086)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float2 _7105 = float2(_60, _62);
    float4 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7105, float2(0.0), isnan(_7105)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7105, float2(0.0), isnan(_7105)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyzw;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float _193 = _185.w;
    float2 _7124 = float2(_60, _62);
    float4 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7124, float2(0.0), isnan(_7124)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7124, float2(0.0), isnan(_7124)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyzw;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _195.w;
    float2 _7143 = float2(_60, _62);
    float4 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7143, float2(0.0), isnan(_7143)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7143, float2(0.0), isnan(_7143)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyzw;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _205.w;
    float2 _7162 = float2(_60, _62);
    float4 _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7162, float2(0.0), isnan(_7162)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7162, float2(0.0), isnan(_7162)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyzw;
    float _217 = _215.x;
    float _219 = _215.y;
    float _221 = _215.z;
    float _223 = _215.w;
    float _225 = _77 + _67;
    float _227 = _79 + _69;
    float _229 = _81 + _71;
    float _231 = _87 + _225;
    float _233 = _89 + _227;
    float _235 = _91 + _229;
    float _237 = _97 + _231;
    float _239 = _99 + _233;
    float _241 = _101 + _235;
    float _243 = _107 + _237;
    float _245 = _109 + _239;
    float _247 = _111 + _241;
    float _249 = _117 + _243;
    float _251 = _119 + _245;
    float _253 = _121 + _247;
    float _255 = _127 + _249;
    float _257 = _129 + _251;
    float _259 = _131 + _253;
    float _261 = _137 + _255;
    float _263 = _139 + _257;
    float _265 = _141 + _259;
    float _267 = _147 + _261;
    float _269 = _149 + _263;
    float _271 = _151 + _265;
    float _273 = _157 + _267;
    float _275 = _159 + _269;
    float _277 = _161 + _271;
    float _279 = _167 + _273;
    float _281 = _169 + _275;
    float _283 = _171 + _277;
    float _285 = _177 + _279;
    float _287 = _179 + _281;
    float _289 = _181 + _283;
    float _291 = _187 + _285;
    float _293 = _189 + _287;
    float _295 = _191 + _289;
    float _297 = _197 + _291;
    float _299 = _199 + _293;
    float _301 = _201 + _295;
    float _303 = _207 + _297;
    float _305 = _209 + _299;
    float _307 = _211 + _301;
    float _309 = _217 + _303;
    float _311 = _219 + _305;
    float _313 = _221 + _307;
    float _315 = fma(_309, -0.0625, _67);
    float _317 = fma(_311, -0.0625, _69);
    float _319 = fma(_313, -0.0625, _71);
    float _321 = fma(_311, -0.0625, _79);
    float _323 = fma(_309, -0.0625, _77);
    float _325 = _317 * _317;
    float _327 = _315 * _317;
    float _329 = _317 * _319;
    float _331 = fma(_313, -0.0625, _81);
    float _333 = _315 * _315;
    float _335 = _315 * _319;
    float _337 = fma(_321, _321, _325);
    float _339 = fma(_323, _321, _327);
    float _341 = fma(_321, _331, _329);
    float _343 = fma(_323, _323, _333);
    float _345 = fma(_323, _331, _335);
    float _347 = _319 * _319;
    float _349 = fma(_311, -0.0625, _89);
    float _351 = fma(_309, -0.0625, _87);
    float _353 = fma(_313, -0.0625, _91);
    float _355 = fma(_331, _331, _347);
    float _357 = fma(_349, _349, _337);
    float _359 = fma(_351, _349, _339);
    float _361 = fma(_349, _353, _341);
    float _363 = fma(_351, _351, _343);
    float _365 = fma(_351, _353, _345);
    float _367 = fma(_311, -0.0625, _99);
    float _369 = fma(_309, -0.0625, _97);
    float _371 = fma(_313, -0.0625, _101);
    float _373 = fma(_353, _353, _355);
    float _375 = fma(_367, _367, _357);
    float _377 = fma(_369, _367, _359);
    float _379 = fma(_367, _371, _361);
    float _381 = fma(_369, _369, _363);
    float _383 = fma(_369, _371, _365);
    float _385 = fma(_311, -0.0625, _109);
    float _387 = fma(_309, -0.0625, _107);
    float _389 = fma(_313, -0.0625, _111);
    float _391 = fma(_371, _371, _373);
    float _393 = fma(_385, _385, _375);
    float _395 = fma(_387, _385, _377);
    float _397 = fma(_385, _389, _379);
    float _399 = fma(_387, _387, _381);
    float _401 = fma(_387, _389, _383);
    float _403 = fma(_311, -0.0625, _119);
    float _405 = fma(_309, -0.0625, _117);
    float _407 = fma(_313, -0.0625, _121);
    float _409 = fma(_389, _389, _391);
    float _411 = fma(_403, _403, _393);
    float _413 = fma(_405, _403, _395);
    float _415 = fma(_403, _407, _397);
    float _417 = fma(_405, _405, _399);
    float _419 = fma(_405, _407, _401);
    float _421 = fma(_311, -0.0625, _129);
    float _423 = fma(_309, -0.0625, _127);
    float _425 = fma(_313, -0.0625, _131);
    float _427 = fma(_407, _407, _409);
    float _429 = fma(_421, _421, _411);
    float _431 = fma(_423, _421, _413);
    float _433 = fma(_421, _425, _415);
    float _435 = fma(_423, _423, _417);
    float _437 = fma(_423, _425, _419);
    float _439 = fma(_311, -0.0625, _139);
    float _441 = fma(_309, -0.0625, _137);
    float _443 = fma(_313, -0.0625, _141);
    float _445 = fma(_425, _425, _427);
    float _447 = fma(_439, _439, _429);
    float _449 = fma(_441, _439, _431);
    float _451 = fma(_439, _443, _433);
    float _453 = fma(_441, _441, _435);
    float _455 = fma(_441, _443, _437);
    float _457 = fma(_311, -0.0625, _149);
    float _459 = fma(_309, -0.0625, _147);
    float _461 = fma(_313, -0.0625, _151);
    float _463 = fma(_443, _443, _445);
    float _465 = fma(_457, _457, _447);
    float _467 = fma(_459, _457, _449);
    float _469 = fma(_457, _461, _451);
    float _471 = fma(_459, _459, _453);
    float _473 = fma(_459, _461, _455);
    float _475 = fma(_311, -0.0625, _159);
    float _477 = fma(_309, -0.0625, _157);
    float _479 = fma(_313, -0.0625, _161);
    float _481 = fma(_461, _461, _463);
    float _483 = fma(_475, _475, _465);
    float _485 = fma(_477, _475, _467);
    float _487 = fma(_475, _479, _469);
    float _489 = fma(_477, _477, _471);
    float _491 = fma(_477, _479, _473);
    float _493 = fma(_311, -0.0625, _169);
    float _495 = fma(_309, -0.0625, _167);
    float _497 = fma(_313, -0.0625, _171);
    float _499 = fma(_479, _479, _481);
    float _501 = fma(_493, _493, _483);
    float _503 = fma(_495, _493, _485);
    float _505 = fma(_493, _497, _487);
    float _507 = fma(_495, _495, _489);
    float _509 = fma(_495, _497, _491);
    float _511 = fma(_311, -0.0625, _179);
    float _513 = fma(_309, -0.0625, _177);
    float _515 = fma(_313, -0.0625, _181);
    float _517 = fma(_497, _497, _499);
    float _519 = fma(_511, _511, _501);
    float _521 = fma(_513, _511, _503);
    float _523 = fma(_511, _515, _505);
    float _525 = fma(_513, _513, _507);
    float _527 = fma(_513, _515, _509);
    float _529 = fma(_311, -0.0625, _189);
    float _531 = fma(_309, -0.0625, _187);
    float _533 = fma(_313, -0.0625, _191);
    float _535 = fma(_515, _515, _517);
    float _537 = fma(_529, _529, _519);
    float _539 = fma(_531, _529, _521);
    float _541 = fma(_529, _533, _523);
    float _543 = fma(_531, _531, _525);
    float _545 = fma(_531, _533, _527);
    float _547 = fma(_311, -0.0625, _199);
    float _549 = fma(_309, -0.0625, _197);
    float _551 = fma(_313, -0.0625, _201);
    float _553 = fma(_533, _533, _535);
    float _555 = fma(_547, _547, _537);
    float _557 = fma(_549, _547, _539);
    float _559 = fma(_547, _551, _541);
    float _561 = fma(_549, _549, _543);
    float _563 = fma(_549, _551, _545);
    float _565 = fma(_311, -0.0625, _209);
    float _567 = fma(_309, -0.0625, _207);
    float _569 = fma(_313, -0.0625, _211);
    float _571 = fma(_309, -0.0625, _217);
    float _573 = fma(_565, _565, _555);
    float _575 = fma(_567, _565, _557);
    float _577 = fma(_565, _569, _559);
    float _579 = fma(_311, -0.0625, _219);
    float _581 = fma(_551, _551, _553);
    float _583 = fma(_313, -0.0625, _221);
    float _585 = fma(_567, _567, _561);
    float _587 = fma(_579, _579, _573);
    float _589 = fma(_571, _579, _575);
    float _591 = fma(_567, _569, _563);
    float _593 = fma(_579, _583, _577);
    float _595 = fma(_571, _571, _585);
    float _597 = _587 + _589;
    float _599 = fma(_569, _569, _581);
    float _601 = fma(_571, _583, _591);
    float _603 = _595 + _589;
    float _605 = _593 + _597;
    float _607 = fma(_583, _583, _599);
    float _609 = _593 + _601;
    float _611 = _601 + _603;
    float _613 = _605 * _605;
    float _615 = _607 + _609;
    float _617 = fma(_611, _611, _613);
    float _619 = fma(_615, _615, _617);
    float _621 = rsqrt(_619);
    float _623 = _605 * _621;
    float _625 = _611 * _621;
    float _627 = _615 * _621;
    float _629 = _587 * _623;
    float _631 = _589 * _623;
    float _633 = fma(_589, _625, _629);
    float _635 = _593 * _623;
    float _637 = fma(_595, _625, _631);
    float _639 = fma(_593, _627, _633);
    float _641 = fma(_601, _625, _635);
    float _643 = fma(_601, _627, _637);
    float _645 = _639 * _639;
    float _647 = fma(_607, _627, _641);
    float _649 = fma(_643, _643, _645);
    float _651 = fma(_647, _647, _649);
    float _653 = rsqrt(_651);
    float _655 = _639 * _653;
    float _657 = _643 * _653;
    float _659 = _647 * _653;
    float _661 = _587 * _655;
    float _663 = _589 * _655;
    float _665 = _593 * _655;
    float _667 = fma(_589, _657, _661);
    float _669 = fma(_595, _657, _663);
    float _671 = fma(_601, _657, _665);
    float _673 = fma(_593, _659, _667);
    float _675 = fma(_601, _659, _669);
    float _677 = fma(_607, _659, _671);
    float _679 = _673 * _673;
    float _681 = fma(_675, _675, _679);
    float _683 = fma(_677, _677, _681);
    float _685 = rsqrt(_683);
    float _687 = _673 * _685;
    float _689 = _675 * _685;
    float _691 = _677 * _685;
    float _693 = _587 * _687;
    float _695 = _589 * _687;
    float _697 = _593 * _687;
    float _699 = fma(_589, _689, _693);
    float _701 = fma(_595, _689, _695);
    float _703 = fma(_601, _689, _697);
    float _705 = fma(_593, _691, _699);
    float _707 = fma(_601, _691, _701);
    float _709 = fma(_607, _691, _703);
    float _711 = _705 * _705;
    float _713 = fma(_707, _707, _711);
    float _715 = fma(_709, _709, _713);
    float _717 = rsqrt(_715);
    float _719 = _705 * _717;
    float _721 = _707 * _717;
    float _723 = _709 * _717;
    float _725 = _587 * _719;
    float _727 = _589 * _719;
    float _729 = _593 * _719;
    float _731 = fma(_589, _721, _725);
    float _733 = fma(_595, _721, _727);
    float _735 = fma(_601, _721, _729);
    float _737 = fma(_593, _723, _731);
    float _739 = fma(_601, _723, _733);
    float _741 = fma(_607, _723, _735);
    float _743 = _737 * _737;
    float _745 = fma(_739, _739, _743);
    float _747 = fma(_741, _741, _745);
    float _749 = rsqrt(_747);
    float _751 = _737 * _749;
    float _753 = _739 * _749;
    float _755 = _741 * _749;
    float _757 = _587 * _751;
    float _759 = _589 * _751;
    float _761 = _593 * _751;
    float _763 = fma(_589, _753, _757);
    float _765 = fma(_595, _753, _759);
    float _767 = fma(_601, _753, _761);
    float _769 = fma(_593, _755, _763);
    float _771 = fma(_601, _755, _765);
    float _773 = fma(_607, _755, _767);
    float _775 = _769 * _769;
    float _777 = fma(_771, _771, _775);
    float _779 = fma(_773, _773, _777);
    float _781 = rsqrt(_779);
    float _783 = _769 * _781;
    float _785 = _771 * _781;
    float _787 = _773 * _781;
    float _789 = _587 * _783;
    float _791 = _589 * _783;
    float _793 = _593 * _783;
    float _795 = fma(_589, _785, _789);
    float _797 = fma(_595, _785, _791);
    float _799 = fma(_601, _785, _793);
    float _801 = fma(_593, _787, _795);
    float _803 = fma(_601, _787, _797);
    float _805 = fma(_607, _787, _799);
    float _807 = _801 * _801;
    float _809 = fma(_803, _803, _807);
    float _811 = fma(_805, _805, _809);
    float _813 = rsqrt(_811);
    float _815 = _801 * _813;
    float _817 = _803 * _813;
    float _819 = _805 * _813;
    float _821 = _587 * _815;
    float _823 = _589 * _815;
    float _825 = fma(_589, _817, _821);
    float _827 = _593 * _815;
    float _829 = fma(_595, _817, _823);
    float _831 = fma(_593, _819, _825);
    float _833 = fma(_601, _817, _827);
    float _835 = fma(_601, _819, _829);
    float _837 = _831 * _831;
    float _839 = fma(_607, _819, _833);
    float _841 = fma(_835, _835, _837);
    float _843 = fma(_839, _839, _841);
    float _845 = rsqrt(_843);
    float _847 = _831 * _845;
    float _849 = _835 * _845;
    float _851 = _839 * _845;
    float _853 = _79 * _847;
    float _855 = _69 * _847;
    float _857 = _89 * _847;
    float _859 = fma(_77, _849, _853);
    float _861 = fma(_67, _849, _855);
    float _863 = fma(_87, _849, _857);
    float _865 = fma(_81, _851, _859);
    float _867 = fma(_71, _851, _861);
    float _869 = fma(_91, _851, _863);
    bool _873 = _865 >= _867;
    bool _875 = isnan(_865);
    bool _877 = _873 || _875;
    bool _879 = isnan(_867);
    bool _881 = _877 || _879;
    float _883 = 0.0;
    float _885 = _863;
    float _887 = _595;
    float _889 = _859;
    float _891 = _845;
    float _893 = _817;
    float _895 = _805;
    float _897 = _815;
    float _899 = _865;
    float _901 = _789;
    float _903 = _869;
    float _905 = _869;
    float _907 = _847;
    float _909 = _849;
    spvUnsafeArray<uint, 4> _24;
    if (!_881)
    {
        _883 = _67;
    }
    float _911 = _883;
    float _913 = _911;
    float _915 = _911;
    if (!_881)
    {
        _885 = _69;
    }
    float _917 = _885;
    float _919 = _917;
    float _921 = _917;
    if (!_881)
    {
        _887 = _71;
    }
    float _923 = _887;
    float _925 = _923;
    float _927 = _923;
    if (!_881)
    {
        _889 = _865;
    }
    float _929 = _889;
    float _931 = _929;
    float _933 = _929;
    if (!_881)
    {
        _891 = _867;
    }
    float _935 = _891;
    float _937 = _935;
    float _939 = _935;
    if (!_881)
    {
        _893 = _77;
    }
    float _941 = _893;
    float _943 = _941;
    float _945 = _941;
    if (!_881)
    {
        _895 = _79;
    }
    float _947 = _895;
    float _949 = _947;
    float _951 = _947;
    if (!_881)
    {
        _897 = _81;
    }
    float _953 = _897;
    bool _955 = !_881;
    float _957 = _953;
    float _959 = _953;
    if (!_955)
    {
        bool _961 = _865 > _867;
        if (!_961)
        {
            _931 = _865;
        }
        float _963 = _931;
        float _965 = _963;
        if (!_961)
        {
            _937 = _865;
        }
        float _967 = _937;
        float _969 = _967;
        if (!_961)
        {
            _943 = _77;
        }
        float _971 = _943;
        float _973 = _971;
        if (!_961)
        {
            _949 = _79;
        }
        float _975 = _949;
        float _977 = _975;
        if (!_961)
        {
            _957 = _81;
        }
        float _979 = _957;
        float _981 = _979;
        if (!_961)
        {
            _913 = _77;
        }
        float _983 = _913;
        float _985 = _983;
        if (!_961)
        {
            _919 = _79;
        }
        float _987 = _919;
        float _989 = _987;
        if (!_961)
        {
            _925 = _81;
        }
        float _991 = _925;
        _927 = _991;
        if (_961)
        {
            _965 = _867;
        }
        float _993 = _965;
        _933 = _993;
        if (_961)
        {
            _969 = _865;
        }
        float _995 = _969;
        _939 = _995;
        if (_961)
        {
            _973 = _67;
        }
        float _997 = _973;
        _945 = _997;
        if (_961)
        {
            _977 = _69;
        }
        float _999 = _977;
        _951 = _999;
        if (_961)
        {
            _981 = _71;
        }
        float _1001 = _981;
        _959 = _1001;
        if (_961)
        {
            _985 = _77;
        }
        float _1003 = _985;
        _915 = _1003;
        if (_961)
        {
            _989 = _79;
        }
        float _1005 = _989;
        _921 = _1005;
        if (_961)
        {
            _927 = _81;
        }
    }
    float _1007 = _939;
    float _1009 = _933;
    float _1011 = _915;
    float _1013 = _921;
    float _1015 = _927;
    float _1017 = _945;
    float _1019 = _951;
    float _1021 = _959;
    bool _1023 = _1007 >= _869;
    bool _1025 = isnan(_1007);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(_869);
    bool _1031 = _1027 || _1029;
    float _1033 = _99 * _847;
    float _1035 = fma(_97, _849, _1033);
    float _1037 = fma(_101, _851, _1035);
    float _1039 = _1035;
    float _1041 = _1009;
    float _1043 = _1017;
    float _1045 = _1019;
    float _1047 = _1009;
    float _1049 = _1017;
    float _1051 = _1019;
    float _1053 = _1021;
    float _1055 = _1007;
    float _1057 = _1015;
    float _1059 = _1037;
    float _1061 = _1037;
    if (!_1031)
    {
        _899 = _87;
    }
    float _1063 = _899;
    float _1065 = _1063;
    float _1067 = _1063;
    if (!_1031)
    {
        _1039 = _89;
    }
    float _1069 = _1039;
    float _1071 = _1069;
    float _1073 = _1069;
    if (!_1031)
    {
        _901 = _91;
    }
    float _1075 = _901;
    bool _1077 = !_1031;
    float _1079 = _1075;
    float _1081 = _1075;
    if (!_1077)
    {
        bool _1083 = _1009 > _869;
        if (_1083)
        {
            _1041 = _869;
        }
        float _1085 = _1041;
        _1047 = _1085;
        if (!_1083)
        {
            _1065 = _1011;
        }
        float _1087 = _1065;
        float _1089 = _1087;
        if (!_1083)
        {
            _1071 = _1013;
        }
        float _1091 = _1071;
        float _1093 = _1091;
        if (!_1083)
        {
            _1079 = _1015;
        }
        float _1095 = _1079;
        float _1097 = _1095;
        if (!_1083)
        {
            _903 = _1007;
        }
        float _1099 = _903;
        float _1101 = _1099;
        if (_1083)
        {
            _1089 = _1011;
        }
        float _1103 = _1089;
        _1067 = _1103;
        if (_1083)
        {
            _1093 = _1013;
        }
        float _1105 = _1093;
        _1073 = _1105;
        if (_1083)
        {
            _1097 = _1015;
        }
        float _1107 = _1097;
        _1081 = _1107;
        if (_1083)
        {
            _1101 = _1007;
        }
        float _1109 = _1101;
        _905 = _1109;
        if (_1083)
        {
            _1043 = _87;
        }
        float _1111 = _1043;
        _1049 = _1111;
        if (_1083)
        {
            _1045 = _89;
        }
        float _1113 = _1045;
        _1051 = _1113;
        if (_1083)
        {
            _1053 = _91;
        }
    }
    float _1115 = _905;
    float _1117 = _1047;
    float _1119 = _1067;
    float _1121 = _1073;
    float _1123 = _1081;
    float _1125 = _1049;
    float _1127 = _1051;
    float _1129 = _1053;
    bool _1131 = _1115 >= _1037;
    bool _1133 = isnan(_1115);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(_1037);
    bool _1139 = _1135 || _1137;
    float _1141 = _109 * _847;
    float _1143 = fma(_107, _849, _1141);
    float _1145 = fma(_111, _851, _1143);
    float _1147 = _1143;
    float _1149 = _1117;
    float _1151 = _1125;
    float _1153 = _1127;
    float _1155 = _1117;
    float _1157 = _1125;
    float _1159 = _1127;
    float _1161 = _1129;
    float _1163 = _1119;
    float _1165 = _1123;
    float _1167 = _1145;
    float _1169 = _1145;
    if (!_1139)
    {
        _1055 = _97;
    }
    float _1171 = _1055;
    float _1173 = _1171;
    float _1175 = _1171;
    if (!_1139)
    {
        _1057 = _99;
    }
    float _1177 = _1057;
    float _1179 = _1177;
    float _1181 = _1177;
    if (!_1139)
    {
        _1147 = _101;
    }
    float _1183 = _1147;
    bool _1185 = !_1139;
    float _1187 = _1183;
    float _1189 = _1183;
    if (!_1185)
    {
        bool _1191 = _1117 > _1037;
        if (_1191)
        {
            _1149 = _1037;
        }
        float _1193 = _1149;
        _1155 = _1193;
        if (!_1191)
        {
            _1173 = _1119;
        }
        float _1195 = _1173;
        float _1197 = _1195;
        if (!_1191)
        {
            _1179 = _1121;
        }
        float _1199 = _1179;
        float _1201 = _1199;
        if (!_1191)
        {
            _1187 = _1123;
        }
        float _1203 = _1187;
        float _1205 = _1203;
        if (!_1191)
        {
            _1059 = _1115;
        }
        float _1207 = _1059;
        float _1209 = _1207;
        if (_1191)
        {
            _1197 = _1119;
        }
        float _1211 = _1197;
        _1175 = _1211;
        if (_1191)
        {
            _1201 = _1121;
        }
        float _1213 = _1201;
        _1181 = _1213;
        if (_1191)
        {
            _1205 = _1123;
        }
        float _1215 = _1205;
        _1189 = _1215;
        if (_1191)
        {
            _1209 = _1115;
        }
        float _1217 = _1209;
        _1061 = _1217;
        if (_1191)
        {
            _1151 = _97;
        }
        float _1219 = _1151;
        _1157 = _1219;
        if (_1191)
        {
            _1153 = _99;
        }
        float _1221 = _1153;
        _1159 = _1221;
        if (_1191)
        {
            _1161 = _101;
        }
    }
    float _1223 = _1061;
    float _1225 = _1155;
    float _1227 = _1175;
    float _1229 = _1181;
    float _1231 = _1189;
    float _1233 = _1157;
    float _1235 = _1159;
    float _1237 = _1161;
    bool _1239 = _1223 >= _1145;
    bool _1241 = isnan(_1223);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan(_1145);
    bool _1247 = _1243 || _1245;
    float _1249 = _119 * _847;
    float _1251 = fma(_117, _849, _1249);
    float _1253 = fma(_121, _851, _1251);
    float _1255 = _1251;
    float _1257 = _1225;
    float _1259 = _1233;
    float _1261 = _1235;
    float _1263 = _1225;
    float _1265 = _1233;
    float _1267 = _1235;
    float _1269 = _1237;
    float _1271 = _1227;
    float _1273 = _1229;
    float _1275 = _1253;
    float _1277 = _1253;
    float _1279 = _1223;
    if (!_1247)
    {
        _1163 = _107;
    }
    float _1281 = _1163;
    float _1283 = _1281;
    float _1285 = _1281;
    if (!_1247)
    {
        _1255 = _109;
    }
    float _1287 = _1255;
    float _1289 = _1287;
    float _1291 = _1287;
    if (!_1247)
    {
        _1165 = _111;
    }
    float _1293 = _1165;
    bool _1295 = !_1247;
    float _1297 = _1293;
    float _1299 = _1293;
    if (!_1295)
    {
        bool _1301 = _1225 > _1145;
        if (_1301)
        {
            _1257 = _1145;
        }
        float _1303 = _1257;
        _1263 = _1303;
        if (!_1301)
        {
            _1283 = _1227;
        }
        float _1305 = _1283;
        float _1307 = _1305;
        if (!_1301)
        {
            _1289 = _1229;
        }
        float _1309 = _1289;
        float _1311 = _1309;
        if (!_1301)
        {
            _1297 = _1231;
        }
        float _1313 = _1297;
        float _1315 = _1313;
        if (!_1301)
        {
            _1167 = _1223;
        }
        float _1317 = _1167;
        float _1319 = _1317;
        if (_1301)
        {
            _1307 = _1227;
        }
        float _1321 = _1307;
        _1285 = _1321;
        if (_1301)
        {
            _1311 = _1229;
        }
        float _1323 = _1311;
        _1291 = _1323;
        if (_1301)
        {
            _1315 = _1231;
        }
        float _1325 = _1315;
        _1299 = _1325;
        if (_1301)
        {
            _1319 = _1223;
        }
        float _1327 = _1319;
        _1169 = _1327;
        if (_1301)
        {
            _1259 = _107;
        }
        float _1329 = _1259;
        _1265 = _1329;
        if (_1301)
        {
            _1261 = _109;
        }
        float _1331 = _1261;
        _1267 = _1331;
        if (_1301)
        {
            _1269 = _111;
        }
    }
    float _1333 = _1169;
    float _1335 = _1263;
    float _1337 = _1285;
    float _1339 = _1291;
    float _1341 = _1299;
    float _1343 = _1265;
    float _1345 = _1267;
    float _1347 = _1269;
    bool _1349 = _1333 >= _1253;
    bool _1351 = isnan(_1333);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(_1253);
    bool _1357 = _1353 || _1355;
    float _1359 = _129 * _847;
    float _1361 = fma(_127, _849, _1359);
    float _1363 = fma(_131, _851, _1361);
    float _1365 = _1361;
    float _1367 = _1335;
    float _1369 = _1343;
    float _1371 = _1345;
    float _1373 = _1335;
    float _1375 = _1343;
    float _1377 = _1345;
    float _1379 = _1347;
    float _1381 = _1341;
    float _1383 = _1333;
    float _1385 = _1363;
    float _1387 = _1363;
    if (!_1357)
    {
        _1271 = _117;
    }
    float _1389 = _1271;
    float _1391 = _1389;
    float _1393 = _1389;
    if (!_1357)
    {
        _1273 = _119;
    }
    float _1395 = _1273;
    float _1397 = _1395;
    float _1399 = _1395;
    if (!_1357)
    {
        _1365 = _121;
    }
    float _1401 = _1365;
    bool _1403 = !_1357;
    float _1405 = _1401;
    float _1407 = _1401;
    if (!_1403)
    {
        bool _1409 = _1335 > _1253;
        if (_1409)
        {
            _1367 = _1253;
        }
        float _1411 = _1367;
        _1373 = _1411;
        if (!_1409)
        {
            _1391 = _1337;
        }
        float _1413 = _1391;
        float _1415 = _1413;
        if (!_1409)
        {
            _1397 = _1339;
        }
        float _1417 = _1397;
        float _1419 = _1417;
        if (!_1409)
        {
            _1405 = _1341;
        }
        float _1421 = _1405;
        float _1423 = _1421;
        if (!_1409)
        {
            _1275 = _1333;
        }
        float _1425 = _1275;
        float _1427 = _1425;
        if (_1409)
        {
            _1415 = _1337;
        }
        float _1429 = _1415;
        _1393 = _1429;
        if (_1409)
        {
            _1419 = _1339;
        }
        float _1431 = _1419;
        _1399 = _1431;
        if (_1409)
        {
            _1423 = _1341;
        }
        float _1433 = _1423;
        _1407 = _1433;
        if (_1409)
        {
            _1427 = _1333;
        }
        float _1435 = _1427;
        _1277 = _1435;
        if (_1409)
        {
            _1369 = _117;
        }
        float _1437 = _1369;
        _1375 = _1437;
        if (_1409)
        {
            _1371 = _119;
        }
        float _1439 = _1371;
        _1377 = _1439;
        if (_1409)
        {
            _1379 = _121;
        }
    }
    float _1441 = _1277;
    float _1443 = _1373;
    float _1445 = _1393;
    float _1447 = _1399;
    float _1449 = _1407;
    float _1451 = _1375;
    float _1453 = _1377;
    float _1455 = _1379;
    bool _1457 = _1441 >= _1363;
    bool _1459 = isnan(_1441);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(_1363);
    bool _1465 = _1461 || _1463;
    float _1467 = _139 * _847;
    float _1469 = fma(_137, _849, _1467);
    float _1471 = fma(_141, _851, _1469);
    float _1473 = _1443;
    float _1475 = _1451;
    float _1477 = _1453;
    float _1479 = _1443;
    float _1481 = _1451;
    float _1483 = _1453;
    float _1485 = _1455;
    float _1487 = _1445;
    float _1489 = _1447;
    float _1491 = _1471;
    float _1493 = _1471;
    if (!_1465)
    {
        _1381 = _127;
    }
    float _1495 = _1381;
    float _1497 = _1495;
    float _1499 = _1495;
    if (!_1465)
    {
        _1279 = _129;
    }
    float _1501 = _1279;
    float _1503 = _1501;
    float _1505 = _1501;
    if (!_1465)
    {
        _1383 = _131;
    }
    float _1507 = _1383;
    bool _1509 = !_1465;
    float _1511 = _1507;
    float _1513 = _1507;
    if (!_1509)
    {
        bool _1515 = _1443 > _1363;
        if (_1515)
        {
            _1473 = _1363;
        }
        float _1517 = _1473;
        _1479 = _1517;
        if (!_1515)
        {
            _1497 = _1445;
        }
        float _1519 = _1497;
        float _1521 = _1519;
        if (!_1515)
        {
            _1503 = _1447;
        }
        float _1523 = _1503;
        float _1525 = _1523;
        if (!_1515)
        {
            _1511 = _1449;
        }
        float _1527 = _1511;
        float _1529 = _1527;
        if (!_1515)
        {
            _1385 = _1441;
        }
        float _1531 = _1385;
        float _1533 = _1531;
        if (_1515)
        {
            _1521 = _1445;
        }
        float _1535 = _1521;
        _1499 = _1535;
        if (_1515)
        {
            _1525 = _1447;
        }
        float _1537 = _1525;
        _1505 = _1537;
        if (_1515)
        {
            _1529 = _1449;
        }
        float _1539 = _1529;
        _1513 = _1539;
        if (_1515)
        {
            _1533 = _1441;
        }
        float _1541 = _1533;
        _1387 = _1541;
        if (_1515)
        {
            _1475 = _127;
        }
        float _1543 = _1475;
        _1481 = _1543;
        if (_1515)
        {
            _1477 = _129;
        }
        float _1545 = _1477;
        _1483 = _1545;
        if (_1515)
        {
            _1485 = _131;
        }
    }
    float _1547 = _1387;
    float _1549 = _1479;
    float _1551 = _1499;
    float _1553 = _1505;
    float _1555 = _1513;
    float _1557 = _1481;
    float _1559 = _1483;
    float _1561 = _1485;
    bool _1563 = _1547 >= _1471;
    bool _1565 = isnan(_1547);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan(_1471);
    bool _1571 = _1567 || _1569;
    float _1573 = _149 * _847;
    float _1575 = fma(_147, _849, _1573);
    float _1577 = fma(_151, _851, _1575);
    float _1579 = _1575;
    float _1581 = _1549;
    float _1583 = _1557;
    float _1585 = _1559;
    float _1587 = _1549;
    float _1589 = _1557;
    float _1591 = _1559;
    float _1593 = _1561;
    float _1595 = _1555;
    float _1597 = _1551;
    float _1599 = _1577;
    float _1601 = _1577;
    if (!_1571)
    {
        _1487 = _137;
    }
    float _1603 = _1487;
    float _1605 = _1603;
    float _1607 = _1603;
    if (!_1571)
    {
        _1489 = _139;
    }
    float _1609 = _1489;
    float _1611 = _1609;
    float _1613 = _1609;
    if (!_1571)
    {
        _1579 = _141;
    }
    float _1615 = _1579;
    bool _1617 = !_1571;
    float _1619 = _1615;
    float _1621 = _1615;
    if (!_1617)
    {
        bool _1623 = _1549 > _1471;
        if (_1623)
        {
            _1581 = _1471;
        }
        float _1625 = _1581;
        _1587 = _1625;
        if (!_1623)
        {
            _1605 = _1551;
        }
        float _1627 = _1605;
        float _1629 = _1627;
        if (!_1623)
        {
            _1611 = _1553;
        }
        float _1631 = _1611;
        float _1633 = _1631;
        if (!_1623)
        {
            _1619 = _1555;
        }
        float _1635 = _1619;
        float _1637 = _1635;
        if (!_1623)
        {
            _1491 = _1547;
        }
        float _1639 = _1491;
        float _1641 = _1639;
        if (_1623)
        {
            _1629 = _1551;
        }
        float _1643 = _1629;
        _1607 = _1643;
        if (_1623)
        {
            _1633 = _1553;
        }
        float _1645 = _1633;
        _1613 = _1645;
        if (_1623)
        {
            _1637 = _1555;
        }
        float _1647 = _1637;
        _1621 = _1647;
        if (_1623)
        {
            _1641 = _1547;
        }
        float _1649 = _1641;
        _1493 = _1649;
        if (_1623)
        {
            _1583 = _137;
        }
        float _1651 = _1583;
        _1589 = _1651;
        if (_1623)
        {
            _1585 = _139;
        }
        float _1653 = _1585;
        _1591 = _1653;
        if (_1623)
        {
            _1593 = _141;
        }
    }
    float _1655 = _1493;
    float _1657 = _1587;
    float _1659 = _1607;
    float _1661 = _1613;
    float _1663 = _1621;
    float _1665 = _1589;
    float _1667 = _1591;
    float _1669 = _1593;
    bool _1671 = _1655 >= _1577;
    bool _1673 = isnan(_1655);
    bool _1675 = _1671 || _1673;
    bool _1677 = isnan(_1577);
    bool _1679 = _1675 || _1677;
    float _1681 = _159 * _847;
    float _1683 = fma(_157, _849, _1681);
    float _1685 = fma(_161, _851, _1683);
    float _1687 = _1683;
    float _1689 = _1657;
    float _1691 = _1665;
    float _1693 = _1667;
    float _1695 = _1657;
    float _1697 = _1665;
    float _1699 = _1667;
    float _1701 = _1669;
    float _1703 = _1661;
    float _1705 = _1659;
    float _1707 = _1685;
    float _1709 = _1685;
    if (!_1679)
    {
        _1595 = _147;
    }
    float _1711 = _1595;
    float _1713 = _1711;
    float _1715 = _1711;
    if (!_1679)
    {
        _1687 = _149;
    }
    float _1717 = _1687;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1679)
    {
        _1597 = _151;
    }
    float _1723 = _1597;
    bool _1725 = !_1679;
    float _1727 = _1723;
    float _1729 = _1723;
    if (!_1725)
    {
        bool _1731 = _1657 > _1577;
        if (_1731)
        {
            _1689 = _1577;
        }
        float _1733 = _1689;
        _1695 = _1733;
        if (!_1731)
        {
            _1713 = _1659;
        }
        float _1735 = _1713;
        float _1737 = _1735;
        if (!_1731)
        {
            _1719 = _1661;
        }
        float _1739 = _1719;
        float _1741 = _1739;
        if (!_1731)
        {
            _1727 = _1663;
        }
        float _1743 = _1727;
        float _1745 = _1743;
        if (!_1731)
        {
            _1599 = _1655;
        }
        float _1747 = _1599;
        float _1749 = _1747;
        if (_1731)
        {
            _1737 = _1659;
        }
        float _1751 = _1737;
        _1715 = _1751;
        if (_1731)
        {
            _1741 = _1661;
        }
        float _1753 = _1741;
        _1721 = _1753;
        if (_1731)
        {
            _1745 = _1663;
        }
        float _1755 = _1745;
        _1729 = _1755;
        if (_1731)
        {
            _1749 = _1655;
        }
        float _1757 = _1749;
        _1601 = _1757;
        if (_1731)
        {
            _1691 = _147;
        }
        float _1759 = _1691;
        _1697 = _1759;
        if (_1731)
        {
            _1693 = _149;
        }
        float _1761 = _1693;
        _1699 = _1761;
        if (_1731)
        {
            _1701 = _151;
        }
    }
    float _1763 = _1601;
    float _1765 = _1695;
    float _1767 = _1715;
    float _1769 = _1721;
    float _1771 = _1729;
    float _1773 = _1697;
    float _1775 = _1699;
    float _1777 = _1701;
    bool _1779 = _1763 >= _1685;
    bool _1781 = isnan(_1763);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan(_1685);
    bool _1787 = _1783 || _1785;
    float _1789 = _169 * _847;
    float _1791 = fma(_167, _849, _1789);
    float _1793 = fma(_171, _851, _1791);
    float _1795 = _1791;
    float _1797 = _1765;
    float _1799 = _1773;
    float _1801 = _1775;
    float _1803 = _1765;
    float _1805 = _1773;
    float _1807 = _1775;
    float _1809 = _1777;
    float _1811 = _1771;
    float _1813 = _1763;
    float _1815 = _1793;
    float _1817 = _1793;
    if (!_1787)
    {
        _1795 = _157;
    }
    float _1819 = _1795;
    float _1821 = _1819;
    float _1823 = _1819;
    if (!_1787)
    {
        _1703 = _159;
    }
    float _1825 = _1703;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1787)
    {
        _1705 = _161;
    }
    float _1831 = _1705;
    bool _1833 = !_1787;
    float _1835 = _1831;
    float _1837 = _1831;
    if (!_1833)
    {
        bool _1839 = _1765 > _1685;
        if (_1839)
        {
            _1797 = _1685;
        }
        float _1841 = _1797;
        _1803 = _1841;
        if (!_1839)
        {
            _1821 = _1767;
        }
        float _1843 = _1821;
        float _1845 = _1843;
        if (!_1839)
        {
            _1827 = _1769;
        }
        float _1847 = _1827;
        float _1849 = _1847;
        if (!_1839)
        {
            _1835 = _1771;
        }
        float _1851 = _1835;
        float _1853 = _1851;
        if (!_1839)
        {
            _1707 = _1763;
        }
        float _1855 = _1707;
        float _1857 = _1855;
        if (_1839)
        {
            _1845 = _1767;
        }
        float _1859 = _1845;
        _1823 = _1859;
        if (_1839)
        {
            _1849 = _1769;
        }
        float _1861 = _1849;
        _1829 = _1861;
        if (_1839)
        {
            _1853 = _1771;
        }
        float _1863 = _1853;
        _1837 = _1863;
        if (_1839)
        {
            _1857 = _1763;
        }
        float _1865 = _1857;
        _1709 = _1865;
        if (_1839)
        {
            _1799 = _157;
        }
        float _1867 = _1799;
        _1805 = _1867;
        if (_1839)
        {
            _1801 = _159;
        }
        float _1869 = _1801;
        _1807 = _1869;
        if (_1839)
        {
            _1809 = _161;
        }
    }
    float _1871 = _1709;
    float _1873 = _1803;
    float _1875 = _1823;
    float _1877 = _1829;
    float _1879 = _1837;
    float _1881 = _1805;
    float _1883 = _1807;
    float _1885 = _1809;
    bool _1887 = _1871 >= _1793;
    bool _1889 = isnan(_1871);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(_1793);
    bool _1895 = _1891 || _1893;
    float _1897 = _179 * _847;
    float _1899 = fma(_177, _849, _1897);
    float _1901 = fma(_181, _851, _1899);
    float _1903 = _1899;
    float _1905 = _1873;
    float _1907 = _1881;
    float _1909 = _1883;
    float _1911 = _1873;
    float _1913 = _1881;
    float _1915 = _1883;
    float _1917 = _1885;
    float _1919 = _1877;
    float _1921 = _1879;
    float _1923 = _1901;
    float _1925 = _1901;
    if (!_1895)
    {
        _1811 = _167;
    }
    float _1927 = _1811;
    float _1929 = _1927;
    float _1931 = _1927;
    if (!_1895)
    {
        _1903 = _169;
    }
    float _1933 = _1903;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1895)
    {
        _1813 = _171;
    }
    float _1939 = _1813;
    bool _1941 = !_1895;
    float _1943 = _1939;
    float _1945 = _1939;
    if (!_1941)
    {
        bool _1947 = _1873 > _1793;
        if (_1947)
        {
            _1905 = _1793;
        }
        float _1949 = _1905;
        _1911 = _1949;
        if (!_1947)
        {
            _1929 = _1875;
        }
        float _1951 = _1929;
        float _1953 = _1951;
        if (!_1947)
        {
            _1935 = _1877;
        }
        float _1955 = _1935;
        float _1957 = _1955;
        if (!_1947)
        {
            _1943 = _1879;
        }
        float _1959 = _1943;
        float _1961 = _1959;
        if (!_1947)
        {
            _1815 = _1871;
        }
        float _1963 = _1815;
        float _1965 = _1963;
        if (_1947)
        {
            _1953 = _1875;
        }
        float _1967 = _1953;
        _1931 = _1967;
        if (_1947)
        {
            _1957 = _1877;
        }
        float _1969 = _1957;
        _1937 = _1969;
        if (_1947)
        {
            _1961 = _1879;
        }
        float _1971 = _1961;
        _1945 = _1971;
        if (_1947)
        {
            _1965 = _1871;
        }
        float _1973 = _1965;
        _1817 = _1973;
        if (_1947)
        {
            _1907 = _167;
        }
        float _1975 = _1907;
        _1913 = _1975;
        if (_1947)
        {
            _1909 = _169;
        }
        float _1977 = _1909;
        _1915 = _1977;
        if (_1947)
        {
            _1917 = _171;
        }
    }
    float _1979 = _1817;
    float _1981 = _1911;
    float _1983 = _1931;
    float _1985 = _1937;
    float _1987 = _1945;
    float _1989 = _1913;
    float _1991 = _1915;
    float _1993 = _1917;
    bool _1995 = _1979 >= _1901;
    bool _1997 = isnan(_1979);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(_1901);
    bool _2003 = _1999 || _2001;
    float _2005 = _189 * _847;
    float _2007 = fma(_187, _849, _2005);
    float _2009 = fma(_191, _851, _2007);
    float _2011 = _2007;
    float _2013 = _1981;
    float _2015 = _1989;
    float _2017 = _1991;
    float _2019 = _1981;
    float _2021 = _1989;
    float _2023 = _1991;
    float _2025 = _1993;
    float _2027 = _1983;
    float _2029 = _1987;
    float _2031 = _2009;
    float _2033 = _2009;
    if (!_2003)
    {
        _2011 = _177;
    }
    float _2035 = _2011;
    float _2037 = _2035;
    float _2039 = _2035;
    if (!_2003)
    {
        _1919 = _179;
    }
    float _2041 = _1919;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_2003)
    {
        _1921 = _181;
    }
    float _2047 = _1921;
    bool _2049 = !_2003;
    float _2051 = _2047;
    float _2053 = _2047;
    if (!_2049)
    {
        bool _2055 = _1981 > _1901;
        if (_2055)
        {
            _2013 = _1901;
        }
        float _2057 = _2013;
        _2019 = _2057;
        if (!_2055)
        {
            _2037 = _1983;
        }
        float _2059 = _2037;
        float _2061 = _2059;
        if (!_2055)
        {
            _2043 = _1985;
        }
        float _2063 = _2043;
        float _2065 = _2063;
        if (!_2055)
        {
            _2051 = _1987;
        }
        float _2067 = _2051;
        float _2069 = _2067;
        if (!_2055)
        {
            _1923 = _1979;
        }
        float _2071 = _1923;
        float _2073 = _2071;
        if (_2055)
        {
            _2061 = _1983;
        }
        float _2075 = _2061;
        _2039 = _2075;
        if (_2055)
        {
            _2065 = _1985;
        }
        float _2077 = _2065;
        _2045 = _2077;
        if (_2055)
        {
            _2069 = _1987;
        }
        float _2079 = _2069;
        _2053 = _2079;
        if (_2055)
        {
            _2073 = _1979;
        }
        float _2081 = _2073;
        _1925 = _2081;
        if (_2055)
        {
            _2015 = _177;
        }
        float _2083 = _2015;
        _2021 = _2083;
        if (_2055)
        {
            _2017 = _179;
        }
        float _2085 = _2017;
        _2023 = _2085;
        if (_2055)
        {
            _2025 = _181;
        }
    }
    float _2087 = _1925;
    float _2089 = _2019;
    float _2091 = _2039;
    float _2093 = _2045;
    float _2095 = _2053;
    float _2097 = _2021;
    float _2099 = _2023;
    float _2101 = _2025;
    bool _2103 = _2087 >= _2009;
    bool _2105 = isnan(_2087);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(_2009);
    bool _2111 = _2107 || _2109;
    float _2113 = _199 * _847;
    float _2115 = fma(_197, _849, _2113);
    float _2117 = fma(_201, _851, _2115);
    float _2119 = _2115;
    float _2121 = _2089;
    float _2123 = _2097;
    float _2125 = _2099;
    float _2127 = _2089;
    float _2129 = _2097;
    float _2131 = _2099;
    float _2133 = _2101;
    float _2135 = _2093;
    float _2137 = _2095;
    float _2139 = _2117;
    float _2141 = _2117;
    if (!_2111)
    {
        _2027 = _187;
    }
    float _2143 = _2027;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2111)
    {
        _2119 = _189;
    }
    float _2149 = _2119;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2111)
    {
        _2029 = _191;
    }
    float _2155 = _2029;
    bool _2157 = !_2111;
    float _2159 = _2155;
    float _2161 = _2155;
    if (!_2157)
    {
        bool _2163 = _2089 > _2009;
        if (_2163)
        {
            _2121 = _2009;
        }
        float _2165 = _2121;
        _2127 = _2165;
        if (!_2163)
        {
            _2145 = _2091;
        }
        float _2167 = _2145;
        float _2169 = _2167;
        if (!_2163)
        {
            _2151 = _2093;
        }
        float _2171 = _2151;
        float _2173 = _2171;
        if (!_2163)
        {
            _2159 = _2095;
        }
        float _2175 = _2159;
        float _2177 = _2175;
        if (!_2163)
        {
            _2031 = _2087;
        }
        float _2179 = _2031;
        float _2181 = _2179;
        if (_2163)
        {
            _2169 = _2091;
        }
        float _2183 = _2169;
        _2147 = _2183;
        if (_2163)
        {
            _2173 = _2093;
        }
        float _2185 = _2173;
        _2153 = _2185;
        if (_2163)
        {
            _2177 = _2095;
        }
        float _2187 = _2177;
        _2161 = _2187;
        if (_2163)
        {
            _2181 = _2087;
        }
        float _2189 = _2181;
        _2033 = _2189;
        if (_2163)
        {
            _2123 = _187;
        }
        float _2191 = _2123;
        _2129 = _2191;
        if (_2163)
        {
            _2125 = _189;
        }
        float _2193 = _2125;
        _2131 = _2193;
        if (_2163)
        {
            _2133 = _191;
        }
    }
    float _2195 = _2033;
    float _2197 = _2127;
    float _2199 = _2147;
    float _2201 = _2153;
    float _2203 = _2161;
    float _2205 = _2129;
    float _2207 = _2131;
    float _2209 = _2133;
    bool _2211 = _2195 >= _2117;
    bool _2213 = isnan(_2195);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(_2117);
    bool _2219 = _2215 || _2217;
    float _2221 = _209 * _847;
    float _2223 = fma(_207, _849, _2221);
    float _2225 = fma(_211, _851, _2223);
    float _2227 = _2223;
    float _2229 = _2197;
    float _2231 = _2205;
    float _2233 = _2207;
    float _2235 = _2205;
    float _2237 = _2207;
    float _2239 = _2197;
    float _2241 = _2209;
    float _2243 = _2203;
    float _2245 = _2199;
    float _2247 = _2225;
    float _2249 = _2225;
    if (!_2219)
    {
        _2227 = _197;
    }
    float _2251 = _2227;
    float _2253 = _2251;
    float _2255 = _2251;
    if (!_2219)
    {
        _2135 = _199;
    }
    float _2257 = _2135;
    float _2259 = _2257;
    float _2261 = _2257;
    if (!_2219)
    {
        _2137 = _201;
    }
    float _2263 = _2137;
    bool _2265 = !_2219;
    float _2267 = _2263;
    float _2269 = _2263;
    if (!_2265)
    {
        bool _2271 = _2197 > _2117;
        if (_2271)
        {
            _2229 = _2117;
        }
        float _2273 = _2229;
        _2239 = _2273;
        if (!_2271)
        {
            _2253 = _2199;
        }
        float _2275 = _2253;
        float _2277 = _2275;
        if (!_2271)
        {
            _2259 = _2201;
        }
        float _2279 = _2259;
        float _2281 = _2279;
        if (!_2271)
        {
            _2267 = _2203;
        }
        float _2283 = _2267;
        float _2285 = _2283;
        if (!_2271)
        {
            _2139 = _2195;
        }
        float _2287 = _2139;
        float _2289 = _2287;
        if (_2271)
        {
            _2277 = _2199;
        }
        float _2291 = _2277;
        _2255 = _2291;
        if (_2271)
        {
            _2281 = _2201;
        }
        float _2293 = _2281;
        _2261 = _2293;
        if (_2271)
        {
            _2285 = _2203;
        }
        float _2295 = _2285;
        _2269 = _2295;
        if (_2271)
        {
            _2289 = _2195;
        }
        float _2297 = _2289;
        _2141 = _2297;
        if (_2271)
        {
            _2231 = _197;
        }
        float _2299 = _2231;
        _2235 = _2299;
        if (_2271)
        {
            _2233 = _199;
        }
        float _2301 = _2233;
        _2237 = _2301;
        if (_2271)
        {
            _2241 = _201;
        }
    }
    float _2303 = _2141;
    float _2305 = _2235;
    float _2307 = _2237;
    float _2309 = _2239;
    float _2311 = _2255;
    float _2313 = _2261;
    float _2315 = _2269;
    float _2317 = _2241;
    bool _2319 = _2303 >= _2225;
    bool _2321 = isnan(_2303);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan(_2225);
    bool _2327 = _2323 || _2325;
    float _2329 = _219 * _847;
    float _2331 = fma(_217, _849, _2329);
    float _2333 = fma(_221, _851, _2331);
    float _2335 = _2331;
    float _2337 = _2309;
    float _2339 = _2317;
    float _2341 = _2309;
    float _2343 = _2307;
    float _2345 = _2305;
    if (!_2327)
    {
        _907 = _2305;
    }
    float _2347 = _907;
    float _2349 = _2347;
    float _2351 = _2347;
    if (!_2327)
    {
        _2335 = _2307;
    }
    float _2353 = _2335;
    float _2355 = _2353;
    float _2357 = _2353;
    if (!_2327)
    {
        _909 = _207;
    }
    float _2359 = _909;
    float _2361 = _2359;
    float _2363 = _2359;
    if (!_2327)
    {
        _2243 = _209;
    }
    float _2365 = _2243;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2327)
    {
        _2245 = _211;
    }
    float _2371 = _2245;
    bool _2373 = !_2327;
    float _2375 = _2371;
    float _2377 = _2371;
    if (!_2373)
    {
        bool _2379 = _2309 > _2225;
        if (_2379)
        {
            _2337 = _2225;
        }
        float _2381 = _2337;
        _2341 = _2381;
        if (!_2379)
        {
            _2361 = _2311;
        }
        float _2383 = _2361;
        float _2385 = _2383;
        if (!_2379)
        {
            _2367 = _2313;
        }
        float _2387 = _2367;
        float _2389 = _2387;
        if (!_2379)
        {
            _2375 = _2315;
        }
        float _2391 = _2375;
        float _2393 = _2391;
        if (!_2379)
        {
            _2247 = _2303;
        }
        float _2395 = _2247;
        float _2397 = _2395;
        if (!_2379)
        {
            _2349 = _2305;
        }
        float _2399 = _2349;
        float _2401 = _2399;
        if (!_2379)
        {
            _2355 = _2307;
        }
        float _2403 = _2355;
        float _2405 = _2403;
        if (_2379)
        {
            _2385 = _2311;
        }
        float _2407 = _2385;
        _2363 = _2407;
        if (_2379)
        {
            _2389 = _2313;
        }
        float _2409 = _2389;
        _2369 = _2409;
        if (_2379)
        {
            _2393 = _2315;
        }
        float _2411 = _2393;
        _2377 = _2411;
        if (_2379)
        {
            _2397 = _2303;
        }
        float _2413 = _2397;
        _2249 = _2413;
        if (_2379)
        {
            _2401 = _207;
        }
        float _2415 = _2401;
        _2351 = _2415;
        if (_2379)
        {
            _2405 = _209;
        }
        float _2417 = _2405;
        _2357 = _2417;
        if (_2379)
        {
            _2339 = _211;
        }
    }
    float _2419 = _2249;
    float _2421 = _2351;
    float _2423 = _2339;
    float _2425 = _2341;
    float _2427 = _2363;
    float _2429 = _2369;
    float _2431 = _2377;
    float _2433 = _2357;
    bool _2435 = _2419 >= _2333;
    bool _2437 = isnan(_2419);
    bool _2439 = _2435 || _2437;
    bool _2441 = isnan(_2333);
    bool _2443 = _2439 || _2441;
    float _2445 = _2433;
    float _2447 = _2433;
    if (!_2443)
    {
        _2343 = _2421;
    }
    float _2449 = _2343;
    float _2451 = _2449;
    float _2453 = _2449;
    if (!_2443)
    {
        _2345 = _2423;
    }
    float _2455 = _2345;
    float _2457 = 0.0;
    float _2459 = _2455;
    float _2461 = _2455;
    if (!_2443)
    {
        _2457 = _217;
    }
    float _2463 = _2457;
    float _2465 = 0.0;
    float _2467 = _2463;
    float _2469 = _2463;
    if (!_2443)
    {
        _2465 = _219;
    }
    float _2471 = _2465;
    float _2473 = 0.0;
    float _2475 = _2471;
    float _2477 = _2471;
    if (!_2443)
    {
        _2473 = _221;
    }
    float _2479 = _2473;
    bool _2481 = !_2443;
    float _2483 = _2479;
    float _2485 = _2479;
    if (!_2481)
    {
        bool _2487 = _2425 > _2333;
        if (!_2487)
        {
            _2467 = _2427;
        }
        float _2489 = _2467;
        float _2491 = _2489;
        if (!_2487)
        {
            _2475 = _2429;
        }
        float _2493 = _2475;
        float _2495 = _2493;
        if (!_2487)
        {
            _2483 = _2431;
        }
        float _2497 = _2483;
        float _2499 = _2497;
        if (!_2487)
        {
            _2451 = _2421;
        }
        float _2501 = _2451;
        float _2503 = _2501;
        if (!_2487)
        {
            _2459 = _2423;
        }
        float _2505 = _2459;
        _2461 = _2505;
        if (_2487)
        {
            _2491 = _2427;
        }
        float _2507 = _2491;
        _2469 = _2507;
        if (_2487)
        {
            _2495 = _2429;
        }
        float _2509 = _2495;
        _2477 = _2509;
        if (_2487)
        {
            _2499 = _2431;
        }
        float _2511 = _2499;
        _2485 = _2511;
        if (_2487)
        {
            _2503 = _217;
        }
        float _2513 = _2503;
        _2453 = _2513;
        if (_2487)
        {
            _2445 = _219;
        }
        float _2515 = _2445;
        _2447 = _2515;
        if (_2487)
        {
            _2461 = _221;
        }
    }
    float _2517 = _2447;
    float _2519 = _2477;
    float _2521 = _2453;
    float _2523 = _2469;
    float _2525 = _2461;
    float _2527 = _2485;
    float _2529 = -_2517;
    float _2531 = _2519 + _2529;
    float _2533 = -_2521;
    float _2535 = _2523 + _2533;
    float _2537 = -_2525;
    float _2539 = _2527 + _2537;
    float _2541 = -_2517;
    float _2543 = _79 + _2541;
    float _2545 = _2531 * _2531;
    float _2547 = _2531 * _2543;
    float _2549 = fma(_2535, _2535, _2545);
    float _2551 = -_2521;
    float _2553 = _77 + _2551;
    float _2555 = -_2525;
    float _2557 = _81 + _2555;
    float _2559 = fma(_2539, _2539, _2549);
    float _2561 = fma(_2535, _2553, _2547);
    float _2563 = fma(_2539, _2557, _2561);
    float _2565 = 1.0 / _2559;
    float _2567 = _2565 * 3.0;
    float _2569 = _2567 * _2563;
    float _2571 = rint(_2569);
    float _2573 = precise::max(0.0, _2571);
    float _2575 = precise::min(_2573, 3.0);
    float _2577 = trunc(_2575);
    int _2580 = int(_2577);
    bool _2582 = _2580 >= 2;
    bool _2584 = !_2582;
    float _2586 = _2535;
    float _2588 = _2531;
    float _2590 = _2539;
    float _2592 = _2521;
    float _2594 = _2523;
    float _2596 = _2517;
    float _2598 = _2519;
    float _2600 = _2525;
    float _2602 = _2527;
    float _2612;
    float _2614;
    float _2616;
    float _2618;
    float _2620;
    float _2622;
    float _2624;
    float _2626;
    float _2628;
    float _2630;
    float _2632;
    float _2634;
    float _2636;
    float _2638;
    float _2640;
    float _2642;
    if (!_2584)
    {
        bool _2604 = _2580 >= 3;
        bool _2606 = !_2604;
        if (!_2606)
        {
            bool _2608 = _2580 != 3;
            _2610 = _2608;
            if (!_2610)
            {
                _2612 = _77;
                _2614 = _79;
                _2616 = _81;
                _2618 = 1.0;
                _2620 = 0.0;
                _2622 = 0.0;
                _2624 = 0.0;
                _2626 = 0.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = true;
            }
        }
        else
        {
            _2612 = 0.0;
            _2614 = 0.0;
            _2616 = 0.0;
            _2618 = 0.0;
            _2620 = 0.0;
            _2622 = 0.0;
            _2624 = 0.0;
            _2626 = 0.0;
            _2628 = _77;
            _2630 = _79;
            _2632 = _81;
            _2634 = 1.0;
            _2636 = 0.0;
            _2638 = 0.0;
            _2640 = 0.0;
            _2642 = 0.0;
            _2644 = true;
        }
    }
    if ((!_2644) || _2610)
    {
        bool _2646;
        if (!_2610)
        {
            _2646 = _2580 >= 1;
        }
        if ((!_2646) || _2610)
        {
            bool _2648;
            if (!_2610)
            {
                _2648 = _2580 != 0;
            }
            if ((!_2648) && (!_2610))
            {
                _2612 = 0.0;
                _2614 = 0.0;
                _2616 = 0.0;
                _2618 = 0.0;
                _2620 = _77;
                _2622 = _79;
                _2624 = _81;
                _2626 = 1.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = true;
            }
            else
            {
                _2610 = false;
                _2612 = 0.0;
                _2614 = 0.0;
                _2616 = 0.0;
                _2618 = 0.0;
                _2620 = 0.0;
                _2622 = 0.0;
                _2624 = 0.0;
                _2626 = 0.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = true;
            }
        }
        else
        {
            _2612 = 0.0;
            _2614 = 0.0;
            _2616 = 0.0;
            _2618 = 0.0;
            _2620 = 0.0;
            _2622 = 0.0;
            _2624 = 0.0;
            _2626 = 0.0;
            _2628 = 0.0;
            _2630 = 0.0;
            _2632 = 0.0;
            _2634 = 0.0;
            _2636 = _77;
            _2638 = _79;
            _2640 = _81;
            _2642 = 1.0;
        }
    }
    _2644 = false;
    float _2650 = _2612;
    float _2652 = _2614;
    float _2654 = _2616;
    float _2656 = _2618;
    float _2658 = _2620;
    float _2660 = _2622;
    float _2662 = _2624;
    float _2664 = _2626;
    float _2666 = _2628;
    float _2668 = _2630;
    float _2670 = _2632;
    float _2672 = _2634;
    float _2674 = _2636;
    float _2676 = _2638;
    float _2678 = _2640;
    float _2680 = _2642;
    float _2682 = -_2517;
    float _2684 = _69 + _2682;
    float _2686 = -_2521;
    float _2688 = _67 + _2686;
    float _2690 = _2531 * _2684;
    float _2692 = -_2525;
    float _2694 = _71 + _2692;
    float _2696 = fma(_2535, _2688, _2690);
    float _2698 = fma(_2539, _2694, _2696);
    float _2700 = _2567 * _2698;
    float _2702 = rint(_2700);
    float _2704 = precise::max(0.0, _2702);
    float _2706 = precise::min(_2704, 3.0);
    float _2708 = trunc(_2706);
    int _2710 = int(_2708);
    bool _2712 = _2710 >= 2;
    bool _2714 = !_2712;
    float _2716 = as_type<float>(_2710);
    float _2718 = _2702;
    float _2720 = _2696;
    float _2722 = _2690;
    float _2724 = _2650;
    float _2726 = _2652;
    float _2728 = _2654;
    float _2730 = _2656;
    float _2732 = _2666;
    float _2734 = _2668;
    float _2736 = _2670;
    float _2738 = _2672;
    float _2740 = _2674;
    float _2742 = _2676;
    float _2744 = _2678;
    float _2746 = _2680;
    float _2764;
    float _2766;
    float _2768;
    float _2770;
    if (!_2714)
    {
        bool _2748 = _2710 >= 3;
        bool _2750 = !_2748;
        if (!_2750)
        {
            bool _2752 = _2710 != 3;
            _2754 = _2752;
            if (!_2754)
            {
                float _2756 = _67 + _2650;
                float _2758 = _69 + _2652;
                float _2760 = _71 + _2654;
                float _2762 = _2656 + 1.0;
                _2724 = _2756;
                _2726 = _2758;
                _2728 = _2760;
                _2730 = _2762;
                _2764 = _2658;
                _2766 = _2660;
                _2768 = _2662;
                _2770 = _2664;
                _2772 = true;
            }
        }
        else
        {
            float _2774 = _67 + _2666;
            float _2776 = _69 + _2668;
            float _2778 = _71 + _2670;
            float _2780 = _2672 + 1.0;
            _2764 = _2658;
            _2766 = _2660;
            _2768 = _2662;
            _2770 = _2664;
            _2732 = _2774;
            _2734 = _2776;
            _2736 = _2778;
            _2738 = _2780;
            _2772 = true;
        }
    }
    if ((!_2772) || _2754)
    {
        bool _2782;
        if (!_2754)
        {
            _2782 = _2710 >= 1;
        }
        if ((!_2782) || _2754)
        {
            if (!_2754)
            {
                bool _2784 = _2710 != 0;
                if (!_2784)
                {
                    float _2786 = _67 + _2658;
                    _2716 = _2786;
                }
                float _2788 = _2716;
                _2764 = _2788;
                if (!_2784)
                {
                    float _2790 = _69 + _2660;
                    _2718 = _2790;
                }
                float _2792 = _2718;
                _2766 = _2792;
                if (!_2784)
                {
                    float _2794 = _71 + _2662;
                    _2720 = _2794;
                }
                float _2796 = _2720;
                _2768 = _2796;
                if (!_2784)
                {
                    float _2798 = _2664 + 1.0;
                    _2722 = _2798;
                }
                float _2800 = _2722;
                bool _2802 = !_2784;
                _2770 = _2800;
                _2772 = _2802;
            }
            if ((!_2772) || _2754)
            {
                _2754 = false;
                _2764 = _2658;
                _2766 = _2660;
                _2768 = _2662;
                _2770 = _2664;
                _2772 = true;
            }
        }
        else
        {
            float _2804 = _67 + _2674;
            float _2806 = _69 + _2676;
            float _2808 = _71 + _2678;
            float _2810 = _2680 + 1.0;
            _2764 = _2658;
            _2766 = _2660;
            _2768 = _2662;
            _2770 = _2664;
            _2740 = _2804;
            _2742 = _2806;
            _2744 = _2808;
            _2746 = _2810;
        }
    }
    _2772 = false;
    float _2812 = _2724;
    float _2814 = _2726;
    float _2816 = _2728;
    float _2818 = _2730;
    float _2820 = _2764;
    float _2822 = _2766;
    float _2824 = _2768;
    float _2826 = _2770;
    float _2828 = _2732;
    float _2830 = _2734;
    float _2832 = _2736;
    float _2834 = _2738;
    float _2836 = _2740;
    float _2838 = _2742;
    float _2840 = _2744;
    float _2842 = _2746;
    float _2844 = -_2517;
    float _2846 = _89 + _2844;
    float _2848 = -_2521;
    float _2850 = _87 + _2848;
    float _2852 = _2531 * _2846;
    float _2854 = -_2525;
    float _2856 = _91 + _2854;
    float _2858 = fma(_2535, _2850, _2852);
    float _2860 = fma(_2539, _2856, _2858);
    float _2862 = _2567 * _2860;
    float _2864 = rint(_2862);
    float _2866 = precise::max(0.0, _2864);
    float _2868 = precise::min(_2866, 3.0);
    float _2870 = trunc(_2868);
    int _2872 = int(_2870);
    bool _2874 = _2872 >= 2;
    bool _2876 = !_2874;
    float _2878 = _2864;
    float _2880 = as_type<float>(_2872);
    float _2882 = _2852;
    float _2884 = _2858;
    float _2886 = _2812;
    float _2888 = _2814;
    float _2890 = _2816;
    float _2892 = _2818;
    float _2894 = _2828;
    float _2896 = _2830;
    float _2898 = _2832;
    float _2900 = _2834;
    float _2902 = _2836;
    float _2904 = _2838;
    float _2906 = _2840;
    float _2908 = _2842;
    float _2926;
    float _2928;
    float _2930;
    float _2932;
    if (!_2876)
    {
        bool _2910 = _2872 >= 3;
        bool _2912 = !_2910;
        if (!_2912)
        {
            bool _2914 = _2872 != 3;
            _2916 = _2914;
            if (!_2916)
            {
                float _2918 = _87 + _2812;
                float _2920 = _89 + _2814;
                float _2922 = _91 + _2816;
                float _2924 = _2818 + 1.0;
                _2886 = _2918;
                _2888 = _2920;
                _2890 = _2922;
                _2892 = _2924;
                _2926 = _2820;
                _2928 = _2822;
                _2930 = _2824;
                _2932 = _2826;
                _2934 = true;
            }
        }
        else
        {
            float _2936 = _87 + _2828;
            float _2938 = _89 + _2830;
            float _2940 = _91 + _2832;
            float _2942 = _2834 + 1.0;
            _2926 = _2820;
            _2928 = _2822;
            _2930 = _2824;
            _2932 = _2826;
            _2894 = _2936;
            _2896 = _2938;
            _2898 = _2940;
            _2900 = _2942;
            _2934 = true;
        }
    }
    if ((!_2934) || _2916)
    {
        bool _2944;
        if (!_2916)
        {
            _2944 = _2872 >= 1;
        }
        if ((!_2944) || _2916)
        {
            if (!_2916)
            {
                bool _2946 = _2872 != 0;
                if (!_2946)
                {
                    float _2948 = _87 + _2820;
                    _2878 = _2948;
                }
                float _2950 = _2878;
                _2926 = _2950;
                if (!_2946)
                {
                    float _2952 = _89 + _2822;
                    _2880 = _2952;
                }
                float _2954 = _2880;
                _2928 = _2954;
                if (!_2946)
                {
                    float _2956 = _91 + _2824;
                    _2882 = _2956;
                }
                float _2958 = _2882;
                _2930 = _2958;
                if (!_2946)
                {
                    float _2960 = _2826 + 1.0;
                    _2884 = _2960;
                }
                float _2962 = _2884;
                bool _2964 = !_2946;
                _2932 = _2962;
                _2934 = _2964;
            }
            if ((!_2934) || _2916)
            {
                _2916 = false;
                _2926 = _2820;
                _2928 = _2822;
                _2930 = _2824;
                _2932 = _2826;
                _2934 = true;
            }
        }
        else
        {
            float _2966 = _87 + _2836;
            float _2968 = _89 + _2838;
            float _2970 = _91 + _2840;
            float _2972 = _2842 + 1.0;
            _2926 = _2820;
            _2928 = _2822;
            _2930 = _2824;
            _2932 = _2826;
            _2902 = _2966;
            _2904 = _2968;
            _2906 = _2970;
            _2908 = _2972;
        }
    }
    _2934 = false;
    float _2974 = _2886;
    float _2976 = _2888;
    float _2978 = _2890;
    float _2980 = _2892;
    float _2982 = _2926;
    float _2984 = _2928;
    float _2986 = _2930;
    float _2988 = _2932;
    float _2990 = _2894;
    float _2992 = _2896;
    float _2994 = _2898;
    float _2996 = _2900;
    float _2998 = _2902;
    float _3000 = _2904;
    float _3002 = _2906;
    float _3004 = _2908;
    float _3006 = -_2517;
    float _3008 = _99 + _3006;
    float _3010 = -_2521;
    float _3012 = _97 + _3010;
    float _3014 = _2531 * _3008;
    float _3016 = -_2525;
    float _3018 = _101 + _3016;
    float _3020 = fma(_2535, _3012, _3014);
    float _3022 = fma(_2539, _3018, _3020);
    float _3024 = _2567 * _3022;
    float _3026 = rint(_3024);
    float _3028 = precise::max(0.0, _3026);
    float _3030 = precise::min(_3028, 3.0);
    float _3032 = trunc(_3030);
    int _3034 = int(_3032);
    bool _3036 = _3034 >= 2;
    bool _3038 = !_3036;
    float _3040 = as_type<float>(_3034);
    float _3042 = _3026;
    float _3044 = _3020;
    float _3046 = _3014;
    float _3048 = _2974;
    float _3050 = _2976;
    float _3052 = _2978;
    float _3054 = _2980;
    float _3056 = _2990;
    float _3058 = _2992;
    float _3060 = _2994;
    float _3062 = _2996;
    float _3064 = _2998;
    float _3066 = _3000;
    float _3068 = _3002;
    float _3070 = _3004;
    float _3088;
    float _3090;
    float _3092;
    float _3094;
    if (!_3038)
    {
        bool _3072 = _3034 >= 3;
        bool _3074 = !_3072;
        if (!_3074)
        {
            bool _3076 = _3034 != 3;
            _3078 = _3076;
            if (!_3078)
            {
                float _3080 = _97 + _2974;
                float _3082 = _99 + _2976;
                float _3084 = _101 + _2978;
                float _3086 = _2980 + 1.0;
                _3048 = _3080;
                _3050 = _3082;
                _3052 = _3084;
                _3054 = _3086;
                _3088 = _2982;
                _3090 = _2984;
                _3092 = _2986;
                _3094 = _2988;
                _3096 = true;
            }
        }
        else
        {
            float _3098 = _97 + _2990;
            float _3100 = _99 + _2992;
            float _3102 = _101 + _2994;
            float _3104 = _2996 + 1.0;
            _3088 = _2982;
            _3090 = _2984;
            _3092 = _2986;
            _3094 = _2988;
            _3056 = _3098;
            _3058 = _3100;
            _3060 = _3102;
            _3062 = _3104;
            _3096 = true;
        }
    }
    if ((!_3096) || _3078)
    {
        bool _3106;
        if (!_3078)
        {
            _3106 = _3034 >= 1;
        }
        if ((!_3106) || _3078)
        {
            if (!_3078)
            {
                bool _3108 = _3034 != 0;
                if (!_3108)
                {
                    float _3110 = _97 + _2982;
                    _3040 = _3110;
                }
                float _3112 = _3040;
                _3088 = _3112;
                if (!_3108)
                {
                    float _3114 = _99 + _2984;
                    _3042 = _3114;
                }
                float _3116 = _3042;
                _3090 = _3116;
                if (!_3108)
                {
                    float _3118 = _101 + _2986;
                    _3044 = _3118;
                }
                float _3120 = _3044;
                _3092 = _3120;
                if (!_3108)
                {
                    float _3122 = _2988 + 1.0;
                    _3046 = _3122;
                }
                float _3124 = _3046;
                bool _3126 = !_3108;
                _3094 = _3124;
                _3096 = _3126;
            }
            if ((!_3096) || _3078)
            {
                _3078 = false;
                _3088 = _2982;
                _3090 = _2984;
                _3092 = _2986;
                _3094 = _2988;
                _3096 = true;
            }
        }
        else
        {
            float _3128 = _97 + _2998;
            float _3130 = _99 + _3000;
            float _3132 = _101 + _3002;
            float _3134 = _3004 + 1.0;
            _3088 = _2982;
            _3090 = _2984;
            _3092 = _2986;
            _3094 = _2988;
            _3064 = _3128;
            _3066 = _3130;
            _3068 = _3132;
            _3070 = _3134;
        }
    }
    _3096 = false;
    float _3136 = _3048;
    float _3138 = _3050;
    float _3140 = _3052;
    float _3142 = _3054;
    float _3144 = _3088;
    float _3146 = _3090;
    float _3148 = _3092;
    float _3150 = _3094;
    float _3152 = _3056;
    float _3154 = _3058;
    float _3156 = _3060;
    float _3158 = _3062;
    float _3160 = _3064;
    float _3162 = _3066;
    float _3164 = _3068;
    float _3166 = _3070;
    float _3168 = -_2517;
    float _3170 = _109 + _3168;
    float _3172 = -_2521;
    float _3174 = _107 + _3172;
    float _3176 = _2531 * _3170;
    float _3178 = -_2525;
    float _3180 = _111 + _3178;
    float _3182 = fma(_2535, _3174, _3176);
    float _3184 = fma(_2539, _3180, _3182);
    float _3186 = _2567 * _3184;
    float _3188 = rint(_3186);
    float _3190 = precise::max(0.0, _3188);
    float _3192 = precise::min(_3190, 3.0);
    float _3194 = trunc(_3192);
    int _3196 = int(_3194);
    bool _3198 = _3196 >= 2;
    bool _3200 = !_3198;
    float _3202 = _3188;
    float _3204 = as_type<float>(_3196);
    float _3206 = _3176;
    float _3208 = _3182;
    float _3210 = _3136;
    float _3212 = _3138;
    float _3214 = _3140;
    float _3216 = _3142;
    float _3218 = _3152;
    float _3220 = _3154;
    float _3222 = _3156;
    float _3224 = _3158;
    float _3226 = _3160;
    float _3228 = _3162;
    float _3230 = _3164;
    float _3232 = _3166;
    float _3250;
    float _3252;
    float _3254;
    float _3256;
    if (!_3200)
    {
        bool _3234 = _3196 >= 3;
        bool _3236 = !_3234;
        if (!_3236)
        {
            bool _3238 = _3196 != 3;
            _3240 = _3238;
            if (!_3240)
            {
                float _3242 = _107 + _3136;
                float _3244 = _109 + _3138;
                float _3246 = _111 + _3140;
                float _3248 = _3142 + 1.0;
                _3210 = _3242;
                _3212 = _3244;
                _3214 = _3246;
                _3216 = _3248;
                _3250 = _3144;
                _3252 = _3146;
                _3254 = _3148;
                _3256 = _3150;
                _3258 = true;
            }
        }
        else
        {
            float _3260 = _107 + _3152;
            float _3262 = _109 + _3154;
            float _3264 = _111 + _3156;
            float _3266 = _3158 + 1.0;
            _3250 = _3144;
            _3252 = _3146;
            _3254 = _3148;
            _3256 = _3150;
            _3218 = _3260;
            _3220 = _3262;
            _3222 = _3264;
            _3224 = _3266;
            _3258 = true;
        }
    }
    if ((!_3258) || _3240)
    {
        bool _3268;
        if (!_3240)
        {
            _3268 = _3196 >= 1;
        }
        if ((!_3268) || _3240)
        {
            if (!_3240)
            {
                bool _3270 = _3196 != 0;
                if (!_3270)
                {
                    float _3272 = _107 + _3144;
                    _3202 = _3272;
                }
                float _3274 = _3202;
                _3250 = _3274;
                if (!_3270)
                {
                    float _3276 = _109 + _3146;
                    _3204 = _3276;
                }
                float _3278 = _3204;
                _3252 = _3278;
                if (!_3270)
                {
                    float _3280 = _111 + _3148;
                    _3206 = _3280;
                }
                float _3282 = _3206;
                _3254 = _3282;
                if (!_3270)
                {
                    float _3284 = _3150 + 1.0;
                    _3208 = _3284;
                }
                float _3286 = _3208;
                bool _3288 = !_3270;
                _3256 = _3286;
                _3258 = _3288;
            }
            if ((!_3258) || _3240)
            {
                _3240 = false;
                _3250 = _3144;
                _3252 = _3146;
                _3254 = _3148;
                _3256 = _3150;
                _3258 = true;
            }
        }
        else
        {
            float _3290 = _107 + _3160;
            float _3292 = _109 + _3162;
            float _3294 = _111 + _3164;
            float _3296 = _3166 + 1.0;
            _3250 = _3144;
            _3252 = _3146;
            _3254 = _3148;
            _3256 = _3150;
            _3226 = _3290;
            _3228 = _3292;
            _3230 = _3294;
            _3232 = _3296;
        }
    }
    _3258 = false;
    float _3298 = _3210;
    float _3300 = _3212;
    float _3302 = _3214;
    float _3304 = _3216;
    float _3306 = _3250;
    float _3308 = _3252;
    float _3310 = _3254;
    float _3312 = _3256;
    float _3314 = _3218;
    float _3316 = _3220;
    float _3318 = _3222;
    float _3320 = _3224;
    float _3322 = _3226;
    float _3324 = _3228;
    float _3326 = _3230;
    float _3328 = _3232;
    float _3330 = -_2517;
    float _3332 = _119 + _3330;
    float _3334 = -_2521;
    float _3336 = _117 + _3334;
    float _3338 = _2531 * _3332;
    float _3340 = -_2525;
    float _3342 = _121 + _3340;
    float _3344 = fma(_2535, _3336, _3338);
    float _3346 = fma(_2539, _3342, _3344);
    float _3348 = _2567 * _3346;
    float _3350 = rint(_3348);
    float _3352 = precise::max(0.0, _3350);
    float _3354 = precise::min(_3352, 3.0);
    float _3356 = trunc(_3354);
    int _3358 = int(_3356);
    bool _3360 = _3358 >= 2;
    bool _3362 = !_3360;
    float _3364 = as_type<float>(_3358);
    float _3366 = _3350;
    float _3368 = _3344;
    float _3370 = _3338;
    float _3372 = _3298;
    float _3374 = _3300;
    float _3376 = _3302;
    float _3378 = _3304;
    float _3380 = _3314;
    float _3382 = _3316;
    float _3384 = _3318;
    float _3386 = _3320;
    float _3388 = _3322;
    float _3390 = _3324;
    float _3392 = _3326;
    float _3394 = _3328;
    float _3412;
    float _3414;
    float _3416;
    float _3418;
    if (!_3362)
    {
        bool _3396 = _3358 >= 3;
        bool _3398 = !_3396;
        if (!_3398)
        {
            bool _3400 = _3358 != 3;
            _3402 = _3400;
            if (!_3402)
            {
                float _3404 = _117 + _3298;
                float _3406 = _119 + _3300;
                float _3408 = _121 + _3302;
                float _3410 = _3304 + 1.0;
                _3372 = _3404;
                _3374 = _3406;
                _3376 = _3408;
                _3378 = _3410;
                _3412 = _3306;
                _3414 = _3308;
                _3416 = _3310;
                _3418 = _3312;
                _3420 = true;
            }
        }
        else
        {
            float _3422 = _117 + _3314;
            float _3424 = _119 + _3316;
            float _3426 = _121 + _3318;
            float _3428 = _3320 + 1.0;
            _3412 = _3306;
            _3414 = _3308;
            _3416 = _3310;
            _3418 = _3312;
            _3380 = _3422;
            _3382 = _3424;
            _3384 = _3426;
            _3386 = _3428;
            _3420 = true;
        }
    }
    if ((!_3420) || _3402)
    {
        bool _3430;
        if (!_3402)
        {
            _3430 = _3358 >= 1;
        }
        if ((!_3430) || _3402)
        {
            if (!_3402)
            {
                bool _3432 = _3358 != 0;
                if (!_3432)
                {
                    float _3434 = _117 + _3306;
                    _3364 = _3434;
                }
                float _3436 = _3364;
                _3412 = _3436;
                if (!_3432)
                {
                    float _3438 = _119 + _3308;
                    _3366 = _3438;
                }
                float _3440 = _3366;
                _3414 = _3440;
                if (!_3432)
                {
                    float _3442 = _121 + _3310;
                    _3368 = _3442;
                }
                float _3444 = _3368;
                _3416 = _3444;
                if (!_3432)
                {
                    float _3446 = _3312 + 1.0;
                    _3370 = _3446;
                }
                float _3448 = _3370;
                bool _3450 = !_3432;
                _3418 = _3448;
                _3420 = _3450;
            }
            if ((!_3420) || _3402)
            {
                _3402 = false;
                _3412 = _3306;
                _3414 = _3308;
                _3416 = _3310;
                _3418 = _3312;
                _3420 = true;
            }
        }
        else
        {
            float _3452 = _117 + _3322;
            float _3454 = _119 + _3324;
            float _3456 = _121 + _3326;
            float _3458 = _3328 + 1.0;
            _3412 = _3306;
            _3414 = _3308;
            _3416 = _3310;
            _3418 = _3312;
            _3388 = _3452;
            _3390 = _3454;
            _3392 = _3456;
            _3394 = _3458;
        }
    }
    _3420 = false;
    float _3460 = _3372;
    float _3462 = _3374;
    float _3464 = _3376;
    float _3466 = _3378;
    float _3468 = _3412;
    float _3470 = _3414;
    float _3472 = _3416;
    float _3474 = _3418;
    float _3476 = _3380;
    float _3478 = _3382;
    float _3480 = _3384;
    float _3482 = _3386;
    float _3484 = _3388;
    float _3486 = _3390;
    float _3488 = _3392;
    float _3490 = _3394;
    float _3492 = -_2517;
    float _3494 = _129 + _3492;
    float _3496 = -_2521;
    float _3498 = _127 + _3496;
    float _3500 = _2531 * _3494;
    float _3502 = -_2525;
    float _3504 = _131 + _3502;
    float _3506 = fma(_2535, _3498, _3500);
    float _3508 = fma(_2539, _3504, _3506);
    float _3510 = _2567 * _3508;
    float _3512 = rint(_3510);
    float _3514 = precise::max(0.0, _3512);
    float _3516 = precise::min(_3514, 3.0);
    float _3518 = trunc(_3516);
    int _3520 = int(_3518);
    bool _3522 = _3520 >= 2;
    bool _3524 = !_3522;
    float _3526 = _3512;
    float _3528 = as_type<float>(_3520);
    float _3530 = _3500;
    float _3532 = _3506;
    float _3534 = _3460;
    float _3536 = _3462;
    float _3538 = _3464;
    float _3540 = _3466;
    float _3542 = _3476;
    float _3544 = _3478;
    float _3546 = _3480;
    float _3548 = _3482;
    float _3550 = _3484;
    float _3552 = _3486;
    float _3554 = _3488;
    float _3556 = _3490;
    float _3574;
    float _3576;
    float _3578;
    float _3580;
    if (!_3524)
    {
        bool _3558 = _3520 >= 3;
        bool _3560 = !_3558;
        if (!_3560)
        {
            bool _3562 = _3520 != 3;
            _3564 = _3562;
            if (!_3564)
            {
                float _3566 = _127 + _3460;
                float _3568 = _129 + _3462;
                float _3570 = _131 + _3464;
                float _3572 = _3466 + 1.0;
                _3534 = _3566;
                _3536 = _3568;
                _3538 = _3570;
                _3540 = _3572;
                _3574 = _3468;
                _3576 = _3470;
                _3578 = _3472;
                _3580 = _3474;
                _3582 = true;
            }
        }
        else
        {
            float _3584 = _127 + _3476;
            float _3586 = _129 + _3478;
            float _3588 = _131 + _3480;
            float _3590 = _3482 + 1.0;
            _3574 = _3468;
            _3576 = _3470;
            _3578 = _3472;
            _3580 = _3474;
            _3542 = _3584;
            _3544 = _3586;
            _3546 = _3588;
            _3548 = _3590;
            _3582 = true;
        }
    }
    if ((!_3582) || _3564)
    {
        bool _3592;
        if (!_3564)
        {
            _3592 = _3520 >= 1;
        }
        if ((!_3592) || _3564)
        {
            if (!_3564)
            {
                bool _3594 = _3520 != 0;
                if (!_3594)
                {
                    float _3596 = _127 + _3468;
                    _3526 = _3596;
                }
                float _3598 = _3526;
                _3574 = _3598;
                if (!_3594)
                {
                    float _3600 = _129 + _3470;
                    _3528 = _3600;
                }
                float _3602 = _3528;
                _3576 = _3602;
                if (!_3594)
                {
                    float _3604 = _131 + _3472;
                    _3530 = _3604;
                }
                float _3606 = _3530;
                _3578 = _3606;
                if (!_3594)
                {
                    float _3608 = _3474 + 1.0;
                    _3532 = _3608;
                }
                float _3610 = _3532;
                bool _3612 = !_3594;
                _3580 = _3610;
                _3582 = _3612;
            }
            if ((!_3582) || _3564)
            {
                _3564 = false;
                _3574 = _3468;
                _3576 = _3470;
                _3578 = _3472;
                _3580 = _3474;
                _3582 = true;
            }
        }
        else
        {
            float _3614 = _127 + _3484;
            float _3616 = _129 + _3486;
            float _3618 = _131 + _3488;
            float _3620 = _3490 + 1.0;
            _3574 = _3468;
            _3576 = _3470;
            _3578 = _3472;
            _3580 = _3474;
            _3550 = _3614;
            _3552 = _3616;
            _3554 = _3618;
            _3556 = _3620;
        }
    }
    _3582 = false;
    float _3622 = _3534;
    float _3624 = _3536;
    float _3626 = _3538;
    float _3628 = _3540;
    float _3630 = _3574;
    float _3632 = _3576;
    float _3634 = _3578;
    float _3636 = _3580;
    float _3638 = _3542;
    float _3640 = _3544;
    float _3642 = _3546;
    float _3644 = _3548;
    float _3646 = _3550;
    float _3648 = _3552;
    float _3650 = _3554;
    float _3652 = _3556;
    float _3654 = -_2517;
    float _3656 = _139 + _3654;
    float _3658 = -_2521;
    float _3660 = _137 + _3658;
    float _3662 = _2531 * _3656;
    float _3664 = -_2525;
    float _3666 = _141 + _3664;
    float _3668 = fma(_2535, _3660, _3662);
    float _3670 = fma(_2539, _3666, _3668);
    float _3672 = _2567 * _3670;
    float _3674 = rint(_3672);
    float _3676 = precise::max(0.0, _3674);
    float _3678 = precise::min(_3676, 3.0);
    float _3680 = trunc(_3678);
    int _3682 = int(_3680);
    bool _3684 = _3682 >= 2;
    bool _3686 = !_3684;
    float _3688 = _3662;
    float _3690 = _3668;
    float _3692 = _3674;
    float _3694 = as_type<float>(_3682);
    float _3696 = _3622;
    float _3698 = _3624;
    float _3700 = _3626;
    float _3702 = _3628;
    float _3704 = _3638;
    float _3706 = _3640;
    float _3708 = _3642;
    float _3710 = _3644;
    float _3712 = _3646;
    float _3714 = _3648;
    float _3716 = _3650;
    float _3718 = _3652;
    float _3736;
    float _3738;
    float _3740;
    float _3742;
    if (!_3686)
    {
        bool _3720 = _3682 >= 3;
        bool _3722 = !_3720;
        if (!_3722)
        {
            bool _3724 = _3682 != 3;
            _3726 = _3724;
            if (!_3726)
            {
                float _3728 = _137 + _3622;
                float _3730 = _139 + _3624;
                float _3732 = _141 + _3626;
                float _3734 = _3628 + 1.0;
                _3696 = _3728;
                _3698 = _3730;
                _3700 = _3732;
                _3702 = _3734;
                _3736 = _3630;
                _3738 = _3632;
                _3740 = _3634;
                _3742 = _3636;
                _3744 = true;
            }
        }
        else
        {
            float _3746 = _137 + _3638;
            float _3748 = _139 + _3640;
            float _3750 = _141 + _3642;
            float _3752 = _3644 + 1.0;
            _3736 = _3630;
            _3738 = _3632;
            _3740 = _3634;
            _3742 = _3636;
            _3704 = _3746;
            _3706 = _3748;
            _3708 = _3750;
            _3710 = _3752;
            _3744 = true;
        }
    }
    if ((!_3744) || _3726)
    {
        bool _3754;
        if (!_3726)
        {
            _3754 = _3682 >= 1;
        }
        if ((!_3754) || _3726)
        {
            if (!_3726)
            {
                bool _3756 = _3682 != 0;
                if (!_3756)
                {
                    float _3758 = _137 + _3630;
                    _3688 = _3758;
                }
                float _3760 = _3688;
                _3736 = _3760;
                if (!_3756)
                {
                    float _3762 = _139 + _3632;
                    _3690 = _3762;
                }
                float _3764 = _3690;
                _3738 = _3764;
                if (!_3756)
                {
                    float _3766 = _141 + _3634;
                    _3692 = _3766;
                }
                float _3768 = _3692;
                _3740 = _3768;
                if (!_3756)
                {
                    float _3770 = _3636 + 1.0;
                    _3694 = _3770;
                }
                float _3772 = _3694;
                bool _3774 = !_3756;
                _3742 = _3772;
                _3744 = _3774;
            }
            if ((!_3744) || _3726)
            {
                _3726 = false;
                _3736 = _3630;
                _3738 = _3632;
                _3740 = _3634;
                _3742 = _3636;
                _3744 = true;
            }
        }
        else
        {
            float _3776 = _137 + _3646;
            float _3778 = _139 + _3648;
            float _3780 = _141 + _3650;
            float _3782 = _3652 + 1.0;
            _3736 = _3630;
            _3738 = _3632;
            _3740 = _3634;
            _3742 = _3636;
            _3712 = _3776;
            _3714 = _3778;
            _3716 = _3780;
            _3718 = _3782;
        }
    }
    _3744 = false;
    float _3784 = _3696;
    float _3786 = _3698;
    float _3788 = _3700;
    float _3790 = _3702;
    float _3792 = _3736;
    float _3794 = _3738;
    float _3796 = _3740;
    float _3798 = _3742;
    float _3800 = _3704;
    float _3802 = _3706;
    float _3804 = _3708;
    float _3806 = _3710;
    float _3808 = _3712;
    float _3810 = _3714;
    float _3812 = _3716;
    float _3814 = _3718;
    float _3816 = -_2517;
    float _3818 = _149 + _3816;
    float _3820 = -_2521;
    float _3822 = _147 + _3820;
    float _3824 = _2531 * _3818;
    float _3826 = -_2525;
    float _3828 = _151 + _3826;
    float _3830 = fma(_2535, _3822, _3824);
    float _3832 = fma(_2539, _3828, _3830);
    float _3834 = _2567 * _3832;
    float _3836 = rint(_3834);
    float _3838 = precise::max(0.0, _3836);
    float _3840 = precise::min(_3838, 3.0);
    float _3842 = trunc(_3840);
    int _3844 = int(_3842);
    bool _3846 = _3844 >= 2;
    bool _3848 = !_3846;
    float _3850 = _3836;
    float _3852 = as_type<float>(_3844);
    float _3854 = _3824;
    float _3856 = _3830;
    float _3858 = _3784;
    float _3860 = _3786;
    float _3862 = _3788;
    float _3864 = _3790;
    float _3866 = _3800;
    float _3868 = _3802;
    float _3870 = _3804;
    float _3872 = _3806;
    float _3874 = _3808;
    float _3876 = _3810;
    float _3878 = _3812;
    float _3880 = _3814;
    float _3898;
    float _3900;
    float _3902;
    float _3904;
    if (!_3848)
    {
        bool _3882 = _3844 >= 3;
        bool _3884 = !_3882;
        if (!_3884)
        {
            bool _3886 = _3844 != 3;
            _3888 = _3886;
            if (!_3888)
            {
                float _3890 = _147 + _3784;
                float _3892 = _149 + _3786;
                float _3894 = _151 + _3788;
                float _3896 = _3790 + 1.0;
                _3858 = _3890;
                _3860 = _3892;
                _3862 = _3894;
                _3864 = _3896;
                _3898 = _3792;
                _3900 = _3794;
                _3902 = _3796;
                _3904 = _3798;
                _3906 = true;
            }
        }
        else
        {
            float _3908 = _147 + _3800;
            float _3910 = _149 + _3802;
            float _3912 = _151 + _3804;
            float _3914 = _3806 + 1.0;
            _3898 = _3792;
            _3900 = _3794;
            _3902 = _3796;
            _3904 = _3798;
            _3866 = _3908;
            _3868 = _3910;
            _3870 = _3912;
            _3872 = _3914;
            _3906 = true;
        }
    }
    if ((!_3906) || _3888)
    {
        bool _3916;
        if (!_3888)
        {
            _3916 = _3844 >= 1;
        }
        if ((!_3916) || _3888)
        {
            if (!_3888)
            {
                bool _3918 = _3844 != 0;
                if (!_3918)
                {
                    float _3920 = _147 + _3792;
                    _3850 = _3920;
                }
                float _3922 = _3850;
                _3898 = _3922;
                if (!_3918)
                {
                    float _3924 = _149 + _3794;
                    _3852 = _3924;
                }
                float _3926 = _3852;
                _3900 = _3926;
                if (!_3918)
                {
                    float _3928 = _151 + _3796;
                    _3854 = _3928;
                }
                float _3930 = _3854;
                _3902 = _3930;
                if (!_3918)
                {
                    float _3932 = _3798 + 1.0;
                    _3856 = _3932;
                }
                float _3934 = _3856;
                bool _3936 = !_3918;
                _3904 = _3934;
                _3906 = _3936;
            }
            if ((!_3906) || _3888)
            {
                _3888 = false;
                _3898 = _3792;
                _3900 = _3794;
                _3902 = _3796;
                _3904 = _3798;
                _3906 = true;
            }
        }
        else
        {
            float _3938 = _147 + _3808;
            float _3940 = _149 + _3810;
            float _3942 = _151 + _3812;
            float _3944 = _3814 + 1.0;
            _3898 = _3792;
            _3900 = _3794;
            _3902 = _3796;
            _3904 = _3798;
            _3874 = _3938;
            _3876 = _3940;
            _3878 = _3942;
            _3880 = _3944;
        }
    }
    _3906 = false;
    float _3946 = _3858;
    float _3948 = _3860;
    float _3950 = _3862;
    float _3952 = _3864;
    float _3954 = _3898;
    float _3956 = _3900;
    float _3958 = _3902;
    float _3960 = _3904;
    float _3962 = _3866;
    float _3964 = _3868;
    float _3966 = _3870;
    float _3968 = _3872;
    float _3970 = _3874;
    float _3972 = _3876;
    float _3974 = _3878;
    float _3976 = _3880;
    float _3978 = -_2517;
    float _3980 = _159 + _3978;
    float _3982 = -_2521;
    float _3984 = _157 + _3982;
    float _3986 = _2531 * _3980;
    float _3988 = -_2525;
    float _3990 = _161 + _3988;
    float _3992 = fma(_2535, _3984, _3986);
    float _3994 = fma(_2539, _3990, _3992);
    float _3996 = _2567 * _3994;
    float _3998 = rint(_3996);
    float _4000 = precise::max(0.0, _3998);
    float _4002 = precise::min(_4000, 3.0);
    float _4004 = trunc(_4002);
    int _4006 = int(_4004);
    bool _4008 = _4006 >= 2;
    bool _4010 = !_4008;
    float _4012 = as_type<float>(_4006);
    float _4014 = _3998;
    float _4016 = _3992;
    float _4018 = _3986;
    float _4020 = _3946;
    float _4022 = _3948;
    float _4024 = _3950;
    float _4026 = _3952;
    float _4028 = _3962;
    float _4030 = _3964;
    float _4032 = _3966;
    float _4034 = _3968;
    float _4036 = _3970;
    float _4038 = _3972;
    float _4040 = _3974;
    float _4042 = _3976;
    float _4060;
    float _4062;
    float _4064;
    float _4066;
    if (!_4010)
    {
        bool _4044 = _4006 >= 3;
        bool _4046 = !_4044;
        if (!_4046)
        {
            bool _4048 = _4006 != 3;
            _4050 = _4048;
            if (!_4050)
            {
                float _4052 = _157 + _3946;
                float _4054 = _159 + _3948;
                float _4056 = _161 + _3950;
                float _4058 = _3952 + 1.0;
                _4020 = _4052;
                _4022 = _4054;
                _4024 = _4056;
                _4026 = _4058;
                _4060 = _3954;
                _4062 = _3956;
                _4064 = _3958;
                _4066 = _3960;
                _4068 = true;
            }
        }
        else
        {
            float _4070 = _157 + _3962;
            float _4072 = _159 + _3964;
            float _4074 = _161 + _3966;
            float _4076 = _3968 + 1.0;
            _4060 = _3954;
            _4062 = _3956;
            _4064 = _3958;
            _4066 = _3960;
            _4028 = _4070;
            _4030 = _4072;
            _4032 = _4074;
            _4034 = _4076;
            _4068 = true;
        }
    }
    if ((!_4068) || _4050)
    {
        bool _4078;
        if (!_4050)
        {
            _4078 = _4006 >= 1;
        }
        if ((!_4078) || _4050)
        {
            if (!_4050)
            {
                bool _4080 = _4006 != 0;
                if (!_4080)
                {
                    float _4082 = _157 + _3954;
                    _4012 = _4082;
                }
                float _4084 = _4012;
                _4060 = _4084;
                if (!_4080)
                {
                    float _4086 = _159 + _3956;
                    _4014 = _4086;
                }
                float _4088 = _4014;
                _4062 = _4088;
                if (!_4080)
                {
                    float _4090 = _161 + _3958;
                    _4016 = _4090;
                }
                float _4092 = _4016;
                _4064 = _4092;
                if (!_4080)
                {
                    float _4094 = _3960 + 1.0;
                    _4018 = _4094;
                }
                float _4096 = _4018;
                bool _4098 = !_4080;
                _4066 = _4096;
                _4068 = _4098;
            }
            if ((!_4068) || _4050)
            {
                _4050 = false;
                _4060 = _3954;
                _4062 = _3956;
                _4064 = _3958;
                _4066 = _3960;
                _4068 = true;
            }
        }
        else
        {
            float _4100 = _157 + _3970;
            float _4102 = _159 + _3972;
            float _4104 = _161 + _3974;
            float _4106 = _3976 + 1.0;
            _4060 = _3954;
            _4062 = _3956;
            _4064 = _3958;
            _4066 = _3960;
            _4036 = _4100;
            _4038 = _4102;
            _4040 = _4104;
            _4042 = _4106;
        }
    }
    _4068 = false;
    float _4108 = _4020;
    float _4110 = _4022;
    float _4112 = _4024;
    float _4114 = _4026;
    float _4116 = _4060;
    float _4118 = _4062;
    float _4120 = _4064;
    float _4122 = _4066;
    float _4124 = _4028;
    float _4126 = _4030;
    float _4128 = _4032;
    float _4130 = _4034;
    float _4132 = _4036;
    float _4134 = _4038;
    float _4136 = _4040;
    float _4138 = _4042;
    float _4140 = -_2517;
    float _4142 = _169 + _4140;
    float _4144 = -_2521;
    float _4146 = _167 + _4144;
    float _4148 = _2531 * _4142;
    float _4150 = -_2525;
    float _4152 = _171 + _4150;
    float _4154 = fma(_2535, _4146, _4148);
    float _4156 = fma(_2539, _4152, _4154);
    float _4158 = _2567 * _4156;
    float _4160 = rint(_4158);
    float _4162 = precise::max(0.0, _4160);
    float _4164 = precise::min(_4162, 3.0);
    float _4166 = trunc(_4164);
    int _4168 = int(_4166);
    bool _4170 = _4168 >= 2;
    bool _4172 = !_4170;
    float _4174 = _4160;
    float _4176 = as_type<float>(_4168);
    float _4178 = _4148;
    float _4180 = _4154;
    float _4182 = _4108;
    float _4184 = _4110;
    float _4186 = _4112;
    float _4188 = _4114;
    float _4190 = _4124;
    float _4192 = _4126;
    float _4194 = _4128;
    float _4196 = _4130;
    float _4198 = _4132;
    float _4200 = _4134;
    float _4202 = _4136;
    float _4204 = _4138;
    float _4222;
    float _4224;
    float _4226;
    float _4228;
    if (!_4172)
    {
        bool _4206 = _4168 >= 3;
        bool _4208 = !_4206;
        if (!_4208)
        {
            bool _4210 = _4168 != 3;
            _4212 = _4210;
            if (!_4212)
            {
                float _4214 = _167 + _4108;
                float _4216 = _169 + _4110;
                float _4218 = _171 + _4112;
                float _4220 = _4114 + 1.0;
                _4182 = _4214;
                _4184 = _4216;
                _4186 = _4218;
                _4188 = _4220;
                _4222 = _4116;
                _4224 = _4118;
                _4226 = _4120;
                _4228 = _4122;
                _4230 = true;
            }
        }
        else
        {
            float _4232 = _167 + _4124;
            float _4234 = _169 + _4126;
            float _4236 = _171 + _4128;
            float _4238 = _4130 + 1.0;
            _4222 = _4116;
            _4224 = _4118;
            _4226 = _4120;
            _4228 = _4122;
            _4190 = _4232;
            _4192 = _4234;
            _4194 = _4236;
            _4196 = _4238;
            _4230 = true;
        }
    }
    if ((!_4230) || _4212)
    {
        bool _4240;
        if (!_4212)
        {
            _4240 = _4168 >= 1;
        }
        if ((!_4240) || _4212)
        {
            if (!_4212)
            {
                bool _4242 = _4168 != 0;
                if (!_4242)
                {
                    float _4244 = _167 + _4116;
                    _4174 = _4244;
                }
                float _4246 = _4174;
                _4222 = _4246;
                if (!_4242)
                {
                    float _4248 = _169 + _4118;
                    _4176 = _4248;
                }
                float _4250 = _4176;
                _4224 = _4250;
                if (!_4242)
                {
                    float _4252 = _171 + _4120;
                    _4178 = _4252;
                }
                float _4254 = _4178;
                _4226 = _4254;
                if (!_4242)
                {
                    float _4256 = _4122 + 1.0;
                    _4180 = _4256;
                }
                float _4258 = _4180;
                bool _4260 = !_4242;
                _4228 = _4258;
                _4230 = _4260;
            }
            if ((!_4230) || _4212)
            {
                _4212 = false;
                _4222 = _4116;
                _4224 = _4118;
                _4226 = _4120;
                _4228 = _4122;
                _4230 = true;
            }
        }
        else
        {
            float _4262 = _167 + _4132;
            float _4264 = _169 + _4134;
            float _4266 = _171 + _4136;
            float _4268 = _4138 + 1.0;
            _4222 = _4116;
            _4224 = _4118;
            _4226 = _4120;
            _4228 = _4122;
            _4198 = _4262;
            _4200 = _4264;
            _4202 = _4266;
            _4204 = _4268;
        }
    }
    _4230 = false;
    float _4270 = _4182;
    float _4272 = _4184;
    float _4274 = _4186;
    float _4276 = _4188;
    float _4278 = _4222;
    float _4280 = _4224;
    float _4282 = _4226;
    float _4284 = _4228;
    float _4286 = _4190;
    float _4288 = _4192;
    float _4290 = _4194;
    float _4292 = _4196;
    float _4294 = _4198;
    float _4296 = _4200;
    float _4298 = _4202;
    float _4300 = _4204;
    float _4302 = -_2517;
    float _4304 = _179 + _4302;
    float _4306 = -_2521;
    float _4308 = _177 + _4306;
    float _4310 = _2531 * _4304;
    float _4312 = -_2525;
    float _4314 = _181 + _4312;
    float _4316 = fma(_2535, _4308, _4310);
    float _4318 = fma(_2539, _4314, _4316);
    float _4320 = _2567 * _4318;
    float _4322 = rint(_4320);
    float _4324 = precise::max(0.0, _4322);
    float _4326 = precise::min(_4324, 3.0);
    float _4328 = trunc(_4326);
    int _4330 = int(_4328);
    bool _4332 = _4330 >= 2;
    bool _4334 = !_4332;
    float _4336 = as_type<float>(_4330);
    float _4338 = _4322;
    float _4340 = _4316;
    float _4342 = _4310;
    float _4344 = _4270;
    float _4346 = _4272;
    float _4348 = _4274;
    float _4350 = _4276;
    float _4352 = _4286;
    float _4354 = _4288;
    float _4356 = _4290;
    float _4358 = _4292;
    float _4360 = _4294;
    float _4362 = _4296;
    float _4364 = _4298;
    float _4366 = _4300;
    float _4384;
    float _4386;
    float _4388;
    float _4390;
    if (!_4334)
    {
        bool _4368 = _4330 >= 3;
        bool _4370 = !_4368;
        if (!_4370)
        {
            bool _4372 = _4330 != 3;
            _4374 = _4372;
            if (!_4374)
            {
                float _4376 = _177 + _4270;
                float _4378 = _179 + _4272;
                float _4380 = _181 + _4274;
                float _4382 = _4276 + 1.0;
                _4344 = _4376;
                _4346 = _4378;
                _4348 = _4380;
                _4350 = _4382;
                _4384 = _4278;
                _4386 = _4280;
                _4388 = _4282;
                _4390 = _4284;
                _4392 = true;
            }
        }
        else
        {
            float _4394 = _177 + _4286;
            float _4396 = _179 + _4288;
            float _4398 = _181 + _4290;
            float _4400 = _4292 + 1.0;
            _4384 = _4278;
            _4386 = _4280;
            _4388 = _4282;
            _4390 = _4284;
            _4352 = _4394;
            _4354 = _4396;
            _4356 = _4398;
            _4358 = _4400;
            _4392 = true;
        }
    }
    if ((!_4392) || _4374)
    {
        bool _4402;
        if (!_4374)
        {
            _4402 = _4330 >= 1;
        }
        if ((!_4402) || _4374)
        {
            if (!_4374)
            {
                bool _4404 = _4330 != 0;
                if (!_4404)
                {
                    float _4406 = _177 + _4278;
                    _4336 = _4406;
                }
                float _4408 = _4336;
                _4384 = _4408;
                if (!_4404)
                {
                    float _4410 = _179 + _4280;
                    _4338 = _4410;
                }
                float _4412 = _4338;
                _4386 = _4412;
                if (!_4404)
                {
                    float _4414 = _181 + _4282;
                    _4340 = _4414;
                }
                float _4416 = _4340;
                _4388 = _4416;
                if (!_4404)
                {
                    float _4418 = _4284 + 1.0;
                    _4342 = _4418;
                }
                float _4420 = _4342;
                bool _4422 = !_4404;
                _4390 = _4420;
                _4392 = _4422;
            }
            if ((!_4392) || _4374)
            {
                _4374 = false;
                _4384 = _4278;
                _4386 = _4280;
                _4388 = _4282;
                _4390 = _4284;
                _4392 = true;
            }
        }
        else
        {
            float _4424 = _177 + _4294;
            float _4426 = _179 + _4296;
            float _4428 = _181 + _4298;
            float _4430 = _4300 + 1.0;
            _4384 = _4278;
            _4386 = _4280;
            _4388 = _4282;
            _4390 = _4284;
            _4360 = _4424;
            _4362 = _4426;
            _4364 = _4428;
            _4366 = _4430;
        }
    }
    _4392 = false;
    float _4432 = _4344;
    float _4434 = _4346;
    float _4436 = _4348;
    float _4438 = _4350;
    float _4440 = _4384;
    float _4442 = _4386;
    float _4444 = _4388;
    float _4446 = _4390;
    float _4448 = _4352;
    float _4450 = _4354;
    float _4452 = _4356;
    float _4454 = _4358;
    float _4456 = _4360;
    float _4458 = _4362;
    float _4460 = _4364;
    float _4462 = _4366;
    float _4464 = -_2517;
    float _4466 = _189 + _4464;
    float _4468 = -_2521;
    float _4470 = _187 + _4468;
    float _4472 = _2531 * _4466;
    float _4474 = -_2525;
    float _4476 = _191 + _4474;
    float _4478 = fma(_2535, _4470, _4472);
    float _4480 = fma(_2539, _4476, _4478);
    float _4482 = _2567 * _4480;
    float _4484 = rint(_4482);
    float _4486 = precise::max(0.0, _4484);
    float _4488 = precise::min(_4486, 3.0);
    float _4490 = trunc(_4488);
    int _4492 = int(_4490);
    bool _4494 = _4492 >= 2;
    bool _4496 = !_4494;
    float _4498 = _4484;
    float _4500 = as_type<float>(_4492);
    float _4502 = _4472;
    float _4504 = _4478;
    float _4506 = _4432;
    float _4508 = _4434;
    float _4510 = _4436;
    float _4512 = _4438;
    float _4514 = _4448;
    float _4516 = _4450;
    float _4518 = _4452;
    float _4520 = _4454;
    float _4522 = _4456;
    float _4524 = _4458;
    float _4526 = _4460;
    float _4528 = _4462;
    float _4546;
    float _4548;
    float _4550;
    float _4552;
    if (!_4496)
    {
        bool _4530 = _4492 >= 3;
        bool _4532 = !_4530;
        if (!_4532)
        {
            bool _4534 = _4492 != 3;
            _4536 = _4534;
            if (!_4536)
            {
                float _4538 = _187 + _4432;
                float _4540 = _189 + _4434;
                float _4542 = _191 + _4436;
                float _4544 = _4438 + 1.0;
                _4506 = _4538;
                _4508 = _4540;
                _4510 = _4542;
                _4512 = _4544;
                _4546 = _4440;
                _4548 = _4442;
                _4550 = _4444;
                _4552 = _4446;
                _4554 = true;
            }
        }
        else
        {
            float _4556 = _187 + _4448;
            float _4558 = _189 + _4450;
            float _4560 = _191 + _4452;
            float _4562 = _4454 + 1.0;
            _4546 = _4440;
            _4548 = _4442;
            _4550 = _4444;
            _4552 = _4446;
            _4514 = _4556;
            _4516 = _4558;
            _4518 = _4560;
            _4520 = _4562;
            _4554 = true;
        }
    }
    if ((!_4554) || _4536)
    {
        bool _4564;
        if (!_4536)
        {
            _4564 = _4492 >= 1;
        }
        if ((!_4564) || _4536)
        {
            if (!_4536)
            {
                bool _4566 = _4492 != 0;
                if (!_4566)
                {
                    float _4568 = _187 + _4440;
                    _4498 = _4568;
                }
                float _4570 = _4498;
                _4546 = _4570;
                if (!_4566)
                {
                    float _4572 = _189 + _4442;
                    _4500 = _4572;
                }
                float _4574 = _4500;
                _4548 = _4574;
                if (!_4566)
                {
                    float _4576 = _191 + _4444;
                    _4502 = _4576;
                }
                float _4578 = _4502;
                _4550 = _4578;
                if (!_4566)
                {
                    float _4580 = _4446 + 1.0;
                    _4504 = _4580;
                }
                float _4582 = _4504;
                bool _4584 = !_4566;
                _4552 = _4582;
                _4554 = _4584;
            }
            if ((!_4554) || _4536)
            {
                _4536 = false;
                _4546 = _4440;
                _4548 = _4442;
                _4550 = _4444;
                _4552 = _4446;
                _4554 = true;
            }
        }
        else
        {
            float _4586 = _187 + _4456;
            float _4588 = _189 + _4458;
            float _4590 = _191 + _4460;
            float _4592 = _4462 + 1.0;
            _4546 = _4440;
            _4548 = _4442;
            _4550 = _4444;
            _4552 = _4446;
            _4522 = _4586;
            _4524 = _4588;
            _4526 = _4590;
            _4528 = _4592;
        }
    }
    _4554 = false;
    float _4594 = _4506;
    float _4596 = _4508;
    float _4598 = _4510;
    float _4600 = _4512;
    float _4602 = _4546;
    float _4604 = _4548;
    float _4606 = _4550;
    float _4608 = _4552;
    float _4610 = _4514;
    float _4612 = _4516;
    float _4614 = _4518;
    float _4616 = _4520;
    float _4618 = _4522;
    float _4620 = _4524;
    float _4622 = _4526;
    float _4624 = _4528;
    float _4626 = -_2517;
    float _4628 = _199 + _4626;
    float _4630 = -_2521;
    float _4632 = _197 + _4630;
    float _4634 = _2531 * _4628;
    float _4636 = -_2525;
    float _4638 = _201 + _4636;
    float _4640 = fma(_2535, _4632, _4634);
    float _4642 = fma(_2539, _4638, _4640);
    float _4644 = _2567 * _4642;
    float _4646 = rint(_4644);
    float _4648 = precise::max(0.0, _4646);
    float _4650 = precise::min(_4648, 3.0);
    float _4652 = trunc(_4650);
    int _4654 = int(_4652);
    bool _4656 = _4654 >= 2;
    bool _4658 = !_4656;
    float _4660 = as_type<float>(_4654);
    float _4662 = _4646;
    float _4664 = _4640;
    float _4666 = _4634;
    float _4668 = _4594;
    float _4670 = _4596;
    float _4672 = _4598;
    float _4674 = _4600;
    float _4676 = _4610;
    float _4678 = _4612;
    float _4680 = _4614;
    float _4682 = _4616;
    float _4684 = _4618;
    float _4686 = _4620;
    float _4688 = _4622;
    float _4690 = _4624;
    float _4708;
    float _4710;
    float _4712;
    float _4714;
    if (!_4658)
    {
        bool _4692 = _4654 >= 3;
        bool _4694 = !_4692;
        if (!_4694)
        {
            bool _4696 = _4654 != 3;
            _4698 = _4696;
            if (!_4698)
            {
                float _4700 = _197 + _4594;
                float _4702 = _199 + _4596;
                float _4704 = _201 + _4598;
                float _4706 = _4600 + 1.0;
                _4668 = _4700;
                _4670 = _4702;
                _4672 = _4704;
                _4674 = _4706;
                _4708 = _4602;
                _4710 = _4604;
                _4712 = _4606;
                _4714 = _4608;
                _4716 = true;
            }
        }
        else
        {
            float _4718 = _197 + _4610;
            float _4720 = _199 + _4612;
            float _4722 = _201 + _4614;
            float _4724 = _4616 + 1.0;
            _4708 = _4602;
            _4710 = _4604;
            _4712 = _4606;
            _4714 = _4608;
            _4676 = _4718;
            _4678 = _4720;
            _4680 = _4722;
            _4682 = _4724;
            _4716 = true;
        }
    }
    if ((!_4716) || _4698)
    {
        bool _4726;
        if (!_4698)
        {
            _4726 = _4654 >= 1;
        }
        if ((!_4726) || _4698)
        {
            if (!_4698)
            {
                bool _4728 = _4654 != 0;
                if (!_4728)
                {
                    float _4730 = _197 + _4602;
                    _4660 = _4730;
                }
                float _4732 = _4660;
                _4708 = _4732;
                if (!_4728)
                {
                    float _4734 = _199 + _4604;
                    _4662 = _4734;
                }
                float _4736 = _4662;
                _4710 = _4736;
                if (!_4728)
                {
                    float _4738 = _201 + _4606;
                    _4664 = _4738;
                }
                float _4740 = _4664;
                _4712 = _4740;
                if (!_4728)
                {
                    float _4742 = _4608 + 1.0;
                    _4666 = _4742;
                }
                float _4744 = _4666;
                bool _4746 = !_4728;
                _4714 = _4744;
                _4716 = _4746;
            }
            if ((!_4716) || _4698)
            {
                _4698 = false;
                _4708 = _4602;
                _4710 = _4604;
                _4712 = _4606;
                _4714 = _4608;
                _4716 = true;
            }
        }
        else
        {
            float _4748 = _197 + _4618;
            float _4750 = _199 + _4620;
            float _4752 = _201 + _4622;
            float _4754 = _4624 + 1.0;
            _4708 = _4602;
            _4710 = _4604;
            _4712 = _4606;
            _4714 = _4608;
            _4684 = _4748;
            _4686 = _4750;
            _4688 = _4752;
            _4690 = _4754;
        }
    }
    _4716 = false;
    float _4756 = _4668;
    float _4758 = _4670;
    float _4760 = _4672;
    float _4762 = _4674;
    float _4764 = _4708;
    float _4766 = _4710;
    float _4768 = _4712;
    float _4770 = _4714;
    float _4772 = _4676;
    float _4774 = _4678;
    float _4776 = _4680;
    float _4778 = _4682;
    float _4780 = _4684;
    float _4782 = _4686;
    float _4784 = _4688;
    float _4786 = _4690;
    float _4788 = -_2517;
    float _4790 = _209 + _4788;
    float _4792 = -_2521;
    float _4794 = _207 + _4792;
    float _4796 = _2531 * _4790;
    float _4798 = -_2525;
    float _4800 = _211 + _4798;
    float _4802 = fma(_2535, _4794, _4796);
    float _4804 = fma(_2539, _4800, _4802);
    float _4806 = _2567 * _4804;
    float _4808 = rint(_4806);
    float _4810 = precise::max(0.0, _4808);
    float _4812 = precise::min(_4810, 3.0);
    float _4814 = trunc(_4812);
    int _4816 = int(_4814);
    bool _4818 = _4816 >= 2;
    bool _4820 = !_4818;
    float _4822 = _4808;
    float _4824 = as_type<float>(_4816);
    float _4826 = _4796;
    float _4828 = _4802;
    float _4830 = _4756;
    float _4832 = _4758;
    float _4834 = _4760;
    float _4836 = _4762;
    float _4838 = _4772;
    float _4840 = _4774;
    float _4842 = _4776;
    float _4844 = _4778;
    float _4846 = _4780;
    float _4848 = _4782;
    float _4850 = _4784;
    float _4852 = _4786;
    float _4870;
    float _4872;
    float _4874;
    float _4876;
    if (!_4820)
    {
        bool _4854 = _4816 >= 3;
        bool _4856 = !_4854;
        if (!_4856)
        {
            bool _4858 = _4816 != 3;
            _4860 = _4858;
            if (!_4860)
            {
                float _4862 = _207 + _4756;
                float _4864 = _209 + _4758;
                float _4866 = _211 + _4760;
                float _4868 = _4762 + 1.0;
                _4830 = _4862;
                _4832 = _4864;
                _4834 = _4866;
                _4836 = _4868;
                _4870 = _4764;
                _4872 = _4766;
                _4874 = _4768;
                _4876 = _4770;
                _4878 = true;
            }
        }
        else
        {
            float _4880 = _207 + _4772;
            float _4882 = _209 + _4774;
            float _4884 = _211 + _4776;
            float _4886 = _4778 + 1.0;
            _4870 = _4764;
            _4872 = _4766;
            _4874 = _4768;
            _4876 = _4770;
            _4838 = _4880;
            _4840 = _4882;
            _4842 = _4884;
            _4844 = _4886;
            _4878 = true;
        }
    }
    if ((!_4878) || _4860)
    {
        bool _4888;
        if (!_4860)
        {
            _4888 = _4816 >= 1;
        }
        if ((!_4888) || _4860)
        {
            if (!_4860)
            {
                bool _4890 = _4816 != 0;
                if (!_4890)
                {
                    float _4892 = _207 + _4764;
                    _4822 = _4892;
                }
                float _4894 = _4822;
                _4870 = _4894;
                if (!_4890)
                {
                    float _4896 = _209 + _4766;
                    _4824 = _4896;
                }
                float _4898 = _4824;
                _4872 = _4898;
                if (!_4890)
                {
                    float _4900 = _211 + _4768;
                    _4826 = _4900;
                }
                float _4902 = _4826;
                _4874 = _4902;
                if (!_4890)
                {
                    float _4904 = _4770 + 1.0;
                    _4828 = _4904;
                }
                float _4906 = _4828;
                bool _4908 = !_4890;
                _4876 = _4906;
                _4878 = _4908;
            }
            if ((!_4878) || _4860)
            {
                _4860 = false;
                _4870 = _4764;
                _4872 = _4766;
                _4874 = _4768;
                _4876 = _4770;
                _4878 = true;
            }
        }
        else
        {
            float _4910 = _207 + _4780;
            float _4912 = _209 + _4782;
            float _4914 = _211 + _4784;
            float _4916 = _4786 + 1.0;
            _4870 = _4764;
            _4872 = _4766;
            _4874 = _4768;
            _4876 = _4770;
            _4846 = _4910;
            _4848 = _4912;
            _4850 = _4914;
            _4852 = _4916;
        }
    }
    _4878 = false;
    float _4918 = _4830;
    float _4920 = _4832;
    float _4922 = _4834;
    float _4924 = _4836;
    float _4926 = _4870;
    float _4928 = _4872;
    float _4930 = _4874;
    float _4932 = _4876;
    float _4934 = _4838;
    float _4936 = _4840;
    float _4938 = _4842;
    float _4940 = _4844;
    float _4942 = _4846;
    float _4944 = _4848;
    float _4946 = _4850;
    float _4948 = _4852;
    float _4950 = -_2517;
    float _4952 = _219 + _4950;
    float _4954 = -_2521;
    float _4956 = _217 + _4954;
    float _4958 = _2531 * _4952;
    float _4960 = -_2525;
    float _4962 = _221 + _4960;
    float _4964 = fma(_2535, _4956, _4958);
    float _4966 = fma(_2539, _4962, _4964);
    float _4968 = _2567 * _4966;
    float _4970 = rint(_4968);
    float _4972 = precise::max(0.0, _4970);
    float _4974 = precise::min(_4972, 3.0);
    float _4976 = trunc(_4974);
    int _4978 = int(_4976);
    bool _4980 = _4978 >= 2;
    bool _4982 = !_4980;
    float _4984 = as_type<float>(_4978);
    float _4986 = _4970;
    float _4988 = _4964;
    float _4990 = _4958;
    float _4992 = _4934;
    float _4994 = _4936;
    float _4996 = _4942;
    float _4998 = _4944;
    float _5000 = _4948;
    float _5002 = _4940;
    float _5004 = _4924;
    float _5006 = _4946;
    float _5008 = _4938;
    float _5010 = _4918;
    float _5012 = _4920;
    float _5014 = _4922;
    float _5032;
    float _5034;
    float _5036;
    float _5038;
    if (!_4982)
    {
        bool _5016 = _4978 >= 3;
        bool _5018 = !_5016;
        if (!_5018)
        {
            bool _5020 = _4978 != 3;
            _5022 = _5020;
            if (!_5022)
            {
                float _5024 = _217 + _4918;
                float _5026 = _219 + _4920;
                float _5028 = _221 + _4922;
                float _5030 = _4924 + 1.0;
                _5032 = _4926;
                _5034 = _4932;
                _5004 = _5030;
                _5036 = _4928;
                _5038 = _4930;
                _5010 = _5024;
                _5012 = _5026;
                _5014 = _5028;
                _5040 = true;
            }
        }
        else
        {
            float _5042 = _217 + _4934;
            float _5044 = _219 + _4936;
            float _5046 = _221 + _4938;
            float _5048 = _4940 + 1.0;
            _4992 = _5042;
            _4994 = _5044;
            _5002 = _5048;
            _5032 = _4926;
            _5034 = _4932;
            _5036 = _4928;
            _5008 = _5046;
            _5038 = _4930;
            _5040 = true;
        }
    }
    if ((!_5040) || _5022)
    {
        bool _5050;
        if (!_5022)
        {
            _5050 = _4978 >= 1;
        }
        if ((!_5050) || _5022)
        {
            if (!_5022)
            {
                bool _5052 = _4978 != 0;
                if (!_5052)
                {
                    float _5054 = _217 + _4926;
                    _4984 = _5054;
                }
                float _5056 = _4984;
                _5032 = _5056;
                if (!_5052)
                {
                    float _5058 = _219 + _4928;
                    _4986 = _5058;
                }
                float _5060 = _4986;
                _5036 = _5060;
                if (!_5052)
                {
                    float _5062 = _221 + _4930;
                    _4988 = _5062;
                }
                float _5064 = _4988;
                _5038 = _5064;
                if (!_5052)
                {
                    float _5066 = _4932 + 1.0;
                    _4990 = _5066;
                }
                float _5068 = _4990;
                bool _5070 = !_5052;
                _5034 = _5068;
                _5040 = _5070;
            }
            if ((!_5040) || _5022)
            {
                _5022 = false;
                _5032 = _4926;
                _5034 = _4932;
                _5036 = _4928;
                _5038 = _4930;
                _5040 = true;
            }
        }
        else
        {
            float _5072 = _217 + _4942;
            float _5074 = _219 + _4944;
            float _5076 = _221 + _4946;
            float _5078 = _4948 + 1.0;
            _4996 = _5072;
            _4998 = _5074;
            _5000 = _5078;
            _5032 = _4926;
            _5034 = _4932;
            _5036 = _4928;
            _5006 = _5076;
            _5038 = _4930;
        }
    }
    _5040 = false;
    float _5080 = _4992;
    float _5082 = _4994;
    float _5084 = _4996;
    float _5086 = _4998;
    float _5088 = _5000;
    float _5090 = _5002;
    float _5092 = _5032;
    float _5094 = _5034;
    float _5096 = _5004;
    float _5098 = _5036;
    float _5100 = _5006;
    float _5102 = _5008;
    float _5104 = _5038;
    float _5106 = _5010;
    float _5108 = _5012;
    float _5110 = _5014;
    float _5112 = _5080 * 6.0;
    float _5114 = _5082 * 6.0;
    float _5116 = _5084 * 6.0;
    float _5118 = _5086 * 6.0;
    float _5120 = fma(_5084, 3.0, _5112);
    float _5122 = fma(_5086, 3.0, _5114);
    float _5124 = _5088 * 4.0;
    float _5126 = fma(_5090, 4.0, _5088);
    _24[1] = as_type<uint>(_217);
    float _5128 = fma(_5092, 9.0, _5116);
    float _5130 = fma(_5094, 9.0, _5124);
    float _5132 = fma(_5096, 9.0, _5126);
    _24[0] = as_type<uint>(_221);
    float _5134 = precise::max(_133, _143);
    float _5136 = fma(_5098, 9.0, _5118);
    float _5138 = precise::max(_173, _183);
    float _5140 = _5100 * 6.0;
    float _5142 = precise::max(_113, _123);
    float _5144 = _5102 * 6.0;
    float _5146 = _5090 + _5088;
    float _5148 = precise::max(_153, _163);
    float _5150 = fma(_5104, 9.0, _5140);
    float _5152 = precise::max(_5142, _5134);
    float _5154 = fma(_5100, 3.0, _5144);
    float _5156 = precise::max(_5148, _5138);
    float _5158 = as_type<float>(_24[1]);
    float _5160 = precise::max(_83, _73);
    float _5162 = _5130 + _5090;
    float _5164 = precise::max(_93, _103);
    float _5166 = as_type<float>(_24[0]);
    float _5168 = precise::max(_193, _203);
    float _5170 = _5162 * _5132;
    float _5172 = precise::max(_5160, _5164);
    float _5174 = _5146 * 2.0;
    float _5176 = precise::max(_213, _223);
    float _5178 = -_5170;
    float _5180 = fma(_5174, _5174, _5178);
    bool _5182 = _5180 != 0.0;
    bool _5184 = isnan(_5180);
    bool _5186 = _5182 || _5184;
    bool _5188 = isnan(0.0);
    bool _5190 = _5186 || _5188;
    float _5192 = precise::max(_5168, _5176);
    float _5194 = precise::max(_5172, _5152);
    float _5196 = precise::max(_5156, _5192);
    float _5198 = fma(_5080, 3.0, _5128);
    float _5200 = fma(_5102, 3.0, _5150);
    float _5202 = fma(_5082, 3.0, _5136);
    float _5204 = fma(_5106, 9.0, _5120);
    float _5206 = fma(_5108, 9.0, _5122);
    float _5208 = fma(_5110, 9.0, _5154);
    float _5210 = precise::max(_5194, _5196);
    bool _5212 = !_5190;
    if (!_5212)
    {
        float _5214 = 1.0 / _5180;
        float _5216 = _5162 * _5204;
        float _5218 = _5198 * _5132;
        float _5220 = -_5216;
        float _5222 = fma(_5198, _5174, _5220);
        float _5224 = -_5218;
        float _5226 = fma(_5204, _5174, _5224);
        float _5228 = _5162 * _5206;
        float _5230 = _5202 * _5132;
        float _5232 = _5162 * _5208;
        float _5234 = _5200 * _5132;
        float _5236 = -_5228;
        float _5238 = fma(_5202, _5174, _5236);
        float _5240 = -_5230;
        float _5242 = fma(_5206, _5174, _5240);
        float _5244 = -_5232;
        float _5246 = fma(_5200, _5174, _5244);
        float _5248 = -_5234;
        float _5250 = fma(_5208, _5174, _5248);
        float _5252 = _5242 * _5214;
        float _5254 = _5222 * _5214;
        float _5256 = _5238 * _5214;
        float _5258 = _5246 * _5214;
        float _5260 = _5226 * _5214;
        float _5262 = _5250 * _5214;
        float _5264 = -_5252;
        float _5266 = _5256 + _5264;
        float _5268 = -_5260;
        float _5270 = _5254 + _5268;
        float _5272 = -_5262;
        float _5274 = _5258 + _5272;
        _2586 = _5270;
        _2588 = _5266;
        _2590 = _5274;
        _2592 = _5260;
        _2594 = _5254;
        _2596 = _5252;
        _2598 = _5256;
        _2600 = _5262;
        _2602 = _5258;
    }
    float _5276 = _2586;
    float _5278 = _2588;
    float _5280 = _2590;
    float _5282 = _2592;
    float _5284 = _2594;
    float _5286 = _2596;
    float _5288 = _2598;
    float _5290 = _2600;
    float _5292 = _2602;
    float _5294 = fma(_5276, 496.0, 0.5);
    float _5296 = precise::clamp(_5294, 0.0, 1.0);
    float _5298 = fma(_5278, 1008.0, 0.5);
    float _5300 = precise::clamp(_5298, 0.0, 1.0);
    float _5302 = fma(_5276, -31.0, 1.0);
    float _5304 = precise::clamp(_5302, 0.0, 1.0);
    float _5306 = fma(_5280, 496.0, 0.5);
    float _5308 = precise::clamp(_5306, 0.0, 1.0);
    float _5310 = _5296 + (-0.5);
    float _5312 = fma(_5278, -63.0, 1.0);
    float _5314 = precise::clamp(_5312, 0.0, 1.0);
    float _5316 = _5300 + (-0.5);
    float _5318 = fma(_5280, -31.0, 1.0);
    float _5320 = precise::clamp(_5318, 0.0, 1.0);
    float _5322 = _5304 * _5310;
    float _5324 = _5308 + (-0.5);
    float _5326 = _5314 * _5316;
    float _5328 = _5326 * 2.0;
    float _5330 = _5210 * 255.0;
    float _5332 = fma(_5322, -0.0322580635547637939453125, _5282);
    float _5334 = precise::clamp(_5332, 0.0, 1.0);
    float _5336 = _5320 * _5324;
    float _5338 = fma(_5322, 0.0322580635547637939453125, _5284);
    float _5340 = precise::clamp(_5338, 0.0, 1.0);
    float _5342 = fma(_5328, -0.01587301678955554962158203125, _5286);
    float _5344 = precise::clamp(_5342, 0.0, 1.0);
    float _5346 = fma(_5328, 0.01587301678955554962158203125, _5288);
    float _5348 = precise::clamp(_5346, 0.0, 1.0);
    float _5350 = fma(_5336, -0.0322580635547637939453125, _5290);
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = _5340 * 31.0;
    float _5356 = fma(_5336, 0.0322580635547637939453125, _5292);
    float _5358 = precise::clamp(_5356, 0.0, 1.0);
    float _5360 = _5334 * 31.0;
    float _5362 = _5344 * 63.0;
    float _5364 = _5348 * 63.0;
    float _5366 = _5352 * 31.0;
    float _5368 = _5358 * 31.0;
    float _5370 = trunc(_5330);
    float _5372 = precise::max(_5370, 0.0);
    uint _5375 = uint(_5372);
    float _5377 = precise::min(_83, _73);
    float _5379 = precise::min(_113, _123);
    float _5381 = precise::min(_153, _163);
    float _5383 = precise::min(_173, _183);
    float _5385 = rint(_5354);
    float _5387 = precise::min(_193, _203);
    float _5389 = precise::min(_213, _223);
    float _5391 = precise::min(_5381, _5383);
    float _5393 = precise::min(_5387, _5389);
    float _5395 = rint(_5364);
    float _5397 = precise::min(_5391, _5393);
    float _5399 = rint(_5360);
    float _5401 = _5385 + 0.5;
    float _5403 = rint(_5362);
    float _5405 = _5395 + 0.5;
    float _5407 = rint(_5366);
    float _5409 = _5399 + 0.5;
    float _5411 = rint(_5368);
    float _5413 = precise::min(_93, _103);
    float _5415 = precise::min(_5377, _5413);
    float _5417 = precise::min(_133, _143);
    float _5419 = trunc(_5401);
    float _5421 = precise::max(_5419, 0.0);
    uint _5423 = uint(_5421);
    float _5425 = precise::min(_5379, _5417);
    float _5427 = _5403 + 0.5;
    float _5429 = precise::min(_5415, _5425);
    float _5431 = _5411 + 0.5;
    float _5433 = trunc(_5405);
    float _5435 = precise::max(_5433, 0.0);
    uint _5437 = uint(_5435);
    float _5439 = precise::min(_5429, _5397);
    float _5441 = _5407 + 0.5;
    float _5443 = _5439 * 255.0;
    float _5445 = trunc(_5409);
    float _5447 = precise::max(_5445, 0.0);
    uint _5449 = uint(_5447);
    int _5451 = int(_5423) << 11;
    float _5453 = trunc(_5427);
    float _5455 = precise::max(_5453, 0.0);
    uint _5457 = uint(_5455);
    int _5459 = int(_5437) << 5;
    float _5461 = trunc(_5431);
    float _5463 = precise::max(_5461, 0.0);
    uint _5465 = uint(_5463);
    int _5467 = int(_5449) << 11;
    float _5469 = trunc(_5441);
    float _5471 = precise::max(_5469, 0.0);
    uint _5473 = uint(_5471);
    int _5475 = int(_5457) << 5;
    float _5477 = trunc(_5443);
    float _5479 = precise::max(_5477, 0.0);
    uint _5481 = uint(_5479);
    int _5483 = _5451 | _5459;
    int _5485 = int(_5465) | _5483;
    int _5487 = _5467 | _5475;
    int _5489 = int(_5473) | _5487;
    bool _5491 = _5485 != _5489;
    bool _5493 = _5375 > _5481;
    int _5495 = int(_5481) << 8;
    int _5497 = _5495 & 65280;
    int _5499 = int(_5457);
    int _5501 = _5495;
    int _5503 = _5459;
    int _5505 = _5497;
    int _5507 = as_type<int>(_5399);
    int _5509 = _5485;
    int _5511 = _5489;
    if (!_5491)
    {
        _5499 = _5485;
    }
    int _5513 = _5499;
    int _5515 = 255 & int(_5375);
    int _5517 = _5497 | _5515;
    int _5519 = _5513;
    if (!_5493)
    {
        _5501 = 0;
    }
    int _5521 = _5501;
    int _5523 = _5521;
    if (!_5491)
    {
        _5503 = 0;
    }
    int _5525 = _5503;
    int _5527 = _5525;
    if (!_5491)
    {
        _5505 = 0;
    }
    int _5529 = _5505;
    bool _5531 = !_5491;
    int _5533 = _5529;
    if (!_5531)
    {
        float _5535 = _5399 * 0.0322580635547637939453125;
        float _5537 = _5395 * 0.01587301678955554962158203125;
        float _5539 = _5403 * 0.01587301678955554962158203125;
        bool _5541 = uint(_5485) >= uint(_5489);
        float _5543 = _5385 * 0.0322580635547637939453125;
        float _5545 = _5411 * 0.0322580635547637939453125;
        float _5547 = _5407 * 0.0322580635547637939453125;
        bool _5549 = !_5541;
        float _5551 = _5549 ? _5537 : _5539;
        bool _5553 = !_5541;
        float _5555 = _5553 ? _5539 : _5537;
        bool _5557 = !_5541;
        float _5559 = _5557 ? _5543 : _5535;
        float _5561 = -_5551;
        float _5563 = _139 + _5561;
        bool _5565 = !_5541;
        float _5567 = _5565 ? _5535 : _5543;
        float _5569 = -_5551;
        float _5571 = _5569 + _5555;
        bool _5573 = !_5541;
        float _5575 = _5573 ? _5545 : _5547;
        float _5577 = -_5559;
        float _5579 = _137 + _5577;
        bool _5581 = !_5541;
        float _5583 = _5581 ? _5547 : _5545;
        float _5585 = -_5559;
        float _5587 = _5585 + _5567;
        float _5589 = -_5559;
        float _5591 = _127 + _5589;
        float _5593 = -_5559;
        float _5595 = _117 + _5593;
        float _5597 = -_5559;
        float _5599 = _107 + _5597;
        float _5601 = -_5559;
        float _5603 = _97 + _5601;
        float _5605 = -_5559;
        float _5607 = _87 + _5605;
        float _5609 = -_5559;
        float _5611 = _67 + _5609;
        float _5613 = -_5559;
        float _5615 = _77 + _5613;
        float _5617 = -_5559;
        float _5619 = _5158 + _5617;
        float _5621 = -_5559;
        float _5623 = _207 + _5621;
        float _5625 = -_5559;
        float _5627 = _197 + _5625;
        float _5629 = -_5559;
        float _5631 = _187 + _5629;
        float _5633 = -_5559;
        float _5635 = _177 + _5633;
        float _5637 = -_5559;
        float _5639 = _167 + _5637;
        float _5641 = -_5559;
        float _5643 = _157 + _5641;
        float _5645 = -_5559;
        float _5647 = _147 + _5645;
        float _5649 = _5571 * _5571;
        float _5651 = -_5575;
        float _5653 = _5651 + _5583;
        float _5655 = -_5551;
        float _5657 = _129 + _5655;
        float _5659 = -_5575;
        float _5661 = _141 + _5659;
        float _5663 = fma(_5587, _5587, _5649);
        float _5665 = -_5575;
        float _5667 = _131 + _5665;
        float _5669 = -_5551;
        float _5671 = _119 + _5669;
        float _5673 = -_5551;
        float _5675 = _109 + _5673;
        float _5677 = fma(_5653, _5653, _5663);
        float _5679 = -_5575;
        float _5681 = _121 + _5679;
        float _5683 = -_5551;
        float _5685 = _99 + _5683;
        float _5687 = -_5551;
        float _5689 = _89 + _5687;
        float _5691 = 1.0 / _5677;
        float _5693 = -_5551;
        float _5695 = _69 + _5693;
        float _5697 = -_5551;
        float _5699 = _79 + _5697;
        float _5701 = -_5551;
        float _5703 = _219 + _5701;
        float _5705 = -_5551;
        float _5707 = _209 + _5705;
        float _5709 = -_5551;
        float _5711 = _199 + _5709;
        float _5713 = -_5551;
        float _5715 = _189 + _5713;
        float _5717 = -_5551;
        float _5719 = _179 + _5717;
        float _5721 = -_5551;
        float _5723 = _169 + _5721;
        float _5725 = -_5551;
        float _5727 = _159 + _5725;
        float _5729 = -_5551;
        float _5731 = _149 + _5729;
        float _5733 = -_5575;
        float _5735 = _111 + _5733;
        float _5737 = -_5575;
        float _5739 = _101 + _5737;
        float _5741 = -_5575;
        float _5743 = _91 + _5741;
        float _5745 = -_5575;
        float _5747 = _71 + _5745;
        float _5749 = _5571 * _5691;
        float _5751 = _5587 * _5691;
        float _5753 = _5653 * _5691;
        float _5755 = _5749 * _5563;
        float _5757 = _5749 * _5657;
        float _5759 = _5749 * _5671;
        float _5761 = _5749 * _5675;
        float _5763 = fma(_5751, _5579, _5755);
        float _5765 = fma(_5751, _5591, _5757);
        float _5767 = fma(_5751, _5595, _5759);
        float _5769 = fma(_5751, _5599, _5761);
        float _5771 = fma(_5753, _5661, _5763);
        float _5773 = fma(_5753, _5667, _5765);
        float _5775 = fma(_5753, _5681, _5767);
        float _5777 = _5749 * _5685;
        float _5779 = _5749 * _5731;
        bool _5781 = _5771 >= 0.5;
        float _5783 = _5749 * _5689;
        bool _5785 = _5773 >= 0.5;
        float _5787 = _5749 * _5695;
        bool _5789 = _5771 >= 0.833000004291534423828125;
        float _5791 = _5749 * _5699;
        bool _5793 = _5771 >= 0.16599999368190765380859375;
        float _5795 = _5749 * _5703;
        float _5797 = _5749 * _5707;
        float _5799 = _5749 * _5711;
        float _5801 = _5749 * _5715;
        float _5803 = _5749 * _5719;
        float _5805 = _5749 * _5723;
        float _5807 = _5749 * _5727;
        int _5809 = _5789 ? 0 : 32768;
        float _5811 = fma(_5753, _5735, _5769);
        bool _5813 = _5773 >= 0.833000004291534423828125;
        float _5815 = fma(_5751, _5603, _5777);
        int _5817 = _5809;
        if (!_5781)
        {
            int _5819 = _5793 ? 49152 : 16384;
            _5817 = _5819;
        }
        int _5821 = _5817;
        float _5823 = fma(_5751, _5607, _5783);
        bool _5825 = _5773 >= 0.16599999368190765380859375;
        float _5827 = fma(_5751, _5611, _5787);
        float _5829 = fma(_5751, _5615, _5791);
        bool _5831 = _5775 >= 0.5;
        float _5833 = fma(_5751, _5619, _5795);
        float _5835 = fma(_5751, _5623, _5797);
        float _5837 = fma(_5751, _5627, _5799);
        float _5839 = fma(_5751, _5631, _5801);
        float _5841 = fma(_5751, _5635, _5803);
        float _5843 = fma(_5751, _5639, _5805);
        float _5845 = fma(_5751, _5643, _5807);
        float _5847 = fma(_5751, _5647, _5779);
        int _5849 = _5813 ? 0 : 8192;
        float _5851 = fma(_5753, _5739, _5815);
        bool _5853 = _5811 >= 0.5;
        float _5855 = fma(_5753, _5743, _5823);
        int _5857 = _5849;
        if (!_5785)
        {
            int _5859 = _5825 ? 12288 : 4096;
            _5857 = _5859;
        }
        int _5861 = _5857;
        float _5863 = fma(_5753, _5747, _5827);
        bool _5865 = _5811 >= 0.833000004291534423828125;
        float _5867 = -_5575;
        float _5869 = _5166 + _5867;
        bool _5871 = _5775 >= 0.833000004291534423828125;
        float _5873 = -_5575;
        float _5875 = _211 + _5873;
        bool _5877 = _5775 >= 0.16599999368190765380859375;
        float _5879 = fma(_5753, _5869, _5833);
        int _5881 = _5865 ? 0 : 512;
        float _5883 = fma(_5753, _5875, _5835);
        bool _5885 = _5851 >= 0.5;
        float _5887 = -_5575;
        float _5889 = _201 + _5887;
        int _5891 = _5871 ? 0 : 2048;
        float _5893 = -_5575;
        float _5895 = _191 + _5893;
        bool _5897 = _5811 >= 0.16599999368190765380859375;
        float _5899 = fma(_5753, _5889, _5837);
        float _5901 = fma(_5753, _5895, _5839);
        int _5903 = _5891;
        int _5905 = _5881;
        if (!_5831)
        {
            int _5907 = _5877 ? 3072 : 1024;
            _5903 = _5907;
        }
        int _5909 = _5903;
        float _5911 = -_5575;
        float _5913 = _181 + _5911;
        bool _5915 = _5855 >= 0.5;
        float _5917 = -_5575;
        float _5919 = _161 + _5917;
        if (!_5853)
        {
            int _5921 = _5897 ? 768 : 256;
            _5905 = _5921;
        }
        int _5923 = _5905;
        float _5925 = fma(_5753, _5913, _5841);
        bool _5927 = _5851 >= 0.833000004291534423828125;
        float _5929 = -_5575;
        float _5931 = _171 + _5929;
        bool _5933 = _5855 >= 0.833000004291534423828125;
        float _5935 = fma(_5753, _5919, _5845);
        bool _5937 = _5851 >= 0.16599999368190765380859375;
        float _5939 = fma(_5753, _5931, _5843);
        int _5941 = _5927 ? 0 : 128;
        float _5943 = -_5575;
        float _5945 = _81 + _5943;
        int _5947 = _5933 ? 0 : 32;
        float _5949 = -_5575;
        float _5951 = _151 + _5949;
        bool _5953 = _5863 >= 0.5;
        float _5955 = fma(_5753, _5945, _5829);
        bool _5957 = _5855 >= 0.16599999368190765380859375;
        float _5959 = fma(_5753, _5951, _5847);
        int _5961 = _5941;
        int _5963 = _5947;
        if (!_5885)
        {
            int _5965 = _5937 ? 192 : 64;
            _5961 = _5965;
        }
        int _5967 = _5961;
        bool _5969 = _5863 >= 0.833000004291534423828125;
        if (!_5915)
        {
            int _5971 = _5957 ? 48 : 16;
            _5963 = _5971;
        }
        int _5973 = _5963;
        int _5975 = _5969 ? 0 : 8;
        bool _5977 = _5879 >= 0.5;
        bool _5979 = _5863 >= 0.16599999368190765380859375;
        bool _5981 = _5883 >= 0.5;
        bool _5983 = _5879 >= 0.833000004291534423828125;
        int _5985 = _5975;
        if (!_5953)
        {
            int _5987 = _5979 ? 12 : 4;
            _5985 = _5987;
        }
        int _5989 = _5985;
        bool _5991 = _5883 >= 0.833000004291534423828125;
        bool _5993 = _5879 >= 0.16599999368190765380859375;
        int _5995 = _5983 ? 0 : int(0x80000000);
        bool _5997 = _5883 >= 0.16599999368190765380859375;
        int _5999 = _5991 ? 0 : 536870912;
        bool _6001 = _5899 >= 0.5;
        int _6003 = _5995;
        int _6005 = _5999;
        if (!_5977)
        {
            int _6007 = _5993 ? (-1073741824) : 1073741824;
            _6003 = _6007;
        }
        int _6009 = _6003;
        bool _6011 = _5901 >= 0.5;
        if (!_5981)
        {
            int _6013 = _5997 ? 805306368 : 268435456;
            _6005 = _6013;
        }
        int _6015 = _6005;
        bool _6017 = _5899 >= 0.833000004291534423828125;
        bool _6019 = _5901 >= 0.833000004291534423828125;
        int _6021 = _6017 ? 0 : 134217728;
        bool _6023 = _5899 >= 0.16599999368190765380859375;
        bool _6025 = _5925 >= 0.5;
        int _6027 = _6019 ? 0 : 33554432;
        bool _6029 = _5901 >= 0.16599999368190765380859375;
        int _6031 = _6021;
        int _6033 = _6027;
        if (!_6001)
        {
            int _6035 = _6023 ? 201326592 : 67108864;
            _6031 = _6035;
        }
        int _6037 = _6031;
        bool _6039 = _5925 >= 0.833000004291534423828125;
        if (!_6011)
        {
            int _6041 = _6029 ? 50331648 : 16777216;
            _6033 = _6041;
        }
        int _6043 = _6033;
        bool _6045 = _5935 >= 0.5;
        bool _6047 = _5925 >= 0.16599999368190765380859375;
        int _6049 = _6039 ? 0 : 8388608;
        bool _6051 = _5939 >= 0.5;
        bool _6053 = _5939 >= 0.833000004291534423828125;
        int _6055 = _6049;
        if (!_6025)
        {
            int _6057 = _6047 ? 12582912 : 4194304;
            _6055 = _6057;
        }
        int _6059 = _6055;
        bool _6061 = _5935 >= 0.833000004291534423828125;
        int _6063 = _6053 ? 0 : 2097152;
        bool _6065 = _5935 >= 0.16599999368190765380859375;
        int _6067 = _6061 ? 0 : 524288;
        bool _6069 = _5939 >= 0.16599999368190765380859375;
        int _6071 = _6067;
        int _6073 = _6063;
        if (!_6045)
        {
            int _6075 = _6065 ? 786432 : 262144;
            _6071 = _6075;
        }
        int _6077 = _6071;
        bool _6079 = _5955 >= 0.5;
        bool _6081 = _5959 >= 0.5;
        if (!_6051)
        {
            int _6083 = _6069 ? 3145728 : 1048576;
            _6073 = _6083;
        }
        int _6085 = _6073;
        bool _6087 = _5955 >= 0.833000004291534423828125;
        int _6089 = _6037 + _6009;
        int _6091 = _6089 + _6015;
        int _6093 = _5909 + _5821;
        int _6095 = _6093 + _5861;
        bool _6097 = _5959 >= 0.833000004291534423828125;
        int _6099 = _6087 ? 0 : 2;
        bool _6101 = _5955 >= 0.16599999368190765380859375;
        bool _6103 = _5959 >= 0.16599999368190765380859375;
        int _6105 = _6059 + _6091;
        int _6107 = _6105 + _6043;
        int _6109 = _5967 + _6095;
        int _6111 = _6109 + _5923;
        int _6113 = _6097 ? 0 : 131072;
        int _6115 = _6099;
        int _6117 = _6113;
        _5507 = 3;
        if (!_6079)
        {
            int _6119 = _6101 ? 3 : 1;
            _6115 = _6119;
        }
        int _6121 = _6115;
        if (!_6081)
        {
            int _6123 = _6103 ? 196608 : 65536;
            _6117 = _6123;
        }
        int _6125 = _6117;
        int _6127 = _6077 + _6107;
        int _6129 = _6127 + _6085;
        int _6131 = _5989 + _6111;
        int _6133 = _6131 + _5973;
        bool _6135 = !_5541;
        int _6137 = _6135 ? _5489 : _5485;
        bool _6139 = !_5541;
        int _6141 = _6139 ? _5485 : _5489;
        int _6143 = _6129 + _6125;
        int _6145 = _6133 + _6121;
        _5519 = _6137;
        _5533 = _6143;
        _5527 = _6145;
        _5509 = _6141;
    }
    int _6147 = _5519;
    int _6149 = _5507;
    int _6151 = _5533;
    int _6153 = _5527;
    int _6155 = _5509;
    int _6157 = _6149;
    if (!_5493)
    {
        _6157 = 0;
    }
    int _6159 = _6157;
    int _6161 = _6159;
    if (!_5493)
    {
        _5511 = 0;
    }
    int _6163 = _5511;
    bool _6165 = !_5493;
    int _6167 = _6163;
    if (!_6165)
    {
        float _6169 = -_5439;
        float _6171 = _5210 + _6169;
        float _6173 = -_5439;
        float _6175 = _93 + _6173;
        float _6177 = -_5439;
        float _6179 = _83 + _6177;
        float _6181 = -_5439;
        float _6183 = _73 + _6181;
        float _6185 = -_5439;
        float _6187 = _123 + _6185;
        float _6189 = 1.0 / _6171;
        float _6191 = -_5439;
        float _6193 = _133 + _6191;
        float _6195 = -_5439;
        float _6197 = _183 + _6195;
        float _6199 = -_5439;
        float _6201 = _143 + _6199;
        float _6203 = -_5439;
        float _6205 = _153 + _6203;
        float _6207 = -_5439;
        float _6209 = _163 + _6207;
        float _6211 = -_5439;
        float _6213 = _203 + _6211;
        float _6215 = -_5439;
        float _6217 = _213 + _6215;
        float _6219 = -_5439;
        float _6221 = _223 + _6219;
        float _6223 = _6175 * _6189;
        float _6225 = -_5439;
        float _6227 = _103 + _6225;
        float _6229 = _6179 * _6189;
        float _6231 = _6183 * _6189;
        float _6233 = _6227 * _6189;
        float _6235 = -_5439;
        float _6237 = _113 + _6235;
        float _6239 = fma(_6229, -1.99999904632568359375, 1.99999904632568359375);
        float _6241 = fma(_6229, -7.99999904632568359375, 7.99999904632568359375);
        float _6243 = fma(_6231, -1.99999904632568359375, 1.99999904632568359375);
        float _6245 = fma(_6231, -7.99999904632568359375, 7.99999904632568359375);
        float _6247 = fma(_6223, -1.99999904632568359375, 1.99999904632568359375);
        float _6249 = fma(_6223, -7.99999904632568359375, 7.99999904632568359375);
        float _6251 = _6237 * _6189;
        float _6253 = -_6229;
        float _6255 = _6253 + 0.5;
        float _6257 = -_6231;
        float _6259 = _6257 + 0.5;
        float _6261 = trunc(_6239);
        float _6263 = precise::max(_6261, 0.0);
        uint _6265 = uint(_6263);
        float _6267 = fma(_6233, -1.99999904632568359375, 1.99999904632568359375);
        float _6269 = fma(_6233, -7.99999904632568359375, 7.99999904632568359375);
        float _6271 = fma(_6251, -1.99999904632568359375, 1.99999904632568359375);
        float _6273 = fma(_6251, -7.99999904632568359375, 7.99999904632568359375);
        float _6275 = _6187 * _6189;
        float _6277 = _6193 * _6189;
        float _6279 = -_6223;
        float _6281 = _6279 + 0.5;
        float _6283 = trunc(_6241);
        float _6285 = precise::max(_6283, 0.0);
        uint _6287 = uint(_6285);
        float _6289 = _6197 * _6189;
        float _6291 = -_5439;
        float _6293 = _193 + _6291;
        float _6295 = abs(_6255);
        bool _6297 = _6295 >= 0.375;
        float _6299 = fma(_6275, -1.99999904632568359375, 1.99999904632568359375);
        float _6301 = abs(_6259);
        bool _6303 = _6301 >= 0.375;
        float _6305 = fma(_6275, -7.99999904632568359375, 7.99999904632568359375);
        float _6307 = fma(_6277, -1.99999904632568359375, 1.99999904632568359375);
        float _6309 = trunc(_6243);
        float _6311 = precise::max(_6309, 0.0);
        uint _6313 = uint(_6311);
        float _6315 = fma(_6277, -7.99999904632568359375, 7.99999904632568359375);
        float _6317 = _6201 * _6189;
        float _6319 = _6205 * _6189;
        float _6321 = -_6233;
        float _6323 = _6321 + 0.5;
        float _6325 = -_6251;
        float _6327 = _6325 + 0.5;
        float _6329 = _6209 * _6189;
        float _6331 = abs(_6281);
        bool _6333 = _6331 >= 0.375;
        float _6335 = trunc(_6245);
        float _6337 = precise::max(_6335, 0.0);
        uint _6339 = uint(_6337);
        float _6341 = -_5439;
        float _6343 = _173 + _6341;
        float _6345 = _6293 * _6189;
        float _6347 = fma(_6317, -1.99999904632568359375, 1.99999904632568359375);
        float _6349 = fma(_6317, -7.99999904632568359375, 7.99999904632568359375);
        float _6351 = fma(_6319, -1.99999904632568359375, 1.99999904632568359375);
        float _6353 = fma(_6319, -7.99999904632568359375, 7.99999904632568359375);
        float _6355 = -_6275;
        float _6357 = _6355 + 0.5;
        float _6359 = trunc(_6247);
        float _6361 = precise::max(_6359, 0.0);
        uint _6363 = uint(_6361);
        float _6365 = -_6277;
        float _6367 = _6365 + 0.5;
        float _6369 = abs(_6323);
        bool _6371 = _6369 >= 0.375;
        float _6373 = fma(_6329, -1.99999904632568359375, 1.99999904632568359375);
        float _6375 = abs(_6327);
        bool _6377 = _6375 >= 0.375;
        float _6379 = fma(_6329, -7.99999904632568359375, 7.99999904632568359375);
        float _6381 = _6343 * _6189;
        float _6383 = _6213 * _6189;
        float _6385 = trunc(_6249);
        float _6387 = precise::max(_6385, 0.0);
        uint _6389 = uint(_6387);
        float _6391 = _6217 * _6189;
        float _6393 = _6221 * _6189;
        float _6395 = fma(_6345, -7.99999904632568359375, 7.99999904632568359375);
        float _6397 = -_6317;
        float _6399 = _6397 + 0.5;
        float _6401 = -_6319;
        float _6403 = _6401 + 0.5;
        float _6405 = abs(_6357);
        bool _6407 = _6405 >= 0.375;
        float _6409 = fma(_6381, -1.99999904632568359375, 1.99999904632568359375);
        float _6411 = trunc(_6267);
        float _6413 = precise::max(_6411, 0.0);
        uint _6415 = uint(_6413);
        float _6417 = abs(_6367);
        bool _6419 = _6417 >= 0.375;
        float _6421 = fma(_6381, -7.99999904632568359375, 7.99999904632568359375);
        float _6423 = fma(_6289, -1.99999904632568359375, 1.99999904632568359375);
        float _6425 = fma(_6289, -7.99999904632568359375, 7.99999904632568359375);
        float _6427 = -_6329;
        float _6429 = _6427 + 0.5;
        int _6431 = int(_6265);
        int _6433 = int(_6313);
        int _6435 = int(_6363);
        int _6437 = int(_6415);
        if (!_6297)
        {
            int _6439 = int(_6287) + 1;
            _6431 = _6439;
        }
        int _6441 = _6431;
        float _6443 = fma(_6345, -1.99999904632568359375, 1.99999904632568359375);
        float _6445 = trunc(_6269);
        float _6447 = precise::max(_6445, 0.0);
        uint _6449 = uint(_6447);
        if (!_6303)
        {
            int _6451 = int(_6339) + 1;
            _6433 = _6451;
        }
        int _6453 = _6433;
        float _6455 = fma(_6383, -1.99999904632568359375, 1.99999904632568359375);
        float _6457 = abs(_6399);
        bool _6459 = _6457 >= 0.375;
        float _6461 = -_6381;
        float _6463 = _6461 + 0.5;
        float _6465 = abs(_6403);
        bool _6467 = _6465 >= 0.375;
        float _6469 = -_6289;
        float _6471 = _6469 + 0.5;
        if (!_6333)
        {
            int _6473 = int(_6389) + 1;
            _6435 = _6473;
        }
        int _6475 = _6435;
        float _6477 = trunc(_6271);
        float _6479 = precise::max(_6477, 0.0);
        uint _6481 = uint(_6479);
        float _6483 = abs(_6429);
        bool _6485 = _6483 >= 0.375;
        float _6487 = fma(_6391, -1.99999904632568359375, 1.99999904632568359375);
        float _6489 = -_6345;
        float _6491 = _6489 + 0.5;
        float _6493 = fma(_6393, -1.99999904632568359375, 1.99999904632568359375);
        int _6495 = _6453 << 3;
        float _6497 = trunc(_6273);
        float _6499 = precise::max(_6497, 0.0);
        uint _6501 = uint(_6499);
        int _6503 = int(_6481);
        if (!_6371)
        {
            int _6505 = int(_6449) + 1;
            _6437 = _6505;
        }
        int _6507 = _6437;
        float _6509 = abs(_6463);
        bool _6511 = _6509 >= 0.375;
        int _6513 = _6441 | _6495;
        int _6515 = _6507 << 9;
        float _6517 = trunc(_6299);
        float _6519 = precise::max(_6517, 0.0);
        uint _6521 = uint(_6519);
        float _6523 = trunc(_6305);
        float _6525 = precise::max(_6523, 0.0);
        uint _6527 = uint(_6525);
        int _6529 = int(_6521);
        if (!_6377)
        {
            int _6531 = int(_6501) + 1;
            _6503 = _6531;
        }
        int _6533 = _6503;
        float _6535 = abs(_6471);
        bool _6537 = _6535 >= 0.375;
        float _6539 = trunc(_6307);
        float _6541 = precise::max(_6539, 0.0);
        uint _6543 = uint(_6541);
        float _6545 = trunc(_6315);
        float _6547 = precise::max(_6545, 0.0);
        uint _6549 = uint(_6547);
        int _6551 = int(_6543);
        if (!_6407)
        {
            int _6553 = int(_6527) + 1;
            _6529 = _6553;
        }
        int _6555 = _6529;
        float _6557 = abs(_6491);
        bool _6559 = _6557 >= 0.375;
        int _6561 = _6555 << 15;
        float _6563 = trunc(_6347);
        float _6565 = precise::max(_6563, 0.0);
        uint _6567 = uint(_6565);
        float _6569 = trunc(_6349);
        float _6571 = precise::max(_6569, 0.0);
        uint _6573 = uint(_6571);
        int _6575 = int(_6567);
        if (!_6419)
        {
            int _6577 = int(_6549) + 1;
            _6551 = _6577;
        }
        int _6579 = _6551;
        float _6581 = trunc(_6351);
        float _6583 = precise::max(_6581, 0.0);
        uint _6585 = uint(_6583);
        float _6587 = trunc(_6353);
        float _6589 = precise::max(_6587, 0.0);
        uint _6591 = uint(_6589);
        int _6593 = int(_6585);
        if (!_6459)
        {
            int _6595 = int(_6573) + 1;
            _6575 = _6595;
        }
        int _6597 = _6575;
        int _6599 = _6597 << 21;
        float _6601 = trunc(_6395);
        float _6603 = precise::max(_6601, 0.0);
        uint _6605 = uint(_6603);
        float _6607 = trunc(_6373);
        float _6609 = precise::max(_6607, 0.0);
        uint _6611 = uint(_6609);
        float _6613 = fma(_6383, -7.99999904632568359375, 7.99999904632568359375);
        float _6615 = -_6383;
        float _6617 = _6615 + 0.5;
        int _6619 = int(_6611);
        if (!_6467)
        {
            int _6621 = int(_6591) + 1;
            _6593 = _6621;
        }
        int _6623 = _6593;
        float _6625 = abs(_6617);
        bool _6627 = _6625 >= 0.375;
        float _6629 = trunc(_6379);
        float _6631 = precise::max(_6629, 0.0);
        uint _6633 = uint(_6631);
        float _6635 = trunc(_6409);
        float _6637 = precise::max(_6635, 0.0);
        uint _6639 = uint(_6637);
        float _6641 = trunc(_6421);
        float _6643 = precise::max(_6641, 0.0);
        uint _6645 = uint(_6643);
        int _6647 = int(_6639);
        if (!_6485)
        {
            int _6649 = int(_6633) + 1;
            _6619 = _6649;
        }
        int _6651 = _6619;
        float _6653 = trunc(_6423);
        float _6655 = precise::max(_6653, 0.0);
        uint _6657 = uint(_6655);
        float _6659 = trunc(_6425);
        float _6661 = precise::max(_6659, 0.0);
        uint _6663 = uint(_6661);
        int _6665 = int(_6657);
        if (!_6511)
        {
            int _6667 = int(_6645) + 1;
            _6647 = _6667;
        }
        int _6669 = _6647;
        int _6671 = _6669 << 6;
        float _6673 = trunc(_6613);
        float _6675 = precise::max(_6673, 0.0);
        uint _6677 = uint(_6675);
        float _6679 = trunc(_6443);
        float _6681 = precise::max(_6679, 0.0);
        uint _6683 = uint(_6681);
        float _6685 = fma(_6391, -7.99999904632568359375, 7.99999904632568359375);
        float _6687 = fma(_6393, -7.99999904632568359375, 7.99999904632568359375);
        float _6689 = -_6391;
        float _6691 = _6689 + 0.5;
        float _6693 = -_6393;
        float _6695 = _6693 + 0.5;
        if (!_6537)
        {
            int _6697 = int(_6663) + 1;
            _6665 = _6697;
        }
        int _6699 = _6665;
        float _6701 = trunc(_6455);
        float _6703 = precise::max(_6701, 0.0);
        uint _6705 = uint(_6703);
        float _6707 = abs(_6691);
        bool _6709 = _6707 >= 0.375;
        float _6711 = abs(_6695);
        bool _6713 = _6711 >= 0.375;
        int _6715 = _6699 << 9;
        float _6717 = trunc(_6487);
        float _6719 = precise::max(_6717, 0.0);
        uint _6721 = uint(_6719);
        int _6723 = int(_6683);
        int _6725 = int(_6721);
        if (!_6559)
        {
            int _6727 = int(_6605) + 1;
            _6723 = _6727;
        }
        int _6729 = _6723;
        int _6731 = _6729 << 12;
        float _6733 = trunc(_6685);
        float _6735 = precise::max(_6733, 0.0);
        uint _6737 = uint(_6735);
        int _6739 = int(_6705);
        if (!_6627)
        {
            int _6741 = int(_6677) + 1;
            _6739 = _6741;
        }
        int _6743 = _6739;
        int _6745 = _6743 << 15;
        float _6747 = trunc(_6493);
        float _6749 = precise::max(_6747, 0.0);
        uint _6751 = uint(_6749);
        int _6753 = _6651 << 3;
        int _6755 = _6623 | _6753;
        float _6757 = trunc(_6687);
        float _6759 = precise::max(_6757, 0.0);
        uint _6761 = uint(_6759);
        int _6763 = _6475 << 6;
        int _6765 = _6755 | _6671;
        int _6767 = _6715 | _6765;
        int _6769 = _6513 | _6763;
        int _6771 = _6515 | _6769;
        int _6773 = _6533 << 12;
        int _6775 = int(_6751);
        if (!_6709)
        {
            int _6777 = int(_6737) + 1;
            _6725 = _6777;
        }
        int _6779 = _6725;
        int _6781 = _6771 | _6773;
        int _6783 = _6561 | _6781;
        int _6785 = _6767 | _6731;
        int _6787 = _6745 | _6785;
        int _6789 = _6579 << 18;
        if (!_6713)
        {
            int _6791 = int(_6761) + 1;
            _6775 = _6791;
        }
        int _6793 = _6775;
        int _6795 = _6779 << 18;
        int _6797 = _6793 << 21;
        int _6799 = _6783 | _6789;
        int _6801 = _6599 | _6799;
        int _6803 = _6787 | _6795;
        int _6805 = _6797 | _6803;
        uint _6807 = uint(int(uint(_6801) >> uint(16)));
        int _6809 = _6805 << 8;
        uint _6811 = uint(int(uint(_6805) >> uint(8)));
        int _6813 = 65280 & _6809;
        int _6815 = int(_6807) | _6813;
        int _6817 = _6801 << 16;
        int _6819 = int(_6811) << 16;
        _5523 = _6817;
        _6167 = _6819;
        _6161 = _6815;
    }
    int _6821 = _5523;
    int _6823 = _6167;
    int _6825 = _6161;
    int _6827 = _6147 & 65535;
    int _6829 = _6821 | _5517;
    int _6831 = _6823 | _6825;
    int _6833 = _6151 | _6153;
    int _6835 = _6155 << 16;
    int _6837 = _6835 + _6827;
    out.m_37.x = as_type<float>(_6829);
    out.m_37.y = as_type<float>(_6831);
    out.m_37.z = as_type<float>(_6837);
    out.m_37.w = as_type<float>(_6833);
    return main0_out_u{as_type<uint4>(out.m_37)};
}

