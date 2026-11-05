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
    texture3d<float> fp_t_tcb_8 [[id(1)]];
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
    bool _5048 = false;
    bool _5030 = false;
    bool _4886 = false;
    bool _4868 = false;
    bool _4724 = false;
    bool _4706 = false;
    bool _4562 = false;
    bool _4544 = false;
    bool _4400 = false;
    bool _4382 = false;
    bool _4238 = false;
    bool _4220 = false;
    bool _4076 = false;
    bool _4058 = false;
    bool _3914 = false;
    bool _3896 = false;
    bool _3752 = false;
    bool _3734 = false;
    bool _3590 = false;
    bool _3572 = false;
    bool _3428 = false;
    bool _3410 = false;
    bool _3266 = false;
    bool _3248 = false;
    bool _3104 = false;
    bool _3086 = false;
    bool _2942 = false;
    bool _2924 = false;
    bool _2780 = false;
    bool _2762 = false;
    bool _2652 = false;
    bool _2618 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_34.z;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float3 _6892 = float3(_66, _68, _70);
    float4 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6892, float3(0.0), isnan(_6892)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6892, float3(0.0), isnan(_6892)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).xyzw;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float _81 = _73.w;
    float3 _6917 = float3(_66, _68, _70);
    float4 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6917, float3(0.0), isnan(_6917)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6917, float3(0.0), isnan(_6917)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float _91 = _83.w;
    float3 _6936 = float3(_66, _68, _70);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6936, float3(0.0), isnan(_6936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6936, float3(0.0), isnan(_6936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float3 _6956 = float3(_66, _68, _70);
    float4 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6956, float3(0.0), isnan(_6956)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6956, float3(0.0), isnan(_6956)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).xyzw;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _103.w;
    float3 _6976 = float3(_66, _68, _70);
    float4 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6976, float3(0.0), isnan(_6976)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6976, float3(0.0), isnan(_6976)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).xyzw;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = _113.z;
    float _121 = _113.w;
    float3 _6996 = float3(_66, _68, _70);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6996, float3(0.0), isnan(_6996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6996, float3(0.0), isnan(_6996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float3 _7016 = float3(_66, _68, _70);
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7016, float3(0.0), isnan(_7016)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7016, float3(0.0), isnan(_7016)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float3 _7036 = float3(_66, _68, _70);
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7036, float3(0.0), isnan(_7036)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7036, float3(0.0), isnan(_7036)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float3 _7056 = float3(_66, _68, _70);
    float4 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7056, float3(0.0), isnan(_7056)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7056, float3(0.0), isnan(_7056)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).xyzw;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float _161 = _153.w;
    float3 _7076 = float3(_66, _68, _70);
    float4 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7076, float3(0.0), isnan(_7076)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7076, float3(0.0), isnan(_7076)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).xyzw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _163.w;
    float3 _7096 = float3(_66, _68, _70);
    float4 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7096, float3(0.0), isnan(_7096)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7096, float3(0.0), isnan(_7096)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).xyzw;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float _181 = _173.w;
    float3 _7116 = float3(_66, _68, _70);
    float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7116, float3(0.0), isnan(_7116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7116, float3(0.0), isnan(_7116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).xyzw;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _183.w;
    float3 _7136 = float3(_66, _68, _70);
    float4 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7136, float3(0.0), isnan(_7136)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7136, float3(0.0), isnan(_7136)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).xyzw;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = _193.w;
    float3 _7156 = float3(_66, _68, _70);
    float4 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7156, float3(0.0), isnan(_7156)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7156, float3(0.0), isnan(_7156)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).xyzw;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = _203.w;
    float3 _7176 = float3(_66, _68, _70);
    float4 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7176, float3(0.0), isnan(_7176)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7176, float3(0.0), isnan(_7176)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).xyzw;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _213.w;
    float3 _7196 = float3(_66, _68, _70);
    float4 _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7196, float3(0.0), isnan(_7196)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7196, float3(0.0), isnan(_7196)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).xyzw;
    float _225 = _223.x;
    float _227 = _223.y;
    float _229 = _223.z;
    float _231 = _223.w;
    float _233 = _85 + _75;
    float _235 = _87 + _77;
    float _237 = _89 + _79;
    float _239 = _95 + _233;
    float _241 = _97 + _235;
    float _243 = _99 + _237;
    float _245 = _105 + _239;
    float _247 = _107 + _241;
    float _249 = _109 + _243;
    float _251 = _115 + _245;
    float _253 = _117 + _247;
    float _255 = _119 + _249;
    float _257 = _125 + _251;
    float _259 = _127 + _253;
    float _261 = _129 + _255;
    float _263 = _135 + _257;
    float _265 = _137 + _259;
    float _267 = _139 + _261;
    float _269 = _145 + _263;
    float _271 = _147 + _265;
    float _273 = _149 + _267;
    float _275 = _155 + _269;
    float _277 = _157 + _271;
    float _279 = _159 + _273;
    float _281 = _165 + _275;
    float _283 = _167 + _277;
    float _285 = _169 + _279;
    float _287 = _175 + _281;
    float _289 = _177 + _283;
    float _291 = _179 + _285;
    float _293 = _185 + _287;
    float _295 = _187 + _289;
    float _297 = _189 + _291;
    float _299 = _195 + _293;
    float _301 = _197 + _295;
    float _303 = _199 + _297;
    float _305 = _205 + _299;
    float _307 = _207 + _301;
    float _309 = _209 + _303;
    float _311 = _215 + _305;
    float _313 = _217 + _307;
    float _315 = _219 + _309;
    float _317 = _227 + _313;
    float _319 = _225 + _311;
    float _321 = _229 + _315;
    float _323 = fma(_317, -0.0625, _77);
    float _325 = fma(_319, -0.0625, _75);
    float _327 = fma(_321, -0.0625, _79);
    float _329 = fma(_317, -0.0625, _87);
    float _331 = _323 * _323;
    float _333 = _325 * _323;
    float _335 = _323 * _327;
    float _337 = fma(_319, -0.0625, _85);
    float _339 = fma(_321, -0.0625, _89);
    float _341 = _325 * _325;
    float _343 = _325 * _327;
    float _345 = fma(_329, _329, _331);
    float _347 = fma(_337, _329, _333);
    float _349 = fma(_329, _339, _335);
    float _351 = fma(_337, _337, _341);
    float _353 = fma(_337, _339, _343);
    float _355 = _327 * _327;
    float _357 = fma(_317, -0.0625, _97);
    float _359 = fma(_319, -0.0625, _95);
    float _361 = fma(_321, -0.0625, _99);
    float _363 = fma(_339, _339, _355);
    float _365 = fma(_357, _357, _345);
    float _367 = fma(_359, _357, _347);
    float _369 = fma(_357, _361, _349);
    float _371 = fma(_359, _359, _351);
    float _373 = fma(_359, _361, _353);
    float _375 = fma(_317, -0.0625, _107);
    float _377 = fma(_319, -0.0625, _105);
    float _379 = fma(_321, -0.0625, _109);
    float _381 = fma(_361, _361, _363);
    float _383 = fma(_375, _375, _365);
    float _385 = fma(_377, _375, _367);
    float _387 = fma(_375, _379, _369);
    float _389 = fma(_377, _377, _371);
    float _391 = fma(_377, _379, _373);
    float _393 = fma(_317, -0.0625, _117);
    float _395 = fma(_319, -0.0625, _115);
    float _397 = fma(_321, -0.0625, _119);
    float _399 = fma(_379, _379, _381);
    float _401 = fma(_393, _393, _383);
    float _403 = fma(_395, _393, _385);
    float _405 = fma(_393, _397, _387);
    float _407 = fma(_395, _395, _389);
    float _409 = fma(_395, _397, _391);
    float _411 = fma(_317, -0.0625, _127);
    float _413 = fma(_319, -0.0625, _125);
    float _415 = fma(_321, -0.0625, _129);
    float _417 = fma(_397, _397, _399);
    float _419 = fma(_411, _411, _401);
    float _421 = fma(_413, _411, _403);
    float _423 = fma(_411, _415, _405);
    float _425 = fma(_413, _413, _407);
    float _427 = fma(_413, _415, _409);
    float _429 = fma(_317, -0.0625, _137);
    float _431 = fma(_319, -0.0625, _135);
    float _433 = fma(_321, -0.0625, _139);
    float _435 = fma(_415, _415, _417);
    float _437 = fma(_429, _429, _419);
    float _439 = fma(_431, _429, _421);
    float _441 = fma(_429, _433, _423);
    float _443 = fma(_431, _431, _425);
    float _445 = fma(_431, _433, _427);
    float _447 = fma(_317, -0.0625, _147);
    float _449 = fma(_319, -0.0625, _145);
    float _451 = fma(_321, -0.0625, _149);
    float _453 = fma(_433, _433, _435);
    float _455 = fma(_447, _447, _437);
    float _457 = fma(_449, _447, _439);
    float _459 = fma(_447, _451, _441);
    float _461 = fma(_449, _449, _443);
    float _463 = fma(_449, _451, _445);
    float _465 = fma(_317, -0.0625, _157);
    float _467 = fma(_319, -0.0625, _155);
    float _469 = fma(_321, -0.0625, _159);
    float _471 = fma(_451, _451, _453);
    float _473 = fma(_465, _465, _455);
    float _475 = fma(_467, _465, _457);
    float _477 = fma(_465, _469, _459);
    float _479 = fma(_467, _467, _461);
    float _481 = fma(_467, _469, _463);
    float _483 = fma(_317, -0.0625, _167);
    float _485 = fma(_319, -0.0625, _165);
    float _487 = fma(_321, -0.0625, _169);
    float _489 = fma(_469, _469, _471);
    float _491 = fma(_483, _483, _473);
    float _493 = fma(_485, _483, _475);
    float _495 = fma(_483, _487, _477);
    float _497 = fma(_485, _485, _479);
    float _499 = fma(_485, _487, _481);
    float _501 = fma(_317, -0.0625, _177);
    float _503 = fma(_319, -0.0625, _175);
    float _505 = fma(_321, -0.0625, _179);
    float _507 = fma(_487, _487, _489);
    float _509 = fma(_501, _501, _491);
    float _511 = fma(_503, _501, _493);
    float _513 = fma(_501, _505, _495);
    float _515 = fma(_503, _503, _497);
    float _517 = fma(_503, _505, _499);
    float _519 = fma(_317, -0.0625, _187);
    float _521 = fma(_319, -0.0625, _185);
    float _523 = fma(_321, -0.0625, _189);
    float _525 = fma(_505, _505, _507);
    float _527 = fma(_519, _519, _509);
    float _529 = fma(_521, _519, _511);
    float _531 = fma(_519, _523, _513);
    float _533 = fma(_521, _521, _515);
    float _535 = fma(_521, _523, _517);
    float _537 = fma(_317, -0.0625, _197);
    float _539 = fma(_319, -0.0625, _195);
    float _541 = fma(_321, -0.0625, _199);
    float _543 = fma(_523, _523, _525);
    float _545 = fma(_537, _537, _527);
    float _547 = fma(_539, _537, _529);
    float _549 = fma(_537, _541, _531);
    float _551 = fma(_539, _539, _533);
    float _553 = fma(_539, _541, _535);
    float _555 = fma(_317, -0.0625, _207);
    float _557 = fma(_319, -0.0625, _205);
    float _559 = fma(_321, -0.0625, _209);
    float _561 = fma(_541, _541, _543);
    float _563 = fma(_555, _555, _545);
    float _565 = fma(_557, _555, _547);
    float _567 = fma(_555, _559, _549);
    float _569 = fma(_557, _557, _551);
    float _571 = fma(_557, _559, _553);
    float _573 = fma(_317, -0.0625, _217);
    float _575 = fma(_319, -0.0625, _215);
    float _577 = fma(_321, -0.0625, _219);
    float _579 = fma(_319, -0.0625, _225);
    float _581 = fma(_573, _573, _563);
    float _583 = fma(_575, _573, _565);
    float _585 = fma(_573, _577, _567);
    float _587 = fma(_317, -0.0625, _227);
    float _589 = fma(_559, _559, _561);
    float _591 = fma(_321, -0.0625, _229);
    float _593 = fma(_575, _575, _569);
    float _595 = fma(_587, _587, _581);
    float _597 = fma(_579, _587, _583);
    float _599 = fma(_575, _577, _571);
    float _601 = fma(_587, _591, _585);
    float _603 = fma(_579, _579, _593);
    float _605 = _595 + _597;
    float _607 = fma(_577, _577, _589);
    float _609 = fma(_579, _591, _599);
    float _611 = _603 + _597;
    float _613 = _601 + _605;
    float _615 = fma(_591, _591, _607);
    float _617 = _601 + _609;
    float _619 = _609 + _611;
    float _621 = _613 * _613;
    float _623 = _615 + _617;
    float _625 = fma(_619, _619, _621);
    float _627 = fma(_623, _623, _625);
    float _629 = rsqrt(_627);
    float _631 = _613 * _629;
    float _633 = _619 * _629;
    float _635 = _623 * _629;
    float _637 = _595 * _631;
    float _639 = _597 * _631;
    float _641 = fma(_597, _633, _637);
    float _643 = _601 * _631;
    float _645 = fma(_603, _633, _639);
    float _647 = fma(_601, _635, _641);
    float _649 = fma(_609, _633, _643);
    float _651 = fma(_609, _635, _645);
    float _653 = _647 * _647;
    float _655 = fma(_615, _635, _649);
    float _657 = fma(_651, _651, _653);
    float _659 = fma(_655, _655, _657);
    float _661 = rsqrt(_659);
    float _663 = _647 * _661;
    float _665 = _651 * _661;
    float _667 = _655 * _661;
    float _669 = _595 * _663;
    float _671 = _597 * _663;
    float _673 = _601 * _663;
    float _675 = fma(_597, _665, _669);
    float _677 = fma(_603, _665, _671);
    float _679 = fma(_609, _665, _673);
    float _681 = fma(_601, _667, _675);
    float _683 = fma(_609, _667, _677);
    float _685 = fma(_615, _667, _679);
    float _687 = _681 * _681;
    float _689 = fma(_683, _683, _687);
    float _691 = fma(_685, _685, _689);
    float _693 = rsqrt(_691);
    float _695 = _681 * _693;
    float _697 = _683 * _693;
    float _699 = _685 * _693;
    float _701 = _595 * _695;
    float _703 = _597 * _695;
    float _705 = _601 * _695;
    float _707 = fma(_597, _697, _701);
    float _709 = fma(_603, _697, _703);
    float _711 = fma(_609, _697, _705);
    float _713 = fma(_601, _699, _707);
    float _715 = fma(_609, _699, _709);
    float _717 = fma(_615, _699, _711);
    float _719 = _713 * _713;
    float _721 = fma(_715, _715, _719);
    float _723 = fma(_717, _717, _721);
    float _725 = rsqrt(_723);
    float _727 = _713 * _725;
    float _729 = _715 * _725;
    float _731 = _717 * _725;
    float _733 = _595 * _727;
    float _735 = _597 * _727;
    float _737 = _601 * _727;
    float _739 = fma(_597, _729, _733);
    float _741 = fma(_603, _729, _735);
    float _743 = fma(_609, _729, _737);
    float _745 = fma(_601, _731, _739);
    float _747 = fma(_609, _731, _741);
    float _749 = fma(_615, _731, _743);
    float _751 = _745 * _745;
    float _753 = fma(_747, _747, _751);
    float _755 = fma(_749, _749, _753);
    float _757 = rsqrt(_755);
    float _759 = _745 * _757;
    float _761 = _747 * _757;
    float _763 = _749 * _757;
    float _765 = _595 * _759;
    float _767 = _597 * _759;
    float _769 = _601 * _759;
    float _771 = fma(_597, _761, _765);
    float _773 = fma(_603, _761, _767);
    float _775 = fma(_609, _761, _769);
    float _777 = fma(_601, _763, _771);
    float _779 = fma(_609, _763, _773);
    float _781 = fma(_615, _763, _775);
    float _783 = _777 * _777;
    float _785 = fma(_779, _779, _783);
    float _787 = fma(_781, _781, _785);
    float _789 = rsqrt(_787);
    float _791 = _777 * _789;
    float _793 = _779 * _789;
    float _795 = _781 * _789;
    float _797 = _595 * _791;
    float _799 = _597 * _791;
    float _801 = _601 * _791;
    float _803 = fma(_597, _793, _797);
    float _805 = fma(_603, _793, _799);
    float _807 = fma(_609, _793, _801);
    float _809 = fma(_601, _795, _803);
    float _811 = fma(_609, _795, _805);
    float _813 = fma(_615, _795, _807);
    float _815 = _809 * _809;
    float _817 = fma(_811, _811, _815);
    float _819 = fma(_813, _813, _817);
    float _821 = rsqrt(_819);
    float _823 = _809 * _821;
    float _825 = _811 * _821;
    float _827 = _813 * _821;
    float _829 = _595 * _823;
    float _831 = _597 * _823;
    float _833 = fma(_597, _825, _829);
    float _835 = _601 * _823;
    float _837 = fma(_603, _825, _831);
    float _839 = fma(_601, _827, _833);
    float _841 = fma(_609, _825, _835);
    float _843 = fma(_609, _827, _837);
    float _845 = _839 * _839;
    float _847 = fma(_615, _827, _841);
    float _849 = fma(_843, _843, _845);
    float _851 = fma(_847, _847, _849);
    float _853 = rsqrt(_851);
    float _855 = _839 * _853;
    float _857 = _843 * _853;
    float _859 = _847 * _853;
    float _861 = _87 * _855;
    float _863 = _77 * _855;
    float _865 = _97 * _855;
    float _867 = fma(_85, _857, _861);
    float _869 = fma(_75, _857, _863);
    float _871 = fma(_95, _857, _865);
    float _873 = fma(_89, _859, _867);
    float _875 = fma(_79, _859, _869);
    float _877 = fma(_99, _859, _871);
    bool _881 = _873 >= _875;
    bool _883 = isnan(_873);
    bool _885 = _881 || _883;
    bool _887 = isnan(_875);
    bool _889 = _885 || _887;
    float _891 = _70;
    float _893 = _871;
    float _895 = _603;
    float _897 = _867;
    float _899 = _853;
    float _901 = _825;
    float _903 = _813;
    float _905 = _823;
    float _907 = _873;
    float _909 = _797;
    float _911 = _877;
    float _913 = _877;
    float _915 = _855;
    float _917 = _857;
    float _919 = 7.1466221680565670617110208747786e-44;
    float _921 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _923 = 7.0064923216240853546186479164496e-44;
    spvUnsafeArray<uint, 4> _24;
    if (!_889)
    {
        _891 = _75;
    }
    float _925 = _891;
    float _927 = _925;
    float _929 = _925;
    if (!_889)
    {
        _893 = _77;
    }
    float _931 = _893;
    float _933 = _931;
    float _935 = _931;
    if (!_889)
    {
        _895 = _79;
    }
    float _937 = _895;
    float _939 = _937;
    float _941 = _937;
    if (!_889)
    {
        _897 = _873;
    }
    float _943 = _897;
    float _945 = _943;
    float _947 = _943;
    if (!_889)
    {
        _899 = _875;
    }
    float _949 = _899;
    float _951 = _949;
    float _953 = _949;
    if (!_889)
    {
        _901 = _85;
    }
    float _955 = _901;
    float _957 = _955;
    float _959 = _955;
    if (!_889)
    {
        _903 = _87;
    }
    float _961 = _903;
    float _963 = _961;
    float _965 = _961;
    if (!_889)
    {
        _905 = _89;
    }
    float _967 = _905;
    bool _969 = !_889;
    float _971 = _967;
    float _973 = _967;
    if (!_969)
    {
        bool _975 = _873 > _875;
        if (!_975)
        {
            _945 = _873;
        }
        float _977 = _945;
        float _979 = _977;
        if (!_975)
        {
            _951 = _873;
        }
        float _981 = _951;
        float _983 = _981;
        if (!_975)
        {
            _957 = _85;
        }
        float _985 = _957;
        float _987 = _985;
        if (!_975)
        {
            _963 = _87;
        }
        float _989 = _963;
        float _991 = _989;
        if (!_975)
        {
            _971 = _89;
        }
        float _993 = _971;
        float _995 = _993;
        if (!_975)
        {
            _927 = _85;
        }
        float _997 = _927;
        float _999 = _997;
        if (!_975)
        {
            _933 = _87;
        }
        float _1001 = _933;
        float _1003 = _1001;
        if (!_975)
        {
            _939 = _89;
        }
        float _1005 = _939;
        _941 = _1005;
        if (_975)
        {
            _979 = _875;
        }
        float _1007 = _979;
        _947 = _1007;
        if (_975)
        {
            _983 = _873;
        }
        float _1009 = _983;
        _953 = _1009;
        if (_975)
        {
            _987 = _75;
        }
        float _1011 = _987;
        _959 = _1011;
        if (_975)
        {
            _991 = _77;
        }
        float _1013 = _991;
        _965 = _1013;
        if (_975)
        {
            _995 = _79;
        }
        float _1015 = _995;
        _973 = _1015;
        if (_975)
        {
            _999 = _85;
        }
        float _1017 = _999;
        _929 = _1017;
        if (_975)
        {
            _1003 = _87;
        }
        float _1019 = _1003;
        _935 = _1019;
        if (_975)
        {
            _941 = _89;
        }
    }
    float _1021 = _953;
    float _1023 = _947;
    float _1025 = _929;
    float _1027 = _935;
    float _1029 = _941;
    float _1031 = _959;
    float _1033 = _965;
    float _1035 = _973;
    bool _1037 = _1021 >= _877;
    bool _1039 = isnan(_1021);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(_877);
    bool _1045 = _1041 || _1043;
    float _1047 = _107 * _855;
    float _1049 = fma(_105, _857, _1047);
    float _1051 = fma(_109, _859, _1049);
    float _1053 = _1049;
    float _1055 = _1023;
    float _1057 = _1031;
    float _1059 = _1033;
    float _1061 = _1023;
    float _1063 = _1031;
    float _1065 = _1033;
    float _1067 = _1035;
    float _1069 = _1021;
    float _1071 = _1029;
    float _1073 = _1051;
    float _1075 = _1051;
    if (!_1045)
    {
        _907 = _95;
    }
    float _1077 = _907;
    float _1079 = _1077;
    float _1081 = _1077;
    if (!_1045)
    {
        _1053 = _97;
    }
    float _1083 = _1053;
    float _1085 = _1083;
    float _1087 = _1083;
    if (!_1045)
    {
        _909 = _99;
    }
    float _1089 = _909;
    bool _1091 = !_1045;
    float _1093 = _1089;
    float _1095 = _1089;
    if (!_1091)
    {
        bool _1097 = _1023 > _877;
        if (_1097)
        {
            _1055 = _877;
        }
        float _1099 = _1055;
        _1061 = _1099;
        if (!_1097)
        {
            _1079 = _1025;
        }
        float _1101 = _1079;
        float _1103 = _1101;
        if (!_1097)
        {
            _1085 = _1027;
        }
        float _1105 = _1085;
        float _1107 = _1105;
        if (!_1097)
        {
            _1093 = _1029;
        }
        float _1109 = _1093;
        float _1111 = _1109;
        if (!_1097)
        {
            _911 = _1021;
        }
        float _1113 = _911;
        float _1115 = _1113;
        if (_1097)
        {
            _1103 = _1025;
        }
        float _1117 = _1103;
        _1081 = _1117;
        if (_1097)
        {
            _1107 = _1027;
        }
        float _1119 = _1107;
        _1087 = _1119;
        if (_1097)
        {
            _1111 = _1029;
        }
        float _1121 = _1111;
        _1095 = _1121;
        if (_1097)
        {
            _1115 = _1021;
        }
        float _1123 = _1115;
        _913 = _1123;
        if (_1097)
        {
            _1057 = _95;
        }
        float _1125 = _1057;
        _1063 = _1125;
        if (_1097)
        {
            _1059 = _97;
        }
        float _1127 = _1059;
        _1065 = _1127;
        if (_1097)
        {
            _1067 = _99;
        }
    }
    float _1129 = _913;
    float _1131 = _1061;
    float _1133 = _1081;
    float _1135 = _1087;
    float _1137 = _1095;
    float _1139 = _1063;
    float _1141 = _1065;
    float _1143 = _1067;
    bool _1145 = _1129 >= _1051;
    bool _1147 = isnan(_1129);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan(_1051);
    bool _1153 = _1149 || _1151;
    float _1155 = _117 * _855;
    float _1157 = fma(_115, _857, _1155);
    float _1159 = fma(_119, _859, _1157);
    float _1161 = _1157;
    float _1163 = _1131;
    float _1165 = _1139;
    float _1167 = _1141;
    float _1169 = _1131;
    float _1171 = _1139;
    float _1173 = _1141;
    float _1175 = _1143;
    float _1177 = _1133;
    float _1179 = _1137;
    float _1181 = _1159;
    float _1183 = _1159;
    if (!_1153)
    {
        _1069 = _105;
    }
    float _1185 = _1069;
    float _1187 = _1185;
    float _1189 = _1185;
    if (!_1153)
    {
        _1071 = _107;
    }
    float _1191 = _1071;
    float _1193 = _1191;
    float _1195 = _1191;
    if (!_1153)
    {
        _1161 = _109;
    }
    float _1197 = _1161;
    bool _1199 = !_1153;
    float _1201 = _1197;
    float _1203 = _1197;
    if (!_1199)
    {
        bool _1205 = _1131 > _1051;
        if (_1205)
        {
            _1163 = _1051;
        }
        float _1207 = _1163;
        _1169 = _1207;
        if (!_1205)
        {
            _1187 = _1133;
        }
        float _1209 = _1187;
        float _1211 = _1209;
        if (!_1205)
        {
            _1193 = _1135;
        }
        float _1213 = _1193;
        float _1215 = _1213;
        if (!_1205)
        {
            _1201 = _1137;
        }
        float _1217 = _1201;
        float _1219 = _1217;
        if (!_1205)
        {
            _1073 = _1129;
        }
        float _1221 = _1073;
        float _1223 = _1221;
        if (_1205)
        {
            _1211 = _1133;
        }
        float _1225 = _1211;
        _1189 = _1225;
        if (_1205)
        {
            _1215 = _1135;
        }
        float _1227 = _1215;
        _1195 = _1227;
        if (_1205)
        {
            _1219 = _1137;
        }
        float _1229 = _1219;
        _1203 = _1229;
        if (_1205)
        {
            _1223 = _1129;
        }
        float _1231 = _1223;
        _1075 = _1231;
        if (_1205)
        {
            _1165 = _105;
        }
        float _1233 = _1165;
        _1171 = _1233;
        if (_1205)
        {
            _1167 = _107;
        }
        float _1235 = _1167;
        _1173 = _1235;
        if (_1205)
        {
            _1175 = _109;
        }
    }
    float _1237 = _1075;
    float _1239 = _1169;
    float _1241 = _1189;
    float _1243 = _1195;
    float _1245 = _1203;
    float _1247 = _1171;
    float _1249 = _1173;
    float _1251 = _1175;
    bool _1253 = _1237 >= _1159;
    bool _1255 = isnan(_1237);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(_1159);
    bool _1261 = _1257 || _1259;
    float _1263 = _127 * _855;
    float _1265 = fma(_125, _857, _1263);
    float _1267 = fma(_129, _859, _1265);
    float _1269 = _1265;
    float _1271 = _1239;
    float _1273 = _1247;
    float _1275 = _1249;
    float _1277 = _1239;
    float _1279 = _1247;
    float _1281 = _1249;
    float _1283 = _1251;
    float _1285 = _1241;
    float _1287 = _1243;
    float _1289 = _1267;
    float _1291 = _1267;
    float _1293 = _1237;
    if (!_1261)
    {
        _1177 = _115;
    }
    float _1295 = _1177;
    float _1297 = _1295;
    float _1299 = _1295;
    if (!_1261)
    {
        _1269 = _117;
    }
    float _1301 = _1269;
    float _1303 = _1301;
    float _1305 = _1301;
    if (!_1261)
    {
        _1179 = _119;
    }
    float _1307 = _1179;
    bool _1309 = !_1261;
    float _1311 = _1307;
    float _1313 = _1307;
    if (!_1309)
    {
        bool _1315 = _1239 > _1159;
        if (_1315)
        {
            _1271 = _1159;
        }
        float _1317 = _1271;
        _1277 = _1317;
        if (!_1315)
        {
            _1297 = _1241;
        }
        float _1319 = _1297;
        float _1321 = _1319;
        if (!_1315)
        {
            _1303 = _1243;
        }
        float _1323 = _1303;
        float _1325 = _1323;
        if (!_1315)
        {
            _1311 = _1245;
        }
        float _1327 = _1311;
        float _1329 = _1327;
        if (!_1315)
        {
            _1181 = _1237;
        }
        float _1331 = _1181;
        float _1333 = _1331;
        if (_1315)
        {
            _1321 = _1241;
        }
        float _1335 = _1321;
        _1299 = _1335;
        if (_1315)
        {
            _1325 = _1243;
        }
        float _1337 = _1325;
        _1305 = _1337;
        if (_1315)
        {
            _1329 = _1245;
        }
        float _1339 = _1329;
        _1313 = _1339;
        if (_1315)
        {
            _1333 = _1237;
        }
        float _1341 = _1333;
        _1183 = _1341;
        if (_1315)
        {
            _1273 = _115;
        }
        float _1343 = _1273;
        _1279 = _1343;
        if (_1315)
        {
            _1275 = _117;
        }
        float _1345 = _1275;
        _1281 = _1345;
        if (_1315)
        {
            _1283 = _119;
        }
    }
    float _1347 = _1183;
    float _1349 = _1277;
    float _1351 = _1299;
    float _1353 = _1305;
    float _1355 = _1313;
    float _1357 = _1279;
    float _1359 = _1281;
    float _1361 = _1283;
    bool _1363 = _1347 >= _1267;
    bool _1365 = isnan(_1347);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(_1267);
    bool _1371 = _1367 || _1369;
    float _1373 = _137 * _855;
    float _1375 = fma(_135, _857, _1373);
    float _1377 = fma(_139, _859, _1375);
    float _1379 = _1375;
    float _1381 = _1349;
    float _1383 = _1357;
    float _1385 = _1359;
    float _1387 = _1349;
    float _1389 = _1357;
    float _1391 = _1359;
    float _1393 = _1361;
    float _1395 = _1355;
    float _1397 = _1347;
    float _1399 = _1377;
    float _1401 = _1377;
    if (!_1371)
    {
        _1285 = _125;
    }
    float _1403 = _1285;
    float _1405 = _1403;
    float _1407 = _1403;
    if (!_1371)
    {
        _1287 = _127;
    }
    float _1409 = _1287;
    float _1411 = _1409;
    float _1413 = _1409;
    if (!_1371)
    {
        _1379 = _129;
    }
    float _1415 = _1379;
    bool _1417 = !_1371;
    float _1419 = _1415;
    float _1421 = _1415;
    if (!_1417)
    {
        bool _1423 = _1349 > _1267;
        if (_1423)
        {
            _1381 = _1267;
        }
        float _1425 = _1381;
        _1387 = _1425;
        if (!_1423)
        {
            _1405 = _1351;
        }
        float _1427 = _1405;
        float _1429 = _1427;
        if (!_1423)
        {
            _1411 = _1353;
        }
        float _1431 = _1411;
        float _1433 = _1431;
        if (!_1423)
        {
            _1419 = _1355;
        }
        float _1435 = _1419;
        float _1437 = _1435;
        if (!_1423)
        {
            _1289 = _1347;
        }
        float _1439 = _1289;
        float _1441 = _1439;
        if (_1423)
        {
            _1429 = _1351;
        }
        float _1443 = _1429;
        _1407 = _1443;
        if (_1423)
        {
            _1433 = _1353;
        }
        float _1445 = _1433;
        _1413 = _1445;
        if (_1423)
        {
            _1437 = _1355;
        }
        float _1447 = _1437;
        _1421 = _1447;
        if (_1423)
        {
            _1441 = _1347;
        }
        float _1449 = _1441;
        _1291 = _1449;
        if (_1423)
        {
            _1383 = _125;
        }
        float _1451 = _1383;
        _1389 = _1451;
        if (_1423)
        {
            _1385 = _127;
        }
        float _1453 = _1385;
        _1391 = _1453;
        if (_1423)
        {
            _1393 = _129;
        }
    }
    float _1455 = _1291;
    float _1457 = _1387;
    float _1459 = _1407;
    float _1461 = _1413;
    float _1463 = _1421;
    float _1465 = _1389;
    float _1467 = _1391;
    float _1469 = _1393;
    bool _1471 = _1455 >= _1377;
    bool _1473 = isnan(_1455);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(_1377);
    bool _1479 = _1475 || _1477;
    float _1481 = _147 * _855;
    float _1483 = fma(_145, _857, _1481);
    float _1485 = fma(_149, _859, _1483);
    float _1487 = _1457;
    float _1489 = _1465;
    float _1491 = _1467;
    float _1493 = _1457;
    float _1495 = _1465;
    float _1497 = _1467;
    float _1499 = _1469;
    float _1501 = _1459;
    float _1503 = _1461;
    float _1505 = _1485;
    float _1507 = _1485;
    if (!_1479)
    {
        _1395 = _135;
    }
    float _1509 = _1395;
    float _1511 = _1509;
    float _1513 = _1509;
    if (!_1479)
    {
        _1293 = _137;
    }
    float _1515 = _1293;
    float _1517 = _1515;
    float _1519 = _1515;
    if (!_1479)
    {
        _1397 = _139;
    }
    float _1521 = _1397;
    bool _1523 = !_1479;
    float _1525 = _1521;
    float _1527 = _1521;
    if (!_1523)
    {
        bool _1529 = _1457 > _1377;
        if (_1529)
        {
            _1487 = _1377;
        }
        float _1531 = _1487;
        _1493 = _1531;
        if (!_1529)
        {
            _1511 = _1459;
        }
        float _1533 = _1511;
        float _1535 = _1533;
        if (!_1529)
        {
            _1517 = _1461;
        }
        float _1537 = _1517;
        float _1539 = _1537;
        if (!_1529)
        {
            _1525 = _1463;
        }
        float _1541 = _1525;
        float _1543 = _1541;
        if (!_1529)
        {
            _1399 = _1455;
        }
        float _1545 = _1399;
        float _1547 = _1545;
        if (_1529)
        {
            _1535 = _1459;
        }
        float _1549 = _1535;
        _1513 = _1549;
        if (_1529)
        {
            _1539 = _1461;
        }
        float _1551 = _1539;
        _1519 = _1551;
        if (_1529)
        {
            _1543 = _1463;
        }
        float _1553 = _1543;
        _1527 = _1553;
        if (_1529)
        {
            _1547 = _1455;
        }
        float _1555 = _1547;
        _1401 = _1555;
        if (_1529)
        {
            _1489 = _135;
        }
        float _1557 = _1489;
        _1495 = _1557;
        if (_1529)
        {
            _1491 = _137;
        }
        float _1559 = _1491;
        _1497 = _1559;
        if (_1529)
        {
            _1499 = _139;
        }
    }
    float _1561 = _1401;
    float _1563 = _1493;
    float _1565 = _1513;
    float _1567 = _1519;
    float _1569 = _1527;
    float _1571 = _1495;
    float _1573 = _1497;
    float _1575 = _1499;
    bool _1577 = _1561 >= _1485;
    bool _1579 = isnan(_1561);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan(_1485);
    bool _1585 = _1581 || _1583;
    float _1587 = _157 * _855;
    float _1589 = fma(_155, _857, _1587);
    float _1591 = fma(_159, _859, _1589);
    float _1593 = _1589;
    float _1595 = _1563;
    float _1597 = _1571;
    float _1599 = _1573;
    float _1601 = _1563;
    float _1603 = _1571;
    float _1605 = _1573;
    float _1607 = _1575;
    float _1609 = _1569;
    float _1611 = _1565;
    float _1613 = _1591;
    float _1615 = _1591;
    if (!_1585)
    {
        _1501 = _145;
    }
    float _1617 = _1501;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1585)
    {
        _1503 = _147;
    }
    float _1623 = _1503;
    float _1625 = _1623;
    float _1627 = _1623;
    if (!_1585)
    {
        _1593 = _149;
    }
    float _1629 = _1593;
    bool _1631 = !_1585;
    float _1633 = _1629;
    float _1635 = _1629;
    if (!_1631)
    {
        bool _1637 = _1563 > _1485;
        if (_1637)
        {
            _1595 = _1485;
        }
        float _1639 = _1595;
        _1601 = _1639;
        if (!_1637)
        {
            _1619 = _1565;
        }
        float _1641 = _1619;
        float _1643 = _1641;
        if (!_1637)
        {
            _1625 = _1567;
        }
        float _1645 = _1625;
        float _1647 = _1645;
        if (!_1637)
        {
            _1633 = _1569;
        }
        float _1649 = _1633;
        float _1651 = _1649;
        if (!_1637)
        {
            _1505 = _1561;
        }
        float _1653 = _1505;
        float _1655 = _1653;
        if (_1637)
        {
            _1643 = _1565;
        }
        float _1657 = _1643;
        _1621 = _1657;
        if (_1637)
        {
            _1647 = _1567;
        }
        float _1659 = _1647;
        _1627 = _1659;
        if (_1637)
        {
            _1651 = _1569;
        }
        float _1661 = _1651;
        _1635 = _1661;
        if (_1637)
        {
            _1655 = _1561;
        }
        float _1663 = _1655;
        _1507 = _1663;
        if (_1637)
        {
            _1597 = _145;
        }
        float _1665 = _1597;
        _1603 = _1665;
        if (_1637)
        {
            _1599 = _147;
        }
        float _1667 = _1599;
        _1605 = _1667;
        if (_1637)
        {
            _1607 = _149;
        }
    }
    float _1669 = _1507;
    float _1671 = _1601;
    float _1673 = _1621;
    float _1675 = _1627;
    float _1677 = _1635;
    float _1679 = _1603;
    float _1681 = _1605;
    float _1683 = _1607;
    bool _1685 = _1669 >= _1591;
    bool _1687 = isnan(_1669);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(_1591);
    bool _1693 = _1689 || _1691;
    float _1695 = _167 * _855;
    float _1697 = fma(_165, _857, _1695);
    float _1699 = fma(_169, _859, _1697);
    float _1701 = _1697;
    float _1703 = _1671;
    float _1705 = _1679;
    float _1707 = _1681;
    float _1709 = _1671;
    float _1711 = _1679;
    float _1713 = _1681;
    float _1715 = _1683;
    float _1717 = _1675;
    float _1719 = _1673;
    float _1721 = _1699;
    float _1723 = _1699;
    if (!_1693)
    {
        _1609 = _155;
    }
    float _1725 = _1609;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1693)
    {
        _1701 = _157;
    }
    float _1731 = _1701;
    float _1733 = _1731;
    float _1735 = _1731;
    if (!_1693)
    {
        _1611 = _159;
    }
    float _1737 = _1611;
    bool _1739 = !_1693;
    float _1741 = _1737;
    float _1743 = _1737;
    if (!_1739)
    {
        bool _1745 = _1671 > _1591;
        if (_1745)
        {
            _1703 = _1591;
        }
        float _1747 = _1703;
        _1709 = _1747;
        if (!_1745)
        {
            _1727 = _1673;
        }
        float _1749 = _1727;
        float _1751 = _1749;
        if (!_1745)
        {
            _1733 = _1675;
        }
        float _1753 = _1733;
        float _1755 = _1753;
        if (!_1745)
        {
            _1741 = _1677;
        }
        float _1757 = _1741;
        float _1759 = _1757;
        if (!_1745)
        {
            _1613 = _1669;
        }
        float _1761 = _1613;
        float _1763 = _1761;
        if (_1745)
        {
            _1751 = _1673;
        }
        float _1765 = _1751;
        _1729 = _1765;
        if (_1745)
        {
            _1755 = _1675;
        }
        float _1767 = _1755;
        _1735 = _1767;
        if (_1745)
        {
            _1759 = _1677;
        }
        float _1769 = _1759;
        _1743 = _1769;
        if (_1745)
        {
            _1763 = _1669;
        }
        float _1771 = _1763;
        _1615 = _1771;
        if (_1745)
        {
            _1705 = _155;
        }
        float _1773 = _1705;
        _1711 = _1773;
        if (_1745)
        {
            _1707 = _157;
        }
        float _1775 = _1707;
        _1713 = _1775;
        if (_1745)
        {
            _1715 = _159;
        }
    }
    float _1777 = _1615;
    float _1779 = _1709;
    float _1781 = _1729;
    float _1783 = _1735;
    float _1785 = _1743;
    float _1787 = _1711;
    float _1789 = _1713;
    float _1791 = _1715;
    bool _1793 = _1777 >= _1699;
    bool _1795 = isnan(_1777);
    bool _1797 = _1793 || _1795;
    bool _1799 = isnan(_1699);
    bool _1801 = _1797 || _1799;
    float _1803 = _177 * _855;
    float _1805 = fma(_175, _857, _1803);
    float _1807 = fma(_179, _859, _1805);
    float _1809 = _1805;
    float _1811 = _1779;
    float _1813 = _1787;
    float _1815 = _1789;
    float _1817 = _1779;
    float _1819 = _1787;
    float _1821 = _1789;
    float _1823 = _1791;
    float _1825 = _1785;
    float _1827 = _1777;
    float _1829 = _1807;
    float _1831 = _1807;
    if (!_1801)
    {
        _1809 = _165;
    }
    float _1833 = _1809;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1801)
    {
        _1717 = _167;
    }
    float _1839 = _1717;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1801)
    {
        _1719 = _169;
    }
    float _1845 = _1719;
    bool _1847 = !_1801;
    float _1849 = _1845;
    float _1851 = _1845;
    if (!_1847)
    {
        bool _1853 = _1779 > _1699;
        if (_1853)
        {
            _1811 = _1699;
        }
        float _1855 = _1811;
        _1817 = _1855;
        if (!_1853)
        {
            _1835 = _1781;
        }
        float _1857 = _1835;
        float _1859 = _1857;
        if (!_1853)
        {
            _1841 = _1783;
        }
        float _1861 = _1841;
        float _1863 = _1861;
        if (!_1853)
        {
            _1849 = _1785;
        }
        float _1865 = _1849;
        float _1867 = _1865;
        if (!_1853)
        {
            _1721 = _1777;
        }
        float _1869 = _1721;
        float _1871 = _1869;
        if (_1853)
        {
            _1859 = _1781;
        }
        float _1873 = _1859;
        _1837 = _1873;
        if (_1853)
        {
            _1863 = _1783;
        }
        float _1875 = _1863;
        _1843 = _1875;
        if (_1853)
        {
            _1867 = _1785;
        }
        float _1877 = _1867;
        _1851 = _1877;
        if (_1853)
        {
            _1871 = _1777;
        }
        float _1879 = _1871;
        _1723 = _1879;
        if (_1853)
        {
            _1813 = _165;
        }
        float _1881 = _1813;
        _1819 = _1881;
        if (_1853)
        {
            _1815 = _167;
        }
        float _1883 = _1815;
        _1821 = _1883;
        if (_1853)
        {
            _1823 = _169;
        }
    }
    float _1885 = _1723;
    float _1887 = _1817;
    float _1889 = _1837;
    float _1891 = _1843;
    float _1893 = _1851;
    float _1895 = _1819;
    float _1897 = _1821;
    float _1899 = _1823;
    bool _1901 = _1885 >= _1807;
    bool _1903 = isnan(_1885);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(_1807);
    bool _1909 = _1905 || _1907;
    float _1911 = _187 * _855;
    float _1913 = fma(_185, _857, _1911);
    float _1915 = fma(_189, _859, _1913);
    float _1917 = _1913;
    float _1919 = _1887;
    float _1921 = _1895;
    float _1923 = _1897;
    float _1925 = _1887;
    float _1927 = _1895;
    float _1929 = _1897;
    float _1931 = _1899;
    float _1933 = _1891;
    float _1935 = _1893;
    float _1937 = _1915;
    float _1939 = _1915;
    if (!_1909)
    {
        _1825 = _175;
    }
    float _1941 = _1825;
    float _1943 = _1941;
    float _1945 = _1941;
    if (!_1909)
    {
        _1917 = _177;
    }
    float _1947 = _1917;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1909)
    {
        _1827 = _179;
    }
    float _1953 = _1827;
    bool _1955 = !_1909;
    float _1957 = _1953;
    float _1959 = _1953;
    if (!_1955)
    {
        bool _1961 = _1887 > _1807;
        if (_1961)
        {
            _1919 = _1807;
        }
        float _1963 = _1919;
        _1925 = _1963;
        if (!_1961)
        {
            _1943 = _1889;
        }
        float _1965 = _1943;
        float _1967 = _1965;
        if (!_1961)
        {
            _1949 = _1891;
        }
        float _1969 = _1949;
        float _1971 = _1969;
        if (!_1961)
        {
            _1957 = _1893;
        }
        float _1973 = _1957;
        float _1975 = _1973;
        if (!_1961)
        {
            _1829 = _1885;
        }
        float _1977 = _1829;
        float _1979 = _1977;
        if (_1961)
        {
            _1967 = _1889;
        }
        float _1981 = _1967;
        _1945 = _1981;
        if (_1961)
        {
            _1971 = _1891;
        }
        float _1983 = _1971;
        _1951 = _1983;
        if (_1961)
        {
            _1975 = _1893;
        }
        float _1985 = _1975;
        _1959 = _1985;
        if (_1961)
        {
            _1979 = _1885;
        }
        float _1987 = _1979;
        _1831 = _1987;
        if (_1961)
        {
            _1921 = _175;
        }
        float _1989 = _1921;
        _1927 = _1989;
        if (_1961)
        {
            _1923 = _177;
        }
        float _1991 = _1923;
        _1929 = _1991;
        if (_1961)
        {
            _1931 = _179;
        }
    }
    float _1993 = _1831;
    float _1995 = _1925;
    float _1997 = _1945;
    float _1999 = _1951;
    float _2001 = _1959;
    float _2003 = _1927;
    float _2005 = _1929;
    float _2007 = _1931;
    bool _2009 = _1993 >= _1915;
    bool _2011 = isnan(_1993);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(_1915);
    bool _2017 = _2013 || _2015;
    float _2019 = _197 * _855;
    float _2021 = fma(_195, _857, _2019);
    float _2023 = fma(_199, _859, _2021);
    float _2025 = _2021;
    float _2027 = _1995;
    float _2029 = _2003;
    float _2031 = _2005;
    float _2033 = _1995;
    float _2035 = _2003;
    float _2037 = _2005;
    float _2039 = _2007;
    float _2041 = _1997;
    float _2043 = _2001;
    float _2045 = _2023;
    float _2047 = _2023;
    if (!_2017)
    {
        _2025 = _185;
    }
    float _2049 = _2025;
    float _2051 = _2049;
    float _2053 = _2049;
    if (!_2017)
    {
        _1933 = _187;
    }
    float _2055 = _1933;
    float _2057 = _2055;
    float _2059 = _2055;
    if (!_2017)
    {
        _1935 = _189;
    }
    float _2061 = _1935;
    bool _2063 = !_2017;
    float _2065 = _2061;
    float _2067 = _2061;
    if (!_2063)
    {
        bool _2069 = _1995 > _1915;
        if (_2069)
        {
            _2027 = _1915;
        }
        float _2071 = _2027;
        _2033 = _2071;
        if (!_2069)
        {
            _2051 = _1997;
        }
        float _2073 = _2051;
        float _2075 = _2073;
        if (!_2069)
        {
            _2057 = _1999;
        }
        float _2077 = _2057;
        float _2079 = _2077;
        if (!_2069)
        {
            _2065 = _2001;
        }
        float _2081 = _2065;
        float _2083 = _2081;
        if (!_2069)
        {
            _1937 = _1993;
        }
        float _2085 = _1937;
        float _2087 = _2085;
        if (_2069)
        {
            _2075 = _1997;
        }
        float _2089 = _2075;
        _2053 = _2089;
        if (_2069)
        {
            _2079 = _1999;
        }
        float _2091 = _2079;
        _2059 = _2091;
        if (_2069)
        {
            _2083 = _2001;
        }
        float _2093 = _2083;
        _2067 = _2093;
        if (_2069)
        {
            _2087 = _1993;
        }
        float _2095 = _2087;
        _1939 = _2095;
        if (_2069)
        {
            _2029 = _185;
        }
        float _2097 = _2029;
        _2035 = _2097;
        if (_2069)
        {
            _2031 = _187;
        }
        float _2099 = _2031;
        _2037 = _2099;
        if (_2069)
        {
            _2039 = _189;
        }
    }
    float _2101 = _1939;
    float _2103 = _2033;
    float _2105 = _2053;
    float _2107 = _2059;
    float _2109 = _2067;
    float _2111 = _2035;
    float _2113 = _2037;
    float _2115 = _2039;
    bool _2117 = _2101 >= _2023;
    bool _2119 = isnan(_2101);
    bool _2121 = _2117 || _2119;
    bool _2123 = isnan(_2023);
    bool _2125 = _2121 || _2123;
    float _2127 = _207 * _855;
    float _2129 = fma(_205, _857, _2127);
    float _2131 = fma(_209, _859, _2129);
    float _2133 = _2129;
    float _2135 = _2103;
    float _2137 = _2111;
    float _2139 = _2113;
    float _2141 = _2103;
    float _2143 = _2111;
    float _2145 = _2113;
    float _2147 = _2115;
    float _2149 = _2107;
    float _2151 = _2109;
    float _2153 = _2131;
    float _2155 = _2131;
    if (!_2125)
    {
        _2041 = _195;
    }
    float _2157 = _2041;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2125)
    {
        _2133 = _197;
    }
    float _2163 = _2133;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2125)
    {
        _2043 = _199;
    }
    float _2169 = _2043;
    bool _2171 = !_2125;
    float _2173 = _2169;
    float _2175 = _2169;
    if (!_2171)
    {
        bool _2177 = _2103 > _2023;
        if (_2177)
        {
            _2135 = _2023;
        }
        float _2179 = _2135;
        _2141 = _2179;
        if (!_2177)
        {
            _2159 = _2105;
        }
        float _2181 = _2159;
        float _2183 = _2181;
        if (!_2177)
        {
            _2165 = _2107;
        }
        float _2185 = _2165;
        float _2187 = _2185;
        if (!_2177)
        {
            _2173 = _2109;
        }
        float _2189 = _2173;
        float _2191 = _2189;
        if (!_2177)
        {
            _2045 = _2101;
        }
        float _2193 = _2045;
        float _2195 = _2193;
        if (_2177)
        {
            _2183 = _2105;
        }
        float _2197 = _2183;
        _2161 = _2197;
        if (_2177)
        {
            _2187 = _2107;
        }
        float _2199 = _2187;
        _2167 = _2199;
        if (_2177)
        {
            _2191 = _2109;
        }
        float _2201 = _2191;
        _2175 = _2201;
        if (_2177)
        {
            _2195 = _2101;
        }
        float _2203 = _2195;
        _2047 = _2203;
        if (_2177)
        {
            _2137 = _195;
        }
        float _2205 = _2137;
        _2143 = _2205;
        if (_2177)
        {
            _2139 = _197;
        }
        float _2207 = _2139;
        _2145 = _2207;
        if (_2177)
        {
            _2147 = _199;
        }
    }
    float _2209 = _2047;
    float _2211 = _2141;
    float _2213 = _2161;
    float _2215 = _2167;
    float _2217 = _2175;
    float _2219 = _2143;
    float _2221 = _2145;
    float _2223 = _2147;
    bool _2225 = _2209 >= _2131;
    bool _2227 = isnan(_2209);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(_2131);
    bool _2233 = _2229 || _2231;
    float _2235 = _217 * _855;
    float _2237 = fma(_215, _857, _2235);
    float _2239 = fma(_219, _859, _2237);
    float _2241 = _2237;
    float _2243 = _2211;
    float _2245 = _2219;
    float _2247 = _2221;
    float _2249 = _2219;
    float _2251 = _2221;
    float _2253 = _2211;
    float _2255 = _2223;
    float _2257 = _2217;
    float _2259 = _2213;
    float _2261 = _2239;
    float _2263 = _2239;
    if (!_2233)
    {
        _2241 = _205;
    }
    float _2265 = _2241;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2233)
    {
        _2149 = _207;
    }
    float _2271 = _2149;
    float _2273 = _2271;
    float _2275 = _2271;
    if (!_2233)
    {
        _2151 = _209;
    }
    float _2277 = _2151;
    bool _2279 = !_2233;
    float _2281 = _2277;
    float _2283 = _2277;
    if (!_2279)
    {
        bool _2285 = _2211 > _2131;
        if (_2285)
        {
            _2243 = _2131;
        }
        float _2287 = _2243;
        _2253 = _2287;
        if (!_2285)
        {
            _2267 = _2213;
        }
        float _2289 = _2267;
        float _2291 = _2289;
        if (!_2285)
        {
            _2273 = _2215;
        }
        float _2293 = _2273;
        float _2295 = _2293;
        if (!_2285)
        {
            _2281 = _2217;
        }
        float _2297 = _2281;
        float _2299 = _2297;
        if (!_2285)
        {
            _2153 = _2209;
        }
        float _2301 = _2153;
        float _2303 = _2301;
        if (_2285)
        {
            _2291 = _2213;
        }
        float _2305 = _2291;
        _2269 = _2305;
        if (_2285)
        {
            _2295 = _2215;
        }
        float _2307 = _2295;
        _2275 = _2307;
        if (_2285)
        {
            _2299 = _2217;
        }
        float _2309 = _2299;
        _2283 = _2309;
        if (_2285)
        {
            _2303 = _2209;
        }
        float _2311 = _2303;
        _2155 = _2311;
        if (_2285)
        {
            _2245 = _205;
        }
        float _2313 = _2245;
        _2249 = _2313;
        if (_2285)
        {
            _2247 = _207;
        }
        float _2315 = _2247;
        _2251 = _2315;
        if (_2285)
        {
            _2255 = _209;
        }
    }
    float _2317 = _2155;
    float _2319 = _2249;
    float _2321 = _2251;
    float _2323 = _2253;
    float _2325 = _2269;
    float _2327 = _2275;
    float _2329 = _2283;
    float _2331 = _2255;
    bool _2333 = _2317 >= _2239;
    bool _2335 = isnan(_2317);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(_2239);
    bool _2341 = _2337 || _2339;
    float _2343 = _227 * _855;
    float _2345 = fma(_225, _857, _2343);
    float _2347 = fma(_229, _859, _2345);
    float _2349 = _2345;
    float _2351 = _2323;
    float _2353 = _2331;
    float _2355 = _2323;
    float _2357 = _2321;
    float _2359 = _2319;
    if (!_2341)
    {
        _915 = _2319;
    }
    float _2361 = _915;
    float _2363 = _2361;
    float _2365 = _2361;
    if (!_2341)
    {
        _2349 = _2321;
    }
    float _2367 = _2349;
    float _2369 = _2367;
    float _2371 = _2367;
    if (!_2341)
    {
        _917 = _215;
    }
    float _2373 = _917;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2341)
    {
        _2257 = _217;
    }
    float _2379 = _2257;
    float _2381 = _2379;
    float _2383 = _2379;
    if (!_2341)
    {
        _2259 = _219;
    }
    float _2385 = _2259;
    bool _2387 = !_2341;
    float _2389 = _2385;
    float _2391 = _2385;
    if (!_2387)
    {
        bool _2393 = _2323 > _2239;
        if (_2393)
        {
            _2351 = _2239;
        }
        float _2395 = _2351;
        _2355 = _2395;
        if (!_2393)
        {
            _2375 = _2325;
        }
        float _2397 = _2375;
        float _2399 = _2397;
        if (!_2393)
        {
            _2381 = _2327;
        }
        float _2401 = _2381;
        float _2403 = _2401;
        if (!_2393)
        {
            _2389 = _2329;
        }
        float _2405 = _2389;
        float _2407 = _2405;
        if (!_2393)
        {
            _2261 = _2317;
        }
        float _2409 = _2261;
        float _2411 = _2409;
        if (!_2393)
        {
            _2363 = _2319;
        }
        float _2413 = _2363;
        float _2415 = _2413;
        if (!_2393)
        {
            _2369 = _2321;
        }
        float _2417 = _2369;
        float _2419 = _2417;
        if (_2393)
        {
            _2399 = _2325;
        }
        float _2421 = _2399;
        _2377 = _2421;
        if (_2393)
        {
            _2403 = _2327;
        }
        float _2423 = _2403;
        _2383 = _2423;
        if (_2393)
        {
            _2407 = _2329;
        }
        float _2425 = _2407;
        _2391 = _2425;
        if (_2393)
        {
            _2411 = _2317;
        }
        float _2427 = _2411;
        _2263 = _2427;
        if (_2393)
        {
            _2415 = _215;
        }
        float _2429 = _2415;
        _2365 = _2429;
        if (_2393)
        {
            _2419 = _217;
        }
        float _2431 = _2419;
        _2371 = _2431;
        if (_2393)
        {
            _2353 = _219;
        }
    }
    float _2433 = _2263;
    float _2435 = _2365;
    float _2437 = _2353;
    float _2439 = _2355;
    float _2441 = _2377;
    float _2443 = _2383;
    float _2445 = _2391;
    float _2447 = _2371;
    bool _2449 = _2433 >= _2347;
    bool _2451 = isnan(_2433);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(_2347);
    bool _2457 = _2453 || _2455;
    float _2459 = _2447;
    float _2461 = _2447;
    if (!_2457)
    {
        _2357 = _2435;
    }
    float _2463 = _2357;
    float _2465 = _2463;
    float _2467 = _2463;
    if (!_2457)
    {
        _2359 = _2437;
    }
    float _2469 = _2359;
    float _2471 = _2469;
    float _2473 = _2469;
    if (!_2457)
    {
        _919 = _225;
    }
    float _2475 = _919;
    float _2477 = _2475;
    float _2479 = _2475;
    if (!_2457)
    {
        _921 = _227;
    }
    float _2481 = _921;
    float _2483 = _2481;
    float _2485 = _2481;
    if (!_2457)
    {
        _923 = _229;
    }
    float _2487 = _923;
    bool _2489 = !_2457;
    float _2491 = _2487;
    float _2493 = _2487;
    if (!_2489)
    {
        bool _2495 = _2439 > _2347;
        if (!_2495)
        {
            _2477 = _2441;
        }
        float _2497 = _2477;
        float _2499 = _2497;
        if (!_2495)
        {
            _2483 = _2443;
        }
        float _2501 = _2483;
        float _2503 = _2501;
        if (!_2495)
        {
            _2491 = _2445;
        }
        float _2505 = _2491;
        float _2507 = _2505;
        if (!_2495)
        {
            _2465 = _2435;
        }
        float _2509 = _2465;
        float _2511 = _2509;
        if (!_2495)
        {
            _2471 = _2437;
        }
        float _2513 = _2471;
        _2473 = _2513;
        if (_2495)
        {
            _2499 = _2441;
        }
        float _2515 = _2499;
        _2479 = _2515;
        if (_2495)
        {
            _2503 = _2443;
        }
        float _2517 = _2503;
        _2485 = _2517;
        if (_2495)
        {
            _2507 = _2445;
        }
        float _2519 = _2507;
        _2493 = _2519;
        if (_2495)
        {
            _2511 = _225;
        }
        float _2521 = _2511;
        _2467 = _2521;
        if (_2495)
        {
            _2459 = _227;
        }
        float _2523 = _2459;
        _2461 = _2523;
        if (_2495)
        {
            _2473 = _229;
        }
    }
    float _2525 = _2461;
    float _2527 = _2485;
    float _2529 = _2467;
    float _2531 = _2479;
    float _2533 = _2473;
    float _2535 = _2493;
    float _2537 = -_2525;
    float _2539 = _2527 + _2537;
    float _2541 = -_2529;
    float _2543 = _2531 + _2541;
    float _2545 = -_2533;
    float _2547 = _2535 + _2545;
    float _2549 = -_2525;
    float _2551 = _87 + _2549;
    float _2553 = _2539 * _2539;
    float _2555 = _2539 * _2551;
    float _2557 = fma(_2543, _2543, _2553);
    float _2559 = -_2529;
    float _2561 = _85 + _2559;
    float _2563 = -_2533;
    float _2565 = _89 + _2563;
    float _2567 = fma(_2547, _2547, _2557);
    float _2569 = fma(_2543, _2561, _2555);
    float _2571 = fma(_2547, _2565, _2569);
    float _2573 = 1.0 / _2567;
    float _2575 = _2573 * 3.0;
    float _2577 = _2575 * _2571;
    float _2579 = rint(_2577);
    float _2581 = precise::max(0.0, _2579);
    float _2583 = precise::min(_2581, 3.0);
    float _2585 = trunc(_2583);
    int _2588 = int(_2585);
    bool _2590 = _2588 >= 2;
    bool _2592 = !_2590;
    float _2594 = _2543;
    float _2596 = _2539;
    float _2598 = _2547;
    float _2600 = _2529;
    float _2602 = _2531;
    float _2604 = _2525;
    float _2606 = _2527;
    float _2608 = _2533;
    float _2610 = _2535;
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
    float _2644;
    float _2646;
    float _2648;
    float _2650;
    if (!_2592)
    {
        bool _2612 = _2588 >= 3;
        bool _2614 = !_2612;
        if (!_2614)
        {
            bool _2616 = _2588 != 3;
            _2618 = _2616;
            if (!_2618)
            {
                _2620 = _85;
                _2622 = _87;
                _2624 = _89;
                _2626 = 1.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = 0.0;
                _2646 = 0.0;
                _2648 = 0.0;
                _2650 = 0.0;
                _2652 = true;
            }
        }
        else
        {
            _2620 = 0.0;
            _2622 = 0.0;
            _2624 = 0.0;
            _2626 = 0.0;
            _2628 = 0.0;
            _2630 = 0.0;
            _2632 = 0.0;
            _2634 = 0.0;
            _2636 = _85;
            _2638 = _87;
            _2640 = _89;
            _2642 = 1.0;
            _2644 = 0.0;
            _2646 = 0.0;
            _2648 = 0.0;
            _2650 = 0.0;
            _2652 = true;
        }
    }
    if ((!_2652) || _2618)
    {
        bool _2654;
        if (!_2618)
        {
            _2654 = _2588 >= 1;
        }
        if ((!_2654) || _2618)
        {
            bool _2656;
            if (!_2618)
            {
                _2656 = _2588 != 0;
            }
            if ((!_2656) && (!_2618))
            {
                _2620 = 0.0;
                _2622 = 0.0;
                _2624 = 0.0;
                _2626 = 0.0;
                _2628 = _85;
                _2630 = _87;
                _2632 = _89;
                _2634 = 1.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = 0.0;
                _2646 = 0.0;
                _2648 = 0.0;
                _2650 = 0.0;
                _2652 = true;
            }
            else
            {
                _2618 = false;
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
                _2644 = 0.0;
                _2646 = 0.0;
                _2648 = 0.0;
                _2650 = 0.0;
                _2652 = true;
            }
        }
        else
        {
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
            _2644 = _85;
            _2646 = _87;
            _2648 = _89;
            _2650 = 1.0;
        }
    }
    _2652 = false;
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
    float _2682 = _2644;
    float _2684 = _2646;
    float _2686 = _2648;
    float _2688 = _2650;
    float _2690 = -_2525;
    float _2692 = _77 + _2690;
    float _2694 = -_2529;
    float _2696 = _75 + _2694;
    float _2698 = _2539 * _2692;
    float _2700 = -_2533;
    float _2702 = _79 + _2700;
    float _2704 = fma(_2543, _2696, _2698);
    float _2706 = fma(_2547, _2702, _2704);
    float _2708 = _2575 * _2706;
    float _2710 = rint(_2708);
    float _2712 = precise::max(0.0, _2710);
    float _2714 = precise::min(_2712, 3.0);
    float _2716 = trunc(_2714);
    int _2718 = int(_2716);
    bool _2720 = _2718 >= 2;
    bool _2722 = !_2720;
    float _2724 = as_type<float>(_2718);
    float _2726 = _2710;
    float _2728 = _2704;
    float _2730 = _2698;
    float _2732 = _2658;
    float _2734 = _2660;
    float _2736 = _2662;
    float _2738 = _2664;
    float _2740 = _2674;
    float _2742 = _2676;
    float _2744 = _2678;
    float _2746 = _2680;
    float _2748 = _2682;
    float _2750 = _2684;
    float _2752 = _2686;
    float _2754 = _2688;
    float _2772;
    float _2774;
    float _2776;
    float _2778;
    if (!_2722)
    {
        bool _2756 = _2718 >= 3;
        bool _2758 = !_2756;
        if (!_2758)
        {
            bool _2760 = _2718 != 3;
            _2762 = _2760;
            if (!_2762)
            {
                float _2764 = _75 + _2658;
                float _2766 = _77 + _2660;
                float _2768 = _79 + _2662;
                float _2770 = _2664 + 1.0;
                _2732 = _2764;
                _2734 = _2766;
                _2736 = _2768;
                _2738 = _2770;
                _2772 = _2666;
                _2774 = _2668;
                _2776 = _2670;
                _2778 = _2672;
                _2780 = true;
            }
        }
        else
        {
            float _2782 = _75 + _2674;
            float _2784 = _77 + _2676;
            float _2786 = _79 + _2678;
            float _2788 = _2680 + 1.0;
            _2772 = _2666;
            _2774 = _2668;
            _2776 = _2670;
            _2778 = _2672;
            _2740 = _2782;
            _2742 = _2784;
            _2744 = _2786;
            _2746 = _2788;
            _2780 = true;
        }
    }
    if ((!_2780) || _2762)
    {
        bool _2790;
        if (!_2762)
        {
            _2790 = _2718 >= 1;
        }
        if ((!_2790) || _2762)
        {
            if (!_2762)
            {
                bool _2792 = _2718 != 0;
                if (!_2792)
                {
                    float _2794 = _75 + _2666;
                    _2724 = _2794;
                }
                float _2796 = _2724;
                _2772 = _2796;
                if (!_2792)
                {
                    float _2798 = _77 + _2668;
                    _2726 = _2798;
                }
                float _2800 = _2726;
                _2774 = _2800;
                if (!_2792)
                {
                    float _2802 = _79 + _2670;
                    _2728 = _2802;
                }
                float _2804 = _2728;
                _2776 = _2804;
                if (!_2792)
                {
                    float _2806 = _2672 + 1.0;
                    _2730 = _2806;
                }
                float _2808 = _2730;
                bool _2810 = !_2792;
                _2778 = _2808;
                _2780 = _2810;
            }
            if ((!_2780) || _2762)
            {
                _2762 = false;
                _2772 = _2666;
                _2774 = _2668;
                _2776 = _2670;
                _2778 = _2672;
                _2780 = true;
            }
        }
        else
        {
            float _2812 = _75 + _2682;
            float _2814 = _77 + _2684;
            float _2816 = _79 + _2686;
            float _2818 = _2688 + 1.0;
            _2772 = _2666;
            _2774 = _2668;
            _2776 = _2670;
            _2778 = _2672;
            _2748 = _2812;
            _2750 = _2814;
            _2752 = _2816;
            _2754 = _2818;
        }
    }
    _2780 = false;
    float _2820 = _2732;
    float _2822 = _2734;
    float _2824 = _2736;
    float _2826 = _2738;
    float _2828 = _2772;
    float _2830 = _2774;
    float _2832 = _2776;
    float _2834 = _2778;
    float _2836 = _2740;
    float _2838 = _2742;
    float _2840 = _2744;
    float _2842 = _2746;
    float _2844 = _2748;
    float _2846 = _2750;
    float _2848 = _2752;
    float _2850 = _2754;
    float _2852 = -_2525;
    float _2854 = _97 + _2852;
    float _2856 = -_2529;
    float _2858 = _95 + _2856;
    float _2860 = _2539 * _2854;
    float _2862 = -_2533;
    float _2864 = _99 + _2862;
    float _2866 = fma(_2543, _2858, _2860);
    float _2868 = fma(_2547, _2864, _2866);
    float _2870 = _2575 * _2868;
    float _2872 = rint(_2870);
    float _2874 = precise::max(0.0, _2872);
    float _2876 = precise::min(_2874, 3.0);
    float _2878 = trunc(_2876);
    int _2880 = int(_2878);
    bool _2882 = _2880 >= 2;
    bool _2884 = !_2882;
    float _2886 = _2872;
    float _2888 = as_type<float>(_2880);
    float _2890 = _2860;
    float _2892 = _2866;
    float _2894 = _2820;
    float _2896 = _2822;
    float _2898 = _2824;
    float _2900 = _2826;
    float _2902 = _2836;
    float _2904 = _2838;
    float _2906 = _2840;
    float _2908 = _2842;
    float _2910 = _2844;
    float _2912 = _2846;
    float _2914 = _2848;
    float _2916 = _2850;
    float _2934;
    float _2936;
    float _2938;
    float _2940;
    if (!_2884)
    {
        bool _2918 = _2880 >= 3;
        bool _2920 = !_2918;
        if (!_2920)
        {
            bool _2922 = _2880 != 3;
            _2924 = _2922;
            if (!_2924)
            {
                float _2926 = _95 + _2820;
                float _2928 = _97 + _2822;
                float _2930 = _99 + _2824;
                float _2932 = _2826 + 1.0;
                _2894 = _2926;
                _2896 = _2928;
                _2898 = _2930;
                _2900 = _2932;
                _2934 = _2828;
                _2936 = _2830;
                _2938 = _2832;
                _2940 = _2834;
                _2942 = true;
            }
        }
        else
        {
            float _2944 = _95 + _2836;
            float _2946 = _97 + _2838;
            float _2948 = _99 + _2840;
            float _2950 = _2842 + 1.0;
            _2934 = _2828;
            _2936 = _2830;
            _2938 = _2832;
            _2940 = _2834;
            _2902 = _2944;
            _2904 = _2946;
            _2906 = _2948;
            _2908 = _2950;
            _2942 = true;
        }
    }
    if ((!_2942) || _2924)
    {
        bool _2952;
        if (!_2924)
        {
            _2952 = _2880 >= 1;
        }
        if ((!_2952) || _2924)
        {
            if (!_2924)
            {
                bool _2954 = _2880 != 0;
                if (!_2954)
                {
                    float _2956 = _95 + _2828;
                    _2886 = _2956;
                }
                float _2958 = _2886;
                _2934 = _2958;
                if (!_2954)
                {
                    float _2960 = _97 + _2830;
                    _2888 = _2960;
                }
                float _2962 = _2888;
                _2936 = _2962;
                if (!_2954)
                {
                    float _2964 = _99 + _2832;
                    _2890 = _2964;
                }
                float _2966 = _2890;
                _2938 = _2966;
                if (!_2954)
                {
                    float _2968 = _2834 + 1.0;
                    _2892 = _2968;
                }
                float _2970 = _2892;
                bool _2972 = !_2954;
                _2940 = _2970;
                _2942 = _2972;
            }
            if ((!_2942) || _2924)
            {
                _2924 = false;
                _2934 = _2828;
                _2936 = _2830;
                _2938 = _2832;
                _2940 = _2834;
                _2942 = true;
            }
        }
        else
        {
            float _2974 = _95 + _2844;
            float _2976 = _97 + _2846;
            float _2978 = _99 + _2848;
            float _2980 = _2850 + 1.0;
            _2934 = _2828;
            _2936 = _2830;
            _2938 = _2832;
            _2940 = _2834;
            _2910 = _2974;
            _2912 = _2976;
            _2914 = _2978;
            _2916 = _2980;
        }
    }
    _2942 = false;
    float _2982 = _2894;
    float _2984 = _2896;
    float _2986 = _2898;
    float _2988 = _2900;
    float _2990 = _2934;
    float _2992 = _2936;
    float _2994 = _2938;
    float _2996 = _2940;
    float _2998 = _2902;
    float _3000 = _2904;
    float _3002 = _2906;
    float _3004 = _2908;
    float _3006 = _2910;
    float _3008 = _2912;
    float _3010 = _2914;
    float _3012 = _2916;
    float _3014 = -_2525;
    float _3016 = _107 + _3014;
    float _3018 = -_2529;
    float _3020 = _105 + _3018;
    float _3022 = _2539 * _3016;
    float _3024 = -_2533;
    float _3026 = _109 + _3024;
    float _3028 = fma(_2543, _3020, _3022);
    float _3030 = fma(_2547, _3026, _3028);
    float _3032 = _2575 * _3030;
    float _3034 = rint(_3032);
    float _3036 = precise::max(0.0, _3034);
    float _3038 = precise::min(_3036, 3.0);
    float _3040 = trunc(_3038);
    int _3042 = int(_3040);
    bool _3044 = _3042 >= 2;
    bool _3046 = !_3044;
    float _3048 = as_type<float>(_3042);
    float _3050 = _3034;
    float _3052 = _3028;
    float _3054 = _3022;
    float _3056 = _2982;
    float _3058 = _2984;
    float _3060 = _2986;
    float _3062 = _2988;
    float _3064 = _2998;
    float _3066 = _3000;
    float _3068 = _3002;
    float _3070 = _3004;
    float _3072 = _3006;
    float _3074 = _3008;
    float _3076 = _3010;
    float _3078 = _3012;
    float _3096;
    float _3098;
    float _3100;
    float _3102;
    if (!_3046)
    {
        bool _3080 = _3042 >= 3;
        bool _3082 = !_3080;
        if (!_3082)
        {
            bool _3084 = _3042 != 3;
            _3086 = _3084;
            if (!_3086)
            {
                float _3088 = _105 + _2982;
                float _3090 = _107 + _2984;
                float _3092 = _109 + _2986;
                float _3094 = _2988 + 1.0;
                _3056 = _3088;
                _3058 = _3090;
                _3060 = _3092;
                _3062 = _3094;
                _3096 = _2990;
                _3098 = _2992;
                _3100 = _2994;
                _3102 = _2996;
                _3104 = true;
            }
        }
        else
        {
            float _3106 = _105 + _2998;
            float _3108 = _107 + _3000;
            float _3110 = _109 + _3002;
            float _3112 = _3004 + 1.0;
            _3096 = _2990;
            _3098 = _2992;
            _3100 = _2994;
            _3102 = _2996;
            _3064 = _3106;
            _3066 = _3108;
            _3068 = _3110;
            _3070 = _3112;
            _3104 = true;
        }
    }
    if ((!_3104) || _3086)
    {
        bool _3114;
        if (!_3086)
        {
            _3114 = _3042 >= 1;
        }
        if ((!_3114) || _3086)
        {
            if (!_3086)
            {
                bool _3116 = _3042 != 0;
                if (!_3116)
                {
                    float _3118 = _105 + _2990;
                    _3048 = _3118;
                }
                float _3120 = _3048;
                _3096 = _3120;
                if (!_3116)
                {
                    float _3122 = _107 + _2992;
                    _3050 = _3122;
                }
                float _3124 = _3050;
                _3098 = _3124;
                if (!_3116)
                {
                    float _3126 = _109 + _2994;
                    _3052 = _3126;
                }
                float _3128 = _3052;
                _3100 = _3128;
                if (!_3116)
                {
                    float _3130 = _2996 + 1.0;
                    _3054 = _3130;
                }
                float _3132 = _3054;
                bool _3134 = !_3116;
                _3102 = _3132;
                _3104 = _3134;
            }
            if ((!_3104) || _3086)
            {
                _3086 = false;
                _3096 = _2990;
                _3098 = _2992;
                _3100 = _2994;
                _3102 = _2996;
                _3104 = true;
            }
        }
        else
        {
            float _3136 = _105 + _3006;
            float _3138 = _107 + _3008;
            float _3140 = _109 + _3010;
            float _3142 = _3012 + 1.0;
            _3096 = _2990;
            _3098 = _2992;
            _3100 = _2994;
            _3102 = _2996;
            _3072 = _3136;
            _3074 = _3138;
            _3076 = _3140;
            _3078 = _3142;
        }
    }
    _3104 = false;
    float _3144 = _3056;
    float _3146 = _3058;
    float _3148 = _3060;
    float _3150 = _3062;
    float _3152 = _3096;
    float _3154 = _3098;
    float _3156 = _3100;
    float _3158 = _3102;
    float _3160 = _3064;
    float _3162 = _3066;
    float _3164 = _3068;
    float _3166 = _3070;
    float _3168 = _3072;
    float _3170 = _3074;
    float _3172 = _3076;
    float _3174 = _3078;
    float _3176 = -_2525;
    float _3178 = _117 + _3176;
    float _3180 = -_2529;
    float _3182 = _115 + _3180;
    float _3184 = _2539 * _3178;
    float _3186 = -_2533;
    float _3188 = _119 + _3186;
    float _3190 = fma(_2543, _3182, _3184);
    float _3192 = fma(_2547, _3188, _3190);
    float _3194 = _2575 * _3192;
    float _3196 = rint(_3194);
    float _3198 = precise::max(0.0, _3196);
    float _3200 = precise::min(_3198, 3.0);
    float _3202 = trunc(_3200);
    int _3204 = int(_3202);
    bool _3206 = _3204 >= 2;
    bool _3208 = !_3206;
    float _3210 = _3196;
    float _3212 = as_type<float>(_3204);
    float _3214 = _3184;
    float _3216 = _3190;
    float _3218 = _3144;
    float _3220 = _3146;
    float _3222 = _3148;
    float _3224 = _3150;
    float _3226 = _3160;
    float _3228 = _3162;
    float _3230 = _3164;
    float _3232 = _3166;
    float _3234 = _3168;
    float _3236 = _3170;
    float _3238 = _3172;
    float _3240 = _3174;
    float _3258;
    float _3260;
    float _3262;
    float _3264;
    if (!_3208)
    {
        bool _3242 = _3204 >= 3;
        bool _3244 = !_3242;
        if (!_3244)
        {
            bool _3246 = _3204 != 3;
            _3248 = _3246;
            if (!_3248)
            {
                float _3250 = _115 + _3144;
                float _3252 = _117 + _3146;
                float _3254 = _119 + _3148;
                float _3256 = _3150 + 1.0;
                _3218 = _3250;
                _3220 = _3252;
                _3222 = _3254;
                _3224 = _3256;
                _3258 = _3152;
                _3260 = _3154;
                _3262 = _3156;
                _3264 = _3158;
                _3266 = true;
            }
        }
        else
        {
            float _3268 = _115 + _3160;
            float _3270 = _117 + _3162;
            float _3272 = _119 + _3164;
            float _3274 = _3166 + 1.0;
            _3258 = _3152;
            _3260 = _3154;
            _3262 = _3156;
            _3264 = _3158;
            _3226 = _3268;
            _3228 = _3270;
            _3230 = _3272;
            _3232 = _3274;
            _3266 = true;
        }
    }
    if ((!_3266) || _3248)
    {
        bool _3276;
        if (!_3248)
        {
            _3276 = _3204 >= 1;
        }
        if ((!_3276) || _3248)
        {
            if (!_3248)
            {
                bool _3278 = _3204 != 0;
                if (!_3278)
                {
                    float _3280 = _115 + _3152;
                    _3210 = _3280;
                }
                float _3282 = _3210;
                _3258 = _3282;
                if (!_3278)
                {
                    float _3284 = _117 + _3154;
                    _3212 = _3284;
                }
                float _3286 = _3212;
                _3260 = _3286;
                if (!_3278)
                {
                    float _3288 = _119 + _3156;
                    _3214 = _3288;
                }
                float _3290 = _3214;
                _3262 = _3290;
                if (!_3278)
                {
                    float _3292 = _3158 + 1.0;
                    _3216 = _3292;
                }
                float _3294 = _3216;
                bool _3296 = !_3278;
                _3264 = _3294;
                _3266 = _3296;
            }
            if ((!_3266) || _3248)
            {
                _3248 = false;
                _3258 = _3152;
                _3260 = _3154;
                _3262 = _3156;
                _3264 = _3158;
                _3266 = true;
            }
        }
        else
        {
            float _3298 = _115 + _3168;
            float _3300 = _117 + _3170;
            float _3302 = _119 + _3172;
            float _3304 = _3174 + 1.0;
            _3258 = _3152;
            _3260 = _3154;
            _3262 = _3156;
            _3264 = _3158;
            _3234 = _3298;
            _3236 = _3300;
            _3238 = _3302;
            _3240 = _3304;
        }
    }
    _3266 = false;
    float _3306 = _3218;
    float _3308 = _3220;
    float _3310 = _3222;
    float _3312 = _3224;
    float _3314 = _3258;
    float _3316 = _3260;
    float _3318 = _3262;
    float _3320 = _3264;
    float _3322 = _3226;
    float _3324 = _3228;
    float _3326 = _3230;
    float _3328 = _3232;
    float _3330 = _3234;
    float _3332 = _3236;
    float _3334 = _3238;
    float _3336 = _3240;
    float _3338 = -_2525;
    float _3340 = _127 + _3338;
    float _3342 = -_2529;
    float _3344 = _125 + _3342;
    float _3346 = _2539 * _3340;
    float _3348 = -_2533;
    float _3350 = _129 + _3348;
    float _3352 = fma(_2543, _3344, _3346);
    float _3354 = fma(_2547, _3350, _3352);
    float _3356 = _2575 * _3354;
    float _3358 = rint(_3356);
    float _3360 = precise::max(0.0, _3358);
    float _3362 = precise::min(_3360, 3.0);
    float _3364 = trunc(_3362);
    int _3366 = int(_3364);
    bool _3368 = _3366 >= 2;
    bool _3370 = !_3368;
    float _3372 = as_type<float>(_3366);
    float _3374 = _3358;
    float _3376 = _3352;
    float _3378 = _3346;
    float _3380 = _3306;
    float _3382 = _3308;
    float _3384 = _3310;
    float _3386 = _3312;
    float _3388 = _3322;
    float _3390 = _3324;
    float _3392 = _3326;
    float _3394 = _3328;
    float _3396 = _3330;
    float _3398 = _3332;
    float _3400 = _3334;
    float _3402 = _3336;
    float _3420;
    float _3422;
    float _3424;
    float _3426;
    if (!_3370)
    {
        bool _3404 = _3366 >= 3;
        bool _3406 = !_3404;
        if (!_3406)
        {
            bool _3408 = _3366 != 3;
            _3410 = _3408;
            if (!_3410)
            {
                float _3412 = _125 + _3306;
                float _3414 = _127 + _3308;
                float _3416 = _129 + _3310;
                float _3418 = _3312 + 1.0;
                _3380 = _3412;
                _3382 = _3414;
                _3384 = _3416;
                _3386 = _3418;
                _3420 = _3314;
                _3422 = _3316;
                _3424 = _3318;
                _3426 = _3320;
                _3428 = true;
            }
        }
        else
        {
            float _3430 = _125 + _3322;
            float _3432 = _127 + _3324;
            float _3434 = _129 + _3326;
            float _3436 = _3328 + 1.0;
            _3420 = _3314;
            _3422 = _3316;
            _3424 = _3318;
            _3426 = _3320;
            _3388 = _3430;
            _3390 = _3432;
            _3392 = _3434;
            _3394 = _3436;
            _3428 = true;
        }
    }
    if ((!_3428) || _3410)
    {
        bool _3438;
        if (!_3410)
        {
            _3438 = _3366 >= 1;
        }
        if ((!_3438) || _3410)
        {
            if (!_3410)
            {
                bool _3440 = _3366 != 0;
                if (!_3440)
                {
                    float _3442 = _125 + _3314;
                    _3372 = _3442;
                }
                float _3444 = _3372;
                _3420 = _3444;
                if (!_3440)
                {
                    float _3446 = _127 + _3316;
                    _3374 = _3446;
                }
                float _3448 = _3374;
                _3422 = _3448;
                if (!_3440)
                {
                    float _3450 = _129 + _3318;
                    _3376 = _3450;
                }
                float _3452 = _3376;
                _3424 = _3452;
                if (!_3440)
                {
                    float _3454 = _3320 + 1.0;
                    _3378 = _3454;
                }
                float _3456 = _3378;
                bool _3458 = !_3440;
                _3426 = _3456;
                _3428 = _3458;
            }
            if ((!_3428) || _3410)
            {
                _3410 = false;
                _3420 = _3314;
                _3422 = _3316;
                _3424 = _3318;
                _3426 = _3320;
                _3428 = true;
            }
        }
        else
        {
            float _3460 = _125 + _3330;
            float _3462 = _127 + _3332;
            float _3464 = _129 + _3334;
            float _3466 = _3336 + 1.0;
            _3420 = _3314;
            _3422 = _3316;
            _3424 = _3318;
            _3426 = _3320;
            _3396 = _3460;
            _3398 = _3462;
            _3400 = _3464;
            _3402 = _3466;
        }
    }
    _3428 = false;
    float _3468 = _3380;
    float _3470 = _3382;
    float _3472 = _3384;
    float _3474 = _3386;
    float _3476 = _3420;
    float _3478 = _3422;
    float _3480 = _3424;
    float _3482 = _3426;
    float _3484 = _3388;
    float _3486 = _3390;
    float _3488 = _3392;
    float _3490 = _3394;
    float _3492 = _3396;
    float _3494 = _3398;
    float _3496 = _3400;
    float _3498 = _3402;
    float _3500 = -_2525;
    float _3502 = _137 + _3500;
    float _3504 = -_2529;
    float _3506 = _135 + _3504;
    float _3508 = _2539 * _3502;
    float _3510 = -_2533;
    float _3512 = _139 + _3510;
    float _3514 = fma(_2543, _3506, _3508);
    float _3516 = fma(_2547, _3512, _3514);
    float _3518 = _2575 * _3516;
    float _3520 = rint(_3518);
    float _3522 = precise::max(0.0, _3520);
    float _3524 = precise::min(_3522, 3.0);
    float _3526 = trunc(_3524);
    int _3528 = int(_3526);
    bool _3530 = _3528 >= 2;
    bool _3532 = !_3530;
    float _3534 = _3520;
    float _3536 = as_type<float>(_3528);
    float _3538 = _3508;
    float _3540 = _3514;
    float _3542 = _3468;
    float _3544 = _3470;
    float _3546 = _3472;
    float _3548 = _3474;
    float _3550 = _3484;
    float _3552 = _3486;
    float _3554 = _3488;
    float _3556 = _3490;
    float _3558 = _3492;
    float _3560 = _3494;
    float _3562 = _3496;
    float _3564 = _3498;
    float _3582;
    float _3584;
    float _3586;
    float _3588;
    if (!_3532)
    {
        bool _3566 = _3528 >= 3;
        bool _3568 = !_3566;
        if (!_3568)
        {
            bool _3570 = _3528 != 3;
            _3572 = _3570;
            if (!_3572)
            {
                float _3574 = _135 + _3468;
                float _3576 = _137 + _3470;
                float _3578 = _139 + _3472;
                float _3580 = _3474 + 1.0;
                _3542 = _3574;
                _3544 = _3576;
                _3546 = _3578;
                _3548 = _3580;
                _3582 = _3476;
                _3584 = _3478;
                _3586 = _3480;
                _3588 = _3482;
                _3590 = true;
            }
        }
        else
        {
            float _3592 = _135 + _3484;
            float _3594 = _137 + _3486;
            float _3596 = _139 + _3488;
            float _3598 = _3490 + 1.0;
            _3582 = _3476;
            _3584 = _3478;
            _3586 = _3480;
            _3588 = _3482;
            _3550 = _3592;
            _3552 = _3594;
            _3554 = _3596;
            _3556 = _3598;
            _3590 = true;
        }
    }
    if ((!_3590) || _3572)
    {
        bool _3600;
        if (!_3572)
        {
            _3600 = _3528 >= 1;
        }
        if ((!_3600) || _3572)
        {
            if (!_3572)
            {
                bool _3602 = _3528 != 0;
                if (!_3602)
                {
                    float _3604 = _135 + _3476;
                    _3534 = _3604;
                }
                float _3606 = _3534;
                _3582 = _3606;
                if (!_3602)
                {
                    float _3608 = _137 + _3478;
                    _3536 = _3608;
                }
                float _3610 = _3536;
                _3584 = _3610;
                if (!_3602)
                {
                    float _3612 = _139 + _3480;
                    _3538 = _3612;
                }
                float _3614 = _3538;
                _3586 = _3614;
                if (!_3602)
                {
                    float _3616 = _3482 + 1.0;
                    _3540 = _3616;
                }
                float _3618 = _3540;
                bool _3620 = !_3602;
                _3588 = _3618;
                _3590 = _3620;
            }
            if ((!_3590) || _3572)
            {
                _3572 = false;
                _3582 = _3476;
                _3584 = _3478;
                _3586 = _3480;
                _3588 = _3482;
                _3590 = true;
            }
        }
        else
        {
            float _3622 = _135 + _3492;
            float _3624 = _137 + _3494;
            float _3626 = _139 + _3496;
            float _3628 = _3498 + 1.0;
            _3582 = _3476;
            _3584 = _3478;
            _3586 = _3480;
            _3588 = _3482;
            _3558 = _3622;
            _3560 = _3624;
            _3562 = _3626;
            _3564 = _3628;
        }
    }
    _3590 = false;
    float _3630 = _3542;
    float _3632 = _3544;
    float _3634 = _3546;
    float _3636 = _3548;
    float _3638 = _3582;
    float _3640 = _3584;
    float _3642 = _3586;
    float _3644 = _3588;
    float _3646 = _3550;
    float _3648 = _3552;
    float _3650 = _3554;
    float _3652 = _3556;
    float _3654 = _3558;
    float _3656 = _3560;
    float _3658 = _3562;
    float _3660 = _3564;
    float _3662 = -_2525;
    float _3664 = _147 + _3662;
    float _3666 = -_2529;
    float _3668 = _145 + _3666;
    float _3670 = _2539 * _3664;
    float _3672 = -_2533;
    float _3674 = _149 + _3672;
    float _3676 = fma(_2543, _3668, _3670);
    float _3678 = fma(_2547, _3674, _3676);
    float _3680 = _2575 * _3678;
    float _3682 = rint(_3680);
    float _3684 = precise::max(0.0, _3682);
    float _3686 = precise::min(_3684, 3.0);
    float _3688 = trunc(_3686);
    int _3690 = int(_3688);
    bool _3692 = _3690 >= 2;
    bool _3694 = !_3692;
    float _3696 = _3670;
    float _3698 = _3676;
    float _3700 = _3682;
    float _3702 = as_type<float>(_3690);
    float _3704 = _3630;
    float _3706 = _3632;
    float _3708 = _3634;
    float _3710 = _3636;
    float _3712 = _3646;
    float _3714 = _3648;
    float _3716 = _3650;
    float _3718 = _3652;
    float _3720 = _3654;
    float _3722 = _3656;
    float _3724 = _3658;
    float _3726 = _3660;
    float _3744;
    float _3746;
    float _3748;
    float _3750;
    if (!_3694)
    {
        bool _3728 = _3690 >= 3;
        bool _3730 = !_3728;
        if (!_3730)
        {
            bool _3732 = _3690 != 3;
            _3734 = _3732;
            if (!_3734)
            {
                float _3736 = _145 + _3630;
                float _3738 = _147 + _3632;
                float _3740 = _149 + _3634;
                float _3742 = _3636 + 1.0;
                _3704 = _3736;
                _3706 = _3738;
                _3708 = _3740;
                _3710 = _3742;
                _3744 = _3638;
                _3746 = _3640;
                _3748 = _3642;
                _3750 = _3644;
                _3752 = true;
            }
        }
        else
        {
            float _3754 = _145 + _3646;
            float _3756 = _147 + _3648;
            float _3758 = _149 + _3650;
            float _3760 = _3652 + 1.0;
            _3744 = _3638;
            _3746 = _3640;
            _3748 = _3642;
            _3750 = _3644;
            _3712 = _3754;
            _3714 = _3756;
            _3716 = _3758;
            _3718 = _3760;
            _3752 = true;
        }
    }
    if ((!_3752) || _3734)
    {
        bool _3762;
        if (!_3734)
        {
            _3762 = _3690 >= 1;
        }
        if ((!_3762) || _3734)
        {
            if (!_3734)
            {
                bool _3764 = _3690 != 0;
                if (!_3764)
                {
                    float _3766 = _145 + _3638;
                    _3696 = _3766;
                }
                float _3768 = _3696;
                _3744 = _3768;
                if (!_3764)
                {
                    float _3770 = _147 + _3640;
                    _3698 = _3770;
                }
                float _3772 = _3698;
                _3746 = _3772;
                if (!_3764)
                {
                    float _3774 = _149 + _3642;
                    _3700 = _3774;
                }
                float _3776 = _3700;
                _3748 = _3776;
                if (!_3764)
                {
                    float _3778 = _3644 + 1.0;
                    _3702 = _3778;
                }
                float _3780 = _3702;
                bool _3782 = !_3764;
                _3750 = _3780;
                _3752 = _3782;
            }
            if ((!_3752) || _3734)
            {
                _3734 = false;
                _3744 = _3638;
                _3746 = _3640;
                _3748 = _3642;
                _3750 = _3644;
                _3752 = true;
            }
        }
        else
        {
            float _3784 = _145 + _3654;
            float _3786 = _147 + _3656;
            float _3788 = _149 + _3658;
            float _3790 = _3660 + 1.0;
            _3744 = _3638;
            _3746 = _3640;
            _3748 = _3642;
            _3750 = _3644;
            _3720 = _3784;
            _3722 = _3786;
            _3724 = _3788;
            _3726 = _3790;
        }
    }
    _3752 = false;
    float _3792 = _3704;
    float _3794 = _3706;
    float _3796 = _3708;
    float _3798 = _3710;
    float _3800 = _3744;
    float _3802 = _3746;
    float _3804 = _3748;
    float _3806 = _3750;
    float _3808 = _3712;
    float _3810 = _3714;
    float _3812 = _3716;
    float _3814 = _3718;
    float _3816 = _3720;
    float _3818 = _3722;
    float _3820 = _3724;
    float _3822 = _3726;
    float _3824 = -_2525;
    float _3826 = _157 + _3824;
    float _3828 = -_2529;
    float _3830 = _155 + _3828;
    float _3832 = _2539 * _3826;
    float _3834 = -_2533;
    float _3836 = _159 + _3834;
    float _3838 = fma(_2543, _3830, _3832);
    float _3840 = fma(_2547, _3836, _3838);
    float _3842 = _2575 * _3840;
    float _3844 = rint(_3842);
    float _3846 = precise::max(0.0, _3844);
    float _3848 = precise::min(_3846, 3.0);
    float _3850 = trunc(_3848);
    int _3852 = int(_3850);
    bool _3854 = _3852 >= 2;
    bool _3856 = !_3854;
    float _3858 = _3844;
    float _3860 = as_type<float>(_3852);
    float _3862 = _3832;
    float _3864 = _3838;
    float _3866 = _3792;
    float _3868 = _3794;
    float _3870 = _3796;
    float _3872 = _3798;
    float _3874 = _3808;
    float _3876 = _3810;
    float _3878 = _3812;
    float _3880 = _3814;
    float _3882 = _3816;
    float _3884 = _3818;
    float _3886 = _3820;
    float _3888 = _3822;
    float _3906;
    float _3908;
    float _3910;
    float _3912;
    if (!_3856)
    {
        bool _3890 = _3852 >= 3;
        bool _3892 = !_3890;
        if (!_3892)
        {
            bool _3894 = _3852 != 3;
            _3896 = _3894;
            if (!_3896)
            {
                float _3898 = _155 + _3792;
                float _3900 = _157 + _3794;
                float _3902 = _159 + _3796;
                float _3904 = _3798 + 1.0;
                _3866 = _3898;
                _3868 = _3900;
                _3870 = _3902;
                _3872 = _3904;
                _3906 = _3800;
                _3908 = _3802;
                _3910 = _3804;
                _3912 = _3806;
                _3914 = true;
            }
        }
        else
        {
            float _3916 = _155 + _3808;
            float _3918 = _157 + _3810;
            float _3920 = _159 + _3812;
            float _3922 = _3814 + 1.0;
            _3906 = _3800;
            _3908 = _3802;
            _3910 = _3804;
            _3912 = _3806;
            _3874 = _3916;
            _3876 = _3918;
            _3878 = _3920;
            _3880 = _3922;
            _3914 = true;
        }
    }
    if ((!_3914) || _3896)
    {
        bool _3924;
        if (!_3896)
        {
            _3924 = _3852 >= 1;
        }
        if ((!_3924) || _3896)
        {
            if (!_3896)
            {
                bool _3926 = _3852 != 0;
                if (!_3926)
                {
                    float _3928 = _155 + _3800;
                    _3858 = _3928;
                }
                float _3930 = _3858;
                _3906 = _3930;
                if (!_3926)
                {
                    float _3932 = _157 + _3802;
                    _3860 = _3932;
                }
                float _3934 = _3860;
                _3908 = _3934;
                if (!_3926)
                {
                    float _3936 = _159 + _3804;
                    _3862 = _3936;
                }
                float _3938 = _3862;
                _3910 = _3938;
                if (!_3926)
                {
                    float _3940 = _3806 + 1.0;
                    _3864 = _3940;
                }
                float _3942 = _3864;
                bool _3944 = !_3926;
                _3912 = _3942;
                _3914 = _3944;
            }
            if ((!_3914) || _3896)
            {
                _3896 = false;
                _3906 = _3800;
                _3908 = _3802;
                _3910 = _3804;
                _3912 = _3806;
                _3914 = true;
            }
        }
        else
        {
            float _3946 = _155 + _3816;
            float _3948 = _157 + _3818;
            float _3950 = _159 + _3820;
            float _3952 = _3822 + 1.0;
            _3906 = _3800;
            _3908 = _3802;
            _3910 = _3804;
            _3912 = _3806;
            _3882 = _3946;
            _3884 = _3948;
            _3886 = _3950;
            _3888 = _3952;
        }
    }
    _3914 = false;
    float _3954 = _3866;
    float _3956 = _3868;
    float _3958 = _3870;
    float _3960 = _3872;
    float _3962 = _3906;
    float _3964 = _3908;
    float _3966 = _3910;
    float _3968 = _3912;
    float _3970 = _3874;
    float _3972 = _3876;
    float _3974 = _3878;
    float _3976 = _3880;
    float _3978 = _3882;
    float _3980 = _3884;
    float _3982 = _3886;
    float _3984 = _3888;
    float _3986 = -_2525;
    float _3988 = _167 + _3986;
    float _3990 = -_2529;
    float _3992 = _165 + _3990;
    float _3994 = _2539 * _3988;
    float _3996 = -_2533;
    float _3998 = _169 + _3996;
    float _4000 = fma(_2543, _3992, _3994);
    float _4002 = fma(_2547, _3998, _4000);
    float _4004 = _2575 * _4002;
    float _4006 = rint(_4004);
    float _4008 = precise::max(0.0, _4006);
    float _4010 = precise::min(_4008, 3.0);
    float _4012 = trunc(_4010);
    int _4014 = int(_4012);
    bool _4016 = _4014 >= 2;
    bool _4018 = !_4016;
    float _4020 = as_type<float>(_4014);
    float _4022 = _4006;
    float _4024 = _4000;
    float _4026 = _3994;
    float _4028 = _3954;
    float _4030 = _3956;
    float _4032 = _3958;
    float _4034 = _3960;
    float _4036 = _3970;
    float _4038 = _3972;
    float _4040 = _3974;
    float _4042 = _3976;
    float _4044 = _3978;
    float _4046 = _3980;
    float _4048 = _3982;
    float _4050 = _3984;
    float _4068;
    float _4070;
    float _4072;
    float _4074;
    if (!_4018)
    {
        bool _4052 = _4014 >= 3;
        bool _4054 = !_4052;
        if (!_4054)
        {
            bool _4056 = _4014 != 3;
            _4058 = _4056;
            if (!_4058)
            {
                float _4060 = _165 + _3954;
                float _4062 = _167 + _3956;
                float _4064 = _169 + _3958;
                float _4066 = _3960 + 1.0;
                _4028 = _4060;
                _4030 = _4062;
                _4032 = _4064;
                _4034 = _4066;
                _4068 = _3962;
                _4070 = _3964;
                _4072 = _3966;
                _4074 = _3968;
                _4076 = true;
            }
        }
        else
        {
            float _4078 = _165 + _3970;
            float _4080 = _167 + _3972;
            float _4082 = _169 + _3974;
            float _4084 = _3976 + 1.0;
            _4068 = _3962;
            _4070 = _3964;
            _4072 = _3966;
            _4074 = _3968;
            _4036 = _4078;
            _4038 = _4080;
            _4040 = _4082;
            _4042 = _4084;
            _4076 = true;
        }
    }
    if ((!_4076) || _4058)
    {
        bool _4086;
        if (!_4058)
        {
            _4086 = _4014 >= 1;
        }
        if ((!_4086) || _4058)
        {
            if (!_4058)
            {
                bool _4088 = _4014 != 0;
                if (!_4088)
                {
                    float _4090 = _165 + _3962;
                    _4020 = _4090;
                }
                float _4092 = _4020;
                _4068 = _4092;
                if (!_4088)
                {
                    float _4094 = _167 + _3964;
                    _4022 = _4094;
                }
                float _4096 = _4022;
                _4070 = _4096;
                if (!_4088)
                {
                    float _4098 = _169 + _3966;
                    _4024 = _4098;
                }
                float _4100 = _4024;
                _4072 = _4100;
                if (!_4088)
                {
                    float _4102 = _3968 + 1.0;
                    _4026 = _4102;
                }
                float _4104 = _4026;
                bool _4106 = !_4088;
                _4074 = _4104;
                _4076 = _4106;
            }
            if ((!_4076) || _4058)
            {
                _4058 = false;
                _4068 = _3962;
                _4070 = _3964;
                _4072 = _3966;
                _4074 = _3968;
                _4076 = true;
            }
        }
        else
        {
            float _4108 = _165 + _3978;
            float _4110 = _167 + _3980;
            float _4112 = _169 + _3982;
            float _4114 = _3984 + 1.0;
            _4068 = _3962;
            _4070 = _3964;
            _4072 = _3966;
            _4074 = _3968;
            _4044 = _4108;
            _4046 = _4110;
            _4048 = _4112;
            _4050 = _4114;
        }
    }
    _4076 = false;
    float _4116 = _4028;
    float _4118 = _4030;
    float _4120 = _4032;
    float _4122 = _4034;
    float _4124 = _4068;
    float _4126 = _4070;
    float _4128 = _4072;
    float _4130 = _4074;
    float _4132 = _4036;
    float _4134 = _4038;
    float _4136 = _4040;
    float _4138 = _4042;
    float _4140 = _4044;
    float _4142 = _4046;
    float _4144 = _4048;
    float _4146 = _4050;
    float _4148 = -_2525;
    float _4150 = _177 + _4148;
    float _4152 = -_2529;
    float _4154 = _175 + _4152;
    float _4156 = _2539 * _4150;
    float _4158 = -_2533;
    float _4160 = _179 + _4158;
    float _4162 = fma(_2543, _4154, _4156);
    float _4164 = fma(_2547, _4160, _4162);
    float _4166 = _2575 * _4164;
    float _4168 = rint(_4166);
    float _4170 = precise::max(0.0, _4168);
    float _4172 = precise::min(_4170, 3.0);
    float _4174 = trunc(_4172);
    int _4176 = int(_4174);
    bool _4178 = _4176 >= 2;
    bool _4180 = !_4178;
    float _4182 = _4168;
    float _4184 = as_type<float>(_4176);
    float _4186 = _4156;
    float _4188 = _4162;
    float _4190 = _4116;
    float _4192 = _4118;
    float _4194 = _4120;
    float _4196 = _4122;
    float _4198 = _4132;
    float _4200 = _4134;
    float _4202 = _4136;
    float _4204 = _4138;
    float _4206 = _4140;
    float _4208 = _4142;
    float _4210 = _4144;
    float _4212 = _4146;
    float _4230;
    float _4232;
    float _4234;
    float _4236;
    if (!_4180)
    {
        bool _4214 = _4176 >= 3;
        bool _4216 = !_4214;
        if (!_4216)
        {
            bool _4218 = _4176 != 3;
            _4220 = _4218;
            if (!_4220)
            {
                float _4222 = _175 + _4116;
                float _4224 = _177 + _4118;
                float _4226 = _179 + _4120;
                float _4228 = _4122 + 1.0;
                _4190 = _4222;
                _4192 = _4224;
                _4194 = _4226;
                _4196 = _4228;
                _4230 = _4124;
                _4232 = _4126;
                _4234 = _4128;
                _4236 = _4130;
                _4238 = true;
            }
        }
        else
        {
            float _4240 = _175 + _4132;
            float _4242 = _177 + _4134;
            float _4244 = _179 + _4136;
            float _4246 = _4138 + 1.0;
            _4230 = _4124;
            _4232 = _4126;
            _4234 = _4128;
            _4236 = _4130;
            _4198 = _4240;
            _4200 = _4242;
            _4202 = _4244;
            _4204 = _4246;
            _4238 = true;
        }
    }
    if ((!_4238) || _4220)
    {
        bool _4248;
        if (!_4220)
        {
            _4248 = _4176 >= 1;
        }
        if ((!_4248) || _4220)
        {
            if (!_4220)
            {
                bool _4250 = _4176 != 0;
                if (!_4250)
                {
                    float _4252 = _175 + _4124;
                    _4182 = _4252;
                }
                float _4254 = _4182;
                _4230 = _4254;
                if (!_4250)
                {
                    float _4256 = _177 + _4126;
                    _4184 = _4256;
                }
                float _4258 = _4184;
                _4232 = _4258;
                if (!_4250)
                {
                    float _4260 = _179 + _4128;
                    _4186 = _4260;
                }
                float _4262 = _4186;
                _4234 = _4262;
                if (!_4250)
                {
                    float _4264 = _4130 + 1.0;
                    _4188 = _4264;
                }
                float _4266 = _4188;
                bool _4268 = !_4250;
                _4236 = _4266;
                _4238 = _4268;
            }
            if ((!_4238) || _4220)
            {
                _4220 = false;
                _4230 = _4124;
                _4232 = _4126;
                _4234 = _4128;
                _4236 = _4130;
                _4238 = true;
            }
        }
        else
        {
            float _4270 = _175 + _4140;
            float _4272 = _177 + _4142;
            float _4274 = _179 + _4144;
            float _4276 = _4146 + 1.0;
            _4230 = _4124;
            _4232 = _4126;
            _4234 = _4128;
            _4236 = _4130;
            _4206 = _4270;
            _4208 = _4272;
            _4210 = _4274;
            _4212 = _4276;
        }
    }
    _4238 = false;
    float _4278 = _4190;
    float _4280 = _4192;
    float _4282 = _4194;
    float _4284 = _4196;
    float _4286 = _4230;
    float _4288 = _4232;
    float _4290 = _4234;
    float _4292 = _4236;
    float _4294 = _4198;
    float _4296 = _4200;
    float _4298 = _4202;
    float _4300 = _4204;
    float _4302 = _4206;
    float _4304 = _4208;
    float _4306 = _4210;
    float _4308 = _4212;
    float _4310 = -_2525;
    float _4312 = _187 + _4310;
    float _4314 = -_2529;
    float _4316 = _185 + _4314;
    float _4318 = _2539 * _4312;
    float _4320 = -_2533;
    float _4322 = _189 + _4320;
    float _4324 = fma(_2543, _4316, _4318);
    float _4326 = fma(_2547, _4322, _4324);
    float _4328 = _2575 * _4326;
    float _4330 = rint(_4328);
    float _4332 = precise::max(0.0, _4330);
    float _4334 = precise::min(_4332, 3.0);
    float _4336 = trunc(_4334);
    int _4338 = int(_4336);
    bool _4340 = _4338 >= 2;
    bool _4342 = !_4340;
    float _4344 = as_type<float>(_4338);
    float _4346 = _4330;
    float _4348 = _4324;
    float _4350 = _4318;
    float _4352 = _4278;
    float _4354 = _4280;
    float _4356 = _4282;
    float _4358 = _4284;
    float _4360 = _4294;
    float _4362 = _4296;
    float _4364 = _4298;
    float _4366 = _4300;
    float _4368 = _4302;
    float _4370 = _4304;
    float _4372 = _4306;
    float _4374 = _4308;
    float _4392;
    float _4394;
    float _4396;
    float _4398;
    if (!_4342)
    {
        bool _4376 = _4338 >= 3;
        bool _4378 = !_4376;
        if (!_4378)
        {
            bool _4380 = _4338 != 3;
            _4382 = _4380;
            if (!_4382)
            {
                float _4384 = _185 + _4278;
                float _4386 = _187 + _4280;
                float _4388 = _189 + _4282;
                float _4390 = _4284 + 1.0;
                _4352 = _4384;
                _4354 = _4386;
                _4356 = _4388;
                _4358 = _4390;
                _4392 = _4286;
                _4394 = _4288;
                _4396 = _4290;
                _4398 = _4292;
                _4400 = true;
            }
        }
        else
        {
            float _4402 = _185 + _4294;
            float _4404 = _187 + _4296;
            float _4406 = _189 + _4298;
            float _4408 = _4300 + 1.0;
            _4392 = _4286;
            _4394 = _4288;
            _4396 = _4290;
            _4398 = _4292;
            _4360 = _4402;
            _4362 = _4404;
            _4364 = _4406;
            _4366 = _4408;
            _4400 = true;
        }
    }
    if ((!_4400) || _4382)
    {
        bool _4410;
        if (!_4382)
        {
            _4410 = _4338 >= 1;
        }
        if ((!_4410) || _4382)
        {
            if (!_4382)
            {
                bool _4412 = _4338 != 0;
                if (!_4412)
                {
                    float _4414 = _185 + _4286;
                    _4344 = _4414;
                }
                float _4416 = _4344;
                _4392 = _4416;
                if (!_4412)
                {
                    float _4418 = _187 + _4288;
                    _4346 = _4418;
                }
                float _4420 = _4346;
                _4394 = _4420;
                if (!_4412)
                {
                    float _4422 = _189 + _4290;
                    _4348 = _4422;
                }
                float _4424 = _4348;
                _4396 = _4424;
                if (!_4412)
                {
                    float _4426 = _4292 + 1.0;
                    _4350 = _4426;
                }
                float _4428 = _4350;
                bool _4430 = !_4412;
                _4398 = _4428;
                _4400 = _4430;
            }
            if ((!_4400) || _4382)
            {
                _4382 = false;
                _4392 = _4286;
                _4394 = _4288;
                _4396 = _4290;
                _4398 = _4292;
                _4400 = true;
            }
        }
        else
        {
            float _4432 = _185 + _4302;
            float _4434 = _187 + _4304;
            float _4436 = _189 + _4306;
            float _4438 = _4308 + 1.0;
            _4392 = _4286;
            _4394 = _4288;
            _4396 = _4290;
            _4398 = _4292;
            _4368 = _4432;
            _4370 = _4434;
            _4372 = _4436;
            _4374 = _4438;
        }
    }
    _4400 = false;
    float _4440 = _4352;
    float _4442 = _4354;
    float _4444 = _4356;
    float _4446 = _4358;
    float _4448 = _4392;
    float _4450 = _4394;
    float _4452 = _4396;
    float _4454 = _4398;
    float _4456 = _4360;
    float _4458 = _4362;
    float _4460 = _4364;
    float _4462 = _4366;
    float _4464 = _4368;
    float _4466 = _4370;
    float _4468 = _4372;
    float _4470 = _4374;
    float _4472 = -_2525;
    float _4474 = _197 + _4472;
    float _4476 = -_2529;
    float _4478 = _195 + _4476;
    float _4480 = _2539 * _4474;
    float _4482 = -_2533;
    float _4484 = _199 + _4482;
    float _4486 = fma(_2543, _4478, _4480);
    float _4488 = fma(_2547, _4484, _4486);
    float _4490 = _2575 * _4488;
    float _4492 = rint(_4490);
    float _4494 = precise::max(0.0, _4492);
    float _4496 = precise::min(_4494, 3.0);
    float _4498 = trunc(_4496);
    int _4500 = int(_4498);
    bool _4502 = _4500 >= 2;
    bool _4504 = !_4502;
    float _4506 = _4492;
    float _4508 = as_type<float>(_4500);
    float _4510 = _4480;
    float _4512 = _4486;
    float _4514 = _4440;
    float _4516 = _4442;
    float _4518 = _4444;
    float _4520 = _4446;
    float _4522 = _4456;
    float _4524 = _4458;
    float _4526 = _4460;
    float _4528 = _4462;
    float _4530 = _4464;
    float _4532 = _4466;
    float _4534 = _4468;
    float _4536 = _4470;
    float _4554;
    float _4556;
    float _4558;
    float _4560;
    if (!_4504)
    {
        bool _4538 = _4500 >= 3;
        bool _4540 = !_4538;
        if (!_4540)
        {
            bool _4542 = _4500 != 3;
            _4544 = _4542;
            if (!_4544)
            {
                float _4546 = _195 + _4440;
                float _4548 = _197 + _4442;
                float _4550 = _199 + _4444;
                float _4552 = _4446 + 1.0;
                _4514 = _4546;
                _4516 = _4548;
                _4518 = _4550;
                _4520 = _4552;
                _4554 = _4448;
                _4556 = _4450;
                _4558 = _4452;
                _4560 = _4454;
                _4562 = true;
            }
        }
        else
        {
            float _4564 = _195 + _4456;
            float _4566 = _197 + _4458;
            float _4568 = _199 + _4460;
            float _4570 = _4462 + 1.0;
            _4554 = _4448;
            _4556 = _4450;
            _4558 = _4452;
            _4560 = _4454;
            _4522 = _4564;
            _4524 = _4566;
            _4526 = _4568;
            _4528 = _4570;
            _4562 = true;
        }
    }
    if ((!_4562) || _4544)
    {
        bool _4572;
        if (!_4544)
        {
            _4572 = _4500 >= 1;
        }
        if ((!_4572) || _4544)
        {
            if (!_4544)
            {
                bool _4574 = _4500 != 0;
                if (!_4574)
                {
                    float _4576 = _195 + _4448;
                    _4506 = _4576;
                }
                float _4578 = _4506;
                _4554 = _4578;
                if (!_4574)
                {
                    float _4580 = _197 + _4450;
                    _4508 = _4580;
                }
                float _4582 = _4508;
                _4556 = _4582;
                if (!_4574)
                {
                    float _4584 = _199 + _4452;
                    _4510 = _4584;
                }
                float _4586 = _4510;
                _4558 = _4586;
                if (!_4574)
                {
                    float _4588 = _4454 + 1.0;
                    _4512 = _4588;
                }
                float _4590 = _4512;
                bool _4592 = !_4574;
                _4560 = _4590;
                _4562 = _4592;
            }
            if ((!_4562) || _4544)
            {
                _4544 = false;
                _4554 = _4448;
                _4556 = _4450;
                _4558 = _4452;
                _4560 = _4454;
                _4562 = true;
            }
        }
        else
        {
            float _4594 = _195 + _4464;
            float _4596 = _197 + _4466;
            float _4598 = _199 + _4468;
            float _4600 = _4470 + 1.0;
            _4554 = _4448;
            _4556 = _4450;
            _4558 = _4452;
            _4560 = _4454;
            _4530 = _4594;
            _4532 = _4596;
            _4534 = _4598;
            _4536 = _4600;
        }
    }
    _4562 = false;
    float _4602 = _4514;
    float _4604 = _4516;
    float _4606 = _4518;
    float _4608 = _4520;
    float _4610 = _4554;
    float _4612 = _4556;
    float _4614 = _4558;
    float _4616 = _4560;
    float _4618 = _4522;
    float _4620 = _4524;
    float _4622 = _4526;
    float _4624 = _4528;
    float _4626 = _4530;
    float _4628 = _4532;
    float _4630 = _4534;
    float _4632 = _4536;
    float _4634 = -_2525;
    float _4636 = _207 + _4634;
    float _4638 = -_2529;
    float _4640 = _205 + _4638;
    float _4642 = _2539 * _4636;
    float _4644 = -_2533;
    float _4646 = _209 + _4644;
    float _4648 = fma(_2543, _4640, _4642);
    float _4650 = fma(_2547, _4646, _4648);
    float _4652 = _2575 * _4650;
    float _4654 = rint(_4652);
    float _4656 = precise::max(0.0, _4654);
    float _4658 = precise::min(_4656, 3.0);
    float _4660 = trunc(_4658);
    int _4662 = int(_4660);
    bool _4664 = _4662 >= 2;
    bool _4666 = !_4664;
    float _4668 = as_type<float>(_4662);
    float _4670 = _4654;
    float _4672 = _4648;
    float _4674 = _4642;
    float _4676 = _4602;
    float _4678 = _4604;
    float _4680 = _4606;
    float _4682 = _4608;
    float _4684 = _4618;
    float _4686 = _4620;
    float _4688 = _4622;
    float _4690 = _4624;
    float _4692 = _4626;
    float _4694 = _4628;
    float _4696 = _4630;
    float _4698 = _4632;
    float _4716;
    float _4718;
    float _4720;
    float _4722;
    if (!_4666)
    {
        bool _4700 = _4662 >= 3;
        bool _4702 = !_4700;
        if (!_4702)
        {
            bool _4704 = _4662 != 3;
            _4706 = _4704;
            if (!_4706)
            {
                float _4708 = _205 + _4602;
                float _4710 = _207 + _4604;
                float _4712 = _209 + _4606;
                float _4714 = _4608 + 1.0;
                _4676 = _4708;
                _4678 = _4710;
                _4680 = _4712;
                _4682 = _4714;
                _4716 = _4610;
                _4718 = _4612;
                _4720 = _4614;
                _4722 = _4616;
                _4724 = true;
            }
        }
        else
        {
            float _4726 = _205 + _4618;
            float _4728 = _207 + _4620;
            float _4730 = _209 + _4622;
            float _4732 = _4624 + 1.0;
            _4716 = _4610;
            _4718 = _4612;
            _4720 = _4614;
            _4722 = _4616;
            _4684 = _4726;
            _4686 = _4728;
            _4688 = _4730;
            _4690 = _4732;
            _4724 = true;
        }
    }
    if ((!_4724) || _4706)
    {
        bool _4734;
        if (!_4706)
        {
            _4734 = _4662 >= 1;
        }
        if ((!_4734) || _4706)
        {
            if (!_4706)
            {
                bool _4736 = _4662 != 0;
                if (!_4736)
                {
                    float _4738 = _205 + _4610;
                    _4668 = _4738;
                }
                float _4740 = _4668;
                _4716 = _4740;
                if (!_4736)
                {
                    float _4742 = _207 + _4612;
                    _4670 = _4742;
                }
                float _4744 = _4670;
                _4718 = _4744;
                if (!_4736)
                {
                    float _4746 = _209 + _4614;
                    _4672 = _4746;
                }
                float _4748 = _4672;
                _4720 = _4748;
                if (!_4736)
                {
                    float _4750 = _4616 + 1.0;
                    _4674 = _4750;
                }
                float _4752 = _4674;
                bool _4754 = !_4736;
                _4722 = _4752;
                _4724 = _4754;
            }
            if ((!_4724) || _4706)
            {
                _4706 = false;
                _4716 = _4610;
                _4718 = _4612;
                _4720 = _4614;
                _4722 = _4616;
                _4724 = true;
            }
        }
        else
        {
            float _4756 = _205 + _4626;
            float _4758 = _207 + _4628;
            float _4760 = _209 + _4630;
            float _4762 = _4632 + 1.0;
            _4716 = _4610;
            _4718 = _4612;
            _4720 = _4614;
            _4722 = _4616;
            _4692 = _4756;
            _4694 = _4758;
            _4696 = _4760;
            _4698 = _4762;
        }
    }
    _4724 = false;
    float _4764 = _4676;
    float _4766 = _4678;
    float _4768 = _4680;
    float _4770 = _4682;
    float _4772 = _4716;
    float _4774 = _4718;
    float _4776 = _4720;
    float _4778 = _4722;
    float _4780 = _4684;
    float _4782 = _4686;
    float _4784 = _4688;
    float _4786 = _4690;
    float _4788 = _4692;
    float _4790 = _4694;
    float _4792 = _4696;
    float _4794 = _4698;
    float _4796 = -_2525;
    float _4798 = _217 + _4796;
    float _4800 = -_2529;
    float _4802 = _215 + _4800;
    float _4804 = _2539 * _4798;
    float _4806 = -_2533;
    float _4808 = _219 + _4806;
    float _4810 = fma(_2543, _4802, _4804);
    float _4812 = fma(_2547, _4808, _4810);
    float _4814 = _2575 * _4812;
    float _4816 = rint(_4814);
    float _4818 = precise::max(0.0, _4816);
    float _4820 = precise::min(_4818, 3.0);
    float _4822 = trunc(_4820);
    int _4824 = int(_4822);
    bool _4826 = _4824 >= 2;
    bool _4828 = !_4826;
    float _4830 = _4816;
    float _4832 = as_type<float>(_4824);
    float _4834 = _4804;
    float _4836 = _4810;
    float _4838 = _4764;
    float _4840 = _4766;
    float _4842 = _4768;
    float _4844 = _4770;
    float _4846 = _4780;
    float _4848 = _4782;
    float _4850 = _4784;
    float _4852 = _4786;
    float _4854 = _4788;
    float _4856 = _4790;
    float _4858 = _4792;
    float _4860 = _4794;
    float _4878;
    float _4880;
    float _4882;
    float _4884;
    if (!_4828)
    {
        bool _4862 = _4824 >= 3;
        bool _4864 = !_4862;
        if (!_4864)
        {
            bool _4866 = _4824 != 3;
            _4868 = _4866;
            if (!_4868)
            {
                float _4870 = _215 + _4764;
                float _4872 = _217 + _4766;
                float _4874 = _219 + _4768;
                float _4876 = _4770 + 1.0;
                _4838 = _4870;
                _4840 = _4872;
                _4842 = _4874;
                _4844 = _4876;
                _4878 = _4772;
                _4880 = _4774;
                _4882 = _4776;
                _4884 = _4778;
                _4886 = true;
            }
        }
        else
        {
            float _4888 = _215 + _4780;
            float _4890 = _217 + _4782;
            float _4892 = _219 + _4784;
            float _4894 = _4786 + 1.0;
            _4878 = _4772;
            _4880 = _4774;
            _4882 = _4776;
            _4884 = _4778;
            _4846 = _4888;
            _4848 = _4890;
            _4850 = _4892;
            _4852 = _4894;
            _4886 = true;
        }
    }
    if ((!_4886) || _4868)
    {
        bool _4896;
        if (!_4868)
        {
            _4896 = _4824 >= 1;
        }
        if ((!_4896) || _4868)
        {
            if (!_4868)
            {
                bool _4898 = _4824 != 0;
                if (!_4898)
                {
                    float _4900 = _215 + _4772;
                    _4830 = _4900;
                }
                float _4902 = _4830;
                _4878 = _4902;
                if (!_4898)
                {
                    float _4904 = _217 + _4774;
                    _4832 = _4904;
                }
                float _4906 = _4832;
                _4880 = _4906;
                if (!_4898)
                {
                    float _4908 = _219 + _4776;
                    _4834 = _4908;
                }
                float _4910 = _4834;
                _4882 = _4910;
                if (!_4898)
                {
                    float _4912 = _4778 + 1.0;
                    _4836 = _4912;
                }
                float _4914 = _4836;
                bool _4916 = !_4898;
                _4884 = _4914;
                _4886 = _4916;
            }
            if ((!_4886) || _4868)
            {
                _4868 = false;
                _4878 = _4772;
                _4880 = _4774;
                _4882 = _4776;
                _4884 = _4778;
                _4886 = true;
            }
        }
        else
        {
            float _4918 = _215 + _4788;
            float _4920 = _217 + _4790;
            float _4922 = _219 + _4792;
            float _4924 = _4794 + 1.0;
            _4878 = _4772;
            _4880 = _4774;
            _4882 = _4776;
            _4884 = _4778;
            _4854 = _4918;
            _4856 = _4920;
            _4858 = _4922;
            _4860 = _4924;
        }
    }
    _4886 = false;
    float _4926 = _4838;
    float _4928 = _4840;
    float _4930 = _4842;
    float _4932 = _4844;
    float _4934 = _4878;
    float _4936 = _4880;
    float _4938 = _4882;
    float _4940 = _4884;
    float _4942 = _4846;
    float _4944 = _4848;
    float _4946 = _4850;
    float _4948 = _4852;
    float _4950 = _4854;
    float _4952 = _4856;
    float _4954 = _4858;
    float _4956 = _4860;
    float _4958 = -_2525;
    float _4960 = _227 + _4958;
    float _4962 = -_2529;
    float _4964 = _225 + _4962;
    float _4966 = _2539 * _4960;
    float _4968 = -_2533;
    float _4970 = _229 + _4968;
    float _4972 = fma(_2543, _4964, _4966);
    float _4974 = fma(_2547, _4970, _4972);
    float _4976 = _2575 * _4974;
    float _4978 = rint(_4976);
    float _4980 = precise::max(0.0, _4978);
    float _4982 = precise::min(_4980, 3.0);
    float _4984 = trunc(_4982);
    int _4986 = int(_4984);
    bool _4988 = _4986 >= 2;
    bool _4990 = !_4988;
    float _4992 = as_type<float>(_4986);
    float _4994 = _4978;
    float _4996 = _4972;
    float _4998 = _4966;
    float _5000 = _4942;
    float _5002 = _4944;
    float _5004 = _4950;
    float _5006 = _4952;
    float _5008 = _4956;
    float _5010 = _4948;
    float _5012 = _4932;
    float _5014 = _4954;
    float _5016 = _4946;
    float _5018 = _4926;
    float _5020 = _4928;
    float _5022 = _4930;
    float _5040;
    float _5042;
    float _5044;
    float _5046;
    if (!_4990)
    {
        bool _5024 = _4986 >= 3;
        bool _5026 = !_5024;
        if (!_5026)
        {
            bool _5028 = _4986 != 3;
            _5030 = _5028;
            if (!_5030)
            {
                float _5032 = _225 + _4926;
                float _5034 = _227 + _4928;
                float _5036 = _229 + _4930;
                float _5038 = _4932 + 1.0;
                _5040 = _4934;
                _5042 = _4940;
                _5012 = _5038;
                _5044 = _4936;
                _5046 = _4938;
                _5018 = _5032;
                _5020 = _5034;
                _5022 = _5036;
                _5048 = true;
            }
        }
        else
        {
            float _5050 = _225 + _4942;
            float _5052 = _227 + _4944;
            float _5054 = _229 + _4946;
            float _5056 = _4948 + 1.0;
            _5000 = _5050;
            _5002 = _5052;
            _5010 = _5056;
            _5040 = _4934;
            _5042 = _4940;
            _5044 = _4936;
            _5016 = _5054;
            _5046 = _4938;
            _5048 = true;
        }
    }
    if ((!_5048) || _5030)
    {
        bool _5058;
        if (!_5030)
        {
            _5058 = _4986 >= 1;
        }
        if ((!_5058) || _5030)
        {
            if (!_5030)
            {
                bool _5060 = _4986 != 0;
                if (!_5060)
                {
                    float _5062 = _225 + _4934;
                    _4992 = _5062;
                }
                float _5064 = _4992;
                _5040 = _5064;
                if (!_5060)
                {
                    float _5066 = _227 + _4936;
                    _4994 = _5066;
                }
                float _5068 = _4994;
                _5044 = _5068;
                if (!_5060)
                {
                    float _5070 = _229 + _4938;
                    _4996 = _5070;
                }
                float _5072 = _4996;
                _5046 = _5072;
                if (!_5060)
                {
                    float _5074 = _4940 + 1.0;
                    _4998 = _5074;
                }
                float _5076 = _4998;
                bool _5078 = !_5060;
                _5042 = _5076;
                _5048 = _5078;
            }
            if ((!_5048) || _5030)
            {
                _5030 = false;
                _5040 = _4934;
                _5042 = _4940;
                _5044 = _4936;
                _5046 = _4938;
                _5048 = true;
            }
        }
        else
        {
            float _5080 = _225 + _4950;
            float _5082 = _227 + _4952;
            float _5084 = _229 + _4954;
            float _5086 = _4956 + 1.0;
            _5004 = _5080;
            _5006 = _5082;
            _5008 = _5086;
            _5040 = _4934;
            _5042 = _4940;
            _5044 = _4936;
            _5014 = _5084;
            _5046 = _4938;
        }
    }
    _5048 = false;
    float _5088 = _5000;
    float _5090 = _5002;
    float _5092 = _5004;
    float _5094 = _5006;
    float _5096 = _5008;
    float _5098 = _5010;
    float _5100 = _5040;
    float _5102 = _5042;
    float _5104 = _5012;
    float _5106 = _5044;
    float _5108 = _5014;
    float _5110 = _5016;
    float _5112 = _5046;
    float _5114 = _5018;
    float _5116 = _5020;
    float _5118 = _5022;
    float _5120 = _5088 * 6.0;
    float _5122 = _5090 * 6.0;
    float _5124 = _5092 * 6.0;
    float _5126 = _5094 * 6.0;
    float _5128 = fma(_5092, 3.0, _5120);
    float _5130 = fma(_5094, 3.0, _5122);
    float _5132 = _5096 * 4.0;
    float _5134 = fma(_5098, 4.0, _5096);
    _24[1] = as_type<uint>(_185);
    float _5136 = fma(_5100, 9.0, _5124);
    float _5138 = fma(_5102, 9.0, _5132);
    float _5140 = fma(_5104, 9.0, _5134);
    _24[0] = as_type<uint>(_189);
    float _5142 = precise::max(_141, _151);
    float _5144 = fma(_5106, 9.0, _5126);
    float _5146 = precise::max(_181, _191);
    float _5148 = _5108 * 6.0;
    float _5150 = precise::max(_121, _131);
    float _5152 = _5110 * 6.0;
    float _5154 = _5098 + _5096;
    float _5156 = precise::max(_161, _171);
    float _5158 = fma(_5112, 9.0, _5148);
    float _5160 = precise::max(_5150, _5142);
    float _5162 = fma(_5108, 3.0, _5152);
    float _5164 = precise::max(_5156, _5146);
    float _5166 = as_type<float>(_24[1]);
    float _5168 = precise::max(_91, _81);
    float _5170 = _5138 + _5098;
    float _5172 = precise::max(_101, _111);
    float _5174 = as_type<float>(_24[0]);
    float _5176 = precise::max(_201, _211);
    float _5178 = _5170 * _5140;
    float _5180 = precise::max(_5168, _5172);
    float _5182 = _5154 * 2.0;
    float _5184 = precise::max(_221, _231);
    float _5186 = -_5178;
    float _5188 = fma(_5182, _5182, _5186);
    bool _5190 = _5188 != 0.0;
    bool _5192 = isnan(_5188);
    bool _5194 = _5190 || _5192;
    bool _5196 = isnan(0.0);
    bool _5198 = _5194 || _5196;
    float _5200 = precise::max(_5176, _5184);
    float _5202 = precise::max(_5180, _5160);
    float _5204 = precise::max(_5164, _5200);
    float _5206 = fma(_5088, 3.0, _5136);
    float _5208 = fma(_5110, 3.0, _5158);
    float _5210 = fma(_5090, 3.0, _5144);
    float _5212 = fma(_5114, 9.0, _5128);
    float _5214 = fma(_5116, 9.0, _5130);
    float _5216 = fma(_5118, 9.0, _5162);
    float _5218 = precise::max(_5202, _5204);
    bool _5220 = !_5198;
    if (!_5220)
    {
        float _5222 = 1.0 / _5188;
        float _5224 = _5170 * _5212;
        float _5226 = _5206 * _5140;
        float _5228 = -_5224;
        float _5230 = fma(_5206, _5182, _5228);
        float _5232 = -_5226;
        float _5234 = fma(_5212, _5182, _5232);
        float _5236 = _5170 * _5214;
        float _5238 = _5210 * _5140;
        float _5240 = _5170 * _5216;
        float _5242 = _5208 * _5140;
        float _5244 = -_5236;
        float _5246 = fma(_5210, _5182, _5244);
        float _5248 = -_5238;
        float _5250 = fma(_5214, _5182, _5248);
        float _5252 = -_5240;
        float _5254 = fma(_5208, _5182, _5252);
        float _5256 = -_5242;
        float _5258 = fma(_5216, _5182, _5256);
        float _5260 = _5250 * _5222;
        float _5262 = _5230 * _5222;
        float _5264 = _5246 * _5222;
        float _5266 = _5254 * _5222;
        float _5268 = _5234 * _5222;
        float _5270 = _5258 * _5222;
        float _5272 = -_5260;
        float _5274 = _5264 + _5272;
        float _5276 = -_5268;
        float _5278 = _5262 + _5276;
        float _5280 = -_5270;
        float _5282 = _5266 + _5280;
        _2594 = _5278;
        _2596 = _5274;
        _2598 = _5282;
        _2600 = _5268;
        _2602 = _5262;
        _2604 = _5260;
        _2606 = _5264;
        _2608 = _5270;
        _2610 = _5266;
    }
    float _5284 = _2594;
    float _5286 = _2596;
    float _5288 = _2598;
    float _5290 = _2600;
    float _5292 = _2602;
    float _5294 = _2604;
    float _5296 = _2606;
    float _5298 = _2608;
    float _5300 = _2610;
    float _5302 = fma(_5284, 496.0, 0.5);
    float _5304 = precise::clamp(_5302, 0.0, 1.0);
    float _5306 = fma(_5286, 1008.0, 0.5);
    float _5308 = precise::clamp(_5306, 0.0, 1.0);
    float _5310 = fma(_5284, -31.0, 1.0);
    float _5312 = precise::clamp(_5310, 0.0, 1.0);
    float _5314 = fma(_5288, 496.0, 0.5);
    float _5316 = precise::clamp(_5314, 0.0, 1.0);
    float _5318 = _5304 + (-0.5);
    float _5320 = fma(_5286, -63.0, 1.0);
    float _5322 = precise::clamp(_5320, 0.0, 1.0);
    float _5324 = _5308 + (-0.5);
    float _5326 = fma(_5288, -31.0, 1.0);
    float _5328 = precise::clamp(_5326, 0.0, 1.0);
    float _5330 = _5312 * _5318;
    float _5332 = _5316 + (-0.5);
    float _5334 = _5322 * _5324;
    float _5336 = _5334 * 2.0;
    float _5338 = _5218 * 255.0;
    float _5340 = fma(_5330, -0.0322580635547637939453125, _5290);
    float _5342 = precise::clamp(_5340, 0.0, 1.0);
    float _5344 = _5328 * _5332;
    float _5346 = fma(_5330, 0.0322580635547637939453125, _5292);
    float _5348 = precise::clamp(_5346, 0.0, 1.0);
    float _5350 = fma(_5336, -0.01587301678955554962158203125, _5294);
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = fma(_5336, 0.01587301678955554962158203125, _5296);
    float _5356 = precise::clamp(_5354, 0.0, 1.0);
    float _5358 = fma(_5344, -0.0322580635547637939453125, _5298);
    float _5360 = precise::clamp(_5358, 0.0, 1.0);
    float _5362 = _5348 * 31.0;
    float _5364 = fma(_5344, 0.0322580635547637939453125, _5300);
    float _5366 = precise::clamp(_5364, 0.0, 1.0);
    float _5368 = _5342 * 31.0;
    float _5370 = _5352 * 63.0;
    float _5372 = _5356 * 63.0;
    float _5374 = _5360 * 31.0;
    float _5376 = _5366 * 31.0;
    float _5378 = trunc(_5338);
    float _5380 = precise::max(_5378, 0.0);
    uint _5383 = uint(_5380);
    float _5385 = precise::min(_91, _81);
    float _5387 = precise::min(_121, _131);
    float _5389 = precise::min(_161, _171);
    float _5391 = precise::min(_181, _191);
    float _5393 = rint(_5362);
    float _5395 = precise::min(_201, _211);
    float _5397 = precise::min(_221, _231);
    float _5399 = precise::min(_5389, _5391);
    float _5401 = precise::min(_5395, _5397);
    float _5403 = rint(_5372);
    float _5405 = precise::min(_5399, _5401);
    float _5407 = rint(_5368);
    float _5409 = _5393 + 0.5;
    float _5411 = rint(_5370);
    float _5413 = _5403 + 0.5;
    float _5415 = rint(_5374);
    float _5417 = _5407 + 0.5;
    float _5419 = rint(_5376);
    float _5421 = precise::min(_101, _111);
    float _5423 = precise::min(_5385, _5421);
    float _5425 = precise::min(_141, _151);
    float _5427 = trunc(_5409);
    float _5429 = precise::max(_5427, 0.0);
    uint _5431 = uint(_5429);
    float _5433 = precise::min(_5387, _5425);
    float _5435 = _5411 + 0.5;
    float _5437 = precise::min(_5423, _5433);
    float _5439 = _5419 + 0.5;
    float _5441 = trunc(_5413);
    float _5443 = precise::max(_5441, 0.0);
    uint _5445 = uint(_5443);
    float _5447 = precise::min(_5437, _5405);
    float _5449 = _5415 + 0.5;
    float _5451 = _5447 * 255.0;
    float _5453 = trunc(_5417);
    float _5455 = precise::max(_5453, 0.0);
    uint _5457 = uint(_5455);
    int _5459 = int(_5431) << 11;
    float _5461 = trunc(_5435);
    float _5463 = precise::max(_5461, 0.0);
    uint _5465 = uint(_5463);
    int _5467 = int(_5445) << 5;
    float _5469 = trunc(_5439);
    float _5471 = precise::max(_5469, 0.0);
    uint _5473 = uint(_5471);
    int _5475 = int(_5457) << 11;
    float _5477 = trunc(_5449);
    float _5479 = precise::max(_5477, 0.0);
    uint _5481 = uint(_5479);
    int _5483 = int(_5465) << 5;
    float _5485 = trunc(_5451);
    float _5487 = precise::max(_5485, 0.0);
    uint _5489 = uint(_5487);
    int _5491 = _5459 | _5467;
    int _5493 = int(_5473) | _5491;
    int _5495 = _5475 | _5483;
    int _5497 = int(_5481) | _5495;
    bool _5499 = _5493 != _5497;
    bool _5501 = _5383 > _5489;
    int _5503 = int(_5489) << 8;
    int _5505 = _5503 & 65280;
    int _5507 = int(_5465);
    int _5509 = _5503;
    int _5511 = _5467;
    int _5513 = _5505;
    int _5515 = as_type<int>(_5407);
    int _5517 = _5493;
    int _5519 = _5497;
    if (!_5499)
    {
        _5507 = _5493;
    }
    int _5521 = _5507;
    int _5523 = 255 & int(_5383);
    int _5525 = _5505 | _5523;
    int _5527 = _5521;
    if (!_5501)
    {
        _5509 = 0;
    }
    int _5529 = _5509;
    int _5531 = _5529;
    if (!_5499)
    {
        _5511 = 0;
    }
    int _5533 = _5511;
    int _5535 = _5533;
    if (!_5499)
    {
        _5513 = 0;
    }
    int _5537 = _5513;
    bool _5539 = !_5499;
    int _5541 = _5537;
    if (!_5539)
    {
        float _5543 = _5407 * 0.0322580635547637939453125;
        float _5545 = _5403 * 0.01587301678955554962158203125;
        float _5547 = _5411 * 0.01587301678955554962158203125;
        bool _5549 = uint(_5493) >= uint(_5497);
        float _5551 = _5393 * 0.0322580635547637939453125;
        float _5553 = _5419 * 0.0322580635547637939453125;
        float _5555 = _5415 * 0.0322580635547637939453125;
        bool _5557 = !_5549;
        float _5559 = _5557 ? _5545 : _5547;
        bool _5561 = !_5549;
        float _5563 = _5561 ? _5547 : _5545;
        bool _5565 = !_5549;
        float _5567 = _5565 ? _5551 : _5543;
        float _5569 = -_5559;
        float _5571 = _147 + _5569;
        bool _5573 = !_5549;
        float _5575 = _5573 ? _5543 : _5551;
        float _5577 = -_5559;
        float _5579 = _5577 + _5563;
        bool _5581 = !_5549;
        float _5583 = _5581 ? _5553 : _5555;
        float _5585 = -_5567;
        float _5587 = _145 + _5585;
        bool _5589 = !_5549;
        float _5591 = _5589 ? _5555 : _5553;
        float _5593 = -_5567;
        float _5595 = _5593 + _5575;
        float _5597 = -_5567;
        float _5599 = _135 + _5597;
        float _5601 = -_5567;
        float _5603 = _125 + _5601;
        float _5605 = -_5567;
        float _5607 = _115 + _5605;
        float _5609 = -_5567;
        float _5611 = _105 + _5609;
        float _5613 = -_5567;
        float _5615 = _95 + _5613;
        float _5617 = -_5567;
        float _5619 = _75 + _5617;
        float _5621 = -_5567;
        float _5623 = _85 + _5621;
        float _5625 = -_5567;
        float _5627 = _225 + _5625;
        float _5629 = -_5567;
        float _5631 = _215 + _5629;
        float _5633 = -_5567;
        float _5635 = _205 + _5633;
        float _5637 = -_5567;
        float _5639 = _195 + _5637;
        float _5641 = -_5567;
        float _5643 = _5166 + _5641;
        float _5645 = -_5567;
        float _5647 = _175 + _5645;
        float _5649 = -_5567;
        float _5651 = _165 + _5649;
        float _5653 = -_5567;
        float _5655 = _155 + _5653;
        float _5657 = _5579 * _5579;
        float _5659 = -_5583;
        float _5661 = _5659 + _5591;
        float _5663 = -_5559;
        float _5665 = _137 + _5663;
        float _5667 = -_5583;
        float _5669 = _149 + _5667;
        float _5671 = fma(_5595, _5595, _5657);
        float _5673 = -_5583;
        float _5675 = _139 + _5673;
        float _5677 = -_5559;
        float _5679 = _127 + _5677;
        float _5681 = -_5559;
        float _5683 = _117 + _5681;
        float _5685 = fma(_5661, _5661, _5671);
        float _5687 = -_5583;
        float _5689 = _129 + _5687;
        float _5691 = -_5559;
        float _5693 = _107 + _5691;
        float _5695 = -_5559;
        float _5697 = _97 + _5695;
        float _5699 = 1.0 / _5685;
        float _5701 = -_5559;
        float _5703 = _77 + _5701;
        float _5705 = -_5559;
        float _5707 = _87 + _5705;
        float _5709 = -_5559;
        float _5711 = _227 + _5709;
        float _5713 = -_5559;
        float _5715 = _217 + _5713;
        float _5717 = -_5559;
        float _5719 = _207 + _5717;
        float _5721 = -_5559;
        float _5723 = _197 + _5721;
        float _5725 = -_5559;
        float _5727 = _187 + _5725;
        float _5729 = -_5559;
        float _5731 = _177 + _5729;
        float _5733 = -_5559;
        float _5735 = _167 + _5733;
        float _5737 = -_5559;
        float _5739 = _157 + _5737;
        float _5741 = -_5583;
        float _5743 = _119 + _5741;
        float _5745 = -_5583;
        float _5747 = _109 + _5745;
        float _5749 = -_5583;
        float _5751 = _99 + _5749;
        float _5753 = -_5583;
        float _5755 = _79 + _5753;
        float _5757 = _5579 * _5699;
        float _5759 = _5595 * _5699;
        float _5761 = _5661 * _5699;
        float _5763 = _5757 * _5571;
        float _5765 = _5757 * _5665;
        float _5767 = _5757 * _5679;
        float _5769 = _5757 * _5683;
        float _5771 = fma(_5759, _5587, _5763);
        float _5773 = fma(_5759, _5599, _5765);
        float _5775 = fma(_5759, _5603, _5767);
        float _5777 = fma(_5759, _5607, _5769);
        float _5779 = fma(_5761, _5669, _5771);
        float _5781 = fma(_5761, _5675, _5773);
        float _5783 = fma(_5761, _5689, _5775);
        float _5785 = _5757 * _5693;
        float _5787 = _5757 * _5739;
        bool _5789 = _5779 >= 0.5;
        float _5791 = _5757 * _5697;
        bool _5793 = _5781 >= 0.5;
        float _5795 = _5757 * _5703;
        bool _5797 = _5779 >= 0.833000004291534423828125;
        float _5799 = _5757 * _5707;
        bool _5801 = _5779 >= 0.16599999368190765380859375;
        float _5803 = _5757 * _5711;
        float _5805 = _5757 * _5715;
        float _5807 = _5757 * _5719;
        float _5809 = _5757 * _5723;
        float _5811 = _5757 * _5727;
        float _5813 = _5757 * _5731;
        float _5815 = _5757 * _5735;
        int _5817 = _5797 ? 0 : 32768;
        float _5819 = fma(_5761, _5743, _5777);
        bool _5821 = _5781 >= 0.833000004291534423828125;
        float _5823 = fma(_5759, _5611, _5785);
        int _5825 = _5817;
        if (!_5789)
        {
            int _5827 = _5801 ? 49152 : 16384;
            _5825 = _5827;
        }
        int _5829 = _5825;
        float _5831 = fma(_5759, _5615, _5791);
        bool _5833 = _5781 >= 0.16599999368190765380859375;
        float _5835 = fma(_5759, _5619, _5795);
        float _5837 = fma(_5759, _5623, _5799);
        bool _5839 = _5783 >= 0.5;
        float _5841 = fma(_5759, _5627, _5803);
        float _5843 = fma(_5759, _5631, _5805);
        float _5845 = fma(_5759, _5635, _5807);
        float _5847 = fma(_5759, _5639, _5809);
        float _5849 = fma(_5759, _5643, _5811);
        float _5851 = fma(_5759, _5647, _5813);
        float _5853 = fma(_5759, _5651, _5815);
        float _5855 = fma(_5759, _5655, _5787);
        int _5857 = _5821 ? 0 : 8192;
        float _5859 = fma(_5761, _5747, _5823);
        bool _5861 = _5819 >= 0.5;
        float _5863 = fma(_5761, _5751, _5831);
        int _5865 = _5857;
        if (!_5793)
        {
            int _5867 = _5833 ? 12288 : 4096;
            _5865 = _5867;
        }
        int _5869 = _5865;
        float _5871 = fma(_5761, _5755, _5835);
        bool _5873 = _5819 >= 0.833000004291534423828125;
        float _5875 = -_5583;
        float _5877 = _229 + _5875;
        bool _5879 = _5783 >= 0.833000004291534423828125;
        float _5881 = -_5583;
        float _5883 = _219 + _5881;
        bool _5885 = _5783 >= 0.16599999368190765380859375;
        float _5887 = fma(_5761, _5877, _5841);
        int _5889 = _5873 ? 0 : 512;
        float _5891 = fma(_5761, _5883, _5843);
        bool _5893 = _5859 >= 0.5;
        float _5895 = -_5583;
        float _5897 = _209 + _5895;
        int _5899 = _5879 ? 0 : 2048;
        float _5901 = -_5583;
        float _5903 = _199 + _5901;
        bool _5905 = _5819 >= 0.16599999368190765380859375;
        float _5907 = fma(_5761, _5897, _5845);
        float _5909 = fma(_5761, _5903, _5847);
        int _5911 = _5899;
        int _5913 = _5889;
        if (!_5839)
        {
            int _5915 = _5885 ? 3072 : 1024;
            _5911 = _5915;
        }
        int _5917 = _5911;
        float _5919 = -_5583;
        float _5921 = _5174 + _5919;
        bool _5923 = _5863 >= 0.5;
        float _5925 = -_5583;
        float _5927 = _169 + _5925;
        if (!_5861)
        {
            int _5929 = _5905 ? 768 : 256;
            _5913 = _5929;
        }
        int _5931 = _5913;
        float _5933 = fma(_5761, _5921, _5849);
        bool _5935 = _5859 >= 0.833000004291534423828125;
        float _5937 = -_5583;
        float _5939 = _179 + _5937;
        bool _5941 = _5863 >= 0.833000004291534423828125;
        float _5943 = fma(_5761, _5927, _5853);
        bool _5945 = _5859 >= 0.16599999368190765380859375;
        float _5947 = fma(_5761, _5939, _5851);
        int _5949 = _5935 ? 0 : 128;
        float _5951 = -_5583;
        float _5953 = _89 + _5951;
        int _5955 = _5941 ? 0 : 32;
        float _5957 = -_5583;
        float _5959 = _159 + _5957;
        bool _5961 = _5871 >= 0.5;
        float _5963 = fma(_5761, _5953, _5837);
        bool _5965 = _5863 >= 0.16599999368190765380859375;
        float _5967 = fma(_5761, _5959, _5855);
        int _5969 = _5949;
        int _5971 = _5955;
        if (!_5893)
        {
            int _5973 = _5945 ? 192 : 64;
            _5969 = _5973;
        }
        int _5975 = _5969;
        bool _5977 = _5871 >= 0.833000004291534423828125;
        if (!_5923)
        {
            int _5979 = _5965 ? 48 : 16;
            _5971 = _5979;
        }
        int _5981 = _5971;
        int _5983 = _5977 ? 0 : 8;
        bool _5985 = _5887 >= 0.5;
        bool _5987 = _5871 >= 0.16599999368190765380859375;
        bool _5989 = _5891 >= 0.5;
        bool _5991 = _5887 >= 0.833000004291534423828125;
        int _5993 = _5983;
        if (!_5961)
        {
            int _5995 = _5987 ? 12 : 4;
            _5993 = _5995;
        }
        int _5997 = _5993;
        bool _5999 = _5891 >= 0.833000004291534423828125;
        bool _6001 = _5887 >= 0.16599999368190765380859375;
        int _6003 = _5991 ? 0 : int(0x80000000);
        bool _6005 = _5891 >= 0.16599999368190765380859375;
        int _6007 = _5999 ? 0 : 536870912;
        bool _6009 = _5907 >= 0.5;
        int _6011 = _6003;
        int _6013 = _6007;
        if (!_5985)
        {
            int _6015 = _6001 ? (-1073741824) : 1073741824;
            _6011 = _6015;
        }
        int _6017 = _6011;
        bool _6019 = _5909 >= 0.5;
        if (!_5989)
        {
            int _6021 = _6005 ? 805306368 : 268435456;
            _6013 = _6021;
        }
        int _6023 = _6013;
        bool _6025 = _5907 >= 0.833000004291534423828125;
        bool _6027 = _5909 >= 0.833000004291534423828125;
        int _6029 = _6025 ? 0 : 134217728;
        bool _6031 = _5907 >= 0.16599999368190765380859375;
        bool _6033 = _5933 >= 0.5;
        int _6035 = _6027 ? 0 : 33554432;
        bool _6037 = _5909 >= 0.16599999368190765380859375;
        int _6039 = _6029;
        int _6041 = _6035;
        if (!_6009)
        {
            int _6043 = _6031 ? 201326592 : 67108864;
            _6039 = _6043;
        }
        int _6045 = _6039;
        bool _6047 = _5933 >= 0.833000004291534423828125;
        if (!_6019)
        {
            int _6049 = _6037 ? 50331648 : 16777216;
            _6041 = _6049;
        }
        int _6051 = _6041;
        bool _6053 = _5943 >= 0.5;
        bool _6055 = _5933 >= 0.16599999368190765380859375;
        int _6057 = _6047 ? 0 : 8388608;
        bool _6059 = _5947 >= 0.5;
        bool _6061 = _5947 >= 0.833000004291534423828125;
        int _6063 = _6057;
        if (!_6033)
        {
            int _6065 = _6055 ? 12582912 : 4194304;
            _6063 = _6065;
        }
        int _6067 = _6063;
        bool _6069 = _5947 >= 0.16599999368190765380859375;
        bool _6071 = _5943 >= 0.833000004291534423828125;
        int _6073 = _6061 ? 0 : 2097152;
        bool _6075 = _5943 >= 0.16599999368190765380859375;
        int _6077 = _6071 ? 0 : 524288;
        int _6079 = _6077;
        int _6081 = _6073;
        if (!_6053)
        {
            int _6083 = _6075 ? 786432 : 262144;
            _6079 = _6083;
        }
        int _6085 = _6079;
        bool _6087 = _5963 >= 0.5;
        bool _6089 = _5967 >= 0.5;
        if (!_6059)
        {
            int _6091 = _6069 ? 3145728 : 1048576;
            _6081 = _6091;
        }
        int _6093 = _6081;
        bool _6095 = _5963 >= 0.833000004291534423828125;
        int _6097 = _6045 + _6017;
        int _6099 = _6097 + _6023;
        int _6101 = _5917 + _5829;
        int _6103 = _6101 + _5869;
        bool _6105 = _5967 >= 0.833000004291534423828125;
        int _6107 = _6095 ? 0 : 2;
        bool _6109 = _5963 >= 0.16599999368190765380859375;
        bool _6111 = _5967 >= 0.16599999368190765380859375;
        int _6113 = _6067 + _6099;
        int _6115 = _6113 + _6051;
        int _6117 = _5975 + _6103;
        int _6119 = _6117 + _5931;
        int _6121 = _6105 ? 0 : 131072;
        int _6123 = _6107;
        int _6125 = _6121;
        _5515 = 3;
        if (!_6087)
        {
            int _6127 = _6109 ? 3 : 1;
            _6123 = _6127;
        }
        int _6129 = _6123;
        if (!_6089)
        {
            int _6131 = _6111 ? 196608 : 65536;
            _6125 = _6131;
        }
        int _6133 = _6125;
        int _6135 = _6085 + _6115;
        int _6137 = _6135 + _6093;
        int _6139 = _5997 + _6119;
        int _6141 = _6139 + _5981;
        bool _6143 = !_5549;
        int _6145 = _6143 ? _5497 : _5493;
        bool _6147 = !_5549;
        int _6149 = _6147 ? _5493 : _5497;
        int _6151 = _6137 + _6133;
        int _6153 = _6141 + _6129;
        _5527 = _6145;
        _5541 = _6151;
        _5535 = _6153;
        _5517 = _6149;
    }
    int _6155 = _5527;
    int _6157 = _5515;
    int _6159 = _5541;
    int _6161 = _5535;
    int _6163 = _5517;
    int _6165 = _6157;
    if (!_5501)
    {
        _6165 = 0;
    }
    int _6167 = _6165;
    int _6169 = _6167;
    if (!_5501)
    {
        _5519 = 0;
    }
    int _6171 = _5519;
    bool _6173 = !_5501;
    int _6175 = _6171;
    if (!_6173)
    {
        float _6177 = -_5447;
        float _6179 = _5218 + _6177;
        float _6181 = -_5447;
        float _6183 = _101 + _6181;
        float _6185 = -_5447;
        float _6187 = _91 + _6185;
        float _6189 = -_5447;
        float _6191 = _81 + _6189;
        float _6193 = -_5447;
        float _6195 = _131 + _6193;
        float _6197 = 1.0 / _6179;
        float _6199 = -_5447;
        float _6201 = _141 + _6199;
        float _6203 = -_5447;
        float _6205 = _151 + _6203;
        float _6207 = -_5447;
        float _6209 = _161 + _6207;
        float _6211 = -_5447;
        float _6213 = _171 + _6211;
        float _6215 = -_5447;
        float _6217 = _181 + _6215;
        float _6219 = -_5447;
        float _6221 = _191 + _6219;
        float _6223 = -_5447;
        float _6225 = _201 + _6223;
        float _6227 = -_5447;
        float _6229 = _211 + _6227;
        float _6231 = -_5447;
        float _6233 = _221 + _6231;
        float _6235 = -_5447;
        float _6237 = _231 + _6235;
        float _6239 = _6183 * _6197;
        float _6241 = -_5447;
        float _6243 = _111 + _6241;
        float _6245 = _6187 * _6197;
        float _6247 = _6191 * _6197;
        float _6249 = _6243 * _6197;
        float _6251 = -_5447;
        float _6253 = _121 + _6251;
        float _6255 = fma(_6245, -1.99999904632568359375, 1.99999904632568359375);
        float _6257 = fma(_6245, -7.99999904632568359375, 7.99999904632568359375);
        float _6259 = fma(_6247, -1.99999904632568359375, 1.99999904632568359375);
        float _6261 = fma(_6247, -7.99999904632568359375, 7.99999904632568359375);
        float _6263 = fma(_6239, -1.99999904632568359375, 1.99999904632568359375);
        float _6265 = fma(_6239, -7.99999904632568359375, 7.99999904632568359375);
        float _6267 = _6253 * _6197;
        float _6269 = -_6245;
        float _6271 = _6269 + 0.5;
        float _6273 = -_6247;
        float _6275 = _6273 + 0.5;
        float _6277 = fma(_6249, -1.99999904632568359375, 1.99999904632568359375);
        float _6279 = fma(_6249, -7.99999904632568359375, 7.99999904632568359375);
        float _6281 = trunc(_6255);
        float _6283 = precise::max(_6281, 0.0);
        uint _6285 = uint(_6283);
        float _6287 = fma(_6267, -1.99999904632568359375, 1.99999904632568359375);
        float _6289 = fma(_6267, -7.99999904632568359375, 7.99999904632568359375);
        float _6291 = _6195 * _6197;
        float _6293 = _6201 * _6197;
        float _6295 = -_6239;
        float _6297 = _6295 + 0.5;
        float _6299 = abs(_6271);
        bool _6301 = _6299 >= 0.375;
        float _6303 = -_6249;
        float _6305 = _6303 + 0.5;
        float _6307 = trunc(_6257);
        float _6309 = precise::max(_6307, 0.0);
        uint _6311 = uint(_6309);
        float _6313 = abs(_6275);
        bool _6315 = _6313 >= 0.375;
        float _6317 = fma(_6291, -1.99999904632568359375, 1.99999904632568359375);
        float _6319 = fma(_6291, -7.99999904632568359375, 7.99999904632568359375);
        float _6321 = fma(_6293, -1.99999904632568359375, 1.99999904632568359375);
        float _6323 = fma(_6293, -7.99999904632568359375, 7.99999904632568359375);
        float _6325 = _6205 * _6197;
        float _6327 = _6209 * _6197;
        float _6329 = trunc(_6259);
        float _6331 = precise::max(_6329, 0.0);
        uint _6333 = uint(_6331);
        float _6335 = -_6267;
        float _6337 = _6335 + 0.5;
        float _6339 = abs(_6297);
        bool _6341 = _6339 >= 0.375;
        float _6343 = _6213 * _6197;
        float _6345 = fma(_6325, -1.99999904632568359375, 1.99999904632568359375);
        float _6347 = fma(_6325, -7.99999904632568359375, 7.99999904632568359375);
        float _6349 = fma(_6327, -1.99999904632568359375, 1.99999904632568359375);
        float _6351 = fma(_6327, -7.99999904632568359375, 7.99999904632568359375);
        float _6353 = trunc(_6261);
        float _6355 = precise::max(_6353, 0.0);
        uint _6357 = uint(_6355);
        float _6359 = -_6291;
        float _6361 = _6359 + 0.5;
        float _6363 = abs(_6305);
        bool _6365 = _6363 >= 0.375;
        float _6367 = -_6293;
        float _6369 = _6367 + 0.5;
        float _6371 = abs(_6337);
        bool _6373 = _6371 >= 0.375;
        float _6375 = fma(_6343, -1.99999904632568359375, 1.99999904632568359375);
        float _6377 = fma(_6343, -7.99999904632568359375, 7.99999904632568359375);
        float _6379 = _6217 * _6197;
        float _6381 = trunc(_6263);
        float _6383 = precise::max(_6381, 0.0);
        uint _6385 = uint(_6383);
        float _6387 = _6221 * _6197;
        float _6389 = -_6325;
        float _6391 = _6389 + 0.5;
        float _6393 = -_6327;
        float _6395 = _6393 + 0.5;
        float _6397 = abs(_6361);
        bool _6399 = _6397 >= 0.375;
        float _6401 = fma(_6379, -1.99999904632568359375, 1.99999904632568359375);
        float _6403 = abs(_6369);
        bool _6405 = _6403 >= 0.375;
        float _6407 = fma(_6379, -7.99999904632568359375, 7.99999904632568359375);
        float _6409 = trunc(_6265);
        float _6411 = precise::max(_6409, 0.0);
        uint _6413 = uint(_6411);
        float _6415 = fma(_6387, -1.99999904632568359375, 1.99999904632568359375);
        float _6417 = fma(_6387, -7.99999904632568359375, 7.99999904632568359375);
        float _6419 = _6225 * _6197;
        float _6421 = _6229 * _6197;
        float _6423 = -_6343;
        float _6425 = _6423 + 0.5;
        int _6427 = int(_6285);
        int _6429 = int(_6333);
        int _6431 = int(_6385);
        if (!_6301)
        {
            int _6433 = int(_6311) + 1;
            _6427 = _6433;
        }
        int _6435 = _6427;
        float _6437 = _6233 * _6197;
        float _6439 = trunc(_6277);
        float _6441 = precise::max(_6439, 0.0);
        uint _6443 = uint(_6441);
        int _6445 = int(_6443);
        if (!_6315)
        {
            int _6447 = int(_6357) + 1;
            _6429 = _6447;
        }
        int _6449 = _6429;
        float _6451 = _6237 * _6197;
        float _6453 = abs(_6391);
        bool _6455 = _6453 >= 0.375;
        float _6457 = fma(_6419, -1.99999904632568359375, 1.99999904632568359375);
        float _6459 = abs(_6395);
        bool _6461 = _6459 >= 0.375;
        float _6463 = fma(_6419, -7.99999904632568359375, 7.99999904632568359375);
        float _6465 = fma(_6421, -1.99999904632568359375, 1.99999904632568359375);
        float _6467 = trunc(_6279);
        float _6469 = precise::max(_6467, 0.0);
        uint _6471 = uint(_6469);
        float _6473 = fma(_6421, -7.99999904632568359375, 7.99999904632568359375);
        if (!_6341)
        {
            int _6475 = int(_6413) + 1;
            _6431 = _6475;
        }
        int _6477 = _6431;
        float _6479 = -_6379;
        float _6481 = _6479 + 0.5;
        float _6483 = -_6387;
        float _6485 = _6483 + 0.5;
        float _6487 = abs(_6425);
        bool _6489 = _6487 >= 0.375;
        float _6491 = fma(_6437, -1.99999904632568359375, 1.99999904632568359375);
        float _6493 = -_6419;
        float _6495 = _6493 + 0.5;
        float _6497 = trunc(_6287);
        float _6499 = precise::max(_6497, 0.0);
        uint _6501 = uint(_6499);
        float _6503 = -_6421;
        float _6505 = _6503 + 0.5;
        float _6507 = fma(_6437, -7.99999904632568359375, 7.99999904632568359375);
        float _6509 = fma(_6451, -1.99999904632568359375, 1.99999904632568359375);
        float _6511 = -_6437;
        float _6513 = _6511 + 0.5;
        int _6515 = _6449 << 3;
        float _6517 = trunc(_6289);
        float _6519 = precise::max(_6517, 0.0);
        uint _6521 = uint(_6519);
        int _6523 = int(_6501);
        if (!_6365)
        {
            int _6525 = int(_6471) + 1;
            _6445 = _6525;
        }
        int _6527 = _6445;
        float _6529 = fma(_6451, -7.99999904632568359375, 7.99999904632568359375);
        float _6531 = abs(_6481);
        bool _6533 = _6531 >= 0.375;
        float _6535 = -_6451;
        float _6537 = _6535 + 0.5;
        int _6539 = _6435 | _6515;
        int _6541 = _6527 << 9;
        float _6543 = trunc(_6317);
        float _6545 = precise::max(_6543, 0.0);
        uint _6547 = uint(_6545);
        float _6549 = trunc(_6319);
        float _6551 = precise::max(_6549, 0.0);
        uint _6553 = uint(_6551);
        int _6555 = int(_6547);
        if (!_6373)
        {
            int _6557 = int(_6521) + 1;
            _6523 = _6557;
        }
        int _6559 = _6523;
        float _6561 = abs(_6485);
        bool _6563 = _6561 >= 0.375;
        float _6565 = trunc(_6321);
        float _6567 = precise::max(_6565, 0.0);
        uint _6569 = uint(_6567);
        float _6571 = trunc(_6323);
        float _6573 = precise::max(_6571, 0.0);
        uint _6575 = uint(_6573);
        int _6577 = int(_6569);
        if (!_6399)
        {
            int _6579 = int(_6553) + 1;
            _6555 = _6579;
        }
        int _6581 = _6555;
        float _6583 = abs(_6495);
        bool _6585 = _6583 >= 0.375;
        int _6587 = _6581 << 15;
        float _6589 = trunc(_6345);
        float _6591 = precise::max(_6589, 0.0);
        uint _6593 = uint(_6591);
        float _6595 = trunc(_6347);
        float _6597 = precise::max(_6595, 0.0);
        uint _6599 = uint(_6597);
        int _6601 = int(_6593);
        if (!_6405)
        {
            int _6603 = int(_6575) + 1;
            _6577 = _6603;
        }
        int _6605 = _6577;
        float _6607 = abs(_6505);
        bool _6609 = _6607 >= 0.375;
        float _6611 = trunc(_6349);
        float _6613 = precise::max(_6611, 0.0);
        uint _6615 = uint(_6613);
        float _6617 = trunc(_6351);
        float _6619 = precise::max(_6617, 0.0);
        uint _6621 = uint(_6619);
        int _6623 = int(_6615);
        if (!_6455)
        {
            int _6625 = int(_6599) + 1;
            _6601 = _6625;
        }
        int _6627 = _6601;
        float _6629 = abs(_6513);
        bool _6631 = _6629 >= 0.375;
        int _6633 = _6627 << 21;
        float _6635 = trunc(_6375);
        float _6637 = precise::max(_6635, 0.0);
        uint _6639 = uint(_6637);
        float _6641 = trunc(_6377);
        float _6643 = precise::max(_6641, 0.0);
        uint _6645 = uint(_6643);
        int _6647 = int(_6639);
        if (!_6461)
        {
            int _6649 = int(_6621) + 1;
            _6623 = _6649;
        }
        int _6651 = _6623;
        float _6653 = abs(_6537);
        bool _6655 = _6653 >= 0.375;
        float _6657 = trunc(_6401);
        float _6659 = precise::max(_6657, 0.0);
        uint _6661 = uint(_6659);
        float _6663 = trunc(_6407);
        float _6665 = precise::max(_6663, 0.0);
        uint _6667 = uint(_6665);
        int _6669 = int(_6661);
        if (!_6489)
        {
            int _6671 = int(_6645) + 1;
            _6647 = _6671;
        }
        int _6673 = _6647;
        int _6675 = _6673 << 3;
        float _6677 = trunc(_6415);
        float _6679 = precise::max(_6677, 0.0);
        uint _6681 = uint(_6679);
        int _6683 = _6651 | _6675;
        float _6685 = trunc(_6417);
        float _6687 = precise::max(_6685, 0.0);
        uint _6689 = uint(_6687);
        int _6691 = int(_6681);
        if (!_6533)
        {
            int _6693 = int(_6667) + 1;
            _6669 = _6693;
        }
        int _6695 = _6669;
        int _6697 = _6695 << 6;
        float _6699 = trunc(_6457);
        float _6701 = precise::max(_6699, 0.0);
        uint _6703 = uint(_6701);
        float _6705 = trunc(_6463);
        float _6707 = precise::max(_6705, 0.0);
        uint _6709 = uint(_6707);
        int _6711 = int(_6703);
        if (!_6563)
        {
            int _6713 = int(_6689) + 1;
            _6691 = _6713;
        }
        int _6715 = _6691;
        int _6717 = _6715 << 9;
        float _6719 = trunc(_6465);
        float _6721 = precise::max(_6719, 0.0);
        uint _6723 = uint(_6721);
        int _6725 = _6683 | _6697;
        int _6727 = _6717 | _6725;
        float _6729 = trunc(_6473);
        float _6731 = precise::max(_6729, 0.0);
        uint _6733 = uint(_6731);
        int _6735 = int(_6723);
        if (!_6585)
        {
            int _6737 = int(_6709) + 1;
            _6711 = _6737;
        }
        int _6739 = _6711;
        float _6741 = trunc(_6491);
        float _6743 = precise::max(_6741, 0.0);
        uint _6745 = uint(_6743);
        float _6747 = trunc(_6507);
        float _6749 = precise::max(_6747, 0.0);
        uint _6751 = uint(_6749);
        int _6753 = int(_6745);
        if (!_6609)
        {
            int _6755 = int(_6733) + 1;
            _6735 = _6755;
        }
        int _6757 = _6735;
        int _6759 = _6757 << 15;
        float _6761 = trunc(_6509);
        float _6763 = precise::max(_6761, 0.0);
        uint _6765 = uint(_6763);
        float _6767 = trunc(_6529);
        float _6769 = precise::max(_6767, 0.0);
        uint _6771 = uint(_6769);
        int _6773 = _6477 << 6;
        int _6775 = _6739 << 12;
        int _6777 = _6539 | _6773;
        int _6779 = _6541 | _6777;
        int _6781 = _6559 << 12;
        int _6783 = int(_6765);
        if (!_6631)
        {
            int _6785 = int(_6751) + 1;
            _6753 = _6785;
        }
        int _6787 = _6753;
        int _6789 = _6779 | _6781;
        int _6791 = _6587 | _6789;
        int _6793 = _6727 | _6775;
        int _6795 = _6759 | _6793;
        int _6797 = _6605 << 18;
        if (!_6655)
        {
            int _6799 = int(_6771) + 1;
            _6783 = _6799;
        }
        int _6801 = _6783;
        int _6803 = _6787 << 18;
        int _6805 = _6801 << 21;
        int _6807 = _6791 | _6797;
        int _6809 = _6633 | _6807;
        int _6811 = _6795 | _6803;
        int _6813 = _6805 | _6811;
        uint _6815 = uint(int(uint(_6809) >> uint(16)));
        int _6817 = _6813 << 8;
        uint _6819 = uint(int(uint(_6813) >> uint(8)));
        int _6821 = 65280 & _6817;
        int _6823 = int(_6815) | _6821;
        int _6825 = _6809 << 16;
        int _6827 = int(_6819) << 16;
        _5531 = _6825;
        _6175 = _6827;
        _6169 = _6823;
    }
    int _6829 = _5531;
    int _6831 = _6175;
    int _6833 = _6169;
    int _6835 = _6155 & 65535;
    int _6837 = _6829 | _5525;
    int _6839 = _6831 | _6833;
    int _6841 = _6159 | _6161;
    int _6843 = _6163 << 16;
    int _6845 = _6843 + _6835;
    out.m_37.x = as_type<float>(_6837);
    out.m_37.y = as_type<float>(_6839);
    out.m_37.z = as_type<float>(_6845);
    out.m_37.w = as_type<float>(_6841);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5048 = false;
    bool _5030 = false;
    bool _4886 = false;
    bool _4868 = false;
    bool _4724 = false;
    bool _4706 = false;
    bool _4562 = false;
    bool _4544 = false;
    bool _4400 = false;
    bool _4382 = false;
    bool _4238 = false;
    bool _4220 = false;
    bool _4076 = false;
    bool _4058 = false;
    bool _3914 = false;
    bool _3896 = false;
    bool _3752 = false;
    bool _3734 = false;
    bool _3590 = false;
    bool _3572 = false;
    bool _3428 = false;
    bool _3410 = false;
    bool _3266 = false;
    bool _3248 = false;
    bool _3104 = false;
    bool _3086 = false;
    bool _2942 = false;
    bool _2924 = false;
    bool _2780 = false;
    bool _2762 = false;
    bool _2652 = false;
    bool _2618 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_34.z;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float3 _6892 = float3(_66, _68, _70);
    float4 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6892, float3(0.0), isnan(_6892)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6892, float3(0.0), isnan(_6892)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).xyzw;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float _81 = _73.w;
    float3 _6917 = float3(_66, _68, _70);
    float4 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6917, float3(0.0), isnan(_6917)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6917, float3(0.0), isnan(_6917)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float _91 = _83.w;
    float3 _6936 = float3(_66, _68, _70);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6936, float3(0.0), isnan(_6936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6936, float3(0.0), isnan(_6936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float3 _6956 = float3(_66, _68, _70);
    float4 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6956, float3(0.0), isnan(_6956)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6956, float3(0.0), isnan(_6956)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).xyzw;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _103.w;
    float3 _6976 = float3(_66, _68, _70);
    float4 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6976, float3(0.0), isnan(_6976)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6976, float3(0.0), isnan(_6976)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).xyzw;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = _113.z;
    float _121 = _113.w;
    float3 _6996 = float3(_66, _68, _70);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6996, float3(0.0), isnan(_6996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6996, float3(0.0), isnan(_6996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float3 _7016 = float3(_66, _68, _70);
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7016, float3(0.0), isnan(_7016)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7016, float3(0.0), isnan(_7016)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float3 _7036 = float3(_66, _68, _70);
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7036, float3(0.0), isnan(_7036)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7036, float3(0.0), isnan(_7036)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float3 _7056 = float3(_66, _68, _70);
    float4 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7056, float3(0.0), isnan(_7056)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7056, float3(0.0), isnan(_7056)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).xyzw;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float _161 = _153.w;
    float3 _7076 = float3(_66, _68, _70);
    float4 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7076, float3(0.0), isnan(_7076)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7076, float3(0.0), isnan(_7076)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).xyzw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _163.w;
    float3 _7096 = float3(_66, _68, _70);
    float4 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7096, float3(0.0), isnan(_7096)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7096, float3(0.0), isnan(_7096)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).xyzw;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float _181 = _173.w;
    float3 _7116 = float3(_66, _68, _70);
    float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7116, float3(0.0), isnan(_7116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7116, float3(0.0), isnan(_7116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).xyzw;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _183.w;
    float3 _7136 = float3(_66, _68, _70);
    float4 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7136, float3(0.0), isnan(_7136)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7136, float3(0.0), isnan(_7136)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).xyzw;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = _193.w;
    float3 _7156 = float3(_66, _68, _70);
    float4 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7156, float3(0.0), isnan(_7156)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7156, float3(0.0), isnan(_7156)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).xyzw;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = _203.w;
    float3 _7176 = float3(_66, _68, _70);
    float4 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7176, float3(0.0), isnan(_7176)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7176, float3(0.0), isnan(_7176)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).xyzw;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _213.w;
    float3 _7196 = float3(_66, _68, _70);
    float4 _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7196, float3(0.0), isnan(_7196)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7196, float3(0.0), isnan(_7196)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).xyzw;
    float _225 = _223.x;
    float _227 = _223.y;
    float _229 = _223.z;
    float _231 = _223.w;
    float _233 = _85 + _75;
    float _235 = _87 + _77;
    float _237 = _89 + _79;
    float _239 = _95 + _233;
    float _241 = _97 + _235;
    float _243 = _99 + _237;
    float _245 = _105 + _239;
    float _247 = _107 + _241;
    float _249 = _109 + _243;
    float _251 = _115 + _245;
    float _253 = _117 + _247;
    float _255 = _119 + _249;
    float _257 = _125 + _251;
    float _259 = _127 + _253;
    float _261 = _129 + _255;
    float _263 = _135 + _257;
    float _265 = _137 + _259;
    float _267 = _139 + _261;
    float _269 = _145 + _263;
    float _271 = _147 + _265;
    float _273 = _149 + _267;
    float _275 = _155 + _269;
    float _277 = _157 + _271;
    float _279 = _159 + _273;
    float _281 = _165 + _275;
    float _283 = _167 + _277;
    float _285 = _169 + _279;
    float _287 = _175 + _281;
    float _289 = _177 + _283;
    float _291 = _179 + _285;
    float _293 = _185 + _287;
    float _295 = _187 + _289;
    float _297 = _189 + _291;
    float _299 = _195 + _293;
    float _301 = _197 + _295;
    float _303 = _199 + _297;
    float _305 = _205 + _299;
    float _307 = _207 + _301;
    float _309 = _209 + _303;
    float _311 = _215 + _305;
    float _313 = _217 + _307;
    float _315 = _219 + _309;
    float _317 = _227 + _313;
    float _319 = _225 + _311;
    float _321 = _229 + _315;
    float _323 = fma(_317, -0.0625, _77);
    float _325 = fma(_319, -0.0625, _75);
    float _327 = fma(_321, -0.0625, _79);
    float _329 = fma(_317, -0.0625, _87);
    float _331 = _323 * _323;
    float _333 = _325 * _323;
    float _335 = _323 * _327;
    float _337 = fma(_319, -0.0625, _85);
    float _339 = fma(_321, -0.0625, _89);
    float _341 = _325 * _325;
    float _343 = _325 * _327;
    float _345 = fma(_329, _329, _331);
    float _347 = fma(_337, _329, _333);
    float _349 = fma(_329, _339, _335);
    float _351 = fma(_337, _337, _341);
    float _353 = fma(_337, _339, _343);
    float _355 = _327 * _327;
    float _357 = fma(_317, -0.0625, _97);
    float _359 = fma(_319, -0.0625, _95);
    float _361 = fma(_321, -0.0625, _99);
    float _363 = fma(_339, _339, _355);
    float _365 = fma(_357, _357, _345);
    float _367 = fma(_359, _357, _347);
    float _369 = fma(_357, _361, _349);
    float _371 = fma(_359, _359, _351);
    float _373 = fma(_359, _361, _353);
    float _375 = fma(_317, -0.0625, _107);
    float _377 = fma(_319, -0.0625, _105);
    float _379 = fma(_321, -0.0625, _109);
    float _381 = fma(_361, _361, _363);
    float _383 = fma(_375, _375, _365);
    float _385 = fma(_377, _375, _367);
    float _387 = fma(_375, _379, _369);
    float _389 = fma(_377, _377, _371);
    float _391 = fma(_377, _379, _373);
    float _393 = fma(_317, -0.0625, _117);
    float _395 = fma(_319, -0.0625, _115);
    float _397 = fma(_321, -0.0625, _119);
    float _399 = fma(_379, _379, _381);
    float _401 = fma(_393, _393, _383);
    float _403 = fma(_395, _393, _385);
    float _405 = fma(_393, _397, _387);
    float _407 = fma(_395, _395, _389);
    float _409 = fma(_395, _397, _391);
    float _411 = fma(_317, -0.0625, _127);
    float _413 = fma(_319, -0.0625, _125);
    float _415 = fma(_321, -0.0625, _129);
    float _417 = fma(_397, _397, _399);
    float _419 = fma(_411, _411, _401);
    float _421 = fma(_413, _411, _403);
    float _423 = fma(_411, _415, _405);
    float _425 = fma(_413, _413, _407);
    float _427 = fma(_413, _415, _409);
    float _429 = fma(_317, -0.0625, _137);
    float _431 = fma(_319, -0.0625, _135);
    float _433 = fma(_321, -0.0625, _139);
    float _435 = fma(_415, _415, _417);
    float _437 = fma(_429, _429, _419);
    float _439 = fma(_431, _429, _421);
    float _441 = fma(_429, _433, _423);
    float _443 = fma(_431, _431, _425);
    float _445 = fma(_431, _433, _427);
    float _447 = fma(_317, -0.0625, _147);
    float _449 = fma(_319, -0.0625, _145);
    float _451 = fma(_321, -0.0625, _149);
    float _453 = fma(_433, _433, _435);
    float _455 = fma(_447, _447, _437);
    float _457 = fma(_449, _447, _439);
    float _459 = fma(_447, _451, _441);
    float _461 = fma(_449, _449, _443);
    float _463 = fma(_449, _451, _445);
    float _465 = fma(_317, -0.0625, _157);
    float _467 = fma(_319, -0.0625, _155);
    float _469 = fma(_321, -0.0625, _159);
    float _471 = fma(_451, _451, _453);
    float _473 = fma(_465, _465, _455);
    float _475 = fma(_467, _465, _457);
    float _477 = fma(_465, _469, _459);
    float _479 = fma(_467, _467, _461);
    float _481 = fma(_467, _469, _463);
    float _483 = fma(_317, -0.0625, _167);
    float _485 = fma(_319, -0.0625, _165);
    float _487 = fma(_321, -0.0625, _169);
    float _489 = fma(_469, _469, _471);
    float _491 = fma(_483, _483, _473);
    float _493 = fma(_485, _483, _475);
    float _495 = fma(_483, _487, _477);
    float _497 = fma(_485, _485, _479);
    float _499 = fma(_485, _487, _481);
    float _501 = fma(_317, -0.0625, _177);
    float _503 = fma(_319, -0.0625, _175);
    float _505 = fma(_321, -0.0625, _179);
    float _507 = fma(_487, _487, _489);
    float _509 = fma(_501, _501, _491);
    float _511 = fma(_503, _501, _493);
    float _513 = fma(_501, _505, _495);
    float _515 = fma(_503, _503, _497);
    float _517 = fma(_503, _505, _499);
    float _519 = fma(_317, -0.0625, _187);
    float _521 = fma(_319, -0.0625, _185);
    float _523 = fma(_321, -0.0625, _189);
    float _525 = fma(_505, _505, _507);
    float _527 = fma(_519, _519, _509);
    float _529 = fma(_521, _519, _511);
    float _531 = fma(_519, _523, _513);
    float _533 = fma(_521, _521, _515);
    float _535 = fma(_521, _523, _517);
    float _537 = fma(_317, -0.0625, _197);
    float _539 = fma(_319, -0.0625, _195);
    float _541 = fma(_321, -0.0625, _199);
    float _543 = fma(_523, _523, _525);
    float _545 = fma(_537, _537, _527);
    float _547 = fma(_539, _537, _529);
    float _549 = fma(_537, _541, _531);
    float _551 = fma(_539, _539, _533);
    float _553 = fma(_539, _541, _535);
    float _555 = fma(_317, -0.0625, _207);
    float _557 = fma(_319, -0.0625, _205);
    float _559 = fma(_321, -0.0625, _209);
    float _561 = fma(_541, _541, _543);
    float _563 = fma(_555, _555, _545);
    float _565 = fma(_557, _555, _547);
    float _567 = fma(_555, _559, _549);
    float _569 = fma(_557, _557, _551);
    float _571 = fma(_557, _559, _553);
    float _573 = fma(_317, -0.0625, _217);
    float _575 = fma(_319, -0.0625, _215);
    float _577 = fma(_321, -0.0625, _219);
    float _579 = fma(_319, -0.0625, _225);
    float _581 = fma(_573, _573, _563);
    float _583 = fma(_575, _573, _565);
    float _585 = fma(_573, _577, _567);
    float _587 = fma(_317, -0.0625, _227);
    float _589 = fma(_559, _559, _561);
    float _591 = fma(_321, -0.0625, _229);
    float _593 = fma(_575, _575, _569);
    float _595 = fma(_587, _587, _581);
    float _597 = fma(_579, _587, _583);
    float _599 = fma(_575, _577, _571);
    float _601 = fma(_587, _591, _585);
    float _603 = fma(_579, _579, _593);
    float _605 = _595 + _597;
    float _607 = fma(_577, _577, _589);
    float _609 = fma(_579, _591, _599);
    float _611 = _603 + _597;
    float _613 = _601 + _605;
    float _615 = fma(_591, _591, _607);
    float _617 = _601 + _609;
    float _619 = _609 + _611;
    float _621 = _613 * _613;
    float _623 = _615 + _617;
    float _625 = fma(_619, _619, _621);
    float _627 = fma(_623, _623, _625);
    float _629 = rsqrt(_627);
    float _631 = _613 * _629;
    float _633 = _619 * _629;
    float _635 = _623 * _629;
    float _637 = _595 * _631;
    float _639 = _597 * _631;
    float _641 = fma(_597, _633, _637);
    float _643 = _601 * _631;
    float _645 = fma(_603, _633, _639);
    float _647 = fma(_601, _635, _641);
    float _649 = fma(_609, _633, _643);
    float _651 = fma(_609, _635, _645);
    float _653 = _647 * _647;
    float _655 = fma(_615, _635, _649);
    float _657 = fma(_651, _651, _653);
    float _659 = fma(_655, _655, _657);
    float _661 = rsqrt(_659);
    float _663 = _647 * _661;
    float _665 = _651 * _661;
    float _667 = _655 * _661;
    float _669 = _595 * _663;
    float _671 = _597 * _663;
    float _673 = _601 * _663;
    float _675 = fma(_597, _665, _669);
    float _677 = fma(_603, _665, _671);
    float _679 = fma(_609, _665, _673);
    float _681 = fma(_601, _667, _675);
    float _683 = fma(_609, _667, _677);
    float _685 = fma(_615, _667, _679);
    float _687 = _681 * _681;
    float _689 = fma(_683, _683, _687);
    float _691 = fma(_685, _685, _689);
    float _693 = rsqrt(_691);
    float _695 = _681 * _693;
    float _697 = _683 * _693;
    float _699 = _685 * _693;
    float _701 = _595 * _695;
    float _703 = _597 * _695;
    float _705 = _601 * _695;
    float _707 = fma(_597, _697, _701);
    float _709 = fma(_603, _697, _703);
    float _711 = fma(_609, _697, _705);
    float _713 = fma(_601, _699, _707);
    float _715 = fma(_609, _699, _709);
    float _717 = fma(_615, _699, _711);
    float _719 = _713 * _713;
    float _721 = fma(_715, _715, _719);
    float _723 = fma(_717, _717, _721);
    float _725 = rsqrt(_723);
    float _727 = _713 * _725;
    float _729 = _715 * _725;
    float _731 = _717 * _725;
    float _733 = _595 * _727;
    float _735 = _597 * _727;
    float _737 = _601 * _727;
    float _739 = fma(_597, _729, _733);
    float _741 = fma(_603, _729, _735);
    float _743 = fma(_609, _729, _737);
    float _745 = fma(_601, _731, _739);
    float _747 = fma(_609, _731, _741);
    float _749 = fma(_615, _731, _743);
    float _751 = _745 * _745;
    float _753 = fma(_747, _747, _751);
    float _755 = fma(_749, _749, _753);
    float _757 = rsqrt(_755);
    float _759 = _745 * _757;
    float _761 = _747 * _757;
    float _763 = _749 * _757;
    float _765 = _595 * _759;
    float _767 = _597 * _759;
    float _769 = _601 * _759;
    float _771 = fma(_597, _761, _765);
    float _773 = fma(_603, _761, _767);
    float _775 = fma(_609, _761, _769);
    float _777 = fma(_601, _763, _771);
    float _779 = fma(_609, _763, _773);
    float _781 = fma(_615, _763, _775);
    float _783 = _777 * _777;
    float _785 = fma(_779, _779, _783);
    float _787 = fma(_781, _781, _785);
    float _789 = rsqrt(_787);
    float _791 = _777 * _789;
    float _793 = _779 * _789;
    float _795 = _781 * _789;
    float _797 = _595 * _791;
    float _799 = _597 * _791;
    float _801 = _601 * _791;
    float _803 = fma(_597, _793, _797);
    float _805 = fma(_603, _793, _799);
    float _807 = fma(_609, _793, _801);
    float _809 = fma(_601, _795, _803);
    float _811 = fma(_609, _795, _805);
    float _813 = fma(_615, _795, _807);
    float _815 = _809 * _809;
    float _817 = fma(_811, _811, _815);
    float _819 = fma(_813, _813, _817);
    float _821 = rsqrt(_819);
    float _823 = _809 * _821;
    float _825 = _811 * _821;
    float _827 = _813 * _821;
    float _829 = _595 * _823;
    float _831 = _597 * _823;
    float _833 = fma(_597, _825, _829);
    float _835 = _601 * _823;
    float _837 = fma(_603, _825, _831);
    float _839 = fma(_601, _827, _833);
    float _841 = fma(_609, _825, _835);
    float _843 = fma(_609, _827, _837);
    float _845 = _839 * _839;
    float _847 = fma(_615, _827, _841);
    float _849 = fma(_843, _843, _845);
    float _851 = fma(_847, _847, _849);
    float _853 = rsqrt(_851);
    float _855 = _839 * _853;
    float _857 = _843 * _853;
    float _859 = _847 * _853;
    float _861 = _87 * _855;
    float _863 = _77 * _855;
    float _865 = _97 * _855;
    float _867 = fma(_85, _857, _861);
    float _869 = fma(_75, _857, _863);
    float _871 = fma(_95, _857, _865);
    float _873 = fma(_89, _859, _867);
    float _875 = fma(_79, _859, _869);
    float _877 = fma(_99, _859, _871);
    bool _881 = _873 >= _875;
    bool _883 = isnan(_873);
    bool _885 = _881 || _883;
    bool _887 = isnan(_875);
    bool _889 = _885 || _887;
    float _891 = _70;
    float _893 = _871;
    float _895 = _603;
    float _897 = _867;
    float _899 = _853;
    float _901 = _825;
    float _903 = _813;
    float _905 = _823;
    float _907 = _873;
    float _909 = _797;
    float _911 = _877;
    float _913 = _877;
    float _915 = _855;
    float _917 = _857;
    float _919 = 7.1466221680565670617110208747786e-44;
    float _921 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _923 = 7.0064923216240853546186479164496e-44;
    spvUnsafeArray<uint, 4> _24;
    if (!_889)
    {
        _891 = _75;
    }
    float _925 = _891;
    float _927 = _925;
    float _929 = _925;
    if (!_889)
    {
        _893 = _77;
    }
    float _931 = _893;
    float _933 = _931;
    float _935 = _931;
    if (!_889)
    {
        _895 = _79;
    }
    float _937 = _895;
    float _939 = _937;
    float _941 = _937;
    if (!_889)
    {
        _897 = _873;
    }
    float _943 = _897;
    float _945 = _943;
    float _947 = _943;
    if (!_889)
    {
        _899 = _875;
    }
    float _949 = _899;
    float _951 = _949;
    float _953 = _949;
    if (!_889)
    {
        _901 = _85;
    }
    float _955 = _901;
    float _957 = _955;
    float _959 = _955;
    if (!_889)
    {
        _903 = _87;
    }
    float _961 = _903;
    float _963 = _961;
    float _965 = _961;
    if (!_889)
    {
        _905 = _89;
    }
    float _967 = _905;
    bool _969 = !_889;
    float _971 = _967;
    float _973 = _967;
    if (!_969)
    {
        bool _975 = _873 > _875;
        if (!_975)
        {
            _945 = _873;
        }
        float _977 = _945;
        float _979 = _977;
        if (!_975)
        {
            _951 = _873;
        }
        float _981 = _951;
        float _983 = _981;
        if (!_975)
        {
            _957 = _85;
        }
        float _985 = _957;
        float _987 = _985;
        if (!_975)
        {
            _963 = _87;
        }
        float _989 = _963;
        float _991 = _989;
        if (!_975)
        {
            _971 = _89;
        }
        float _993 = _971;
        float _995 = _993;
        if (!_975)
        {
            _927 = _85;
        }
        float _997 = _927;
        float _999 = _997;
        if (!_975)
        {
            _933 = _87;
        }
        float _1001 = _933;
        float _1003 = _1001;
        if (!_975)
        {
            _939 = _89;
        }
        float _1005 = _939;
        _941 = _1005;
        if (_975)
        {
            _979 = _875;
        }
        float _1007 = _979;
        _947 = _1007;
        if (_975)
        {
            _983 = _873;
        }
        float _1009 = _983;
        _953 = _1009;
        if (_975)
        {
            _987 = _75;
        }
        float _1011 = _987;
        _959 = _1011;
        if (_975)
        {
            _991 = _77;
        }
        float _1013 = _991;
        _965 = _1013;
        if (_975)
        {
            _995 = _79;
        }
        float _1015 = _995;
        _973 = _1015;
        if (_975)
        {
            _999 = _85;
        }
        float _1017 = _999;
        _929 = _1017;
        if (_975)
        {
            _1003 = _87;
        }
        float _1019 = _1003;
        _935 = _1019;
        if (_975)
        {
            _941 = _89;
        }
    }
    float _1021 = _953;
    float _1023 = _947;
    float _1025 = _929;
    float _1027 = _935;
    float _1029 = _941;
    float _1031 = _959;
    float _1033 = _965;
    float _1035 = _973;
    bool _1037 = _1021 >= _877;
    bool _1039 = isnan(_1021);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(_877);
    bool _1045 = _1041 || _1043;
    float _1047 = _107 * _855;
    float _1049 = fma(_105, _857, _1047);
    float _1051 = fma(_109, _859, _1049);
    float _1053 = _1049;
    float _1055 = _1023;
    float _1057 = _1031;
    float _1059 = _1033;
    float _1061 = _1023;
    float _1063 = _1031;
    float _1065 = _1033;
    float _1067 = _1035;
    float _1069 = _1021;
    float _1071 = _1029;
    float _1073 = _1051;
    float _1075 = _1051;
    if (!_1045)
    {
        _907 = _95;
    }
    float _1077 = _907;
    float _1079 = _1077;
    float _1081 = _1077;
    if (!_1045)
    {
        _1053 = _97;
    }
    float _1083 = _1053;
    float _1085 = _1083;
    float _1087 = _1083;
    if (!_1045)
    {
        _909 = _99;
    }
    float _1089 = _909;
    bool _1091 = !_1045;
    float _1093 = _1089;
    float _1095 = _1089;
    if (!_1091)
    {
        bool _1097 = _1023 > _877;
        if (_1097)
        {
            _1055 = _877;
        }
        float _1099 = _1055;
        _1061 = _1099;
        if (!_1097)
        {
            _1079 = _1025;
        }
        float _1101 = _1079;
        float _1103 = _1101;
        if (!_1097)
        {
            _1085 = _1027;
        }
        float _1105 = _1085;
        float _1107 = _1105;
        if (!_1097)
        {
            _1093 = _1029;
        }
        float _1109 = _1093;
        float _1111 = _1109;
        if (!_1097)
        {
            _911 = _1021;
        }
        float _1113 = _911;
        float _1115 = _1113;
        if (_1097)
        {
            _1103 = _1025;
        }
        float _1117 = _1103;
        _1081 = _1117;
        if (_1097)
        {
            _1107 = _1027;
        }
        float _1119 = _1107;
        _1087 = _1119;
        if (_1097)
        {
            _1111 = _1029;
        }
        float _1121 = _1111;
        _1095 = _1121;
        if (_1097)
        {
            _1115 = _1021;
        }
        float _1123 = _1115;
        _913 = _1123;
        if (_1097)
        {
            _1057 = _95;
        }
        float _1125 = _1057;
        _1063 = _1125;
        if (_1097)
        {
            _1059 = _97;
        }
        float _1127 = _1059;
        _1065 = _1127;
        if (_1097)
        {
            _1067 = _99;
        }
    }
    float _1129 = _913;
    float _1131 = _1061;
    float _1133 = _1081;
    float _1135 = _1087;
    float _1137 = _1095;
    float _1139 = _1063;
    float _1141 = _1065;
    float _1143 = _1067;
    bool _1145 = _1129 >= _1051;
    bool _1147 = isnan(_1129);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan(_1051);
    bool _1153 = _1149 || _1151;
    float _1155 = _117 * _855;
    float _1157 = fma(_115, _857, _1155);
    float _1159 = fma(_119, _859, _1157);
    float _1161 = _1157;
    float _1163 = _1131;
    float _1165 = _1139;
    float _1167 = _1141;
    float _1169 = _1131;
    float _1171 = _1139;
    float _1173 = _1141;
    float _1175 = _1143;
    float _1177 = _1133;
    float _1179 = _1137;
    float _1181 = _1159;
    float _1183 = _1159;
    if (!_1153)
    {
        _1069 = _105;
    }
    float _1185 = _1069;
    float _1187 = _1185;
    float _1189 = _1185;
    if (!_1153)
    {
        _1071 = _107;
    }
    float _1191 = _1071;
    float _1193 = _1191;
    float _1195 = _1191;
    if (!_1153)
    {
        _1161 = _109;
    }
    float _1197 = _1161;
    bool _1199 = !_1153;
    float _1201 = _1197;
    float _1203 = _1197;
    if (!_1199)
    {
        bool _1205 = _1131 > _1051;
        if (_1205)
        {
            _1163 = _1051;
        }
        float _1207 = _1163;
        _1169 = _1207;
        if (!_1205)
        {
            _1187 = _1133;
        }
        float _1209 = _1187;
        float _1211 = _1209;
        if (!_1205)
        {
            _1193 = _1135;
        }
        float _1213 = _1193;
        float _1215 = _1213;
        if (!_1205)
        {
            _1201 = _1137;
        }
        float _1217 = _1201;
        float _1219 = _1217;
        if (!_1205)
        {
            _1073 = _1129;
        }
        float _1221 = _1073;
        float _1223 = _1221;
        if (_1205)
        {
            _1211 = _1133;
        }
        float _1225 = _1211;
        _1189 = _1225;
        if (_1205)
        {
            _1215 = _1135;
        }
        float _1227 = _1215;
        _1195 = _1227;
        if (_1205)
        {
            _1219 = _1137;
        }
        float _1229 = _1219;
        _1203 = _1229;
        if (_1205)
        {
            _1223 = _1129;
        }
        float _1231 = _1223;
        _1075 = _1231;
        if (_1205)
        {
            _1165 = _105;
        }
        float _1233 = _1165;
        _1171 = _1233;
        if (_1205)
        {
            _1167 = _107;
        }
        float _1235 = _1167;
        _1173 = _1235;
        if (_1205)
        {
            _1175 = _109;
        }
    }
    float _1237 = _1075;
    float _1239 = _1169;
    float _1241 = _1189;
    float _1243 = _1195;
    float _1245 = _1203;
    float _1247 = _1171;
    float _1249 = _1173;
    float _1251 = _1175;
    bool _1253 = _1237 >= _1159;
    bool _1255 = isnan(_1237);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(_1159);
    bool _1261 = _1257 || _1259;
    float _1263 = _127 * _855;
    float _1265 = fma(_125, _857, _1263);
    float _1267 = fma(_129, _859, _1265);
    float _1269 = _1265;
    float _1271 = _1239;
    float _1273 = _1247;
    float _1275 = _1249;
    float _1277 = _1239;
    float _1279 = _1247;
    float _1281 = _1249;
    float _1283 = _1251;
    float _1285 = _1241;
    float _1287 = _1243;
    float _1289 = _1267;
    float _1291 = _1267;
    float _1293 = _1237;
    if (!_1261)
    {
        _1177 = _115;
    }
    float _1295 = _1177;
    float _1297 = _1295;
    float _1299 = _1295;
    if (!_1261)
    {
        _1269 = _117;
    }
    float _1301 = _1269;
    float _1303 = _1301;
    float _1305 = _1301;
    if (!_1261)
    {
        _1179 = _119;
    }
    float _1307 = _1179;
    bool _1309 = !_1261;
    float _1311 = _1307;
    float _1313 = _1307;
    if (!_1309)
    {
        bool _1315 = _1239 > _1159;
        if (_1315)
        {
            _1271 = _1159;
        }
        float _1317 = _1271;
        _1277 = _1317;
        if (!_1315)
        {
            _1297 = _1241;
        }
        float _1319 = _1297;
        float _1321 = _1319;
        if (!_1315)
        {
            _1303 = _1243;
        }
        float _1323 = _1303;
        float _1325 = _1323;
        if (!_1315)
        {
            _1311 = _1245;
        }
        float _1327 = _1311;
        float _1329 = _1327;
        if (!_1315)
        {
            _1181 = _1237;
        }
        float _1331 = _1181;
        float _1333 = _1331;
        if (_1315)
        {
            _1321 = _1241;
        }
        float _1335 = _1321;
        _1299 = _1335;
        if (_1315)
        {
            _1325 = _1243;
        }
        float _1337 = _1325;
        _1305 = _1337;
        if (_1315)
        {
            _1329 = _1245;
        }
        float _1339 = _1329;
        _1313 = _1339;
        if (_1315)
        {
            _1333 = _1237;
        }
        float _1341 = _1333;
        _1183 = _1341;
        if (_1315)
        {
            _1273 = _115;
        }
        float _1343 = _1273;
        _1279 = _1343;
        if (_1315)
        {
            _1275 = _117;
        }
        float _1345 = _1275;
        _1281 = _1345;
        if (_1315)
        {
            _1283 = _119;
        }
    }
    float _1347 = _1183;
    float _1349 = _1277;
    float _1351 = _1299;
    float _1353 = _1305;
    float _1355 = _1313;
    float _1357 = _1279;
    float _1359 = _1281;
    float _1361 = _1283;
    bool _1363 = _1347 >= _1267;
    bool _1365 = isnan(_1347);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(_1267);
    bool _1371 = _1367 || _1369;
    float _1373 = _137 * _855;
    float _1375 = fma(_135, _857, _1373);
    float _1377 = fma(_139, _859, _1375);
    float _1379 = _1375;
    float _1381 = _1349;
    float _1383 = _1357;
    float _1385 = _1359;
    float _1387 = _1349;
    float _1389 = _1357;
    float _1391 = _1359;
    float _1393 = _1361;
    float _1395 = _1355;
    float _1397 = _1347;
    float _1399 = _1377;
    float _1401 = _1377;
    if (!_1371)
    {
        _1285 = _125;
    }
    float _1403 = _1285;
    float _1405 = _1403;
    float _1407 = _1403;
    if (!_1371)
    {
        _1287 = _127;
    }
    float _1409 = _1287;
    float _1411 = _1409;
    float _1413 = _1409;
    if (!_1371)
    {
        _1379 = _129;
    }
    float _1415 = _1379;
    bool _1417 = !_1371;
    float _1419 = _1415;
    float _1421 = _1415;
    if (!_1417)
    {
        bool _1423 = _1349 > _1267;
        if (_1423)
        {
            _1381 = _1267;
        }
        float _1425 = _1381;
        _1387 = _1425;
        if (!_1423)
        {
            _1405 = _1351;
        }
        float _1427 = _1405;
        float _1429 = _1427;
        if (!_1423)
        {
            _1411 = _1353;
        }
        float _1431 = _1411;
        float _1433 = _1431;
        if (!_1423)
        {
            _1419 = _1355;
        }
        float _1435 = _1419;
        float _1437 = _1435;
        if (!_1423)
        {
            _1289 = _1347;
        }
        float _1439 = _1289;
        float _1441 = _1439;
        if (_1423)
        {
            _1429 = _1351;
        }
        float _1443 = _1429;
        _1407 = _1443;
        if (_1423)
        {
            _1433 = _1353;
        }
        float _1445 = _1433;
        _1413 = _1445;
        if (_1423)
        {
            _1437 = _1355;
        }
        float _1447 = _1437;
        _1421 = _1447;
        if (_1423)
        {
            _1441 = _1347;
        }
        float _1449 = _1441;
        _1291 = _1449;
        if (_1423)
        {
            _1383 = _125;
        }
        float _1451 = _1383;
        _1389 = _1451;
        if (_1423)
        {
            _1385 = _127;
        }
        float _1453 = _1385;
        _1391 = _1453;
        if (_1423)
        {
            _1393 = _129;
        }
    }
    float _1455 = _1291;
    float _1457 = _1387;
    float _1459 = _1407;
    float _1461 = _1413;
    float _1463 = _1421;
    float _1465 = _1389;
    float _1467 = _1391;
    float _1469 = _1393;
    bool _1471 = _1455 >= _1377;
    bool _1473 = isnan(_1455);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(_1377);
    bool _1479 = _1475 || _1477;
    float _1481 = _147 * _855;
    float _1483 = fma(_145, _857, _1481);
    float _1485 = fma(_149, _859, _1483);
    float _1487 = _1457;
    float _1489 = _1465;
    float _1491 = _1467;
    float _1493 = _1457;
    float _1495 = _1465;
    float _1497 = _1467;
    float _1499 = _1469;
    float _1501 = _1459;
    float _1503 = _1461;
    float _1505 = _1485;
    float _1507 = _1485;
    if (!_1479)
    {
        _1395 = _135;
    }
    float _1509 = _1395;
    float _1511 = _1509;
    float _1513 = _1509;
    if (!_1479)
    {
        _1293 = _137;
    }
    float _1515 = _1293;
    float _1517 = _1515;
    float _1519 = _1515;
    if (!_1479)
    {
        _1397 = _139;
    }
    float _1521 = _1397;
    bool _1523 = !_1479;
    float _1525 = _1521;
    float _1527 = _1521;
    if (!_1523)
    {
        bool _1529 = _1457 > _1377;
        if (_1529)
        {
            _1487 = _1377;
        }
        float _1531 = _1487;
        _1493 = _1531;
        if (!_1529)
        {
            _1511 = _1459;
        }
        float _1533 = _1511;
        float _1535 = _1533;
        if (!_1529)
        {
            _1517 = _1461;
        }
        float _1537 = _1517;
        float _1539 = _1537;
        if (!_1529)
        {
            _1525 = _1463;
        }
        float _1541 = _1525;
        float _1543 = _1541;
        if (!_1529)
        {
            _1399 = _1455;
        }
        float _1545 = _1399;
        float _1547 = _1545;
        if (_1529)
        {
            _1535 = _1459;
        }
        float _1549 = _1535;
        _1513 = _1549;
        if (_1529)
        {
            _1539 = _1461;
        }
        float _1551 = _1539;
        _1519 = _1551;
        if (_1529)
        {
            _1543 = _1463;
        }
        float _1553 = _1543;
        _1527 = _1553;
        if (_1529)
        {
            _1547 = _1455;
        }
        float _1555 = _1547;
        _1401 = _1555;
        if (_1529)
        {
            _1489 = _135;
        }
        float _1557 = _1489;
        _1495 = _1557;
        if (_1529)
        {
            _1491 = _137;
        }
        float _1559 = _1491;
        _1497 = _1559;
        if (_1529)
        {
            _1499 = _139;
        }
    }
    float _1561 = _1401;
    float _1563 = _1493;
    float _1565 = _1513;
    float _1567 = _1519;
    float _1569 = _1527;
    float _1571 = _1495;
    float _1573 = _1497;
    float _1575 = _1499;
    bool _1577 = _1561 >= _1485;
    bool _1579 = isnan(_1561);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan(_1485);
    bool _1585 = _1581 || _1583;
    float _1587 = _157 * _855;
    float _1589 = fma(_155, _857, _1587);
    float _1591 = fma(_159, _859, _1589);
    float _1593 = _1589;
    float _1595 = _1563;
    float _1597 = _1571;
    float _1599 = _1573;
    float _1601 = _1563;
    float _1603 = _1571;
    float _1605 = _1573;
    float _1607 = _1575;
    float _1609 = _1569;
    float _1611 = _1565;
    float _1613 = _1591;
    float _1615 = _1591;
    if (!_1585)
    {
        _1501 = _145;
    }
    float _1617 = _1501;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1585)
    {
        _1503 = _147;
    }
    float _1623 = _1503;
    float _1625 = _1623;
    float _1627 = _1623;
    if (!_1585)
    {
        _1593 = _149;
    }
    float _1629 = _1593;
    bool _1631 = !_1585;
    float _1633 = _1629;
    float _1635 = _1629;
    if (!_1631)
    {
        bool _1637 = _1563 > _1485;
        if (_1637)
        {
            _1595 = _1485;
        }
        float _1639 = _1595;
        _1601 = _1639;
        if (!_1637)
        {
            _1619 = _1565;
        }
        float _1641 = _1619;
        float _1643 = _1641;
        if (!_1637)
        {
            _1625 = _1567;
        }
        float _1645 = _1625;
        float _1647 = _1645;
        if (!_1637)
        {
            _1633 = _1569;
        }
        float _1649 = _1633;
        float _1651 = _1649;
        if (!_1637)
        {
            _1505 = _1561;
        }
        float _1653 = _1505;
        float _1655 = _1653;
        if (_1637)
        {
            _1643 = _1565;
        }
        float _1657 = _1643;
        _1621 = _1657;
        if (_1637)
        {
            _1647 = _1567;
        }
        float _1659 = _1647;
        _1627 = _1659;
        if (_1637)
        {
            _1651 = _1569;
        }
        float _1661 = _1651;
        _1635 = _1661;
        if (_1637)
        {
            _1655 = _1561;
        }
        float _1663 = _1655;
        _1507 = _1663;
        if (_1637)
        {
            _1597 = _145;
        }
        float _1665 = _1597;
        _1603 = _1665;
        if (_1637)
        {
            _1599 = _147;
        }
        float _1667 = _1599;
        _1605 = _1667;
        if (_1637)
        {
            _1607 = _149;
        }
    }
    float _1669 = _1507;
    float _1671 = _1601;
    float _1673 = _1621;
    float _1675 = _1627;
    float _1677 = _1635;
    float _1679 = _1603;
    float _1681 = _1605;
    float _1683 = _1607;
    bool _1685 = _1669 >= _1591;
    bool _1687 = isnan(_1669);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(_1591);
    bool _1693 = _1689 || _1691;
    float _1695 = _167 * _855;
    float _1697 = fma(_165, _857, _1695);
    float _1699 = fma(_169, _859, _1697);
    float _1701 = _1697;
    float _1703 = _1671;
    float _1705 = _1679;
    float _1707 = _1681;
    float _1709 = _1671;
    float _1711 = _1679;
    float _1713 = _1681;
    float _1715 = _1683;
    float _1717 = _1675;
    float _1719 = _1673;
    float _1721 = _1699;
    float _1723 = _1699;
    if (!_1693)
    {
        _1609 = _155;
    }
    float _1725 = _1609;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1693)
    {
        _1701 = _157;
    }
    float _1731 = _1701;
    float _1733 = _1731;
    float _1735 = _1731;
    if (!_1693)
    {
        _1611 = _159;
    }
    float _1737 = _1611;
    bool _1739 = !_1693;
    float _1741 = _1737;
    float _1743 = _1737;
    if (!_1739)
    {
        bool _1745 = _1671 > _1591;
        if (_1745)
        {
            _1703 = _1591;
        }
        float _1747 = _1703;
        _1709 = _1747;
        if (!_1745)
        {
            _1727 = _1673;
        }
        float _1749 = _1727;
        float _1751 = _1749;
        if (!_1745)
        {
            _1733 = _1675;
        }
        float _1753 = _1733;
        float _1755 = _1753;
        if (!_1745)
        {
            _1741 = _1677;
        }
        float _1757 = _1741;
        float _1759 = _1757;
        if (!_1745)
        {
            _1613 = _1669;
        }
        float _1761 = _1613;
        float _1763 = _1761;
        if (_1745)
        {
            _1751 = _1673;
        }
        float _1765 = _1751;
        _1729 = _1765;
        if (_1745)
        {
            _1755 = _1675;
        }
        float _1767 = _1755;
        _1735 = _1767;
        if (_1745)
        {
            _1759 = _1677;
        }
        float _1769 = _1759;
        _1743 = _1769;
        if (_1745)
        {
            _1763 = _1669;
        }
        float _1771 = _1763;
        _1615 = _1771;
        if (_1745)
        {
            _1705 = _155;
        }
        float _1773 = _1705;
        _1711 = _1773;
        if (_1745)
        {
            _1707 = _157;
        }
        float _1775 = _1707;
        _1713 = _1775;
        if (_1745)
        {
            _1715 = _159;
        }
    }
    float _1777 = _1615;
    float _1779 = _1709;
    float _1781 = _1729;
    float _1783 = _1735;
    float _1785 = _1743;
    float _1787 = _1711;
    float _1789 = _1713;
    float _1791 = _1715;
    bool _1793 = _1777 >= _1699;
    bool _1795 = isnan(_1777);
    bool _1797 = _1793 || _1795;
    bool _1799 = isnan(_1699);
    bool _1801 = _1797 || _1799;
    float _1803 = _177 * _855;
    float _1805 = fma(_175, _857, _1803);
    float _1807 = fma(_179, _859, _1805);
    float _1809 = _1805;
    float _1811 = _1779;
    float _1813 = _1787;
    float _1815 = _1789;
    float _1817 = _1779;
    float _1819 = _1787;
    float _1821 = _1789;
    float _1823 = _1791;
    float _1825 = _1785;
    float _1827 = _1777;
    float _1829 = _1807;
    float _1831 = _1807;
    if (!_1801)
    {
        _1809 = _165;
    }
    float _1833 = _1809;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1801)
    {
        _1717 = _167;
    }
    float _1839 = _1717;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1801)
    {
        _1719 = _169;
    }
    float _1845 = _1719;
    bool _1847 = !_1801;
    float _1849 = _1845;
    float _1851 = _1845;
    if (!_1847)
    {
        bool _1853 = _1779 > _1699;
        if (_1853)
        {
            _1811 = _1699;
        }
        float _1855 = _1811;
        _1817 = _1855;
        if (!_1853)
        {
            _1835 = _1781;
        }
        float _1857 = _1835;
        float _1859 = _1857;
        if (!_1853)
        {
            _1841 = _1783;
        }
        float _1861 = _1841;
        float _1863 = _1861;
        if (!_1853)
        {
            _1849 = _1785;
        }
        float _1865 = _1849;
        float _1867 = _1865;
        if (!_1853)
        {
            _1721 = _1777;
        }
        float _1869 = _1721;
        float _1871 = _1869;
        if (_1853)
        {
            _1859 = _1781;
        }
        float _1873 = _1859;
        _1837 = _1873;
        if (_1853)
        {
            _1863 = _1783;
        }
        float _1875 = _1863;
        _1843 = _1875;
        if (_1853)
        {
            _1867 = _1785;
        }
        float _1877 = _1867;
        _1851 = _1877;
        if (_1853)
        {
            _1871 = _1777;
        }
        float _1879 = _1871;
        _1723 = _1879;
        if (_1853)
        {
            _1813 = _165;
        }
        float _1881 = _1813;
        _1819 = _1881;
        if (_1853)
        {
            _1815 = _167;
        }
        float _1883 = _1815;
        _1821 = _1883;
        if (_1853)
        {
            _1823 = _169;
        }
    }
    float _1885 = _1723;
    float _1887 = _1817;
    float _1889 = _1837;
    float _1891 = _1843;
    float _1893 = _1851;
    float _1895 = _1819;
    float _1897 = _1821;
    float _1899 = _1823;
    bool _1901 = _1885 >= _1807;
    bool _1903 = isnan(_1885);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(_1807);
    bool _1909 = _1905 || _1907;
    float _1911 = _187 * _855;
    float _1913 = fma(_185, _857, _1911);
    float _1915 = fma(_189, _859, _1913);
    float _1917 = _1913;
    float _1919 = _1887;
    float _1921 = _1895;
    float _1923 = _1897;
    float _1925 = _1887;
    float _1927 = _1895;
    float _1929 = _1897;
    float _1931 = _1899;
    float _1933 = _1891;
    float _1935 = _1893;
    float _1937 = _1915;
    float _1939 = _1915;
    if (!_1909)
    {
        _1825 = _175;
    }
    float _1941 = _1825;
    float _1943 = _1941;
    float _1945 = _1941;
    if (!_1909)
    {
        _1917 = _177;
    }
    float _1947 = _1917;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1909)
    {
        _1827 = _179;
    }
    float _1953 = _1827;
    bool _1955 = !_1909;
    float _1957 = _1953;
    float _1959 = _1953;
    if (!_1955)
    {
        bool _1961 = _1887 > _1807;
        if (_1961)
        {
            _1919 = _1807;
        }
        float _1963 = _1919;
        _1925 = _1963;
        if (!_1961)
        {
            _1943 = _1889;
        }
        float _1965 = _1943;
        float _1967 = _1965;
        if (!_1961)
        {
            _1949 = _1891;
        }
        float _1969 = _1949;
        float _1971 = _1969;
        if (!_1961)
        {
            _1957 = _1893;
        }
        float _1973 = _1957;
        float _1975 = _1973;
        if (!_1961)
        {
            _1829 = _1885;
        }
        float _1977 = _1829;
        float _1979 = _1977;
        if (_1961)
        {
            _1967 = _1889;
        }
        float _1981 = _1967;
        _1945 = _1981;
        if (_1961)
        {
            _1971 = _1891;
        }
        float _1983 = _1971;
        _1951 = _1983;
        if (_1961)
        {
            _1975 = _1893;
        }
        float _1985 = _1975;
        _1959 = _1985;
        if (_1961)
        {
            _1979 = _1885;
        }
        float _1987 = _1979;
        _1831 = _1987;
        if (_1961)
        {
            _1921 = _175;
        }
        float _1989 = _1921;
        _1927 = _1989;
        if (_1961)
        {
            _1923 = _177;
        }
        float _1991 = _1923;
        _1929 = _1991;
        if (_1961)
        {
            _1931 = _179;
        }
    }
    float _1993 = _1831;
    float _1995 = _1925;
    float _1997 = _1945;
    float _1999 = _1951;
    float _2001 = _1959;
    float _2003 = _1927;
    float _2005 = _1929;
    float _2007 = _1931;
    bool _2009 = _1993 >= _1915;
    bool _2011 = isnan(_1993);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(_1915);
    bool _2017 = _2013 || _2015;
    float _2019 = _197 * _855;
    float _2021 = fma(_195, _857, _2019);
    float _2023 = fma(_199, _859, _2021);
    float _2025 = _2021;
    float _2027 = _1995;
    float _2029 = _2003;
    float _2031 = _2005;
    float _2033 = _1995;
    float _2035 = _2003;
    float _2037 = _2005;
    float _2039 = _2007;
    float _2041 = _1997;
    float _2043 = _2001;
    float _2045 = _2023;
    float _2047 = _2023;
    if (!_2017)
    {
        _2025 = _185;
    }
    float _2049 = _2025;
    float _2051 = _2049;
    float _2053 = _2049;
    if (!_2017)
    {
        _1933 = _187;
    }
    float _2055 = _1933;
    float _2057 = _2055;
    float _2059 = _2055;
    if (!_2017)
    {
        _1935 = _189;
    }
    float _2061 = _1935;
    bool _2063 = !_2017;
    float _2065 = _2061;
    float _2067 = _2061;
    if (!_2063)
    {
        bool _2069 = _1995 > _1915;
        if (_2069)
        {
            _2027 = _1915;
        }
        float _2071 = _2027;
        _2033 = _2071;
        if (!_2069)
        {
            _2051 = _1997;
        }
        float _2073 = _2051;
        float _2075 = _2073;
        if (!_2069)
        {
            _2057 = _1999;
        }
        float _2077 = _2057;
        float _2079 = _2077;
        if (!_2069)
        {
            _2065 = _2001;
        }
        float _2081 = _2065;
        float _2083 = _2081;
        if (!_2069)
        {
            _1937 = _1993;
        }
        float _2085 = _1937;
        float _2087 = _2085;
        if (_2069)
        {
            _2075 = _1997;
        }
        float _2089 = _2075;
        _2053 = _2089;
        if (_2069)
        {
            _2079 = _1999;
        }
        float _2091 = _2079;
        _2059 = _2091;
        if (_2069)
        {
            _2083 = _2001;
        }
        float _2093 = _2083;
        _2067 = _2093;
        if (_2069)
        {
            _2087 = _1993;
        }
        float _2095 = _2087;
        _1939 = _2095;
        if (_2069)
        {
            _2029 = _185;
        }
        float _2097 = _2029;
        _2035 = _2097;
        if (_2069)
        {
            _2031 = _187;
        }
        float _2099 = _2031;
        _2037 = _2099;
        if (_2069)
        {
            _2039 = _189;
        }
    }
    float _2101 = _1939;
    float _2103 = _2033;
    float _2105 = _2053;
    float _2107 = _2059;
    float _2109 = _2067;
    float _2111 = _2035;
    float _2113 = _2037;
    float _2115 = _2039;
    bool _2117 = _2101 >= _2023;
    bool _2119 = isnan(_2101);
    bool _2121 = _2117 || _2119;
    bool _2123 = isnan(_2023);
    bool _2125 = _2121 || _2123;
    float _2127 = _207 * _855;
    float _2129 = fma(_205, _857, _2127);
    float _2131 = fma(_209, _859, _2129);
    float _2133 = _2129;
    float _2135 = _2103;
    float _2137 = _2111;
    float _2139 = _2113;
    float _2141 = _2103;
    float _2143 = _2111;
    float _2145 = _2113;
    float _2147 = _2115;
    float _2149 = _2107;
    float _2151 = _2109;
    float _2153 = _2131;
    float _2155 = _2131;
    if (!_2125)
    {
        _2041 = _195;
    }
    float _2157 = _2041;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2125)
    {
        _2133 = _197;
    }
    float _2163 = _2133;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2125)
    {
        _2043 = _199;
    }
    float _2169 = _2043;
    bool _2171 = !_2125;
    float _2173 = _2169;
    float _2175 = _2169;
    if (!_2171)
    {
        bool _2177 = _2103 > _2023;
        if (_2177)
        {
            _2135 = _2023;
        }
        float _2179 = _2135;
        _2141 = _2179;
        if (!_2177)
        {
            _2159 = _2105;
        }
        float _2181 = _2159;
        float _2183 = _2181;
        if (!_2177)
        {
            _2165 = _2107;
        }
        float _2185 = _2165;
        float _2187 = _2185;
        if (!_2177)
        {
            _2173 = _2109;
        }
        float _2189 = _2173;
        float _2191 = _2189;
        if (!_2177)
        {
            _2045 = _2101;
        }
        float _2193 = _2045;
        float _2195 = _2193;
        if (_2177)
        {
            _2183 = _2105;
        }
        float _2197 = _2183;
        _2161 = _2197;
        if (_2177)
        {
            _2187 = _2107;
        }
        float _2199 = _2187;
        _2167 = _2199;
        if (_2177)
        {
            _2191 = _2109;
        }
        float _2201 = _2191;
        _2175 = _2201;
        if (_2177)
        {
            _2195 = _2101;
        }
        float _2203 = _2195;
        _2047 = _2203;
        if (_2177)
        {
            _2137 = _195;
        }
        float _2205 = _2137;
        _2143 = _2205;
        if (_2177)
        {
            _2139 = _197;
        }
        float _2207 = _2139;
        _2145 = _2207;
        if (_2177)
        {
            _2147 = _199;
        }
    }
    float _2209 = _2047;
    float _2211 = _2141;
    float _2213 = _2161;
    float _2215 = _2167;
    float _2217 = _2175;
    float _2219 = _2143;
    float _2221 = _2145;
    float _2223 = _2147;
    bool _2225 = _2209 >= _2131;
    bool _2227 = isnan(_2209);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan(_2131);
    bool _2233 = _2229 || _2231;
    float _2235 = _217 * _855;
    float _2237 = fma(_215, _857, _2235);
    float _2239 = fma(_219, _859, _2237);
    float _2241 = _2237;
    float _2243 = _2211;
    float _2245 = _2219;
    float _2247 = _2221;
    float _2249 = _2219;
    float _2251 = _2221;
    float _2253 = _2211;
    float _2255 = _2223;
    float _2257 = _2217;
    float _2259 = _2213;
    float _2261 = _2239;
    float _2263 = _2239;
    if (!_2233)
    {
        _2241 = _205;
    }
    float _2265 = _2241;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2233)
    {
        _2149 = _207;
    }
    float _2271 = _2149;
    float _2273 = _2271;
    float _2275 = _2271;
    if (!_2233)
    {
        _2151 = _209;
    }
    float _2277 = _2151;
    bool _2279 = !_2233;
    float _2281 = _2277;
    float _2283 = _2277;
    if (!_2279)
    {
        bool _2285 = _2211 > _2131;
        if (_2285)
        {
            _2243 = _2131;
        }
        float _2287 = _2243;
        _2253 = _2287;
        if (!_2285)
        {
            _2267 = _2213;
        }
        float _2289 = _2267;
        float _2291 = _2289;
        if (!_2285)
        {
            _2273 = _2215;
        }
        float _2293 = _2273;
        float _2295 = _2293;
        if (!_2285)
        {
            _2281 = _2217;
        }
        float _2297 = _2281;
        float _2299 = _2297;
        if (!_2285)
        {
            _2153 = _2209;
        }
        float _2301 = _2153;
        float _2303 = _2301;
        if (_2285)
        {
            _2291 = _2213;
        }
        float _2305 = _2291;
        _2269 = _2305;
        if (_2285)
        {
            _2295 = _2215;
        }
        float _2307 = _2295;
        _2275 = _2307;
        if (_2285)
        {
            _2299 = _2217;
        }
        float _2309 = _2299;
        _2283 = _2309;
        if (_2285)
        {
            _2303 = _2209;
        }
        float _2311 = _2303;
        _2155 = _2311;
        if (_2285)
        {
            _2245 = _205;
        }
        float _2313 = _2245;
        _2249 = _2313;
        if (_2285)
        {
            _2247 = _207;
        }
        float _2315 = _2247;
        _2251 = _2315;
        if (_2285)
        {
            _2255 = _209;
        }
    }
    float _2317 = _2155;
    float _2319 = _2249;
    float _2321 = _2251;
    float _2323 = _2253;
    float _2325 = _2269;
    float _2327 = _2275;
    float _2329 = _2283;
    float _2331 = _2255;
    bool _2333 = _2317 >= _2239;
    bool _2335 = isnan(_2317);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(_2239);
    bool _2341 = _2337 || _2339;
    float _2343 = _227 * _855;
    float _2345 = fma(_225, _857, _2343);
    float _2347 = fma(_229, _859, _2345);
    float _2349 = _2345;
    float _2351 = _2323;
    float _2353 = _2331;
    float _2355 = _2323;
    float _2357 = _2321;
    float _2359 = _2319;
    if (!_2341)
    {
        _915 = _2319;
    }
    float _2361 = _915;
    float _2363 = _2361;
    float _2365 = _2361;
    if (!_2341)
    {
        _2349 = _2321;
    }
    float _2367 = _2349;
    float _2369 = _2367;
    float _2371 = _2367;
    if (!_2341)
    {
        _917 = _215;
    }
    float _2373 = _917;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2341)
    {
        _2257 = _217;
    }
    float _2379 = _2257;
    float _2381 = _2379;
    float _2383 = _2379;
    if (!_2341)
    {
        _2259 = _219;
    }
    float _2385 = _2259;
    bool _2387 = !_2341;
    float _2389 = _2385;
    float _2391 = _2385;
    if (!_2387)
    {
        bool _2393 = _2323 > _2239;
        if (_2393)
        {
            _2351 = _2239;
        }
        float _2395 = _2351;
        _2355 = _2395;
        if (!_2393)
        {
            _2375 = _2325;
        }
        float _2397 = _2375;
        float _2399 = _2397;
        if (!_2393)
        {
            _2381 = _2327;
        }
        float _2401 = _2381;
        float _2403 = _2401;
        if (!_2393)
        {
            _2389 = _2329;
        }
        float _2405 = _2389;
        float _2407 = _2405;
        if (!_2393)
        {
            _2261 = _2317;
        }
        float _2409 = _2261;
        float _2411 = _2409;
        if (!_2393)
        {
            _2363 = _2319;
        }
        float _2413 = _2363;
        float _2415 = _2413;
        if (!_2393)
        {
            _2369 = _2321;
        }
        float _2417 = _2369;
        float _2419 = _2417;
        if (_2393)
        {
            _2399 = _2325;
        }
        float _2421 = _2399;
        _2377 = _2421;
        if (_2393)
        {
            _2403 = _2327;
        }
        float _2423 = _2403;
        _2383 = _2423;
        if (_2393)
        {
            _2407 = _2329;
        }
        float _2425 = _2407;
        _2391 = _2425;
        if (_2393)
        {
            _2411 = _2317;
        }
        float _2427 = _2411;
        _2263 = _2427;
        if (_2393)
        {
            _2415 = _215;
        }
        float _2429 = _2415;
        _2365 = _2429;
        if (_2393)
        {
            _2419 = _217;
        }
        float _2431 = _2419;
        _2371 = _2431;
        if (_2393)
        {
            _2353 = _219;
        }
    }
    float _2433 = _2263;
    float _2435 = _2365;
    float _2437 = _2353;
    float _2439 = _2355;
    float _2441 = _2377;
    float _2443 = _2383;
    float _2445 = _2391;
    float _2447 = _2371;
    bool _2449 = _2433 >= _2347;
    bool _2451 = isnan(_2433);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(_2347);
    bool _2457 = _2453 || _2455;
    float _2459 = _2447;
    float _2461 = _2447;
    if (!_2457)
    {
        _2357 = _2435;
    }
    float _2463 = _2357;
    float _2465 = _2463;
    float _2467 = _2463;
    if (!_2457)
    {
        _2359 = _2437;
    }
    float _2469 = _2359;
    float _2471 = _2469;
    float _2473 = _2469;
    if (!_2457)
    {
        _919 = _225;
    }
    float _2475 = _919;
    float _2477 = _2475;
    float _2479 = _2475;
    if (!_2457)
    {
        _921 = _227;
    }
    float _2481 = _921;
    float _2483 = _2481;
    float _2485 = _2481;
    if (!_2457)
    {
        _923 = _229;
    }
    float _2487 = _923;
    bool _2489 = !_2457;
    float _2491 = _2487;
    float _2493 = _2487;
    if (!_2489)
    {
        bool _2495 = _2439 > _2347;
        if (!_2495)
        {
            _2477 = _2441;
        }
        float _2497 = _2477;
        float _2499 = _2497;
        if (!_2495)
        {
            _2483 = _2443;
        }
        float _2501 = _2483;
        float _2503 = _2501;
        if (!_2495)
        {
            _2491 = _2445;
        }
        float _2505 = _2491;
        float _2507 = _2505;
        if (!_2495)
        {
            _2465 = _2435;
        }
        float _2509 = _2465;
        float _2511 = _2509;
        if (!_2495)
        {
            _2471 = _2437;
        }
        float _2513 = _2471;
        _2473 = _2513;
        if (_2495)
        {
            _2499 = _2441;
        }
        float _2515 = _2499;
        _2479 = _2515;
        if (_2495)
        {
            _2503 = _2443;
        }
        float _2517 = _2503;
        _2485 = _2517;
        if (_2495)
        {
            _2507 = _2445;
        }
        float _2519 = _2507;
        _2493 = _2519;
        if (_2495)
        {
            _2511 = _225;
        }
        float _2521 = _2511;
        _2467 = _2521;
        if (_2495)
        {
            _2459 = _227;
        }
        float _2523 = _2459;
        _2461 = _2523;
        if (_2495)
        {
            _2473 = _229;
        }
    }
    float _2525 = _2461;
    float _2527 = _2485;
    float _2529 = _2467;
    float _2531 = _2479;
    float _2533 = _2473;
    float _2535 = _2493;
    float _2537 = -_2525;
    float _2539 = _2527 + _2537;
    float _2541 = -_2529;
    float _2543 = _2531 + _2541;
    float _2545 = -_2533;
    float _2547 = _2535 + _2545;
    float _2549 = -_2525;
    float _2551 = _87 + _2549;
    float _2553 = _2539 * _2539;
    float _2555 = _2539 * _2551;
    float _2557 = fma(_2543, _2543, _2553);
    float _2559 = -_2529;
    float _2561 = _85 + _2559;
    float _2563 = -_2533;
    float _2565 = _89 + _2563;
    float _2567 = fma(_2547, _2547, _2557);
    float _2569 = fma(_2543, _2561, _2555);
    float _2571 = fma(_2547, _2565, _2569);
    float _2573 = 1.0 / _2567;
    float _2575 = _2573 * 3.0;
    float _2577 = _2575 * _2571;
    float _2579 = rint(_2577);
    float _2581 = precise::max(0.0, _2579);
    float _2583 = precise::min(_2581, 3.0);
    float _2585 = trunc(_2583);
    int _2588 = int(_2585);
    bool _2590 = _2588 >= 2;
    bool _2592 = !_2590;
    float _2594 = _2543;
    float _2596 = _2539;
    float _2598 = _2547;
    float _2600 = _2529;
    float _2602 = _2531;
    float _2604 = _2525;
    float _2606 = _2527;
    float _2608 = _2533;
    float _2610 = _2535;
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
    float _2644;
    float _2646;
    float _2648;
    float _2650;
    if (!_2592)
    {
        bool _2612 = _2588 >= 3;
        bool _2614 = !_2612;
        if (!_2614)
        {
            bool _2616 = _2588 != 3;
            _2618 = _2616;
            if (!_2618)
            {
                _2620 = _85;
                _2622 = _87;
                _2624 = _89;
                _2626 = 1.0;
                _2628 = 0.0;
                _2630 = 0.0;
                _2632 = 0.0;
                _2634 = 0.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = 0.0;
                _2646 = 0.0;
                _2648 = 0.0;
                _2650 = 0.0;
                _2652 = true;
            }
        }
        else
        {
            _2620 = 0.0;
            _2622 = 0.0;
            _2624 = 0.0;
            _2626 = 0.0;
            _2628 = 0.0;
            _2630 = 0.0;
            _2632 = 0.0;
            _2634 = 0.0;
            _2636 = _85;
            _2638 = _87;
            _2640 = _89;
            _2642 = 1.0;
            _2644 = 0.0;
            _2646 = 0.0;
            _2648 = 0.0;
            _2650 = 0.0;
            _2652 = true;
        }
    }
    if ((!_2652) || _2618)
    {
        bool _2654;
        if (!_2618)
        {
            _2654 = _2588 >= 1;
        }
        if ((!_2654) || _2618)
        {
            bool _2656;
            if (!_2618)
            {
                _2656 = _2588 != 0;
            }
            if ((!_2656) && (!_2618))
            {
                _2620 = 0.0;
                _2622 = 0.0;
                _2624 = 0.0;
                _2626 = 0.0;
                _2628 = _85;
                _2630 = _87;
                _2632 = _89;
                _2634 = 1.0;
                _2636 = 0.0;
                _2638 = 0.0;
                _2640 = 0.0;
                _2642 = 0.0;
                _2644 = 0.0;
                _2646 = 0.0;
                _2648 = 0.0;
                _2650 = 0.0;
                _2652 = true;
            }
            else
            {
                _2618 = false;
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
                _2644 = 0.0;
                _2646 = 0.0;
                _2648 = 0.0;
                _2650 = 0.0;
                _2652 = true;
            }
        }
        else
        {
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
            _2644 = _85;
            _2646 = _87;
            _2648 = _89;
            _2650 = 1.0;
        }
    }
    _2652 = false;
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
    float _2682 = _2644;
    float _2684 = _2646;
    float _2686 = _2648;
    float _2688 = _2650;
    float _2690 = -_2525;
    float _2692 = _77 + _2690;
    float _2694 = -_2529;
    float _2696 = _75 + _2694;
    float _2698 = _2539 * _2692;
    float _2700 = -_2533;
    float _2702 = _79 + _2700;
    float _2704 = fma(_2543, _2696, _2698);
    float _2706 = fma(_2547, _2702, _2704);
    float _2708 = _2575 * _2706;
    float _2710 = rint(_2708);
    float _2712 = precise::max(0.0, _2710);
    float _2714 = precise::min(_2712, 3.0);
    float _2716 = trunc(_2714);
    int _2718 = int(_2716);
    bool _2720 = _2718 >= 2;
    bool _2722 = !_2720;
    float _2724 = as_type<float>(_2718);
    float _2726 = _2710;
    float _2728 = _2704;
    float _2730 = _2698;
    float _2732 = _2658;
    float _2734 = _2660;
    float _2736 = _2662;
    float _2738 = _2664;
    float _2740 = _2674;
    float _2742 = _2676;
    float _2744 = _2678;
    float _2746 = _2680;
    float _2748 = _2682;
    float _2750 = _2684;
    float _2752 = _2686;
    float _2754 = _2688;
    float _2772;
    float _2774;
    float _2776;
    float _2778;
    if (!_2722)
    {
        bool _2756 = _2718 >= 3;
        bool _2758 = !_2756;
        if (!_2758)
        {
            bool _2760 = _2718 != 3;
            _2762 = _2760;
            if (!_2762)
            {
                float _2764 = _75 + _2658;
                float _2766 = _77 + _2660;
                float _2768 = _79 + _2662;
                float _2770 = _2664 + 1.0;
                _2732 = _2764;
                _2734 = _2766;
                _2736 = _2768;
                _2738 = _2770;
                _2772 = _2666;
                _2774 = _2668;
                _2776 = _2670;
                _2778 = _2672;
                _2780 = true;
            }
        }
        else
        {
            float _2782 = _75 + _2674;
            float _2784 = _77 + _2676;
            float _2786 = _79 + _2678;
            float _2788 = _2680 + 1.0;
            _2772 = _2666;
            _2774 = _2668;
            _2776 = _2670;
            _2778 = _2672;
            _2740 = _2782;
            _2742 = _2784;
            _2744 = _2786;
            _2746 = _2788;
            _2780 = true;
        }
    }
    if ((!_2780) || _2762)
    {
        bool _2790;
        if (!_2762)
        {
            _2790 = _2718 >= 1;
        }
        if ((!_2790) || _2762)
        {
            if (!_2762)
            {
                bool _2792 = _2718 != 0;
                if (!_2792)
                {
                    float _2794 = _75 + _2666;
                    _2724 = _2794;
                }
                float _2796 = _2724;
                _2772 = _2796;
                if (!_2792)
                {
                    float _2798 = _77 + _2668;
                    _2726 = _2798;
                }
                float _2800 = _2726;
                _2774 = _2800;
                if (!_2792)
                {
                    float _2802 = _79 + _2670;
                    _2728 = _2802;
                }
                float _2804 = _2728;
                _2776 = _2804;
                if (!_2792)
                {
                    float _2806 = _2672 + 1.0;
                    _2730 = _2806;
                }
                float _2808 = _2730;
                bool _2810 = !_2792;
                _2778 = _2808;
                _2780 = _2810;
            }
            if ((!_2780) || _2762)
            {
                _2762 = false;
                _2772 = _2666;
                _2774 = _2668;
                _2776 = _2670;
                _2778 = _2672;
                _2780 = true;
            }
        }
        else
        {
            float _2812 = _75 + _2682;
            float _2814 = _77 + _2684;
            float _2816 = _79 + _2686;
            float _2818 = _2688 + 1.0;
            _2772 = _2666;
            _2774 = _2668;
            _2776 = _2670;
            _2778 = _2672;
            _2748 = _2812;
            _2750 = _2814;
            _2752 = _2816;
            _2754 = _2818;
        }
    }
    _2780 = false;
    float _2820 = _2732;
    float _2822 = _2734;
    float _2824 = _2736;
    float _2826 = _2738;
    float _2828 = _2772;
    float _2830 = _2774;
    float _2832 = _2776;
    float _2834 = _2778;
    float _2836 = _2740;
    float _2838 = _2742;
    float _2840 = _2744;
    float _2842 = _2746;
    float _2844 = _2748;
    float _2846 = _2750;
    float _2848 = _2752;
    float _2850 = _2754;
    float _2852 = -_2525;
    float _2854 = _97 + _2852;
    float _2856 = -_2529;
    float _2858 = _95 + _2856;
    float _2860 = _2539 * _2854;
    float _2862 = -_2533;
    float _2864 = _99 + _2862;
    float _2866 = fma(_2543, _2858, _2860);
    float _2868 = fma(_2547, _2864, _2866);
    float _2870 = _2575 * _2868;
    float _2872 = rint(_2870);
    float _2874 = precise::max(0.0, _2872);
    float _2876 = precise::min(_2874, 3.0);
    float _2878 = trunc(_2876);
    int _2880 = int(_2878);
    bool _2882 = _2880 >= 2;
    bool _2884 = !_2882;
    float _2886 = _2872;
    float _2888 = as_type<float>(_2880);
    float _2890 = _2860;
    float _2892 = _2866;
    float _2894 = _2820;
    float _2896 = _2822;
    float _2898 = _2824;
    float _2900 = _2826;
    float _2902 = _2836;
    float _2904 = _2838;
    float _2906 = _2840;
    float _2908 = _2842;
    float _2910 = _2844;
    float _2912 = _2846;
    float _2914 = _2848;
    float _2916 = _2850;
    float _2934;
    float _2936;
    float _2938;
    float _2940;
    if (!_2884)
    {
        bool _2918 = _2880 >= 3;
        bool _2920 = !_2918;
        if (!_2920)
        {
            bool _2922 = _2880 != 3;
            _2924 = _2922;
            if (!_2924)
            {
                float _2926 = _95 + _2820;
                float _2928 = _97 + _2822;
                float _2930 = _99 + _2824;
                float _2932 = _2826 + 1.0;
                _2894 = _2926;
                _2896 = _2928;
                _2898 = _2930;
                _2900 = _2932;
                _2934 = _2828;
                _2936 = _2830;
                _2938 = _2832;
                _2940 = _2834;
                _2942 = true;
            }
        }
        else
        {
            float _2944 = _95 + _2836;
            float _2946 = _97 + _2838;
            float _2948 = _99 + _2840;
            float _2950 = _2842 + 1.0;
            _2934 = _2828;
            _2936 = _2830;
            _2938 = _2832;
            _2940 = _2834;
            _2902 = _2944;
            _2904 = _2946;
            _2906 = _2948;
            _2908 = _2950;
            _2942 = true;
        }
    }
    if ((!_2942) || _2924)
    {
        bool _2952;
        if (!_2924)
        {
            _2952 = _2880 >= 1;
        }
        if ((!_2952) || _2924)
        {
            if (!_2924)
            {
                bool _2954 = _2880 != 0;
                if (!_2954)
                {
                    float _2956 = _95 + _2828;
                    _2886 = _2956;
                }
                float _2958 = _2886;
                _2934 = _2958;
                if (!_2954)
                {
                    float _2960 = _97 + _2830;
                    _2888 = _2960;
                }
                float _2962 = _2888;
                _2936 = _2962;
                if (!_2954)
                {
                    float _2964 = _99 + _2832;
                    _2890 = _2964;
                }
                float _2966 = _2890;
                _2938 = _2966;
                if (!_2954)
                {
                    float _2968 = _2834 + 1.0;
                    _2892 = _2968;
                }
                float _2970 = _2892;
                bool _2972 = !_2954;
                _2940 = _2970;
                _2942 = _2972;
            }
            if ((!_2942) || _2924)
            {
                _2924 = false;
                _2934 = _2828;
                _2936 = _2830;
                _2938 = _2832;
                _2940 = _2834;
                _2942 = true;
            }
        }
        else
        {
            float _2974 = _95 + _2844;
            float _2976 = _97 + _2846;
            float _2978 = _99 + _2848;
            float _2980 = _2850 + 1.0;
            _2934 = _2828;
            _2936 = _2830;
            _2938 = _2832;
            _2940 = _2834;
            _2910 = _2974;
            _2912 = _2976;
            _2914 = _2978;
            _2916 = _2980;
        }
    }
    _2942 = false;
    float _2982 = _2894;
    float _2984 = _2896;
    float _2986 = _2898;
    float _2988 = _2900;
    float _2990 = _2934;
    float _2992 = _2936;
    float _2994 = _2938;
    float _2996 = _2940;
    float _2998 = _2902;
    float _3000 = _2904;
    float _3002 = _2906;
    float _3004 = _2908;
    float _3006 = _2910;
    float _3008 = _2912;
    float _3010 = _2914;
    float _3012 = _2916;
    float _3014 = -_2525;
    float _3016 = _107 + _3014;
    float _3018 = -_2529;
    float _3020 = _105 + _3018;
    float _3022 = _2539 * _3016;
    float _3024 = -_2533;
    float _3026 = _109 + _3024;
    float _3028 = fma(_2543, _3020, _3022);
    float _3030 = fma(_2547, _3026, _3028);
    float _3032 = _2575 * _3030;
    float _3034 = rint(_3032);
    float _3036 = precise::max(0.0, _3034);
    float _3038 = precise::min(_3036, 3.0);
    float _3040 = trunc(_3038);
    int _3042 = int(_3040);
    bool _3044 = _3042 >= 2;
    bool _3046 = !_3044;
    float _3048 = as_type<float>(_3042);
    float _3050 = _3034;
    float _3052 = _3028;
    float _3054 = _3022;
    float _3056 = _2982;
    float _3058 = _2984;
    float _3060 = _2986;
    float _3062 = _2988;
    float _3064 = _2998;
    float _3066 = _3000;
    float _3068 = _3002;
    float _3070 = _3004;
    float _3072 = _3006;
    float _3074 = _3008;
    float _3076 = _3010;
    float _3078 = _3012;
    float _3096;
    float _3098;
    float _3100;
    float _3102;
    if (!_3046)
    {
        bool _3080 = _3042 >= 3;
        bool _3082 = !_3080;
        if (!_3082)
        {
            bool _3084 = _3042 != 3;
            _3086 = _3084;
            if (!_3086)
            {
                float _3088 = _105 + _2982;
                float _3090 = _107 + _2984;
                float _3092 = _109 + _2986;
                float _3094 = _2988 + 1.0;
                _3056 = _3088;
                _3058 = _3090;
                _3060 = _3092;
                _3062 = _3094;
                _3096 = _2990;
                _3098 = _2992;
                _3100 = _2994;
                _3102 = _2996;
                _3104 = true;
            }
        }
        else
        {
            float _3106 = _105 + _2998;
            float _3108 = _107 + _3000;
            float _3110 = _109 + _3002;
            float _3112 = _3004 + 1.0;
            _3096 = _2990;
            _3098 = _2992;
            _3100 = _2994;
            _3102 = _2996;
            _3064 = _3106;
            _3066 = _3108;
            _3068 = _3110;
            _3070 = _3112;
            _3104 = true;
        }
    }
    if ((!_3104) || _3086)
    {
        bool _3114;
        if (!_3086)
        {
            _3114 = _3042 >= 1;
        }
        if ((!_3114) || _3086)
        {
            if (!_3086)
            {
                bool _3116 = _3042 != 0;
                if (!_3116)
                {
                    float _3118 = _105 + _2990;
                    _3048 = _3118;
                }
                float _3120 = _3048;
                _3096 = _3120;
                if (!_3116)
                {
                    float _3122 = _107 + _2992;
                    _3050 = _3122;
                }
                float _3124 = _3050;
                _3098 = _3124;
                if (!_3116)
                {
                    float _3126 = _109 + _2994;
                    _3052 = _3126;
                }
                float _3128 = _3052;
                _3100 = _3128;
                if (!_3116)
                {
                    float _3130 = _2996 + 1.0;
                    _3054 = _3130;
                }
                float _3132 = _3054;
                bool _3134 = !_3116;
                _3102 = _3132;
                _3104 = _3134;
            }
            if ((!_3104) || _3086)
            {
                _3086 = false;
                _3096 = _2990;
                _3098 = _2992;
                _3100 = _2994;
                _3102 = _2996;
                _3104 = true;
            }
        }
        else
        {
            float _3136 = _105 + _3006;
            float _3138 = _107 + _3008;
            float _3140 = _109 + _3010;
            float _3142 = _3012 + 1.0;
            _3096 = _2990;
            _3098 = _2992;
            _3100 = _2994;
            _3102 = _2996;
            _3072 = _3136;
            _3074 = _3138;
            _3076 = _3140;
            _3078 = _3142;
        }
    }
    _3104 = false;
    float _3144 = _3056;
    float _3146 = _3058;
    float _3148 = _3060;
    float _3150 = _3062;
    float _3152 = _3096;
    float _3154 = _3098;
    float _3156 = _3100;
    float _3158 = _3102;
    float _3160 = _3064;
    float _3162 = _3066;
    float _3164 = _3068;
    float _3166 = _3070;
    float _3168 = _3072;
    float _3170 = _3074;
    float _3172 = _3076;
    float _3174 = _3078;
    float _3176 = -_2525;
    float _3178 = _117 + _3176;
    float _3180 = -_2529;
    float _3182 = _115 + _3180;
    float _3184 = _2539 * _3178;
    float _3186 = -_2533;
    float _3188 = _119 + _3186;
    float _3190 = fma(_2543, _3182, _3184);
    float _3192 = fma(_2547, _3188, _3190);
    float _3194 = _2575 * _3192;
    float _3196 = rint(_3194);
    float _3198 = precise::max(0.0, _3196);
    float _3200 = precise::min(_3198, 3.0);
    float _3202 = trunc(_3200);
    int _3204 = int(_3202);
    bool _3206 = _3204 >= 2;
    bool _3208 = !_3206;
    float _3210 = _3196;
    float _3212 = as_type<float>(_3204);
    float _3214 = _3184;
    float _3216 = _3190;
    float _3218 = _3144;
    float _3220 = _3146;
    float _3222 = _3148;
    float _3224 = _3150;
    float _3226 = _3160;
    float _3228 = _3162;
    float _3230 = _3164;
    float _3232 = _3166;
    float _3234 = _3168;
    float _3236 = _3170;
    float _3238 = _3172;
    float _3240 = _3174;
    float _3258;
    float _3260;
    float _3262;
    float _3264;
    if (!_3208)
    {
        bool _3242 = _3204 >= 3;
        bool _3244 = !_3242;
        if (!_3244)
        {
            bool _3246 = _3204 != 3;
            _3248 = _3246;
            if (!_3248)
            {
                float _3250 = _115 + _3144;
                float _3252 = _117 + _3146;
                float _3254 = _119 + _3148;
                float _3256 = _3150 + 1.0;
                _3218 = _3250;
                _3220 = _3252;
                _3222 = _3254;
                _3224 = _3256;
                _3258 = _3152;
                _3260 = _3154;
                _3262 = _3156;
                _3264 = _3158;
                _3266 = true;
            }
        }
        else
        {
            float _3268 = _115 + _3160;
            float _3270 = _117 + _3162;
            float _3272 = _119 + _3164;
            float _3274 = _3166 + 1.0;
            _3258 = _3152;
            _3260 = _3154;
            _3262 = _3156;
            _3264 = _3158;
            _3226 = _3268;
            _3228 = _3270;
            _3230 = _3272;
            _3232 = _3274;
            _3266 = true;
        }
    }
    if ((!_3266) || _3248)
    {
        bool _3276;
        if (!_3248)
        {
            _3276 = _3204 >= 1;
        }
        if ((!_3276) || _3248)
        {
            if (!_3248)
            {
                bool _3278 = _3204 != 0;
                if (!_3278)
                {
                    float _3280 = _115 + _3152;
                    _3210 = _3280;
                }
                float _3282 = _3210;
                _3258 = _3282;
                if (!_3278)
                {
                    float _3284 = _117 + _3154;
                    _3212 = _3284;
                }
                float _3286 = _3212;
                _3260 = _3286;
                if (!_3278)
                {
                    float _3288 = _119 + _3156;
                    _3214 = _3288;
                }
                float _3290 = _3214;
                _3262 = _3290;
                if (!_3278)
                {
                    float _3292 = _3158 + 1.0;
                    _3216 = _3292;
                }
                float _3294 = _3216;
                bool _3296 = !_3278;
                _3264 = _3294;
                _3266 = _3296;
            }
            if ((!_3266) || _3248)
            {
                _3248 = false;
                _3258 = _3152;
                _3260 = _3154;
                _3262 = _3156;
                _3264 = _3158;
                _3266 = true;
            }
        }
        else
        {
            float _3298 = _115 + _3168;
            float _3300 = _117 + _3170;
            float _3302 = _119 + _3172;
            float _3304 = _3174 + 1.0;
            _3258 = _3152;
            _3260 = _3154;
            _3262 = _3156;
            _3264 = _3158;
            _3234 = _3298;
            _3236 = _3300;
            _3238 = _3302;
            _3240 = _3304;
        }
    }
    _3266 = false;
    float _3306 = _3218;
    float _3308 = _3220;
    float _3310 = _3222;
    float _3312 = _3224;
    float _3314 = _3258;
    float _3316 = _3260;
    float _3318 = _3262;
    float _3320 = _3264;
    float _3322 = _3226;
    float _3324 = _3228;
    float _3326 = _3230;
    float _3328 = _3232;
    float _3330 = _3234;
    float _3332 = _3236;
    float _3334 = _3238;
    float _3336 = _3240;
    float _3338 = -_2525;
    float _3340 = _127 + _3338;
    float _3342 = -_2529;
    float _3344 = _125 + _3342;
    float _3346 = _2539 * _3340;
    float _3348 = -_2533;
    float _3350 = _129 + _3348;
    float _3352 = fma(_2543, _3344, _3346);
    float _3354 = fma(_2547, _3350, _3352);
    float _3356 = _2575 * _3354;
    float _3358 = rint(_3356);
    float _3360 = precise::max(0.0, _3358);
    float _3362 = precise::min(_3360, 3.0);
    float _3364 = trunc(_3362);
    int _3366 = int(_3364);
    bool _3368 = _3366 >= 2;
    bool _3370 = !_3368;
    float _3372 = as_type<float>(_3366);
    float _3374 = _3358;
    float _3376 = _3352;
    float _3378 = _3346;
    float _3380 = _3306;
    float _3382 = _3308;
    float _3384 = _3310;
    float _3386 = _3312;
    float _3388 = _3322;
    float _3390 = _3324;
    float _3392 = _3326;
    float _3394 = _3328;
    float _3396 = _3330;
    float _3398 = _3332;
    float _3400 = _3334;
    float _3402 = _3336;
    float _3420;
    float _3422;
    float _3424;
    float _3426;
    if (!_3370)
    {
        bool _3404 = _3366 >= 3;
        bool _3406 = !_3404;
        if (!_3406)
        {
            bool _3408 = _3366 != 3;
            _3410 = _3408;
            if (!_3410)
            {
                float _3412 = _125 + _3306;
                float _3414 = _127 + _3308;
                float _3416 = _129 + _3310;
                float _3418 = _3312 + 1.0;
                _3380 = _3412;
                _3382 = _3414;
                _3384 = _3416;
                _3386 = _3418;
                _3420 = _3314;
                _3422 = _3316;
                _3424 = _3318;
                _3426 = _3320;
                _3428 = true;
            }
        }
        else
        {
            float _3430 = _125 + _3322;
            float _3432 = _127 + _3324;
            float _3434 = _129 + _3326;
            float _3436 = _3328 + 1.0;
            _3420 = _3314;
            _3422 = _3316;
            _3424 = _3318;
            _3426 = _3320;
            _3388 = _3430;
            _3390 = _3432;
            _3392 = _3434;
            _3394 = _3436;
            _3428 = true;
        }
    }
    if ((!_3428) || _3410)
    {
        bool _3438;
        if (!_3410)
        {
            _3438 = _3366 >= 1;
        }
        if ((!_3438) || _3410)
        {
            if (!_3410)
            {
                bool _3440 = _3366 != 0;
                if (!_3440)
                {
                    float _3442 = _125 + _3314;
                    _3372 = _3442;
                }
                float _3444 = _3372;
                _3420 = _3444;
                if (!_3440)
                {
                    float _3446 = _127 + _3316;
                    _3374 = _3446;
                }
                float _3448 = _3374;
                _3422 = _3448;
                if (!_3440)
                {
                    float _3450 = _129 + _3318;
                    _3376 = _3450;
                }
                float _3452 = _3376;
                _3424 = _3452;
                if (!_3440)
                {
                    float _3454 = _3320 + 1.0;
                    _3378 = _3454;
                }
                float _3456 = _3378;
                bool _3458 = !_3440;
                _3426 = _3456;
                _3428 = _3458;
            }
            if ((!_3428) || _3410)
            {
                _3410 = false;
                _3420 = _3314;
                _3422 = _3316;
                _3424 = _3318;
                _3426 = _3320;
                _3428 = true;
            }
        }
        else
        {
            float _3460 = _125 + _3330;
            float _3462 = _127 + _3332;
            float _3464 = _129 + _3334;
            float _3466 = _3336 + 1.0;
            _3420 = _3314;
            _3422 = _3316;
            _3424 = _3318;
            _3426 = _3320;
            _3396 = _3460;
            _3398 = _3462;
            _3400 = _3464;
            _3402 = _3466;
        }
    }
    _3428 = false;
    float _3468 = _3380;
    float _3470 = _3382;
    float _3472 = _3384;
    float _3474 = _3386;
    float _3476 = _3420;
    float _3478 = _3422;
    float _3480 = _3424;
    float _3482 = _3426;
    float _3484 = _3388;
    float _3486 = _3390;
    float _3488 = _3392;
    float _3490 = _3394;
    float _3492 = _3396;
    float _3494 = _3398;
    float _3496 = _3400;
    float _3498 = _3402;
    float _3500 = -_2525;
    float _3502 = _137 + _3500;
    float _3504 = -_2529;
    float _3506 = _135 + _3504;
    float _3508 = _2539 * _3502;
    float _3510 = -_2533;
    float _3512 = _139 + _3510;
    float _3514 = fma(_2543, _3506, _3508);
    float _3516 = fma(_2547, _3512, _3514);
    float _3518 = _2575 * _3516;
    float _3520 = rint(_3518);
    float _3522 = precise::max(0.0, _3520);
    float _3524 = precise::min(_3522, 3.0);
    float _3526 = trunc(_3524);
    int _3528 = int(_3526);
    bool _3530 = _3528 >= 2;
    bool _3532 = !_3530;
    float _3534 = _3520;
    float _3536 = as_type<float>(_3528);
    float _3538 = _3508;
    float _3540 = _3514;
    float _3542 = _3468;
    float _3544 = _3470;
    float _3546 = _3472;
    float _3548 = _3474;
    float _3550 = _3484;
    float _3552 = _3486;
    float _3554 = _3488;
    float _3556 = _3490;
    float _3558 = _3492;
    float _3560 = _3494;
    float _3562 = _3496;
    float _3564 = _3498;
    float _3582;
    float _3584;
    float _3586;
    float _3588;
    if (!_3532)
    {
        bool _3566 = _3528 >= 3;
        bool _3568 = !_3566;
        if (!_3568)
        {
            bool _3570 = _3528 != 3;
            _3572 = _3570;
            if (!_3572)
            {
                float _3574 = _135 + _3468;
                float _3576 = _137 + _3470;
                float _3578 = _139 + _3472;
                float _3580 = _3474 + 1.0;
                _3542 = _3574;
                _3544 = _3576;
                _3546 = _3578;
                _3548 = _3580;
                _3582 = _3476;
                _3584 = _3478;
                _3586 = _3480;
                _3588 = _3482;
                _3590 = true;
            }
        }
        else
        {
            float _3592 = _135 + _3484;
            float _3594 = _137 + _3486;
            float _3596 = _139 + _3488;
            float _3598 = _3490 + 1.0;
            _3582 = _3476;
            _3584 = _3478;
            _3586 = _3480;
            _3588 = _3482;
            _3550 = _3592;
            _3552 = _3594;
            _3554 = _3596;
            _3556 = _3598;
            _3590 = true;
        }
    }
    if ((!_3590) || _3572)
    {
        bool _3600;
        if (!_3572)
        {
            _3600 = _3528 >= 1;
        }
        if ((!_3600) || _3572)
        {
            if (!_3572)
            {
                bool _3602 = _3528 != 0;
                if (!_3602)
                {
                    float _3604 = _135 + _3476;
                    _3534 = _3604;
                }
                float _3606 = _3534;
                _3582 = _3606;
                if (!_3602)
                {
                    float _3608 = _137 + _3478;
                    _3536 = _3608;
                }
                float _3610 = _3536;
                _3584 = _3610;
                if (!_3602)
                {
                    float _3612 = _139 + _3480;
                    _3538 = _3612;
                }
                float _3614 = _3538;
                _3586 = _3614;
                if (!_3602)
                {
                    float _3616 = _3482 + 1.0;
                    _3540 = _3616;
                }
                float _3618 = _3540;
                bool _3620 = !_3602;
                _3588 = _3618;
                _3590 = _3620;
            }
            if ((!_3590) || _3572)
            {
                _3572 = false;
                _3582 = _3476;
                _3584 = _3478;
                _3586 = _3480;
                _3588 = _3482;
                _3590 = true;
            }
        }
        else
        {
            float _3622 = _135 + _3492;
            float _3624 = _137 + _3494;
            float _3626 = _139 + _3496;
            float _3628 = _3498 + 1.0;
            _3582 = _3476;
            _3584 = _3478;
            _3586 = _3480;
            _3588 = _3482;
            _3558 = _3622;
            _3560 = _3624;
            _3562 = _3626;
            _3564 = _3628;
        }
    }
    _3590 = false;
    float _3630 = _3542;
    float _3632 = _3544;
    float _3634 = _3546;
    float _3636 = _3548;
    float _3638 = _3582;
    float _3640 = _3584;
    float _3642 = _3586;
    float _3644 = _3588;
    float _3646 = _3550;
    float _3648 = _3552;
    float _3650 = _3554;
    float _3652 = _3556;
    float _3654 = _3558;
    float _3656 = _3560;
    float _3658 = _3562;
    float _3660 = _3564;
    float _3662 = -_2525;
    float _3664 = _147 + _3662;
    float _3666 = -_2529;
    float _3668 = _145 + _3666;
    float _3670 = _2539 * _3664;
    float _3672 = -_2533;
    float _3674 = _149 + _3672;
    float _3676 = fma(_2543, _3668, _3670);
    float _3678 = fma(_2547, _3674, _3676);
    float _3680 = _2575 * _3678;
    float _3682 = rint(_3680);
    float _3684 = precise::max(0.0, _3682);
    float _3686 = precise::min(_3684, 3.0);
    float _3688 = trunc(_3686);
    int _3690 = int(_3688);
    bool _3692 = _3690 >= 2;
    bool _3694 = !_3692;
    float _3696 = _3670;
    float _3698 = _3676;
    float _3700 = _3682;
    float _3702 = as_type<float>(_3690);
    float _3704 = _3630;
    float _3706 = _3632;
    float _3708 = _3634;
    float _3710 = _3636;
    float _3712 = _3646;
    float _3714 = _3648;
    float _3716 = _3650;
    float _3718 = _3652;
    float _3720 = _3654;
    float _3722 = _3656;
    float _3724 = _3658;
    float _3726 = _3660;
    float _3744;
    float _3746;
    float _3748;
    float _3750;
    if (!_3694)
    {
        bool _3728 = _3690 >= 3;
        bool _3730 = !_3728;
        if (!_3730)
        {
            bool _3732 = _3690 != 3;
            _3734 = _3732;
            if (!_3734)
            {
                float _3736 = _145 + _3630;
                float _3738 = _147 + _3632;
                float _3740 = _149 + _3634;
                float _3742 = _3636 + 1.0;
                _3704 = _3736;
                _3706 = _3738;
                _3708 = _3740;
                _3710 = _3742;
                _3744 = _3638;
                _3746 = _3640;
                _3748 = _3642;
                _3750 = _3644;
                _3752 = true;
            }
        }
        else
        {
            float _3754 = _145 + _3646;
            float _3756 = _147 + _3648;
            float _3758 = _149 + _3650;
            float _3760 = _3652 + 1.0;
            _3744 = _3638;
            _3746 = _3640;
            _3748 = _3642;
            _3750 = _3644;
            _3712 = _3754;
            _3714 = _3756;
            _3716 = _3758;
            _3718 = _3760;
            _3752 = true;
        }
    }
    if ((!_3752) || _3734)
    {
        bool _3762;
        if (!_3734)
        {
            _3762 = _3690 >= 1;
        }
        if ((!_3762) || _3734)
        {
            if (!_3734)
            {
                bool _3764 = _3690 != 0;
                if (!_3764)
                {
                    float _3766 = _145 + _3638;
                    _3696 = _3766;
                }
                float _3768 = _3696;
                _3744 = _3768;
                if (!_3764)
                {
                    float _3770 = _147 + _3640;
                    _3698 = _3770;
                }
                float _3772 = _3698;
                _3746 = _3772;
                if (!_3764)
                {
                    float _3774 = _149 + _3642;
                    _3700 = _3774;
                }
                float _3776 = _3700;
                _3748 = _3776;
                if (!_3764)
                {
                    float _3778 = _3644 + 1.0;
                    _3702 = _3778;
                }
                float _3780 = _3702;
                bool _3782 = !_3764;
                _3750 = _3780;
                _3752 = _3782;
            }
            if ((!_3752) || _3734)
            {
                _3734 = false;
                _3744 = _3638;
                _3746 = _3640;
                _3748 = _3642;
                _3750 = _3644;
                _3752 = true;
            }
        }
        else
        {
            float _3784 = _145 + _3654;
            float _3786 = _147 + _3656;
            float _3788 = _149 + _3658;
            float _3790 = _3660 + 1.0;
            _3744 = _3638;
            _3746 = _3640;
            _3748 = _3642;
            _3750 = _3644;
            _3720 = _3784;
            _3722 = _3786;
            _3724 = _3788;
            _3726 = _3790;
        }
    }
    _3752 = false;
    float _3792 = _3704;
    float _3794 = _3706;
    float _3796 = _3708;
    float _3798 = _3710;
    float _3800 = _3744;
    float _3802 = _3746;
    float _3804 = _3748;
    float _3806 = _3750;
    float _3808 = _3712;
    float _3810 = _3714;
    float _3812 = _3716;
    float _3814 = _3718;
    float _3816 = _3720;
    float _3818 = _3722;
    float _3820 = _3724;
    float _3822 = _3726;
    float _3824 = -_2525;
    float _3826 = _157 + _3824;
    float _3828 = -_2529;
    float _3830 = _155 + _3828;
    float _3832 = _2539 * _3826;
    float _3834 = -_2533;
    float _3836 = _159 + _3834;
    float _3838 = fma(_2543, _3830, _3832);
    float _3840 = fma(_2547, _3836, _3838);
    float _3842 = _2575 * _3840;
    float _3844 = rint(_3842);
    float _3846 = precise::max(0.0, _3844);
    float _3848 = precise::min(_3846, 3.0);
    float _3850 = trunc(_3848);
    int _3852 = int(_3850);
    bool _3854 = _3852 >= 2;
    bool _3856 = !_3854;
    float _3858 = _3844;
    float _3860 = as_type<float>(_3852);
    float _3862 = _3832;
    float _3864 = _3838;
    float _3866 = _3792;
    float _3868 = _3794;
    float _3870 = _3796;
    float _3872 = _3798;
    float _3874 = _3808;
    float _3876 = _3810;
    float _3878 = _3812;
    float _3880 = _3814;
    float _3882 = _3816;
    float _3884 = _3818;
    float _3886 = _3820;
    float _3888 = _3822;
    float _3906;
    float _3908;
    float _3910;
    float _3912;
    if (!_3856)
    {
        bool _3890 = _3852 >= 3;
        bool _3892 = !_3890;
        if (!_3892)
        {
            bool _3894 = _3852 != 3;
            _3896 = _3894;
            if (!_3896)
            {
                float _3898 = _155 + _3792;
                float _3900 = _157 + _3794;
                float _3902 = _159 + _3796;
                float _3904 = _3798 + 1.0;
                _3866 = _3898;
                _3868 = _3900;
                _3870 = _3902;
                _3872 = _3904;
                _3906 = _3800;
                _3908 = _3802;
                _3910 = _3804;
                _3912 = _3806;
                _3914 = true;
            }
        }
        else
        {
            float _3916 = _155 + _3808;
            float _3918 = _157 + _3810;
            float _3920 = _159 + _3812;
            float _3922 = _3814 + 1.0;
            _3906 = _3800;
            _3908 = _3802;
            _3910 = _3804;
            _3912 = _3806;
            _3874 = _3916;
            _3876 = _3918;
            _3878 = _3920;
            _3880 = _3922;
            _3914 = true;
        }
    }
    if ((!_3914) || _3896)
    {
        bool _3924;
        if (!_3896)
        {
            _3924 = _3852 >= 1;
        }
        if ((!_3924) || _3896)
        {
            if (!_3896)
            {
                bool _3926 = _3852 != 0;
                if (!_3926)
                {
                    float _3928 = _155 + _3800;
                    _3858 = _3928;
                }
                float _3930 = _3858;
                _3906 = _3930;
                if (!_3926)
                {
                    float _3932 = _157 + _3802;
                    _3860 = _3932;
                }
                float _3934 = _3860;
                _3908 = _3934;
                if (!_3926)
                {
                    float _3936 = _159 + _3804;
                    _3862 = _3936;
                }
                float _3938 = _3862;
                _3910 = _3938;
                if (!_3926)
                {
                    float _3940 = _3806 + 1.0;
                    _3864 = _3940;
                }
                float _3942 = _3864;
                bool _3944 = !_3926;
                _3912 = _3942;
                _3914 = _3944;
            }
            if ((!_3914) || _3896)
            {
                _3896 = false;
                _3906 = _3800;
                _3908 = _3802;
                _3910 = _3804;
                _3912 = _3806;
                _3914 = true;
            }
        }
        else
        {
            float _3946 = _155 + _3816;
            float _3948 = _157 + _3818;
            float _3950 = _159 + _3820;
            float _3952 = _3822 + 1.0;
            _3906 = _3800;
            _3908 = _3802;
            _3910 = _3804;
            _3912 = _3806;
            _3882 = _3946;
            _3884 = _3948;
            _3886 = _3950;
            _3888 = _3952;
        }
    }
    _3914 = false;
    float _3954 = _3866;
    float _3956 = _3868;
    float _3958 = _3870;
    float _3960 = _3872;
    float _3962 = _3906;
    float _3964 = _3908;
    float _3966 = _3910;
    float _3968 = _3912;
    float _3970 = _3874;
    float _3972 = _3876;
    float _3974 = _3878;
    float _3976 = _3880;
    float _3978 = _3882;
    float _3980 = _3884;
    float _3982 = _3886;
    float _3984 = _3888;
    float _3986 = -_2525;
    float _3988 = _167 + _3986;
    float _3990 = -_2529;
    float _3992 = _165 + _3990;
    float _3994 = _2539 * _3988;
    float _3996 = -_2533;
    float _3998 = _169 + _3996;
    float _4000 = fma(_2543, _3992, _3994);
    float _4002 = fma(_2547, _3998, _4000);
    float _4004 = _2575 * _4002;
    float _4006 = rint(_4004);
    float _4008 = precise::max(0.0, _4006);
    float _4010 = precise::min(_4008, 3.0);
    float _4012 = trunc(_4010);
    int _4014 = int(_4012);
    bool _4016 = _4014 >= 2;
    bool _4018 = !_4016;
    float _4020 = as_type<float>(_4014);
    float _4022 = _4006;
    float _4024 = _4000;
    float _4026 = _3994;
    float _4028 = _3954;
    float _4030 = _3956;
    float _4032 = _3958;
    float _4034 = _3960;
    float _4036 = _3970;
    float _4038 = _3972;
    float _4040 = _3974;
    float _4042 = _3976;
    float _4044 = _3978;
    float _4046 = _3980;
    float _4048 = _3982;
    float _4050 = _3984;
    float _4068;
    float _4070;
    float _4072;
    float _4074;
    if (!_4018)
    {
        bool _4052 = _4014 >= 3;
        bool _4054 = !_4052;
        if (!_4054)
        {
            bool _4056 = _4014 != 3;
            _4058 = _4056;
            if (!_4058)
            {
                float _4060 = _165 + _3954;
                float _4062 = _167 + _3956;
                float _4064 = _169 + _3958;
                float _4066 = _3960 + 1.0;
                _4028 = _4060;
                _4030 = _4062;
                _4032 = _4064;
                _4034 = _4066;
                _4068 = _3962;
                _4070 = _3964;
                _4072 = _3966;
                _4074 = _3968;
                _4076 = true;
            }
        }
        else
        {
            float _4078 = _165 + _3970;
            float _4080 = _167 + _3972;
            float _4082 = _169 + _3974;
            float _4084 = _3976 + 1.0;
            _4068 = _3962;
            _4070 = _3964;
            _4072 = _3966;
            _4074 = _3968;
            _4036 = _4078;
            _4038 = _4080;
            _4040 = _4082;
            _4042 = _4084;
            _4076 = true;
        }
    }
    if ((!_4076) || _4058)
    {
        bool _4086;
        if (!_4058)
        {
            _4086 = _4014 >= 1;
        }
        if ((!_4086) || _4058)
        {
            if (!_4058)
            {
                bool _4088 = _4014 != 0;
                if (!_4088)
                {
                    float _4090 = _165 + _3962;
                    _4020 = _4090;
                }
                float _4092 = _4020;
                _4068 = _4092;
                if (!_4088)
                {
                    float _4094 = _167 + _3964;
                    _4022 = _4094;
                }
                float _4096 = _4022;
                _4070 = _4096;
                if (!_4088)
                {
                    float _4098 = _169 + _3966;
                    _4024 = _4098;
                }
                float _4100 = _4024;
                _4072 = _4100;
                if (!_4088)
                {
                    float _4102 = _3968 + 1.0;
                    _4026 = _4102;
                }
                float _4104 = _4026;
                bool _4106 = !_4088;
                _4074 = _4104;
                _4076 = _4106;
            }
            if ((!_4076) || _4058)
            {
                _4058 = false;
                _4068 = _3962;
                _4070 = _3964;
                _4072 = _3966;
                _4074 = _3968;
                _4076 = true;
            }
        }
        else
        {
            float _4108 = _165 + _3978;
            float _4110 = _167 + _3980;
            float _4112 = _169 + _3982;
            float _4114 = _3984 + 1.0;
            _4068 = _3962;
            _4070 = _3964;
            _4072 = _3966;
            _4074 = _3968;
            _4044 = _4108;
            _4046 = _4110;
            _4048 = _4112;
            _4050 = _4114;
        }
    }
    _4076 = false;
    float _4116 = _4028;
    float _4118 = _4030;
    float _4120 = _4032;
    float _4122 = _4034;
    float _4124 = _4068;
    float _4126 = _4070;
    float _4128 = _4072;
    float _4130 = _4074;
    float _4132 = _4036;
    float _4134 = _4038;
    float _4136 = _4040;
    float _4138 = _4042;
    float _4140 = _4044;
    float _4142 = _4046;
    float _4144 = _4048;
    float _4146 = _4050;
    float _4148 = -_2525;
    float _4150 = _177 + _4148;
    float _4152 = -_2529;
    float _4154 = _175 + _4152;
    float _4156 = _2539 * _4150;
    float _4158 = -_2533;
    float _4160 = _179 + _4158;
    float _4162 = fma(_2543, _4154, _4156);
    float _4164 = fma(_2547, _4160, _4162);
    float _4166 = _2575 * _4164;
    float _4168 = rint(_4166);
    float _4170 = precise::max(0.0, _4168);
    float _4172 = precise::min(_4170, 3.0);
    float _4174 = trunc(_4172);
    int _4176 = int(_4174);
    bool _4178 = _4176 >= 2;
    bool _4180 = !_4178;
    float _4182 = _4168;
    float _4184 = as_type<float>(_4176);
    float _4186 = _4156;
    float _4188 = _4162;
    float _4190 = _4116;
    float _4192 = _4118;
    float _4194 = _4120;
    float _4196 = _4122;
    float _4198 = _4132;
    float _4200 = _4134;
    float _4202 = _4136;
    float _4204 = _4138;
    float _4206 = _4140;
    float _4208 = _4142;
    float _4210 = _4144;
    float _4212 = _4146;
    float _4230;
    float _4232;
    float _4234;
    float _4236;
    if (!_4180)
    {
        bool _4214 = _4176 >= 3;
        bool _4216 = !_4214;
        if (!_4216)
        {
            bool _4218 = _4176 != 3;
            _4220 = _4218;
            if (!_4220)
            {
                float _4222 = _175 + _4116;
                float _4224 = _177 + _4118;
                float _4226 = _179 + _4120;
                float _4228 = _4122 + 1.0;
                _4190 = _4222;
                _4192 = _4224;
                _4194 = _4226;
                _4196 = _4228;
                _4230 = _4124;
                _4232 = _4126;
                _4234 = _4128;
                _4236 = _4130;
                _4238 = true;
            }
        }
        else
        {
            float _4240 = _175 + _4132;
            float _4242 = _177 + _4134;
            float _4244 = _179 + _4136;
            float _4246 = _4138 + 1.0;
            _4230 = _4124;
            _4232 = _4126;
            _4234 = _4128;
            _4236 = _4130;
            _4198 = _4240;
            _4200 = _4242;
            _4202 = _4244;
            _4204 = _4246;
            _4238 = true;
        }
    }
    if ((!_4238) || _4220)
    {
        bool _4248;
        if (!_4220)
        {
            _4248 = _4176 >= 1;
        }
        if ((!_4248) || _4220)
        {
            if (!_4220)
            {
                bool _4250 = _4176 != 0;
                if (!_4250)
                {
                    float _4252 = _175 + _4124;
                    _4182 = _4252;
                }
                float _4254 = _4182;
                _4230 = _4254;
                if (!_4250)
                {
                    float _4256 = _177 + _4126;
                    _4184 = _4256;
                }
                float _4258 = _4184;
                _4232 = _4258;
                if (!_4250)
                {
                    float _4260 = _179 + _4128;
                    _4186 = _4260;
                }
                float _4262 = _4186;
                _4234 = _4262;
                if (!_4250)
                {
                    float _4264 = _4130 + 1.0;
                    _4188 = _4264;
                }
                float _4266 = _4188;
                bool _4268 = !_4250;
                _4236 = _4266;
                _4238 = _4268;
            }
            if ((!_4238) || _4220)
            {
                _4220 = false;
                _4230 = _4124;
                _4232 = _4126;
                _4234 = _4128;
                _4236 = _4130;
                _4238 = true;
            }
        }
        else
        {
            float _4270 = _175 + _4140;
            float _4272 = _177 + _4142;
            float _4274 = _179 + _4144;
            float _4276 = _4146 + 1.0;
            _4230 = _4124;
            _4232 = _4126;
            _4234 = _4128;
            _4236 = _4130;
            _4206 = _4270;
            _4208 = _4272;
            _4210 = _4274;
            _4212 = _4276;
        }
    }
    _4238 = false;
    float _4278 = _4190;
    float _4280 = _4192;
    float _4282 = _4194;
    float _4284 = _4196;
    float _4286 = _4230;
    float _4288 = _4232;
    float _4290 = _4234;
    float _4292 = _4236;
    float _4294 = _4198;
    float _4296 = _4200;
    float _4298 = _4202;
    float _4300 = _4204;
    float _4302 = _4206;
    float _4304 = _4208;
    float _4306 = _4210;
    float _4308 = _4212;
    float _4310 = -_2525;
    float _4312 = _187 + _4310;
    float _4314 = -_2529;
    float _4316 = _185 + _4314;
    float _4318 = _2539 * _4312;
    float _4320 = -_2533;
    float _4322 = _189 + _4320;
    float _4324 = fma(_2543, _4316, _4318);
    float _4326 = fma(_2547, _4322, _4324);
    float _4328 = _2575 * _4326;
    float _4330 = rint(_4328);
    float _4332 = precise::max(0.0, _4330);
    float _4334 = precise::min(_4332, 3.0);
    float _4336 = trunc(_4334);
    int _4338 = int(_4336);
    bool _4340 = _4338 >= 2;
    bool _4342 = !_4340;
    float _4344 = as_type<float>(_4338);
    float _4346 = _4330;
    float _4348 = _4324;
    float _4350 = _4318;
    float _4352 = _4278;
    float _4354 = _4280;
    float _4356 = _4282;
    float _4358 = _4284;
    float _4360 = _4294;
    float _4362 = _4296;
    float _4364 = _4298;
    float _4366 = _4300;
    float _4368 = _4302;
    float _4370 = _4304;
    float _4372 = _4306;
    float _4374 = _4308;
    float _4392;
    float _4394;
    float _4396;
    float _4398;
    if (!_4342)
    {
        bool _4376 = _4338 >= 3;
        bool _4378 = !_4376;
        if (!_4378)
        {
            bool _4380 = _4338 != 3;
            _4382 = _4380;
            if (!_4382)
            {
                float _4384 = _185 + _4278;
                float _4386 = _187 + _4280;
                float _4388 = _189 + _4282;
                float _4390 = _4284 + 1.0;
                _4352 = _4384;
                _4354 = _4386;
                _4356 = _4388;
                _4358 = _4390;
                _4392 = _4286;
                _4394 = _4288;
                _4396 = _4290;
                _4398 = _4292;
                _4400 = true;
            }
        }
        else
        {
            float _4402 = _185 + _4294;
            float _4404 = _187 + _4296;
            float _4406 = _189 + _4298;
            float _4408 = _4300 + 1.0;
            _4392 = _4286;
            _4394 = _4288;
            _4396 = _4290;
            _4398 = _4292;
            _4360 = _4402;
            _4362 = _4404;
            _4364 = _4406;
            _4366 = _4408;
            _4400 = true;
        }
    }
    if ((!_4400) || _4382)
    {
        bool _4410;
        if (!_4382)
        {
            _4410 = _4338 >= 1;
        }
        if ((!_4410) || _4382)
        {
            if (!_4382)
            {
                bool _4412 = _4338 != 0;
                if (!_4412)
                {
                    float _4414 = _185 + _4286;
                    _4344 = _4414;
                }
                float _4416 = _4344;
                _4392 = _4416;
                if (!_4412)
                {
                    float _4418 = _187 + _4288;
                    _4346 = _4418;
                }
                float _4420 = _4346;
                _4394 = _4420;
                if (!_4412)
                {
                    float _4422 = _189 + _4290;
                    _4348 = _4422;
                }
                float _4424 = _4348;
                _4396 = _4424;
                if (!_4412)
                {
                    float _4426 = _4292 + 1.0;
                    _4350 = _4426;
                }
                float _4428 = _4350;
                bool _4430 = !_4412;
                _4398 = _4428;
                _4400 = _4430;
            }
            if ((!_4400) || _4382)
            {
                _4382 = false;
                _4392 = _4286;
                _4394 = _4288;
                _4396 = _4290;
                _4398 = _4292;
                _4400 = true;
            }
        }
        else
        {
            float _4432 = _185 + _4302;
            float _4434 = _187 + _4304;
            float _4436 = _189 + _4306;
            float _4438 = _4308 + 1.0;
            _4392 = _4286;
            _4394 = _4288;
            _4396 = _4290;
            _4398 = _4292;
            _4368 = _4432;
            _4370 = _4434;
            _4372 = _4436;
            _4374 = _4438;
        }
    }
    _4400 = false;
    float _4440 = _4352;
    float _4442 = _4354;
    float _4444 = _4356;
    float _4446 = _4358;
    float _4448 = _4392;
    float _4450 = _4394;
    float _4452 = _4396;
    float _4454 = _4398;
    float _4456 = _4360;
    float _4458 = _4362;
    float _4460 = _4364;
    float _4462 = _4366;
    float _4464 = _4368;
    float _4466 = _4370;
    float _4468 = _4372;
    float _4470 = _4374;
    float _4472 = -_2525;
    float _4474 = _197 + _4472;
    float _4476 = -_2529;
    float _4478 = _195 + _4476;
    float _4480 = _2539 * _4474;
    float _4482 = -_2533;
    float _4484 = _199 + _4482;
    float _4486 = fma(_2543, _4478, _4480);
    float _4488 = fma(_2547, _4484, _4486);
    float _4490 = _2575 * _4488;
    float _4492 = rint(_4490);
    float _4494 = precise::max(0.0, _4492);
    float _4496 = precise::min(_4494, 3.0);
    float _4498 = trunc(_4496);
    int _4500 = int(_4498);
    bool _4502 = _4500 >= 2;
    bool _4504 = !_4502;
    float _4506 = _4492;
    float _4508 = as_type<float>(_4500);
    float _4510 = _4480;
    float _4512 = _4486;
    float _4514 = _4440;
    float _4516 = _4442;
    float _4518 = _4444;
    float _4520 = _4446;
    float _4522 = _4456;
    float _4524 = _4458;
    float _4526 = _4460;
    float _4528 = _4462;
    float _4530 = _4464;
    float _4532 = _4466;
    float _4534 = _4468;
    float _4536 = _4470;
    float _4554;
    float _4556;
    float _4558;
    float _4560;
    if (!_4504)
    {
        bool _4538 = _4500 >= 3;
        bool _4540 = !_4538;
        if (!_4540)
        {
            bool _4542 = _4500 != 3;
            _4544 = _4542;
            if (!_4544)
            {
                float _4546 = _195 + _4440;
                float _4548 = _197 + _4442;
                float _4550 = _199 + _4444;
                float _4552 = _4446 + 1.0;
                _4514 = _4546;
                _4516 = _4548;
                _4518 = _4550;
                _4520 = _4552;
                _4554 = _4448;
                _4556 = _4450;
                _4558 = _4452;
                _4560 = _4454;
                _4562 = true;
            }
        }
        else
        {
            float _4564 = _195 + _4456;
            float _4566 = _197 + _4458;
            float _4568 = _199 + _4460;
            float _4570 = _4462 + 1.0;
            _4554 = _4448;
            _4556 = _4450;
            _4558 = _4452;
            _4560 = _4454;
            _4522 = _4564;
            _4524 = _4566;
            _4526 = _4568;
            _4528 = _4570;
            _4562 = true;
        }
    }
    if ((!_4562) || _4544)
    {
        bool _4572;
        if (!_4544)
        {
            _4572 = _4500 >= 1;
        }
        if ((!_4572) || _4544)
        {
            if (!_4544)
            {
                bool _4574 = _4500 != 0;
                if (!_4574)
                {
                    float _4576 = _195 + _4448;
                    _4506 = _4576;
                }
                float _4578 = _4506;
                _4554 = _4578;
                if (!_4574)
                {
                    float _4580 = _197 + _4450;
                    _4508 = _4580;
                }
                float _4582 = _4508;
                _4556 = _4582;
                if (!_4574)
                {
                    float _4584 = _199 + _4452;
                    _4510 = _4584;
                }
                float _4586 = _4510;
                _4558 = _4586;
                if (!_4574)
                {
                    float _4588 = _4454 + 1.0;
                    _4512 = _4588;
                }
                float _4590 = _4512;
                bool _4592 = !_4574;
                _4560 = _4590;
                _4562 = _4592;
            }
            if ((!_4562) || _4544)
            {
                _4544 = false;
                _4554 = _4448;
                _4556 = _4450;
                _4558 = _4452;
                _4560 = _4454;
                _4562 = true;
            }
        }
        else
        {
            float _4594 = _195 + _4464;
            float _4596 = _197 + _4466;
            float _4598 = _199 + _4468;
            float _4600 = _4470 + 1.0;
            _4554 = _4448;
            _4556 = _4450;
            _4558 = _4452;
            _4560 = _4454;
            _4530 = _4594;
            _4532 = _4596;
            _4534 = _4598;
            _4536 = _4600;
        }
    }
    _4562 = false;
    float _4602 = _4514;
    float _4604 = _4516;
    float _4606 = _4518;
    float _4608 = _4520;
    float _4610 = _4554;
    float _4612 = _4556;
    float _4614 = _4558;
    float _4616 = _4560;
    float _4618 = _4522;
    float _4620 = _4524;
    float _4622 = _4526;
    float _4624 = _4528;
    float _4626 = _4530;
    float _4628 = _4532;
    float _4630 = _4534;
    float _4632 = _4536;
    float _4634 = -_2525;
    float _4636 = _207 + _4634;
    float _4638 = -_2529;
    float _4640 = _205 + _4638;
    float _4642 = _2539 * _4636;
    float _4644 = -_2533;
    float _4646 = _209 + _4644;
    float _4648 = fma(_2543, _4640, _4642);
    float _4650 = fma(_2547, _4646, _4648);
    float _4652 = _2575 * _4650;
    float _4654 = rint(_4652);
    float _4656 = precise::max(0.0, _4654);
    float _4658 = precise::min(_4656, 3.0);
    float _4660 = trunc(_4658);
    int _4662 = int(_4660);
    bool _4664 = _4662 >= 2;
    bool _4666 = !_4664;
    float _4668 = as_type<float>(_4662);
    float _4670 = _4654;
    float _4672 = _4648;
    float _4674 = _4642;
    float _4676 = _4602;
    float _4678 = _4604;
    float _4680 = _4606;
    float _4682 = _4608;
    float _4684 = _4618;
    float _4686 = _4620;
    float _4688 = _4622;
    float _4690 = _4624;
    float _4692 = _4626;
    float _4694 = _4628;
    float _4696 = _4630;
    float _4698 = _4632;
    float _4716;
    float _4718;
    float _4720;
    float _4722;
    if (!_4666)
    {
        bool _4700 = _4662 >= 3;
        bool _4702 = !_4700;
        if (!_4702)
        {
            bool _4704 = _4662 != 3;
            _4706 = _4704;
            if (!_4706)
            {
                float _4708 = _205 + _4602;
                float _4710 = _207 + _4604;
                float _4712 = _209 + _4606;
                float _4714 = _4608 + 1.0;
                _4676 = _4708;
                _4678 = _4710;
                _4680 = _4712;
                _4682 = _4714;
                _4716 = _4610;
                _4718 = _4612;
                _4720 = _4614;
                _4722 = _4616;
                _4724 = true;
            }
        }
        else
        {
            float _4726 = _205 + _4618;
            float _4728 = _207 + _4620;
            float _4730 = _209 + _4622;
            float _4732 = _4624 + 1.0;
            _4716 = _4610;
            _4718 = _4612;
            _4720 = _4614;
            _4722 = _4616;
            _4684 = _4726;
            _4686 = _4728;
            _4688 = _4730;
            _4690 = _4732;
            _4724 = true;
        }
    }
    if ((!_4724) || _4706)
    {
        bool _4734;
        if (!_4706)
        {
            _4734 = _4662 >= 1;
        }
        if ((!_4734) || _4706)
        {
            if (!_4706)
            {
                bool _4736 = _4662 != 0;
                if (!_4736)
                {
                    float _4738 = _205 + _4610;
                    _4668 = _4738;
                }
                float _4740 = _4668;
                _4716 = _4740;
                if (!_4736)
                {
                    float _4742 = _207 + _4612;
                    _4670 = _4742;
                }
                float _4744 = _4670;
                _4718 = _4744;
                if (!_4736)
                {
                    float _4746 = _209 + _4614;
                    _4672 = _4746;
                }
                float _4748 = _4672;
                _4720 = _4748;
                if (!_4736)
                {
                    float _4750 = _4616 + 1.0;
                    _4674 = _4750;
                }
                float _4752 = _4674;
                bool _4754 = !_4736;
                _4722 = _4752;
                _4724 = _4754;
            }
            if ((!_4724) || _4706)
            {
                _4706 = false;
                _4716 = _4610;
                _4718 = _4612;
                _4720 = _4614;
                _4722 = _4616;
                _4724 = true;
            }
        }
        else
        {
            float _4756 = _205 + _4626;
            float _4758 = _207 + _4628;
            float _4760 = _209 + _4630;
            float _4762 = _4632 + 1.0;
            _4716 = _4610;
            _4718 = _4612;
            _4720 = _4614;
            _4722 = _4616;
            _4692 = _4756;
            _4694 = _4758;
            _4696 = _4760;
            _4698 = _4762;
        }
    }
    _4724 = false;
    float _4764 = _4676;
    float _4766 = _4678;
    float _4768 = _4680;
    float _4770 = _4682;
    float _4772 = _4716;
    float _4774 = _4718;
    float _4776 = _4720;
    float _4778 = _4722;
    float _4780 = _4684;
    float _4782 = _4686;
    float _4784 = _4688;
    float _4786 = _4690;
    float _4788 = _4692;
    float _4790 = _4694;
    float _4792 = _4696;
    float _4794 = _4698;
    float _4796 = -_2525;
    float _4798 = _217 + _4796;
    float _4800 = -_2529;
    float _4802 = _215 + _4800;
    float _4804 = _2539 * _4798;
    float _4806 = -_2533;
    float _4808 = _219 + _4806;
    float _4810 = fma(_2543, _4802, _4804);
    float _4812 = fma(_2547, _4808, _4810);
    float _4814 = _2575 * _4812;
    float _4816 = rint(_4814);
    float _4818 = precise::max(0.0, _4816);
    float _4820 = precise::min(_4818, 3.0);
    float _4822 = trunc(_4820);
    int _4824 = int(_4822);
    bool _4826 = _4824 >= 2;
    bool _4828 = !_4826;
    float _4830 = _4816;
    float _4832 = as_type<float>(_4824);
    float _4834 = _4804;
    float _4836 = _4810;
    float _4838 = _4764;
    float _4840 = _4766;
    float _4842 = _4768;
    float _4844 = _4770;
    float _4846 = _4780;
    float _4848 = _4782;
    float _4850 = _4784;
    float _4852 = _4786;
    float _4854 = _4788;
    float _4856 = _4790;
    float _4858 = _4792;
    float _4860 = _4794;
    float _4878;
    float _4880;
    float _4882;
    float _4884;
    if (!_4828)
    {
        bool _4862 = _4824 >= 3;
        bool _4864 = !_4862;
        if (!_4864)
        {
            bool _4866 = _4824 != 3;
            _4868 = _4866;
            if (!_4868)
            {
                float _4870 = _215 + _4764;
                float _4872 = _217 + _4766;
                float _4874 = _219 + _4768;
                float _4876 = _4770 + 1.0;
                _4838 = _4870;
                _4840 = _4872;
                _4842 = _4874;
                _4844 = _4876;
                _4878 = _4772;
                _4880 = _4774;
                _4882 = _4776;
                _4884 = _4778;
                _4886 = true;
            }
        }
        else
        {
            float _4888 = _215 + _4780;
            float _4890 = _217 + _4782;
            float _4892 = _219 + _4784;
            float _4894 = _4786 + 1.0;
            _4878 = _4772;
            _4880 = _4774;
            _4882 = _4776;
            _4884 = _4778;
            _4846 = _4888;
            _4848 = _4890;
            _4850 = _4892;
            _4852 = _4894;
            _4886 = true;
        }
    }
    if ((!_4886) || _4868)
    {
        bool _4896;
        if (!_4868)
        {
            _4896 = _4824 >= 1;
        }
        if ((!_4896) || _4868)
        {
            if (!_4868)
            {
                bool _4898 = _4824 != 0;
                if (!_4898)
                {
                    float _4900 = _215 + _4772;
                    _4830 = _4900;
                }
                float _4902 = _4830;
                _4878 = _4902;
                if (!_4898)
                {
                    float _4904 = _217 + _4774;
                    _4832 = _4904;
                }
                float _4906 = _4832;
                _4880 = _4906;
                if (!_4898)
                {
                    float _4908 = _219 + _4776;
                    _4834 = _4908;
                }
                float _4910 = _4834;
                _4882 = _4910;
                if (!_4898)
                {
                    float _4912 = _4778 + 1.0;
                    _4836 = _4912;
                }
                float _4914 = _4836;
                bool _4916 = !_4898;
                _4884 = _4914;
                _4886 = _4916;
            }
            if ((!_4886) || _4868)
            {
                _4868 = false;
                _4878 = _4772;
                _4880 = _4774;
                _4882 = _4776;
                _4884 = _4778;
                _4886 = true;
            }
        }
        else
        {
            float _4918 = _215 + _4788;
            float _4920 = _217 + _4790;
            float _4922 = _219 + _4792;
            float _4924 = _4794 + 1.0;
            _4878 = _4772;
            _4880 = _4774;
            _4882 = _4776;
            _4884 = _4778;
            _4854 = _4918;
            _4856 = _4920;
            _4858 = _4922;
            _4860 = _4924;
        }
    }
    _4886 = false;
    float _4926 = _4838;
    float _4928 = _4840;
    float _4930 = _4842;
    float _4932 = _4844;
    float _4934 = _4878;
    float _4936 = _4880;
    float _4938 = _4882;
    float _4940 = _4884;
    float _4942 = _4846;
    float _4944 = _4848;
    float _4946 = _4850;
    float _4948 = _4852;
    float _4950 = _4854;
    float _4952 = _4856;
    float _4954 = _4858;
    float _4956 = _4860;
    float _4958 = -_2525;
    float _4960 = _227 + _4958;
    float _4962 = -_2529;
    float _4964 = _225 + _4962;
    float _4966 = _2539 * _4960;
    float _4968 = -_2533;
    float _4970 = _229 + _4968;
    float _4972 = fma(_2543, _4964, _4966);
    float _4974 = fma(_2547, _4970, _4972);
    float _4976 = _2575 * _4974;
    float _4978 = rint(_4976);
    float _4980 = precise::max(0.0, _4978);
    float _4982 = precise::min(_4980, 3.0);
    float _4984 = trunc(_4982);
    int _4986 = int(_4984);
    bool _4988 = _4986 >= 2;
    bool _4990 = !_4988;
    float _4992 = as_type<float>(_4986);
    float _4994 = _4978;
    float _4996 = _4972;
    float _4998 = _4966;
    float _5000 = _4942;
    float _5002 = _4944;
    float _5004 = _4950;
    float _5006 = _4952;
    float _5008 = _4956;
    float _5010 = _4948;
    float _5012 = _4932;
    float _5014 = _4954;
    float _5016 = _4946;
    float _5018 = _4926;
    float _5020 = _4928;
    float _5022 = _4930;
    float _5040;
    float _5042;
    float _5044;
    float _5046;
    if (!_4990)
    {
        bool _5024 = _4986 >= 3;
        bool _5026 = !_5024;
        if (!_5026)
        {
            bool _5028 = _4986 != 3;
            _5030 = _5028;
            if (!_5030)
            {
                float _5032 = _225 + _4926;
                float _5034 = _227 + _4928;
                float _5036 = _229 + _4930;
                float _5038 = _4932 + 1.0;
                _5040 = _4934;
                _5042 = _4940;
                _5012 = _5038;
                _5044 = _4936;
                _5046 = _4938;
                _5018 = _5032;
                _5020 = _5034;
                _5022 = _5036;
                _5048 = true;
            }
        }
        else
        {
            float _5050 = _225 + _4942;
            float _5052 = _227 + _4944;
            float _5054 = _229 + _4946;
            float _5056 = _4948 + 1.0;
            _5000 = _5050;
            _5002 = _5052;
            _5010 = _5056;
            _5040 = _4934;
            _5042 = _4940;
            _5044 = _4936;
            _5016 = _5054;
            _5046 = _4938;
            _5048 = true;
        }
    }
    if ((!_5048) || _5030)
    {
        bool _5058;
        if (!_5030)
        {
            _5058 = _4986 >= 1;
        }
        if ((!_5058) || _5030)
        {
            if (!_5030)
            {
                bool _5060 = _4986 != 0;
                if (!_5060)
                {
                    float _5062 = _225 + _4934;
                    _4992 = _5062;
                }
                float _5064 = _4992;
                _5040 = _5064;
                if (!_5060)
                {
                    float _5066 = _227 + _4936;
                    _4994 = _5066;
                }
                float _5068 = _4994;
                _5044 = _5068;
                if (!_5060)
                {
                    float _5070 = _229 + _4938;
                    _4996 = _5070;
                }
                float _5072 = _4996;
                _5046 = _5072;
                if (!_5060)
                {
                    float _5074 = _4940 + 1.0;
                    _4998 = _5074;
                }
                float _5076 = _4998;
                bool _5078 = !_5060;
                _5042 = _5076;
                _5048 = _5078;
            }
            if ((!_5048) || _5030)
            {
                _5030 = false;
                _5040 = _4934;
                _5042 = _4940;
                _5044 = _4936;
                _5046 = _4938;
                _5048 = true;
            }
        }
        else
        {
            float _5080 = _225 + _4950;
            float _5082 = _227 + _4952;
            float _5084 = _229 + _4954;
            float _5086 = _4956 + 1.0;
            _5004 = _5080;
            _5006 = _5082;
            _5008 = _5086;
            _5040 = _4934;
            _5042 = _4940;
            _5044 = _4936;
            _5014 = _5084;
            _5046 = _4938;
        }
    }
    _5048 = false;
    float _5088 = _5000;
    float _5090 = _5002;
    float _5092 = _5004;
    float _5094 = _5006;
    float _5096 = _5008;
    float _5098 = _5010;
    float _5100 = _5040;
    float _5102 = _5042;
    float _5104 = _5012;
    float _5106 = _5044;
    float _5108 = _5014;
    float _5110 = _5016;
    float _5112 = _5046;
    float _5114 = _5018;
    float _5116 = _5020;
    float _5118 = _5022;
    float _5120 = _5088 * 6.0;
    float _5122 = _5090 * 6.0;
    float _5124 = _5092 * 6.0;
    float _5126 = _5094 * 6.0;
    float _5128 = fma(_5092, 3.0, _5120);
    float _5130 = fma(_5094, 3.0, _5122);
    float _5132 = _5096 * 4.0;
    float _5134 = fma(_5098, 4.0, _5096);
    _24[1] = as_type<uint>(_185);
    float _5136 = fma(_5100, 9.0, _5124);
    float _5138 = fma(_5102, 9.0, _5132);
    float _5140 = fma(_5104, 9.0, _5134);
    _24[0] = as_type<uint>(_189);
    float _5142 = precise::max(_141, _151);
    float _5144 = fma(_5106, 9.0, _5126);
    float _5146 = precise::max(_181, _191);
    float _5148 = _5108 * 6.0;
    float _5150 = precise::max(_121, _131);
    float _5152 = _5110 * 6.0;
    float _5154 = _5098 + _5096;
    float _5156 = precise::max(_161, _171);
    float _5158 = fma(_5112, 9.0, _5148);
    float _5160 = precise::max(_5150, _5142);
    float _5162 = fma(_5108, 3.0, _5152);
    float _5164 = precise::max(_5156, _5146);
    float _5166 = as_type<float>(_24[1]);
    float _5168 = precise::max(_91, _81);
    float _5170 = _5138 + _5098;
    float _5172 = precise::max(_101, _111);
    float _5174 = as_type<float>(_24[0]);
    float _5176 = precise::max(_201, _211);
    float _5178 = _5170 * _5140;
    float _5180 = precise::max(_5168, _5172);
    float _5182 = _5154 * 2.0;
    float _5184 = precise::max(_221, _231);
    float _5186 = -_5178;
    float _5188 = fma(_5182, _5182, _5186);
    bool _5190 = _5188 != 0.0;
    bool _5192 = isnan(_5188);
    bool _5194 = _5190 || _5192;
    bool _5196 = isnan(0.0);
    bool _5198 = _5194 || _5196;
    float _5200 = precise::max(_5176, _5184);
    float _5202 = precise::max(_5180, _5160);
    float _5204 = precise::max(_5164, _5200);
    float _5206 = fma(_5088, 3.0, _5136);
    float _5208 = fma(_5110, 3.0, _5158);
    float _5210 = fma(_5090, 3.0, _5144);
    float _5212 = fma(_5114, 9.0, _5128);
    float _5214 = fma(_5116, 9.0, _5130);
    float _5216 = fma(_5118, 9.0, _5162);
    float _5218 = precise::max(_5202, _5204);
    bool _5220 = !_5198;
    if (!_5220)
    {
        float _5222 = 1.0 / _5188;
        float _5224 = _5170 * _5212;
        float _5226 = _5206 * _5140;
        float _5228 = -_5224;
        float _5230 = fma(_5206, _5182, _5228);
        float _5232 = -_5226;
        float _5234 = fma(_5212, _5182, _5232);
        float _5236 = _5170 * _5214;
        float _5238 = _5210 * _5140;
        float _5240 = _5170 * _5216;
        float _5242 = _5208 * _5140;
        float _5244 = -_5236;
        float _5246 = fma(_5210, _5182, _5244);
        float _5248 = -_5238;
        float _5250 = fma(_5214, _5182, _5248);
        float _5252 = -_5240;
        float _5254 = fma(_5208, _5182, _5252);
        float _5256 = -_5242;
        float _5258 = fma(_5216, _5182, _5256);
        float _5260 = _5250 * _5222;
        float _5262 = _5230 * _5222;
        float _5264 = _5246 * _5222;
        float _5266 = _5254 * _5222;
        float _5268 = _5234 * _5222;
        float _5270 = _5258 * _5222;
        float _5272 = -_5260;
        float _5274 = _5264 + _5272;
        float _5276 = -_5268;
        float _5278 = _5262 + _5276;
        float _5280 = -_5270;
        float _5282 = _5266 + _5280;
        _2594 = _5278;
        _2596 = _5274;
        _2598 = _5282;
        _2600 = _5268;
        _2602 = _5262;
        _2604 = _5260;
        _2606 = _5264;
        _2608 = _5270;
        _2610 = _5266;
    }
    float _5284 = _2594;
    float _5286 = _2596;
    float _5288 = _2598;
    float _5290 = _2600;
    float _5292 = _2602;
    float _5294 = _2604;
    float _5296 = _2606;
    float _5298 = _2608;
    float _5300 = _2610;
    float _5302 = fma(_5284, 496.0, 0.5);
    float _5304 = precise::clamp(_5302, 0.0, 1.0);
    float _5306 = fma(_5286, 1008.0, 0.5);
    float _5308 = precise::clamp(_5306, 0.0, 1.0);
    float _5310 = fma(_5284, -31.0, 1.0);
    float _5312 = precise::clamp(_5310, 0.0, 1.0);
    float _5314 = fma(_5288, 496.0, 0.5);
    float _5316 = precise::clamp(_5314, 0.0, 1.0);
    float _5318 = _5304 + (-0.5);
    float _5320 = fma(_5286, -63.0, 1.0);
    float _5322 = precise::clamp(_5320, 0.0, 1.0);
    float _5324 = _5308 + (-0.5);
    float _5326 = fma(_5288, -31.0, 1.0);
    float _5328 = precise::clamp(_5326, 0.0, 1.0);
    float _5330 = _5312 * _5318;
    float _5332 = _5316 + (-0.5);
    float _5334 = _5322 * _5324;
    float _5336 = _5334 * 2.0;
    float _5338 = _5218 * 255.0;
    float _5340 = fma(_5330, -0.0322580635547637939453125, _5290);
    float _5342 = precise::clamp(_5340, 0.0, 1.0);
    float _5344 = _5328 * _5332;
    float _5346 = fma(_5330, 0.0322580635547637939453125, _5292);
    float _5348 = precise::clamp(_5346, 0.0, 1.0);
    float _5350 = fma(_5336, -0.01587301678955554962158203125, _5294);
    float _5352 = precise::clamp(_5350, 0.0, 1.0);
    float _5354 = fma(_5336, 0.01587301678955554962158203125, _5296);
    float _5356 = precise::clamp(_5354, 0.0, 1.0);
    float _5358 = fma(_5344, -0.0322580635547637939453125, _5298);
    float _5360 = precise::clamp(_5358, 0.0, 1.0);
    float _5362 = _5348 * 31.0;
    float _5364 = fma(_5344, 0.0322580635547637939453125, _5300);
    float _5366 = precise::clamp(_5364, 0.0, 1.0);
    float _5368 = _5342 * 31.0;
    float _5370 = _5352 * 63.0;
    float _5372 = _5356 * 63.0;
    float _5374 = _5360 * 31.0;
    float _5376 = _5366 * 31.0;
    float _5378 = trunc(_5338);
    float _5380 = precise::max(_5378, 0.0);
    uint _5383 = uint(_5380);
    float _5385 = precise::min(_91, _81);
    float _5387 = precise::min(_121, _131);
    float _5389 = precise::min(_161, _171);
    float _5391 = precise::min(_181, _191);
    float _5393 = rint(_5362);
    float _5395 = precise::min(_201, _211);
    float _5397 = precise::min(_221, _231);
    float _5399 = precise::min(_5389, _5391);
    float _5401 = precise::min(_5395, _5397);
    float _5403 = rint(_5372);
    float _5405 = precise::min(_5399, _5401);
    float _5407 = rint(_5368);
    float _5409 = _5393 + 0.5;
    float _5411 = rint(_5370);
    float _5413 = _5403 + 0.5;
    float _5415 = rint(_5374);
    float _5417 = _5407 + 0.5;
    float _5419 = rint(_5376);
    float _5421 = precise::min(_101, _111);
    float _5423 = precise::min(_5385, _5421);
    float _5425 = precise::min(_141, _151);
    float _5427 = trunc(_5409);
    float _5429 = precise::max(_5427, 0.0);
    uint _5431 = uint(_5429);
    float _5433 = precise::min(_5387, _5425);
    float _5435 = _5411 + 0.5;
    float _5437 = precise::min(_5423, _5433);
    float _5439 = _5419 + 0.5;
    float _5441 = trunc(_5413);
    float _5443 = precise::max(_5441, 0.0);
    uint _5445 = uint(_5443);
    float _5447 = precise::min(_5437, _5405);
    float _5449 = _5415 + 0.5;
    float _5451 = _5447 * 255.0;
    float _5453 = trunc(_5417);
    float _5455 = precise::max(_5453, 0.0);
    uint _5457 = uint(_5455);
    int _5459 = int(_5431) << 11;
    float _5461 = trunc(_5435);
    float _5463 = precise::max(_5461, 0.0);
    uint _5465 = uint(_5463);
    int _5467 = int(_5445) << 5;
    float _5469 = trunc(_5439);
    float _5471 = precise::max(_5469, 0.0);
    uint _5473 = uint(_5471);
    int _5475 = int(_5457) << 11;
    float _5477 = trunc(_5449);
    float _5479 = precise::max(_5477, 0.0);
    uint _5481 = uint(_5479);
    int _5483 = int(_5465) << 5;
    float _5485 = trunc(_5451);
    float _5487 = precise::max(_5485, 0.0);
    uint _5489 = uint(_5487);
    int _5491 = _5459 | _5467;
    int _5493 = int(_5473) | _5491;
    int _5495 = _5475 | _5483;
    int _5497 = int(_5481) | _5495;
    bool _5499 = _5493 != _5497;
    bool _5501 = _5383 > _5489;
    int _5503 = int(_5489) << 8;
    int _5505 = _5503 & 65280;
    int _5507 = int(_5465);
    int _5509 = _5503;
    int _5511 = _5467;
    int _5513 = _5505;
    int _5515 = as_type<int>(_5407);
    int _5517 = _5493;
    int _5519 = _5497;
    if (!_5499)
    {
        _5507 = _5493;
    }
    int _5521 = _5507;
    int _5523 = 255 & int(_5383);
    int _5525 = _5505 | _5523;
    int _5527 = _5521;
    if (!_5501)
    {
        _5509 = 0;
    }
    int _5529 = _5509;
    int _5531 = _5529;
    if (!_5499)
    {
        _5511 = 0;
    }
    int _5533 = _5511;
    int _5535 = _5533;
    if (!_5499)
    {
        _5513 = 0;
    }
    int _5537 = _5513;
    bool _5539 = !_5499;
    int _5541 = _5537;
    if (!_5539)
    {
        float _5543 = _5407 * 0.0322580635547637939453125;
        float _5545 = _5403 * 0.01587301678955554962158203125;
        float _5547 = _5411 * 0.01587301678955554962158203125;
        bool _5549 = uint(_5493) >= uint(_5497);
        float _5551 = _5393 * 0.0322580635547637939453125;
        float _5553 = _5419 * 0.0322580635547637939453125;
        float _5555 = _5415 * 0.0322580635547637939453125;
        bool _5557 = !_5549;
        float _5559 = _5557 ? _5545 : _5547;
        bool _5561 = !_5549;
        float _5563 = _5561 ? _5547 : _5545;
        bool _5565 = !_5549;
        float _5567 = _5565 ? _5551 : _5543;
        float _5569 = -_5559;
        float _5571 = _147 + _5569;
        bool _5573 = !_5549;
        float _5575 = _5573 ? _5543 : _5551;
        float _5577 = -_5559;
        float _5579 = _5577 + _5563;
        bool _5581 = !_5549;
        float _5583 = _5581 ? _5553 : _5555;
        float _5585 = -_5567;
        float _5587 = _145 + _5585;
        bool _5589 = !_5549;
        float _5591 = _5589 ? _5555 : _5553;
        float _5593 = -_5567;
        float _5595 = _5593 + _5575;
        float _5597 = -_5567;
        float _5599 = _135 + _5597;
        float _5601 = -_5567;
        float _5603 = _125 + _5601;
        float _5605 = -_5567;
        float _5607 = _115 + _5605;
        float _5609 = -_5567;
        float _5611 = _105 + _5609;
        float _5613 = -_5567;
        float _5615 = _95 + _5613;
        float _5617 = -_5567;
        float _5619 = _75 + _5617;
        float _5621 = -_5567;
        float _5623 = _85 + _5621;
        float _5625 = -_5567;
        float _5627 = _225 + _5625;
        float _5629 = -_5567;
        float _5631 = _215 + _5629;
        float _5633 = -_5567;
        float _5635 = _205 + _5633;
        float _5637 = -_5567;
        float _5639 = _195 + _5637;
        float _5641 = -_5567;
        float _5643 = _5166 + _5641;
        float _5645 = -_5567;
        float _5647 = _175 + _5645;
        float _5649 = -_5567;
        float _5651 = _165 + _5649;
        float _5653 = -_5567;
        float _5655 = _155 + _5653;
        float _5657 = _5579 * _5579;
        float _5659 = -_5583;
        float _5661 = _5659 + _5591;
        float _5663 = -_5559;
        float _5665 = _137 + _5663;
        float _5667 = -_5583;
        float _5669 = _149 + _5667;
        float _5671 = fma(_5595, _5595, _5657);
        float _5673 = -_5583;
        float _5675 = _139 + _5673;
        float _5677 = -_5559;
        float _5679 = _127 + _5677;
        float _5681 = -_5559;
        float _5683 = _117 + _5681;
        float _5685 = fma(_5661, _5661, _5671);
        float _5687 = -_5583;
        float _5689 = _129 + _5687;
        float _5691 = -_5559;
        float _5693 = _107 + _5691;
        float _5695 = -_5559;
        float _5697 = _97 + _5695;
        float _5699 = 1.0 / _5685;
        float _5701 = -_5559;
        float _5703 = _77 + _5701;
        float _5705 = -_5559;
        float _5707 = _87 + _5705;
        float _5709 = -_5559;
        float _5711 = _227 + _5709;
        float _5713 = -_5559;
        float _5715 = _217 + _5713;
        float _5717 = -_5559;
        float _5719 = _207 + _5717;
        float _5721 = -_5559;
        float _5723 = _197 + _5721;
        float _5725 = -_5559;
        float _5727 = _187 + _5725;
        float _5729 = -_5559;
        float _5731 = _177 + _5729;
        float _5733 = -_5559;
        float _5735 = _167 + _5733;
        float _5737 = -_5559;
        float _5739 = _157 + _5737;
        float _5741 = -_5583;
        float _5743 = _119 + _5741;
        float _5745 = -_5583;
        float _5747 = _109 + _5745;
        float _5749 = -_5583;
        float _5751 = _99 + _5749;
        float _5753 = -_5583;
        float _5755 = _79 + _5753;
        float _5757 = _5579 * _5699;
        float _5759 = _5595 * _5699;
        float _5761 = _5661 * _5699;
        float _5763 = _5757 * _5571;
        float _5765 = _5757 * _5665;
        float _5767 = _5757 * _5679;
        float _5769 = _5757 * _5683;
        float _5771 = fma(_5759, _5587, _5763);
        float _5773 = fma(_5759, _5599, _5765);
        float _5775 = fma(_5759, _5603, _5767);
        float _5777 = fma(_5759, _5607, _5769);
        float _5779 = fma(_5761, _5669, _5771);
        float _5781 = fma(_5761, _5675, _5773);
        float _5783 = fma(_5761, _5689, _5775);
        float _5785 = _5757 * _5693;
        float _5787 = _5757 * _5739;
        bool _5789 = _5779 >= 0.5;
        float _5791 = _5757 * _5697;
        bool _5793 = _5781 >= 0.5;
        float _5795 = _5757 * _5703;
        bool _5797 = _5779 >= 0.833000004291534423828125;
        float _5799 = _5757 * _5707;
        bool _5801 = _5779 >= 0.16599999368190765380859375;
        float _5803 = _5757 * _5711;
        float _5805 = _5757 * _5715;
        float _5807 = _5757 * _5719;
        float _5809 = _5757 * _5723;
        float _5811 = _5757 * _5727;
        float _5813 = _5757 * _5731;
        float _5815 = _5757 * _5735;
        int _5817 = _5797 ? 0 : 32768;
        float _5819 = fma(_5761, _5743, _5777);
        bool _5821 = _5781 >= 0.833000004291534423828125;
        float _5823 = fma(_5759, _5611, _5785);
        int _5825 = _5817;
        if (!_5789)
        {
            int _5827 = _5801 ? 49152 : 16384;
            _5825 = _5827;
        }
        int _5829 = _5825;
        float _5831 = fma(_5759, _5615, _5791);
        bool _5833 = _5781 >= 0.16599999368190765380859375;
        float _5835 = fma(_5759, _5619, _5795);
        float _5837 = fma(_5759, _5623, _5799);
        bool _5839 = _5783 >= 0.5;
        float _5841 = fma(_5759, _5627, _5803);
        float _5843 = fma(_5759, _5631, _5805);
        float _5845 = fma(_5759, _5635, _5807);
        float _5847 = fma(_5759, _5639, _5809);
        float _5849 = fma(_5759, _5643, _5811);
        float _5851 = fma(_5759, _5647, _5813);
        float _5853 = fma(_5759, _5651, _5815);
        float _5855 = fma(_5759, _5655, _5787);
        int _5857 = _5821 ? 0 : 8192;
        float _5859 = fma(_5761, _5747, _5823);
        bool _5861 = _5819 >= 0.5;
        float _5863 = fma(_5761, _5751, _5831);
        int _5865 = _5857;
        if (!_5793)
        {
            int _5867 = _5833 ? 12288 : 4096;
            _5865 = _5867;
        }
        int _5869 = _5865;
        float _5871 = fma(_5761, _5755, _5835);
        bool _5873 = _5819 >= 0.833000004291534423828125;
        float _5875 = -_5583;
        float _5877 = _229 + _5875;
        bool _5879 = _5783 >= 0.833000004291534423828125;
        float _5881 = -_5583;
        float _5883 = _219 + _5881;
        bool _5885 = _5783 >= 0.16599999368190765380859375;
        float _5887 = fma(_5761, _5877, _5841);
        int _5889 = _5873 ? 0 : 512;
        float _5891 = fma(_5761, _5883, _5843);
        bool _5893 = _5859 >= 0.5;
        float _5895 = -_5583;
        float _5897 = _209 + _5895;
        int _5899 = _5879 ? 0 : 2048;
        float _5901 = -_5583;
        float _5903 = _199 + _5901;
        bool _5905 = _5819 >= 0.16599999368190765380859375;
        float _5907 = fma(_5761, _5897, _5845);
        float _5909 = fma(_5761, _5903, _5847);
        int _5911 = _5899;
        int _5913 = _5889;
        if (!_5839)
        {
            int _5915 = _5885 ? 3072 : 1024;
            _5911 = _5915;
        }
        int _5917 = _5911;
        float _5919 = -_5583;
        float _5921 = _5174 + _5919;
        bool _5923 = _5863 >= 0.5;
        float _5925 = -_5583;
        float _5927 = _169 + _5925;
        if (!_5861)
        {
            int _5929 = _5905 ? 768 : 256;
            _5913 = _5929;
        }
        int _5931 = _5913;
        float _5933 = fma(_5761, _5921, _5849);
        bool _5935 = _5859 >= 0.833000004291534423828125;
        float _5937 = -_5583;
        float _5939 = _179 + _5937;
        bool _5941 = _5863 >= 0.833000004291534423828125;
        float _5943 = fma(_5761, _5927, _5853);
        bool _5945 = _5859 >= 0.16599999368190765380859375;
        float _5947 = fma(_5761, _5939, _5851);
        int _5949 = _5935 ? 0 : 128;
        float _5951 = -_5583;
        float _5953 = _89 + _5951;
        int _5955 = _5941 ? 0 : 32;
        float _5957 = -_5583;
        float _5959 = _159 + _5957;
        bool _5961 = _5871 >= 0.5;
        float _5963 = fma(_5761, _5953, _5837);
        bool _5965 = _5863 >= 0.16599999368190765380859375;
        float _5967 = fma(_5761, _5959, _5855);
        int _5969 = _5949;
        int _5971 = _5955;
        if (!_5893)
        {
            int _5973 = _5945 ? 192 : 64;
            _5969 = _5973;
        }
        int _5975 = _5969;
        bool _5977 = _5871 >= 0.833000004291534423828125;
        if (!_5923)
        {
            int _5979 = _5965 ? 48 : 16;
            _5971 = _5979;
        }
        int _5981 = _5971;
        int _5983 = _5977 ? 0 : 8;
        bool _5985 = _5887 >= 0.5;
        bool _5987 = _5871 >= 0.16599999368190765380859375;
        bool _5989 = _5891 >= 0.5;
        bool _5991 = _5887 >= 0.833000004291534423828125;
        int _5993 = _5983;
        if (!_5961)
        {
            int _5995 = _5987 ? 12 : 4;
            _5993 = _5995;
        }
        int _5997 = _5993;
        bool _5999 = _5891 >= 0.833000004291534423828125;
        bool _6001 = _5887 >= 0.16599999368190765380859375;
        int _6003 = _5991 ? 0 : int(0x80000000);
        bool _6005 = _5891 >= 0.16599999368190765380859375;
        int _6007 = _5999 ? 0 : 536870912;
        bool _6009 = _5907 >= 0.5;
        int _6011 = _6003;
        int _6013 = _6007;
        if (!_5985)
        {
            int _6015 = _6001 ? (-1073741824) : 1073741824;
            _6011 = _6015;
        }
        int _6017 = _6011;
        bool _6019 = _5909 >= 0.5;
        if (!_5989)
        {
            int _6021 = _6005 ? 805306368 : 268435456;
            _6013 = _6021;
        }
        int _6023 = _6013;
        bool _6025 = _5907 >= 0.833000004291534423828125;
        bool _6027 = _5909 >= 0.833000004291534423828125;
        int _6029 = _6025 ? 0 : 134217728;
        bool _6031 = _5907 >= 0.16599999368190765380859375;
        bool _6033 = _5933 >= 0.5;
        int _6035 = _6027 ? 0 : 33554432;
        bool _6037 = _5909 >= 0.16599999368190765380859375;
        int _6039 = _6029;
        int _6041 = _6035;
        if (!_6009)
        {
            int _6043 = _6031 ? 201326592 : 67108864;
            _6039 = _6043;
        }
        int _6045 = _6039;
        bool _6047 = _5933 >= 0.833000004291534423828125;
        if (!_6019)
        {
            int _6049 = _6037 ? 50331648 : 16777216;
            _6041 = _6049;
        }
        int _6051 = _6041;
        bool _6053 = _5943 >= 0.5;
        bool _6055 = _5933 >= 0.16599999368190765380859375;
        int _6057 = _6047 ? 0 : 8388608;
        bool _6059 = _5947 >= 0.5;
        bool _6061 = _5947 >= 0.833000004291534423828125;
        int _6063 = _6057;
        if (!_6033)
        {
            int _6065 = _6055 ? 12582912 : 4194304;
            _6063 = _6065;
        }
        int _6067 = _6063;
        bool _6069 = _5947 >= 0.16599999368190765380859375;
        bool _6071 = _5943 >= 0.833000004291534423828125;
        int _6073 = _6061 ? 0 : 2097152;
        bool _6075 = _5943 >= 0.16599999368190765380859375;
        int _6077 = _6071 ? 0 : 524288;
        int _6079 = _6077;
        int _6081 = _6073;
        if (!_6053)
        {
            int _6083 = _6075 ? 786432 : 262144;
            _6079 = _6083;
        }
        int _6085 = _6079;
        bool _6087 = _5963 >= 0.5;
        bool _6089 = _5967 >= 0.5;
        if (!_6059)
        {
            int _6091 = _6069 ? 3145728 : 1048576;
            _6081 = _6091;
        }
        int _6093 = _6081;
        bool _6095 = _5963 >= 0.833000004291534423828125;
        int _6097 = _6045 + _6017;
        int _6099 = _6097 + _6023;
        int _6101 = _5917 + _5829;
        int _6103 = _6101 + _5869;
        bool _6105 = _5967 >= 0.833000004291534423828125;
        int _6107 = _6095 ? 0 : 2;
        bool _6109 = _5963 >= 0.16599999368190765380859375;
        bool _6111 = _5967 >= 0.16599999368190765380859375;
        int _6113 = _6067 + _6099;
        int _6115 = _6113 + _6051;
        int _6117 = _5975 + _6103;
        int _6119 = _6117 + _5931;
        int _6121 = _6105 ? 0 : 131072;
        int _6123 = _6107;
        int _6125 = _6121;
        _5515 = 3;
        if (!_6087)
        {
            int _6127 = _6109 ? 3 : 1;
            _6123 = _6127;
        }
        int _6129 = _6123;
        if (!_6089)
        {
            int _6131 = _6111 ? 196608 : 65536;
            _6125 = _6131;
        }
        int _6133 = _6125;
        int _6135 = _6085 + _6115;
        int _6137 = _6135 + _6093;
        int _6139 = _5997 + _6119;
        int _6141 = _6139 + _5981;
        bool _6143 = !_5549;
        int _6145 = _6143 ? _5497 : _5493;
        bool _6147 = !_5549;
        int _6149 = _6147 ? _5493 : _5497;
        int _6151 = _6137 + _6133;
        int _6153 = _6141 + _6129;
        _5527 = _6145;
        _5541 = _6151;
        _5535 = _6153;
        _5517 = _6149;
    }
    int _6155 = _5527;
    int _6157 = _5515;
    int _6159 = _5541;
    int _6161 = _5535;
    int _6163 = _5517;
    int _6165 = _6157;
    if (!_5501)
    {
        _6165 = 0;
    }
    int _6167 = _6165;
    int _6169 = _6167;
    if (!_5501)
    {
        _5519 = 0;
    }
    int _6171 = _5519;
    bool _6173 = !_5501;
    int _6175 = _6171;
    if (!_6173)
    {
        float _6177 = -_5447;
        float _6179 = _5218 + _6177;
        float _6181 = -_5447;
        float _6183 = _101 + _6181;
        float _6185 = -_5447;
        float _6187 = _91 + _6185;
        float _6189 = -_5447;
        float _6191 = _81 + _6189;
        float _6193 = -_5447;
        float _6195 = _131 + _6193;
        float _6197 = 1.0 / _6179;
        float _6199 = -_5447;
        float _6201 = _141 + _6199;
        float _6203 = -_5447;
        float _6205 = _151 + _6203;
        float _6207 = -_5447;
        float _6209 = _161 + _6207;
        float _6211 = -_5447;
        float _6213 = _171 + _6211;
        float _6215 = -_5447;
        float _6217 = _181 + _6215;
        float _6219 = -_5447;
        float _6221 = _191 + _6219;
        float _6223 = -_5447;
        float _6225 = _201 + _6223;
        float _6227 = -_5447;
        float _6229 = _211 + _6227;
        float _6231 = -_5447;
        float _6233 = _221 + _6231;
        float _6235 = -_5447;
        float _6237 = _231 + _6235;
        float _6239 = _6183 * _6197;
        float _6241 = -_5447;
        float _6243 = _111 + _6241;
        float _6245 = _6187 * _6197;
        float _6247 = _6191 * _6197;
        float _6249 = _6243 * _6197;
        float _6251 = -_5447;
        float _6253 = _121 + _6251;
        float _6255 = fma(_6245, -1.99999904632568359375, 1.99999904632568359375);
        float _6257 = fma(_6245, -7.99999904632568359375, 7.99999904632568359375);
        float _6259 = fma(_6247, -1.99999904632568359375, 1.99999904632568359375);
        float _6261 = fma(_6247, -7.99999904632568359375, 7.99999904632568359375);
        float _6263 = fma(_6239, -1.99999904632568359375, 1.99999904632568359375);
        float _6265 = fma(_6239, -7.99999904632568359375, 7.99999904632568359375);
        float _6267 = _6253 * _6197;
        float _6269 = -_6245;
        float _6271 = _6269 + 0.5;
        float _6273 = -_6247;
        float _6275 = _6273 + 0.5;
        float _6277 = fma(_6249, -1.99999904632568359375, 1.99999904632568359375);
        float _6279 = fma(_6249, -7.99999904632568359375, 7.99999904632568359375);
        float _6281 = trunc(_6255);
        float _6283 = precise::max(_6281, 0.0);
        uint _6285 = uint(_6283);
        float _6287 = fma(_6267, -1.99999904632568359375, 1.99999904632568359375);
        float _6289 = fma(_6267, -7.99999904632568359375, 7.99999904632568359375);
        float _6291 = _6195 * _6197;
        float _6293 = _6201 * _6197;
        float _6295 = -_6239;
        float _6297 = _6295 + 0.5;
        float _6299 = abs(_6271);
        bool _6301 = _6299 >= 0.375;
        float _6303 = -_6249;
        float _6305 = _6303 + 0.5;
        float _6307 = trunc(_6257);
        float _6309 = precise::max(_6307, 0.0);
        uint _6311 = uint(_6309);
        float _6313 = abs(_6275);
        bool _6315 = _6313 >= 0.375;
        float _6317 = fma(_6291, -1.99999904632568359375, 1.99999904632568359375);
        float _6319 = fma(_6291, -7.99999904632568359375, 7.99999904632568359375);
        float _6321 = fma(_6293, -1.99999904632568359375, 1.99999904632568359375);
        float _6323 = fma(_6293, -7.99999904632568359375, 7.99999904632568359375);
        float _6325 = _6205 * _6197;
        float _6327 = _6209 * _6197;
        float _6329 = trunc(_6259);
        float _6331 = precise::max(_6329, 0.0);
        uint _6333 = uint(_6331);
        float _6335 = -_6267;
        float _6337 = _6335 + 0.5;
        float _6339 = abs(_6297);
        bool _6341 = _6339 >= 0.375;
        float _6343 = _6213 * _6197;
        float _6345 = fma(_6325, -1.99999904632568359375, 1.99999904632568359375);
        float _6347 = fma(_6325, -7.99999904632568359375, 7.99999904632568359375);
        float _6349 = fma(_6327, -1.99999904632568359375, 1.99999904632568359375);
        float _6351 = fma(_6327, -7.99999904632568359375, 7.99999904632568359375);
        float _6353 = trunc(_6261);
        float _6355 = precise::max(_6353, 0.0);
        uint _6357 = uint(_6355);
        float _6359 = -_6291;
        float _6361 = _6359 + 0.5;
        float _6363 = abs(_6305);
        bool _6365 = _6363 >= 0.375;
        float _6367 = -_6293;
        float _6369 = _6367 + 0.5;
        float _6371 = abs(_6337);
        bool _6373 = _6371 >= 0.375;
        float _6375 = fma(_6343, -1.99999904632568359375, 1.99999904632568359375);
        float _6377 = fma(_6343, -7.99999904632568359375, 7.99999904632568359375);
        float _6379 = _6217 * _6197;
        float _6381 = trunc(_6263);
        float _6383 = precise::max(_6381, 0.0);
        uint _6385 = uint(_6383);
        float _6387 = _6221 * _6197;
        float _6389 = -_6325;
        float _6391 = _6389 + 0.5;
        float _6393 = -_6327;
        float _6395 = _6393 + 0.5;
        float _6397 = abs(_6361);
        bool _6399 = _6397 >= 0.375;
        float _6401 = fma(_6379, -1.99999904632568359375, 1.99999904632568359375);
        float _6403 = abs(_6369);
        bool _6405 = _6403 >= 0.375;
        float _6407 = fma(_6379, -7.99999904632568359375, 7.99999904632568359375);
        float _6409 = trunc(_6265);
        float _6411 = precise::max(_6409, 0.0);
        uint _6413 = uint(_6411);
        float _6415 = fma(_6387, -1.99999904632568359375, 1.99999904632568359375);
        float _6417 = fma(_6387, -7.99999904632568359375, 7.99999904632568359375);
        float _6419 = _6225 * _6197;
        float _6421 = _6229 * _6197;
        float _6423 = -_6343;
        float _6425 = _6423 + 0.5;
        int _6427 = int(_6285);
        int _6429 = int(_6333);
        int _6431 = int(_6385);
        if (!_6301)
        {
            int _6433 = int(_6311) + 1;
            _6427 = _6433;
        }
        int _6435 = _6427;
        float _6437 = _6233 * _6197;
        float _6439 = trunc(_6277);
        float _6441 = precise::max(_6439, 0.0);
        uint _6443 = uint(_6441);
        int _6445 = int(_6443);
        if (!_6315)
        {
            int _6447 = int(_6357) + 1;
            _6429 = _6447;
        }
        int _6449 = _6429;
        float _6451 = _6237 * _6197;
        float _6453 = abs(_6391);
        bool _6455 = _6453 >= 0.375;
        float _6457 = fma(_6419, -1.99999904632568359375, 1.99999904632568359375);
        float _6459 = abs(_6395);
        bool _6461 = _6459 >= 0.375;
        float _6463 = fma(_6419, -7.99999904632568359375, 7.99999904632568359375);
        float _6465 = fma(_6421, -1.99999904632568359375, 1.99999904632568359375);
        float _6467 = trunc(_6279);
        float _6469 = precise::max(_6467, 0.0);
        uint _6471 = uint(_6469);
        float _6473 = fma(_6421, -7.99999904632568359375, 7.99999904632568359375);
        if (!_6341)
        {
            int _6475 = int(_6413) + 1;
            _6431 = _6475;
        }
        int _6477 = _6431;
        float _6479 = -_6379;
        float _6481 = _6479 + 0.5;
        float _6483 = -_6387;
        float _6485 = _6483 + 0.5;
        float _6487 = abs(_6425);
        bool _6489 = _6487 >= 0.375;
        float _6491 = fma(_6437, -1.99999904632568359375, 1.99999904632568359375);
        float _6493 = -_6419;
        float _6495 = _6493 + 0.5;
        float _6497 = trunc(_6287);
        float _6499 = precise::max(_6497, 0.0);
        uint _6501 = uint(_6499);
        float _6503 = -_6421;
        float _6505 = _6503 + 0.5;
        float _6507 = fma(_6437, -7.99999904632568359375, 7.99999904632568359375);
        float _6509 = fma(_6451, -1.99999904632568359375, 1.99999904632568359375);
        float _6511 = -_6437;
        float _6513 = _6511 + 0.5;
        int _6515 = _6449 << 3;
        float _6517 = trunc(_6289);
        float _6519 = precise::max(_6517, 0.0);
        uint _6521 = uint(_6519);
        int _6523 = int(_6501);
        if (!_6365)
        {
            int _6525 = int(_6471) + 1;
            _6445 = _6525;
        }
        int _6527 = _6445;
        float _6529 = fma(_6451, -7.99999904632568359375, 7.99999904632568359375);
        float _6531 = abs(_6481);
        bool _6533 = _6531 >= 0.375;
        float _6535 = -_6451;
        float _6537 = _6535 + 0.5;
        int _6539 = _6435 | _6515;
        int _6541 = _6527 << 9;
        float _6543 = trunc(_6317);
        float _6545 = precise::max(_6543, 0.0);
        uint _6547 = uint(_6545);
        float _6549 = trunc(_6319);
        float _6551 = precise::max(_6549, 0.0);
        uint _6553 = uint(_6551);
        int _6555 = int(_6547);
        if (!_6373)
        {
            int _6557 = int(_6521) + 1;
            _6523 = _6557;
        }
        int _6559 = _6523;
        float _6561 = abs(_6485);
        bool _6563 = _6561 >= 0.375;
        float _6565 = trunc(_6321);
        float _6567 = precise::max(_6565, 0.0);
        uint _6569 = uint(_6567);
        float _6571 = trunc(_6323);
        float _6573 = precise::max(_6571, 0.0);
        uint _6575 = uint(_6573);
        int _6577 = int(_6569);
        if (!_6399)
        {
            int _6579 = int(_6553) + 1;
            _6555 = _6579;
        }
        int _6581 = _6555;
        float _6583 = abs(_6495);
        bool _6585 = _6583 >= 0.375;
        int _6587 = _6581 << 15;
        float _6589 = trunc(_6345);
        float _6591 = precise::max(_6589, 0.0);
        uint _6593 = uint(_6591);
        float _6595 = trunc(_6347);
        float _6597 = precise::max(_6595, 0.0);
        uint _6599 = uint(_6597);
        int _6601 = int(_6593);
        if (!_6405)
        {
            int _6603 = int(_6575) + 1;
            _6577 = _6603;
        }
        int _6605 = _6577;
        float _6607 = abs(_6505);
        bool _6609 = _6607 >= 0.375;
        float _6611 = trunc(_6349);
        float _6613 = precise::max(_6611, 0.0);
        uint _6615 = uint(_6613);
        float _6617 = trunc(_6351);
        float _6619 = precise::max(_6617, 0.0);
        uint _6621 = uint(_6619);
        int _6623 = int(_6615);
        if (!_6455)
        {
            int _6625 = int(_6599) + 1;
            _6601 = _6625;
        }
        int _6627 = _6601;
        float _6629 = abs(_6513);
        bool _6631 = _6629 >= 0.375;
        int _6633 = _6627 << 21;
        float _6635 = trunc(_6375);
        float _6637 = precise::max(_6635, 0.0);
        uint _6639 = uint(_6637);
        float _6641 = trunc(_6377);
        float _6643 = precise::max(_6641, 0.0);
        uint _6645 = uint(_6643);
        int _6647 = int(_6639);
        if (!_6461)
        {
            int _6649 = int(_6621) + 1;
            _6623 = _6649;
        }
        int _6651 = _6623;
        float _6653 = abs(_6537);
        bool _6655 = _6653 >= 0.375;
        float _6657 = trunc(_6401);
        float _6659 = precise::max(_6657, 0.0);
        uint _6661 = uint(_6659);
        float _6663 = trunc(_6407);
        float _6665 = precise::max(_6663, 0.0);
        uint _6667 = uint(_6665);
        int _6669 = int(_6661);
        if (!_6489)
        {
            int _6671 = int(_6645) + 1;
            _6647 = _6671;
        }
        int _6673 = _6647;
        int _6675 = _6673 << 3;
        float _6677 = trunc(_6415);
        float _6679 = precise::max(_6677, 0.0);
        uint _6681 = uint(_6679);
        int _6683 = _6651 | _6675;
        float _6685 = trunc(_6417);
        float _6687 = precise::max(_6685, 0.0);
        uint _6689 = uint(_6687);
        int _6691 = int(_6681);
        if (!_6533)
        {
            int _6693 = int(_6667) + 1;
            _6669 = _6693;
        }
        int _6695 = _6669;
        int _6697 = _6695 << 6;
        float _6699 = trunc(_6457);
        float _6701 = precise::max(_6699, 0.0);
        uint _6703 = uint(_6701);
        float _6705 = trunc(_6463);
        float _6707 = precise::max(_6705, 0.0);
        uint _6709 = uint(_6707);
        int _6711 = int(_6703);
        if (!_6563)
        {
            int _6713 = int(_6689) + 1;
            _6691 = _6713;
        }
        int _6715 = _6691;
        int _6717 = _6715 << 9;
        float _6719 = trunc(_6465);
        float _6721 = precise::max(_6719, 0.0);
        uint _6723 = uint(_6721);
        int _6725 = _6683 | _6697;
        int _6727 = _6717 | _6725;
        float _6729 = trunc(_6473);
        float _6731 = precise::max(_6729, 0.0);
        uint _6733 = uint(_6731);
        int _6735 = int(_6723);
        if (!_6585)
        {
            int _6737 = int(_6709) + 1;
            _6711 = _6737;
        }
        int _6739 = _6711;
        float _6741 = trunc(_6491);
        float _6743 = precise::max(_6741, 0.0);
        uint _6745 = uint(_6743);
        float _6747 = trunc(_6507);
        float _6749 = precise::max(_6747, 0.0);
        uint _6751 = uint(_6749);
        int _6753 = int(_6745);
        if (!_6609)
        {
            int _6755 = int(_6733) + 1;
            _6735 = _6755;
        }
        int _6757 = _6735;
        int _6759 = _6757 << 15;
        float _6761 = trunc(_6509);
        float _6763 = precise::max(_6761, 0.0);
        uint _6765 = uint(_6763);
        float _6767 = trunc(_6529);
        float _6769 = precise::max(_6767, 0.0);
        uint _6771 = uint(_6769);
        int _6773 = _6477 << 6;
        int _6775 = _6739 << 12;
        int _6777 = _6539 | _6773;
        int _6779 = _6541 | _6777;
        int _6781 = _6559 << 12;
        int _6783 = int(_6765);
        if (!_6631)
        {
            int _6785 = int(_6751) + 1;
            _6753 = _6785;
        }
        int _6787 = _6753;
        int _6789 = _6779 | _6781;
        int _6791 = _6587 | _6789;
        int _6793 = _6727 | _6775;
        int _6795 = _6759 | _6793;
        int _6797 = _6605 << 18;
        if (!_6655)
        {
            int _6799 = int(_6771) + 1;
            _6783 = _6799;
        }
        int _6801 = _6783;
        int _6803 = _6787 << 18;
        int _6805 = _6801 << 21;
        int _6807 = _6791 | _6797;
        int _6809 = _6633 | _6807;
        int _6811 = _6795 | _6803;
        int _6813 = _6805 | _6811;
        uint _6815 = uint(int(uint(_6809) >> uint(16)));
        int _6817 = _6813 << 8;
        uint _6819 = uint(int(uint(_6813) >> uint(8)));
        int _6821 = 65280 & _6817;
        int _6823 = int(_6815) | _6821;
        int _6825 = _6809 << 16;
        int _6827 = int(_6819) << 16;
        _5531 = _6825;
        _6175 = _6827;
        _6169 = _6823;
    }
    int _6829 = _5531;
    int _6831 = _6175;
    int _6833 = _6169;
    int _6835 = _6155 & 65535;
    int _6837 = _6829 | _5525;
    int _6839 = _6831 | _6833;
    int _6841 = _6159 | _6161;
    int _6843 = _6163 << 16;
    int _6845 = _6843 + _6835;
    out.m_37.x = as_type<float>(_6837);
    out.m_37.y = as_type<float>(_6839);
    out.m_37.z = as_type<float>(_6845);
    out.m_37.w = as_type<float>(_6841);
    return main0_out_u{as_type<uint4>(out.m_37)};
}

