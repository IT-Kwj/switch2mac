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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
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
    bool _5057 = false;
    bool _5039 = false;
    bool _4895 = false;
    bool _4877 = false;
    bool _4733 = false;
    bool _4715 = false;
    bool _4571 = false;
    bool _4553 = false;
    bool _4409 = false;
    bool _4391 = false;
    bool _4247 = false;
    bool _4229 = false;
    bool _4085 = false;
    bool _4067 = false;
    bool _3923 = false;
    bool _3905 = false;
    bool _3761 = false;
    bool _3743 = false;
    bool _3599 = false;
    bool _3581 = false;
    bool _3437 = false;
    bool _3419 = false;
    bool _3275 = false;
    bool _3257 = false;
    bool _3113 = false;
    bool _3095 = false;
    bool _2951 = false;
    bool _2933 = false;
    bool _2789 = false;
    bool _2771 = false;
    bool _2661 = false;
    bool _2627 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_34.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float _72 = rint(_66);
    float _74 = precise::max(_72, 0.0);
    uint _77 = uint(_74);
    uint _79 = clamp(_77, 0u, 65535u);
    float3 _6914 = float3(_68, _70, float(int(_79)));
    float3 _6918 = select(_6914, float3(0.0), isnan(_6914));
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6918.xy, uint(rint(_6918.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6918.xy, uint(rint(_6918.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float3 _6940 = float3(_68, _70, float(int(_79)));
    float3 _6942 = select(_6940, float3(0.0), isnan(_6940));
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6942.xy, uint(rint(_6942.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6942.xy, uint(rint(_6942.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float3 _6961 = float3(_68, _70, float(int(_79)));
    float3 _6963 = select(_6961, float3(0.0), isnan(_6961));
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6963.xy, uint(rint(_6963.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6963.xy, uint(rint(_6963.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float3 _6983 = float3(_68, _70, float(int(_79)));
    float3 _6985 = select(_6983, float3(0.0), isnan(_6983));
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6985.xy, uint(rint(_6985.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6985.xy, uint(rint(_6985.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float3 _7005 = float3(_68, _70, float(int(_79)));
    float3 _7007 = select(_7005, float3(0.0), isnan(_7005));
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7007.xy, uint(rint(_7007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7007.xy, uint(rint(_7007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float3 _7027 = float3(_68, _70, float(int(_79)));
    float3 _7029 = select(_7027, float3(0.0), isnan(_7027));
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7029.xy, uint(rint(_7029.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7029.xy, uint(rint(_7029.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float3 _7049 = float3(_68, _70, float(int(_79)));
    float3 _7051 = select(_7049, float3(0.0), isnan(_7049));
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7051.xy, uint(rint(_7051.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7051.xy, uint(rint(_7051.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float3 _7071 = float3(_68, _70, float(int(_79)));
    float3 _7073 = select(_7071, float3(0.0), isnan(_7071));
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7073.xy, uint(rint(_7073.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7073.xy, uint(rint(_7073.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float3 _7093 = float3(_68, _70, float(int(_79)));
    float3 _7095 = select(_7093, float3(0.0), isnan(_7093));
    float4 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7095.xy, uint(rint(_7095.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7095.xy, uint(rint(_7095.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyzw;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _162.z;
    float _170 = _162.w;
    float3 _7115 = float3(_68, _70, float(int(_79)));
    float3 _7117 = select(_7115, float3(0.0), isnan(_7115));
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7117.xy, uint(rint(_7117.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7117.xy, uint(rint(_7117.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float3 _7137 = float3(_68, _70, float(int(_79)));
    float3 _7139 = select(_7137, float3(0.0), isnan(_7137));
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7139.xy, uint(rint(_7139.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7139.xy, uint(rint(_7139.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float3 _7159 = float3(_68, _70, float(int(_79)));
    float3 _7161 = select(_7159, float3(0.0), isnan(_7159));
    float4 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7161.xy, uint(rint(_7161.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7161.xy, uint(rint(_7161.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyzw;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _192.w;
    float3 _7181 = float3(_68, _70, float(int(_79)));
    float3 _7183 = select(_7181, float3(0.0), isnan(_7181));
    float4 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7183.xy, uint(rint(_7183.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7183.xy, uint(rint(_7183.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyzw;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float _210 = _202.w;
    float3 _7203 = float3(_68, _70, float(int(_79)));
    float3 _7205 = select(_7203, float3(0.0), isnan(_7203));
    float4 _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7205.xy, uint(rint(_7205.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7205.xy, uint(rint(_7205.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyzw;
    float _214 = _212.x;
    float _216 = _212.y;
    float _218 = _212.z;
    float _220 = _212.w;
    float3 _7225 = float3(_68, _70, float(int(_79)));
    float3 _7227 = select(_7225, float3(0.0), isnan(_7225));
    float4 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7227.xy, uint(rint(_7227.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7227.xy, uint(rint(_7227.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyzw;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = _222.z;
    float _230 = _222.w;
    float3 _7247 = float3(_68, _70, float(int(_79)));
    float3 _7249 = select(_7247, float3(0.0), isnan(_7247));
    float4 _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7249.xy, uint(rint(_7249.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7249.xy, uint(rint(_7249.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyzw;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = _232.z;
    float _240 = _232.w;
    float _242 = _94 + _84;
    float _244 = _96 + _86;
    float _246 = _98 + _88;
    float _248 = _104 + _242;
    float _250 = _106 + _244;
    float _252 = _108 + _246;
    float _254 = _114 + _248;
    float _256 = _116 + _250;
    float _258 = _118 + _252;
    float _260 = _124 + _254;
    float _262 = _126 + _256;
    float _264 = _128 + _258;
    float _266 = _134 + _260;
    float _268 = _136 + _262;
    float _270 = _138 + _264;
    float _272 = _144 + _266;
    float _274 = _146 + _268;
    float _276 = _148 + _270;
    float _278 = _154 + _272;
    float _280 = _156 + _274;
    float _282 = _158 + _276;
    float _284 = _164 + _278;
    float _286 = _166 + _280;
    float _288 = _168 + _282;
    float _290 = _174 + _284;
    float _292 = _176 + _286;
    float _294 = _178 + _288;
    float _296 = _184 + _290;
    float _298 = _186 + _292;
    float _300 = _188 + _294;
    float _302 = _194 + _296;
    float _304 = _196 + _298;
    float _306 = _198 + _300;
    float _308 = _204 + _302;
    float _310 = _206 + _304;
    float _312 = _208 + _306;
    float _314 = _214 + _308;
    float _316 = _216 + _310;
    float _318 = _218 + _312;
    float _320 = _224 + _314;
    float _322 = _226 + _316;
    float _324 = _228 + _318;
    float _326 = _236 + _322;
    float _328 = _234 + _320;
    float _330 = _238 + _324;
    float _332 = fma(_326, -0.0625, _86);
    float _334 = fma(_328, -0.0625, _84);
    float _336 = fma(_330, -0.0625, _88);
    float _338 = fma(_326, -0.0625, _96);
    float _340 = _332 * _332;
    float _342 = _334 * _332;
    float _344 = _332 * _336;
    float _346 = fma(_328, -0.0625, _94);
    float _348 = fma(_330, -0.0625, _98);
    float _350 = _334 * _334;
    float _352 = _334 * _336;
    float _354 = fma(_338, _338, _340);
    float _356 = fma(_346, _338, _342);
    float _358 = fma(_338, _348, _344);
    float _360 = fma(_346, _346, _350);
    float _362 = fma(_346, _348, _352);
    float _364 = _336 * _336;
    float _366 = fma(_326, -0.0625, _106);
    float _368 = fma(_328, -0.0625, _104);
    float _370 = fma(_330, -0.0625, _108);
    float _372 = fma(_348, _348, _364);
    float _374 = fma(_366, _366, _354);
    float _376 = fma(_368, _366, _356);
    float _378 = fma(_366, _370, _358);
    float _380 = fma(_368, _368, _360);
    float _382 = fma(_368, _370, _362);
    float _384 = fma(_326, -0.0625, _116);
    float _386 = fma(_328, -0.0625, _114);
    float _388 = fma(_330, -0.0625, _118);
    float _390 = fma(_370, _370, _372);
    float _392 = fma(_384, _384, _374);
    float _394 = fma(_386, _384, _376);
    float _396 = fma(_384, _388, _378);
    float _398 = fma(_386, _386, _380);
    float _400 = fma(_386, _388, _382);
    float _402 = fma(_326, -0.0625, _126);
    float _404 = fma(_328, -0.0625, _124);
    float _406 = fma(_330, -0.0625, _128);
    float _408 = fma(_388, _388, _390);
    float _410 = fma(_402, _402, _392);
    float _412 = fma(_404, _402, _394);
    float _414 = fma(_402, _406, _396);
    float _416 = fma(_404, _404, _398);
    float _418 = fma(_404, _406, _400);
    float _420 = fma(_326, -0.0625, _136);
    float _422 = fma(_328, -0.0625, _134);
    float _424 = fma(_330, -0.0625, _138);
    float _426 = fma(_406, _406, _408);
    float _428 = fma(_420, _420, _410);
    float _430 = fma(_422, _420, _412);
    float _432 = fma(_420, _424, _414);
    float _434 = fma(_422, _422, _416);
    float _436 = fma(_422, _424, _418);
    float _438 = fma(_326, -0.0625, _146);
    float _440 = fma(_328, -0.0625, _144);
    float _442 = fma(_330, -0.0625, _148);
    float _444 = fma(_424, _424, _426);
    float _446 = fma(_438, _438, _428);
    float _448 = fma(_440, _438, _430);
    float _450 = fma(_438, _442, _432);
    float _452 = fma(_440, _440, _434);
    float _454 = fma(_440, _442, _436);
    float _456 = fma(_326, -0.0625, _156);
    float _458 = fma(_328, -0.0625, _154);
    float _460 = fma(_330, -0.0625, _158);
    float _462 = fma(_442, _442, _444);
    float _464 = fma(_456, _456, _446);
    float _466 = fma(_458, _456, _448);
    float _468 = fma(_456, _460, _450);
    float _470 = fma(_458, _458, _452);
    float _472 = fma(_458, _460, _454);
    float _474 = fma(_326, -0.0625, _166);
    float _476 = fma(_328, -0.0625, _164);
    float _478 = fma(_330, -0.0625, _168);
    float _480 = fma(_460, _460, _462);
    float _482 = fma(_474, _474, _464);
    float _484 = fma(_476, _474, _466);
    float _486 = fma(_474, _478, _468);
    float _488 = fma(_476, _476, _470);
    float _490 = fma(_476, _478, _472);
    float _492 = fma(_326, -0.0625, _176);
    float _494 = fma(_328, -0.0625, _174);
    float _496 = fma(_330, -0.0625, _178);
    float _498 = fma(_478, _478, _480);
    float _500 = fma(_492, _492, _482);
    float _502 = fma(_494, _492, _484);
    float _504 = fma(_492, _496, _486);
    float _506 = fma(_494, _494, _488);
    float _508 = fma(_494, _496, _490);
    float _510 = fma(_326, -0.0625, _186);
    float _512 = fma(_328, -0.0625, _184);
    float _514 = fma(_330, -0.0625, _188);
    float _516 = fma(_496, _496, _498);
    float _518 = fma(_510, _510, _500);
    float _520 = fma(_512, _510, _502);
    float _522 = fma(_510, _514, _504);
    float _524 = fma(_512, _512, _506);
    float _526 = fma(_512, _514, _508);
    float _528 = fma(_326, -0.0625, _196);
    float _530 = fma(_328, -0.0625, _194);
    float _532 = fma(_330, -0.0625, _198);
    float _534 = fma(_514, _514, _516);
    float _536 = fma(_528, _528, _518);
    float _538 = fma(_530, _528, _520);
    float _540 = fma(_528, _532, _522);
    float _542 = fma(_530, _530, _524);
    float _544 = fma(_530, _532, _526);
    float _546 = fma(_326, -0.0625, _206);
    float _548 = fma(_328, -0.0625, _204);
    float _550 = fma(_330, -0.0625, _208);
    float _552 = fma(_532, _532, _534);
    float _554 = fma(_546, _546, _536);
    float _556 = fma(_548, _546, _538);
    float _558 = fma(_546, _550, _540);
    float _560 = fma(_548, _548, _542);
    float _562 = fma(_548, _550, _544);
    float _564 = fma(_326, -0.0625, _216);
    float _566 = fma(_328, -0.0625, _214);
    float _568 = fma(_330, -0.0625, _218);
    float _570 = fma(_550, _550, _552);
    float _572 = fma(_564, _564, _554);
    float _574 = fma(_566, _564, _556);
    float _576 = fma(_564, _568, _558);
    float _578 = fma(_566, _566, _560);
    float _580 = fma(_566, _568, _562);
    float _582 = fma(_326, -0.0625, _226);
    float _584 = fma(_328, -0.0625, _224);
    float _586 = fma(_330, -0.0625, _228);
    float _588 = fma(_328, -0.0625, _234);
    float _590 = fma(_582, _582, _572);
    float _592 = fma(_584, _582, _574);
    float _594 = fma(_582, _586, _576);
    float _596 = fma(_326, -0.0625, _236);
    float _598 = fma(_568, _568, _570);
    float _600 = fma(_330, -0.0625, _238);
    float _602 = fma(_584, _584, _578);
    float _604 = fma(_596, _596, _590);
    float _606 = fma(_588, _596, _592);
    float _608 = fma(_584, _586, _580);
    float _610 = fma(_596, _600, _594);
    float _612 = fma(_588, _588, _602);
    float _614 = _604 + _606;
    float _616 = fma(_586, _586, _598);
    float _618 = fma(_588, _600, _608);
    float _620 = _612 + _606;
    float _622 = _610 + _614;
    float _624 = fma(_600, _600, _616);
    float _626 = _610 + _618;
    float _628 = _618 + _620;
    float _630 = _622 * _622;
    float _632 = _624 + _626;
    float _634 = fma(_628, _628, _630);
    float _636 = fma(_632, _632, _634);
    float _638 = rsqrt(_636);
    float _640 = _622 * _638;
    float _642 = _628 * _638;
    float _644 = _632 * _638;
    float _646 = _604 * _640;
    float _648 = _606 * _640;
    float _650 = fma(_606, _642, _646);
    float _652 = _610 * _640;
    float _654 = fma(_612, _642, _648);
    float _656 = fma(_610, _644, _650);
    float _658 = fma(_618, _642, _652);
    float _660 = fma(_618, _644, _654);
    float _662 = _656 * _656;
    float _664 = fma(_624, _644, _658);
    float _666 = fma(_660, _660, _662);
    float _668 = fma(_664, _664, _666);
    float _670 = rsqrt(_668);
    float _672 = _656 * _670;
    float _674 = _660 * _670;
    float _676 = _664 * _670;
    float _678 = _604 * _672;
    float _680 = _606 * _672;
    float _682 = _610 * _672;
    float _684 = fma(_606, _674, _678);
    float _686 = fma(_612, _674, _680);
    float _688 = fma(_618, _674, _682);
    float _690 = fma(_610, _676, _684);
    float _692 = fma(_618, _676, _686);
    float _694 = fma(_624, _676, _688);
    float _696 = _690 * _690;
    float _698 = fma(_692, _692, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _690 * _702;
    float _706 = _692 * _702;
    float _708 = _694 * _702;
    float _710 = _604 * _704;
    float _712 = _606 * _704;
    float _714 = _610 * _704;
    float _716 = fma(_606, _706, _710);
    float _718 = fma(_612, _706, _712);
    float _720 = fma(_618, _706, _714);
    float _722 = fma(_610, _708, _716);
    float _724 = fma(_618, _708, _718);
    float _726 = fma(_624, _708, _720);
    float _728 = _722 * _722;
    float _730 = fma(_724, _724, _728);
    float _732 = fma(_726, _726, _730);
    float _734 = rsqrt(_732);
    float _736 = _722 * _734;
    float _738 = _724 * _734;
    float _740 = _726 * _734;
    float _742 = _604 * _736;
    float _744 = _606 * _736;
    float _746 = _610 * _736;
    float _748 = fma(_606, _738, _742);
    float _750 = fma(_612, _738, _744);
    float _752 = fma(_618, _738, _746);
    float _754 = fma(_610, _740, _748);
    float _756 = fma(_618, _740, _750);
    float _758 = fma(_624, _740, _752);
    float _760 = _754 * _754;
    float _762 = fma(_756, _756, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = _754 * _766;
    float _770 = _756 * _766;
    float _772 = _758 * _766;
    float _774 = _604 * _768;
    float _776 = _606 * _768;
    float _778 = _610 * _768;
    float _780 = fma(_606, _770, _774);
    float _782 = fma(_612, _770, _776);
    float _784 = fma(_618, _770, _778);
    float _786 = fma(_610, _772, _780);
    float _788 = fma(_618, _772, _782);
    float _790 = fma(_624, _772, _784);
    float _792 = _786 * _786;
    float _794 = fma(_788, _788, _792);
    float _796 = fma(_790, _790, _794);
    float _798 = rsqrt(_796);
    float _800 = _786 * _798;
    float _802 = _788 * _798;
    float _804 = _790 * _798;
    float _806 = _604 * _800;
    float _808 = _606 * _800;
    float _810 = _610 * _800;
    float _812 = fma(_606, _802, _806);
    float _814 = fma(_612, _802, _808);
    float _816 = fma(_618, _802, _810);
    float _818 = fma(_610, _804, _812);
    float _820 = fma(_618, _804, _814);
    float _822 = fma(_624, _804, _816);
    float _824 = _818 * _818;
    float _826 = fma(_820, _820, _824);
    float _828 = fma(_822, _822, _826);
    float _830 = rsqrt(_828);
    float _832 = _818 * _830;
    float _834 = _820 * _830;
    float _836 = _822 * _830;
    float _838 = _604 * _832;
    float _840 = _606 * _832;
    float _842 = fma(_606, _834, _838);
    float _844 = _610 * _832;
    float _846 = fma(_612, _834, _840);
    float _848 = fma(_610, _836, _842);
    float _850 = fma(_618, _834, _844);
    float _852 = fma(_618, _836, _846);
    float _854 = _848 * _848;
    float _856 = fma(_624, _836, _850);
    float _858 = fma(_852, _852, _854);
    float _860 = fma(_856, _856, _858);
    float _862 = rsqrt(_860);
    float _864 = _848 * _862;
    float _866 = _852 * _862;
    float _868 = _856 * _862;
    float _870 = _96 * _864;
    float _872 = _86 * _864;
    float _874 = _106 * _864;
    float _876 = fma(_94, _866, _870);
    float _878 = fma(_84, _866, _872);
    float _880 = fma(_104, _866, _874);
    float _882 = fma(_98, _868, _876);
    float _884 = fma(_88, _868, _878);
    float _886 = fma(_108, _868, _880);
    bool _890 = _882 >= _884;
    bool _892 = isnan(_882);
    bool _894 = _890 || _892;
    bool _896 = isnan(_884);
    bool _898 = _894 || _896;
    float _900 = _70;
    float _902 = _880;
    float _904 = _612;
    float _906 = _876;
    float _908 = _862;
    float _910 = _834;
    float _912 = _822;
    float _914 = _832;
    float _916 = _882;
    float _918 = _806;
    float _920 = _886;
    float _922 = _886;
    float _924 = _864;
    float _926 = _866;
    float _928 = 7.1466221680565670617110208747786e-44;
    float _930 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _932 = 7.0064923216240853546186479164496e-44;
    spvUnsafeArray<uint, 4> _24;
    if (!_898)
    {
        _900 = _84;
    }
    float _934 = _900;
    float _936 = _934;
    float _938 = _934;
    if (!_898)
    {
        _902 = _86;
    }
    float _940 = _902;
    float _942 = _940;
    float _944 = _940;
    if (!_898)
    {
        _904 = _88;
    }
    float _946 = _904;
    float _948 = _946;
    float _950 = _946;
    if (!_898)
    {
        _906 = _882;
    }
    float _952 = _906;
    float _954 = _952;
    float _956 = _952;
    if (!_898)
    {
        _908 = _884;
    }
    float _958 = _908;
    float _960 = _958;
    float _962 = _958;
    if (!_898)
    {
        _910 = _94;
    }
    float _964 = _910;
    float _966 = _964;
    float _968 = _964;
    if (!_898)
    {
        _912 = _96;
    }
    float _970 = _912;
    float _972 = _970;
    float _974 = _970;
    if (!_898)
    {
        _914 = _98;
    }
    float _976 = _914;
    bool _978 = !_898;
    float _980 = _976;
    float _982 = _976;
    if (!_978)
    {
        bool _984 = _882 > _884;
        if (!_984)
        {
            _954 = _882;
        }
        float _986 = _954;
        float _988 = _986;
        if (!_984)
        {
            _960 = _882;
        }
        float _990 = _960;
        float _992 = _990;
        if (!_984)
        {
            _966 = _94;
        }
        float _994 = _966;
        float _996 = _994;
        if (!_984)
        {
            _972 = _96;
        }
        float _998 = _972;
        float _1000 = _998;
        if (!_984)
        {
            _980 = _98;
        }
        float _1002 = _980;
        float _1004 = _1002;
        if (!_984)
        {
            _936 = _94;
        }
        float _1006 = _936;
        float _1008 = _1006;
        if (!_984)
        {
            _942 = _96;
        }
        float _1010 = _942;
        float _1012 = _1010;
        if (!_984)
        {
            _948 = _98;
        }
        float _1014 = _948;
        _950 = _1014;
        if (_984)
        {
            _988 = _884;
        }
        float _1016 = _988;
        _956 = _1016;
        if (_984)
        {
            _992 = _882;
        }
        float _1018 = _992;
        _962 = _1018;
        if (_984)
        {
            _996 = _84;
        }
        float _1020 = _996;
        _968 = _1020;
        if (_984)
        {
            _1000 = _86;
        }
        float _1022 = _1000;
        _974 = _1022;
        if (_984)
        {
            _1004 = _88;
        }
        float _1024 = _1004;
        _982 = _1024;
        if (_984)
        {
            _1008 = _94;
        }
        float _1026 = _1008;
        _938 = _1026;
        if (_984)
        {
            _1012 = _96;
        }
        float _1028 = _1012;
        _944 = _1028;
        if (_984)
        {
            _950 = _98;
        }
    }
    float _1030 = _962;
    float _1032 = _956;
    float _1034 = _938;
    float _1036 = _944;
    float _1038 = _950;
    float _1040 = _968;
    float _1042 = _974;
    float _1044 = _982;
    bool _1046 = _1030 >= _886;
    bool _1048 = isnan(_1030);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(_886);
    bool _1054 = _1050 || _1052;
    float _1056 = _116 * _864;
    float _1058 = fma(_114, _866, _1056);
    float _1060 = fma(_118, _868, _1058);
    float _1062 = _1058;
    float _1064 = _1032;
    float _1066 = _1040;
    float _1068 = _1042;
    float _1070 = _1032;
    float _1072 = _1040;
    float _1074 = _1042;
    float _1076 = _1044;
    float _1078 = _1030;
    float _1080 = _1038;
    float _1082 = _1060;
    float _1084 = _1060;
    if (!_1054)
    {
        _916 = _104;
    }
    float _1086 = _916;
    float _1088 = _1086;
    float _1090 = _1086;
    if (!_1054)
    {
        _1062 = _106;
    }
    float _1092 = _1062;
    float _1094 = _1092;
    float _1096 = _1092;
    if (!_1054)
    {
        _918 = _108;
    }
    float _1098 = _918;
    bool _1100 = !_1054;
    float _1102 = _1098;
    float _1104 = _1098;
    if (!_1100)
    {
        bool _1106 = _1032 > _886;
        if (_1106)
        {
            _1064 = _886;
        }
        float _1108 = _1064;
        _1070 = _1108;
        if (!_1106)
        {
            _1088 = _1034;
        }
        float _1110 = _1088;
        float _1112 = _1110;
        if (!_1106)
        {
            _1094 = _1036;
        }
        float _1114 = _1094;
        float _1116 = _1114;
        if (!_1106)
        {
            _1102 = _1038;
        }
        float _1118 = _1102;
        float _1120 = _1118;
        if (!_1106)
        {
            _920 = _1030;
        }
        float _1122 = _920;
        float _1124 = _1122;
        if (_1106)
        {
            _1112 = _1034;
        }
        float _1126 = _1112;
        _1090 = _1126;
        if (_1106)
        {
            _1116 = _1036;
        }
        float _1128 = _1116;
        _1096 = _1128;
        if (_1106)
        {
            _1120 = _1038;
        }
        float _1130 = _1120;
        _1104 = _1130;
        if (_1106)
        {
            _1124 = _1030;
        }
        float _1132 = _1124;
        _922 = _1132;
        if (_1106)
        {
            _1066 = _104;
        }
        float _1134 = _1066;
        _1072 = _1134;
        if (_1106)
        {
            _1068 = _106;
        }
        float _1136 = _1068;
        _1074 = _1136;
        if (_1106)
        {
            _1076 = _108;
        }
    }
    float _1138 = _922;
    float _1140 = _1070;
    float _1142 = _1090;
    float _1144 = _1096;
    float _1146 = _1104;
    float _1148 = _1072;
    float _1150 = _1074;
    float _1152 = _1076;
    bool _1154 = _1138 >= _1060;
    bool _1156 = isnan(_1138);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(_1060);
    bool _1162 = _1158 || _1160;
    float _1164 = _126 * _864;
    float _1166 = fma(_124, _866, _1164);
    float _1168 = fma(_128, _868, _1166);
    float _1170 = _1166;
    float _1172 = _1140;
    float _1174 = _1148;
    float _1176 = _1150;
    float _1178 = _1140;
    float _1180 = _1148;
    float _1182 = _1150;
    float _1184 = _1152;
    float _1186 = _1142;
    float _1188 = _1146;
    float _1190 = _1168;
    float _1192 = _1168;
    if (!_1162)
    {
        _1078 = _114;
    }
    float _1194 = _1078;
    float _1196 = _1194;
    float _1198 = _1194;
    if (!_1162)
    {
        _1080 = _116;
    }
    float _1200 = _1080;
    float _1202 = _1200;
    float _1204 = _1200;
    if (!_1162)
    {
        _1170 = _118;
    }
    float _1206 = _1170;
    bool _1208 = !_1162;
    float _1210 = _1206;
    float _1212 = _1206;
    if (!_1208)
    {
        bool _1214 = _1140 > _1060;
        if (_1214)
        {
            _1172 = _1060;
        }
        float _1216 = _1172;
        _1178 = _1216;
        if (!_1214)
        {
            _1196 = _1142;
        }
        float _1218 = _1196;
        float _1220 = _1218;
        if (!_1214)
        {
            _1202 = _1144;
        }
        float _1222 = _1202;
        float _1224 = _1222;
        if (!_1214)
        {
            _1210 = _1146;
        }
        float _1226 = _1210;
        float _1228 = _1226;
        if (!_1214)
        {
            _1082 = _1138;
        }
        float _1230 = _1082;
        float _1232 = _1230;
        if (_1214)
        {
            _1220 = _1142;
        }
        float _1234 = _1220;
        _1198 = _1234;
        if (_1214)
        {
            _1224 = _1144;
        }
        float _1236 = _1224;
        _1204 = _1236;
        if (_1214)
        {
            _1228 = _1146;
        }
        float _1238 = _1228;
        _1212 = _1238;
        if (_1214)
        {
            _1232 = _1138;
        }
        float _1240 = _1232;
        _1084 = _1240;
        if (_1214)
        {
            _1174 = _114;
        }
        float _1242 = _1174;
        _1180 = _1242;
        if (_1214)
        {
            _1176 = _116;
        }
        float _1244 = _1176;
        _1182 = _1244;
        if (_1214)
        {
            _1184 = _118;
        }
    }
    float _1246 = _1084;
    float _1248 = _1178;
    float _1250 = _1198;
    float _1252 = _1204;
    float _1254 = _1212;
    float _1256 = _1180;
    float _1258 = _1182;
    float _1260 = _1184;
    bool _1262 = _1246 >= _1168;
    bool _1264 = isnan(_1246);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(_1168);
    bool _1270 = _1266 || _1268;
    float _1272 = _136 * _864;
    float _1274 = fma(_134, _866, _1272);
    float _1276 = fma(_138, _868, _1274);
    float _1278 = _1274;
    float _1280 = _1248;
    float _1282 = _1256;
    float _1284 = _1258;
    float _1286 = _1248;
    float _1288 = _1256;
    float _1290 = _1258;
    float _1292 = _1260;
    float _1294 = _1250;
    float _1296 = _1252;
    float _1298 = _1276;
    float _1300 = _1276;
    float _1302 = _1246;
    if (!_1270)
    {
        _1186 = _124;
    }
    float _1304 = _1186;
    float _1306 = _1304;
    float _1308 = _1304;
    if (!_1270)
    {
        _1278 = _126;
    }
    float _1310 = _1278;
    float _1312 = _1310;
    float _1314 = _1310;
    if (!_1270)
    {
        _1188 = _128;
    }
    float _1316 = _1188;
    bool _1318 = !_1270;
    float _1320 = _1316;
    float _1322 = _1316;
    if (!_1318)
    {
        bool _1324 = _1248 > _1168;
        if (_1324)
        {
            _1280 = _1168;
        }
        float _1326 = _1280;
        _1286 = _1326;
        if (!_1324)
        {
            _1306 = _1250;
        }
        float _1328 = _1306;
        float _1330 = _1328;
        if (!_1324)
        {
            _1312 = _1252;
        }
        float _1332 = _1312;
        float _1334 = _1332;
        if (!_1324)
        {
            _1320 = _1254;
        }
        float _1336 = _1320;
        float _1338 = _1336;
        if (!_1324)
        {
            _1190 = _1246;
        }
        float _1340 = _1190;
        float _1342 = _1340;
        if (_1324)
        {
            _1330 = _1250;
        }
        float _1344 = _1330;
        _1308 = _1344;
        if (_1324)
        {
            _1334 = _1252;
        }
        float _1346 = _1334;
        _1314 = _1346;
        if (_1324)
        {
            _1338 = _1254;
        }
        float _1348 = _1338;
        _1322 = _1348;
        if (_1324)
        {
            _1342 = _1246;
        }
        float _1350 = _1342;
        _1192 = _1350;
        if (_1324)
        {
            _1282 = _124;
        }
        float _1352 = _1282;
        _1288 = _1352;
        if (_1324)
        {
            _1284 = _126;
        }
        float _1354 = _1284;
        _1290 = _1354;
        if (_1324)
        {
            _1292 = _128;
        }
    }
    float _1356 = _1192;
    float _1358 = _1286;
    float _1360 = _1308;
    float _1362 = _1314;
    float _1364 = _1322;
    float _1366 = _1288;
    float _1368 = _1290;
    float _1370 = _1292;
    bool _1372 = _1356 >= _1276;
    bool _1374 = isnan(_1356);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(_1276);
    bool _1380 = _1376 || _1378;
    float _1382 = _146 * _864;
    float _1384 = fma(_144, _866, _1382);
    float _1386 = fma(_148, _868, _1384);
    float _1388 = _1384;
    float _1390 = _1358;
    float _1392 = _1366;
    float _1394 = _1368;
    float _1396 = _1358;
    float _1398 = _1366;
    float _1400 = _1368;
    float _1402 = _1370;
    float _1404 = _1364;
    float _1406 = _1356;
    float _1408 = _1386;
    float _1410 = _1386;
    if (!_1380)
    {
        _1294 = _134;
    }
    float _1412 = _1294;
    float _1414 = _1412;
    float _1416 = _1412;
    if (!_1380)
    {
        _1296 = _136;
    }
    float _1418 = _1296;
    float _1420 = _1418;
    float _1422 = _1418;
    if (!_1380)
    {
        _1388 = _138;
    }
    float _1424 = _1388;
    bool _1426 = !_1380;
    float _1428 = _1424;
    float _1430 = _1424;
    if (!_1426)
    {
        bool _1432 = _1358 > _1276;
        if (_1432)
        {
            _1390 = _1276;
        }
        float _1434 = _1390;
        _1396 = _1434;
        if (!_1432)
        {
            _1414 = _1360;
        }
        float _1436 = _1414;
        float _1438 = _1436;
        if (!_1432)
        {
            _1420 = _1362;
        }
        float _1440 = _1420;
        float _1442 = _1440;
        if (!_1432)
        {
            _1428 = _1364;
        }
        float _1444 = _1428;
        float _1446 = _1444;
        if (!_1432)
        {
            _1298 = _1356;
        }
        float _1448 = _1298;
        float _1450 = _1448;
        if (_1432)
        {
            _1438 = _1360;
        }
        float _1452 = _1438;
        _1416 = _1452;
        if (_1432)
        {
            _1442 = _1362;
        }
        float _1454 = _1442;
        _1422 = _1454;
        if (_1432)
        {
            _1446 = _1364;
        }
        float _1456 = _1446;
        _1430 = _1456;
        if (_1432)
        {
            _1450 = _1356;
        }
        float _1458 = _1450;
        _1300 = _1458;
        if (_1432)
        {
            _1392 = _134;
        }
        float _1460 = _1392;
        _1398 = _1460;
        if (_1432)
        {
            _1394 = _136;
        }
        float _1462 = _1394;
        _1400 = _1462;
        if (_1432)
        {
            _1402 = _138;
        }
    }
    float _1464 = _1300;
    float _1466 = _1396;
    float _1468 = _1416;
    float _1470 = _1422;
    float _1472 = _1430;
    float _1474 = _1398;
    float _1476 = _1400;
    float _1478 = _1402;
    bool _1480 = _1464 >= _1386;
    bool _1482 = isnan(_1464);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(_1386);
    bool _1488 = _1484 || _1486;
    float _1490 = _156 * _864;
    float _1492 = fma(_154, _866, _1490);
    float _1494 = fma(_158, _868, _1492);
    float _1496 = _1466;
    float _1498 = _1474;
    float _1500 = _1476;
    float _1502 = _1466;
    float _1504 = _1474;
    float _1506 = _1476;
    float _1508 = _1478;
    float _1510 = _1468;
    float _1512 = _1470;
    float _1514 = _1494;
    float _1516 = _1494;
    if (!_1488)
    {
        _1404 = _144;
    }
    float _1518 = _1404;
    float _1520 = _1518;
    float _1522 = _1518;
    if (!_1488)
    {
        _1302 = _146;
    }
    float _1524 = _1302;
    float _1526 = _1524;
    float _1528 = _1524;
    if (!_1488)
    {
        _1406 = _148;
    }
    float _1530 = _1406;
    bool _1532 = !_1488;
    float _1534 = _1530;
    float _1536 = _1530;
    if (!_1532)
    {
        bool _1538 = _1466 > _1386;
        if (_1538)
        {
            _1496 = _1386;
        }
        float _1540 = _1496;
        _1502 = _1540;
        if (!_1538)
        {
            _1520 = _1468;
        }
        float _1542 = _1520;
        float _1544 = _1542;
        if (!_1538)
        {
            _1526 = _1470;
        }
        float _1546 = _1526;
        float _1548 = _1546;
        if (!_1538)
        {
            _1534 = _1472;
        }
        float _1550 = _1534;
        float _1552 = _1550;
        if (!_1538)
        {
            _1408 = _1464;
        }
        float _1554 = _1408;
        float _1556 = _1554;
        if (_1538)
        {
            _1544 = _1468;
        }
        float _1558 = _1544;
        _1522 = _1558;
        if (_1538)
        {
            _1548 = _1470;
        }
        float _1560 = _1548;
        _1528 = _1560;
        if (_1538)
        {
            _1552 = _1472;
        }
        float _1562 = _1552;
        _1536 = _1562;
        if (_1538)
        {
            _1556 = _1464;
        }
        float _1564 = _1556;
        _1410 = _1564;
        if (_1538)
        {
            _1498 = _144;
        }
        float _1566 = _1498;
        _1504 = _1566;
        if (_1538)
        {
            _1500 = _146;
        }
        float _1568 = _1500;
        _1506 = _1568;
        if (_1538)
        {
            _1508 = _148;
        }
    }
    float _1570 = _1410;
    float _1572 = _1502;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1536;
    float _1580 = _1504;
    float _1582 = _1506;
    float _1584 = _1508;
    bool _1586 = _1570 >= _1494;
    bool _1588 = isnan(_1570);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan(_1494);
    bool _1594 = _1590 || _1592;
    float _1596 = _166 * _864;
    float _1598 = fma(_164, _866, _1596);
    float _1600 = fma(_168, _868, _1598);
    float _1602 = _1598;
    float _1604 = _1572;
    float _1606 = _1580;
    float _1608 = _1582;
    float _1610 = _1572;
    float _1612 = _1580;
    float _1614 = _1582;
    float _1616 = _1584;
    float _1618 = _1578;
    float _1620 = _1574;
    float _1622 = _1600;
    float _1624 = _1600;
    if (!_1594)
    {
        _1510 = _154;
    }
    float _1626 = _1510;
    float _1628 = _1626;
    float _1630 = _1626;
    if (!_1594)
    {
        _1512 = _156;
    }
    float _1632 = _1512;
    float _1634 = _1632;
    float _1636 = _1632;
    if (!_1594)
    {
        _1602 = _158;
    }
    float _1638 = _1602;
    bool _1640 = !_1594;
    float _1642 = _1638;
    float _1644 = _1638;
    if (!_1640)
    {
        bool _1646 = _1572 > _1494;
        if (_1646)
        {
            _1604 = _1494;
        }
        float _1648 = _1604;
        _1610 = _1648;
        if (!_1646)
        {
            _1628 = _1574;
        }
        float _1650 = _1628;
        float _1652 = _1650;
        if (!_1646)
        {
            _1634 = _1576;
        }
        float _1654 = _1634;
        float _1656 = _1654;
        if (!_1646)
        {
            _1642 = _1578;
        }
        float _1658 = _1642;
        float _1660 = _1658;
        if (!_1646)
        {
            _1514 = _1570;
        }
        float _1662 = _1514;
        float _1664 = _1662;
        if (_1646)
        {
            _1652 = _1574;
        }
        float _1666 = _1652;
        _1630 = _1666;
        if (_1646)
        {
            _1656 = _1576;
        }
        float _1668 = _1656;
        _1636 = _1668;
        if (_1646)
        {
            _1660 = _1578;
        }
        float _1670 = _1660;
        _1644 = _1670;
        if (_1646)
        {
            _1664 = _1570;
        }
        float _1672 = _1664;
        _1516 = _1672;
        if (_1646)
        {
            _1606 = _154;
        }
        float _1674 = _1606;
        _1612 = _1674;
        if (_1646)
        {
            _1608 = _156;
        }
        float _1676 = _1608;
        _1614 = _1676;
        if (_1646)
        {
            _1616 = _158;
        }
    }
    float _1678 = _1516;
    float _1680 = _1610;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1644;
    float _1688 = _1612;
    float _1690 = _1614;
    float _1692 = _1616;
    bool _1694 = _1678 >= _1600;
    bool _1696 = isnan(_1678);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(_1600);
    bool _1702 = _1698 || _1700;
    float _1704 = _176 * _864;
    float _1706 = fma(_174, _866, _1704);
    float _1708 = fma(_178, _868, _1706);
    float _1710 = _1706;
    float _1712 = _1680;
    float _1714 = _1688;
    float _1716 = _1690;
    float _1718 = _1680;
    float _1720 = _1688;
    float _1722 = _1690;
    float _1724 = _1692;
    float _1726 = _1684;
    float _1728 = _1682;
    float _1730 = _1708;
    float _1732 = _1708;
    if (!_1702)
    {
        _1618 = _164;
    }
    float _1734 = _1618;
    float _1736 = _1734;
    float _1738 = _1734;
    if (!_1702)
    {
        _1710 = _166;
    }
    float _1740 = _1710;
    float _1742 = _1740;
    float _1744 = _1740;
    if (!_1702)
    {
        _1620 = _168;
    }
    float _1746 = _1620;
    bool _1748 = !_1702;
    float _1750 = _1746;
    float _1752 = _1746;
    if (!_1748)
    {
        bool _1754 = _1680 > _1600;
        if (_1754)
        {
            _1712 = _1600;
        }
        float _1756 = _1712;
        _1718 = _1756;
        if (!_1754)
        {
            _1736 = _1682;
        }
        float _1758 = _1736;
        float _1760 = _1758;
        if (!_1754)
        {
            _1742 = _1684;
        }
        float _1762 = _1742;
        float _1764 = _1762;
        if (!_1754)
        {
            _1750 = _1686;
        }
        float _1766 = _1750;
        float _1768 = _1766;
        if (!_1754)
        {
            _1622 = _1678;
        }
        float _1770 = _1622;
        float _1772 = _1770;
        if (_1754)
        {
            _1760 = _1682;
        }
        float _1774 = _1760;
        _1738 = _1774;
        if (_1754)
        {
            _1764 = _1684;
        }
        float _1776 = _1764;
        _1744 = _1776;
        if (_1754)
        {
            _1768 = _1686;
        }
        float _1778 = _1768;
        _1752 = _1778;
        if (_1754)
        {
            _1772 = _1678;
        }
        float _1780 = _1772;
        _1624 = _1780;
        if (_1754)
        {
            _1714 = _164;
        }
        float _1782 = _1714;
        _1720 = _1782;
        if (_1754)
        {
            _1716 = _166;
        }
        float _1784 = _1716;
        _1722 = _1784;
        if (_1754)
        {
            _1724 = _168;
        }
    }
    float _1786 = _1624;
    float _1788 = _1718;
    float _1790 = _1738;
    float _1792 = _1744;
    float _1794 = _1752;
    float _1796 = _1720;
    float _1798 = _1722;
    float _1800 = _1724;
    bool _1802 = _1786 >= _1708;
    bool _1804 = isnan(_1786);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(_1708);
    bool _1810 = _1806 || _1808;
    float _1812 = _186 * _864;
    float _1814 = fma(_184, _866, _1812);
    float _1816 = fma(_188, _868, _1814);
    float _1818 = _1814;
    float _1820 = _1788;
    float _1822 = _1796;
    float _1824 = _1798;
    float _1826 = _1788;
    float _1828 = _1796;
    float _1830 = _1798;
    float _1832 = _1800;
    float _1834 = _1794;
    float _1836 = _1786;
    float _1838 = _1816;
    float _1840 = _1816;
    if (!_1810)
    {
        _1818 = _174;
    }
    float _1842 = _1818;
    float _1844 = _1842;
    float _1846 = _1842;
    if (!_1810)
    {
        _1726 = _176;
    }
    float _1848 = _1726;
    float _1850 = _1848;
    float _1852 = _1848;
    if (!_1810)
    {
        _1728 = _178;
    }
    float _1854 = _1728;
    bool _1856 = !_1810;
    float _1858 = _1854;
    float _1860 = _1854;
    if (!_1856)
    {
        bool _1862 = _1788 > _1708;
        if (_1862)
        {
            _1820 = _1708;
        }
        float _1864 = _1820;
        _1826 = _1864;
        if (!_1862)
        {
            _1844 = _1790;
        }
        float _1866 = _1844;
        float _1868 = _1866;
        if (!_1862)
        {
            _1850 = _1792;
        }
        float _1870 = _1850;
        float _1872 = _1870;
        if (!_1862)
        {
            _1858 = _1794;
        }
        float _1874 = _1858;
        float _1876 = _1874;
        if (!_1862)
        {
            _1730 = _1786;
        }
        float _1878 = _1730;
        float _1880 = _1878;
        if (_1862)
        {
            _1868 = _1790;
        }
        float _1882 = _1868;
        _1846 = _1882;
        if (_1862)
        {
            _1872 = _1792;
        }
        float _1884 = _1872;
        _1852 = _1884;
        if (_1862)
        {
            _1876 = _1794;
        }
        float _1886 = _1876;
        _1860 = _1886;
        if (_1862)
        {
            _1880 = _1786;
        }
        float _1888 = _1880;
        _1732 = _1888;
        if (_1862)
        {
            _1822 = _174;
        }
        float _1890 = _1822;
        _1828 = _1890;
        if (_1862)
        {
            _1824 = _176;
        }
        float _1892 = _1824;
        _1830 = _1892;
        if (_1862)
        {
            _1832 = _178;
        }
    }
    float _1894 = _1732;
    float _1896 = _1826;
    float _1898 = _1846;
    float _1900 = _1852;
    float _1902 = _1860;
    float _1904 = _1828;
    float _1906 = _1830;
    float _1908 = _1832;
    bool _1910 = _1894 >= _1816;
    bool _1912 = isnan(_1894);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(_1816);
    bool _1918 = _1914 || _1916;
    float _1920 = _196 * _864;
    float _1922 = fma(_194, _866, _1920);
    float _1924 = fma(_198, _868, _1922);
    float _1926 = _1922;
    float _1928 = _1896;
    float _1930 = _1904;
    float _1932 = _1906;
    float _1934 = _1896;
    float _1936 = _1904;
    float _1938 = _1906;
    float _1940 = _1908;
    float _1942 = _1900;
    float _1944 = _1902;
    float _1946 = _1924;
    float _1948 = _1924;
    if (!_1918)
    {
        _1834 = _184;
    }
    float _1950 = _1834;
    float _1952 = _1950;
    float _1954 = _1950;
    if (!_1918)
    {
        _1926 = _186;
    }
    float _1956 = _1926;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1918)
    {
        _1836 = _188;
    }
    float _1962 = _1836;
    bool _1964 = !_1918;
    float _1966 = _1962;
    float _1968 = _1962;
    if (!_1964)
    {
        bool _1970 = _1896 > _1816;
        if (_1970)
        {
            _1928 = _1816;
        }
        float _1972 = _1928;
        _1934 = _1972;
        if (!_1970)
        {
            _1952 = _1898;
        }
        float _1974 = _1952;
        float _1976 = _1974;
        if (!_1970)
        {
            _1958 = _1900;
        }
        float _1978 = _1958;
        float _1980 = _1978;
        if (!_1970)
        {
            _1966 = _1902;
        }
        float _1982 = _1966;
        float _1984 = _1982;
        if (!_1970)
        {
            _1838 = _1894;
        }
        float _1986 = _1838;
        float _1988 = _1986;
        if (_1970)
        {
            _1976 = _1898;
        }
        float _1990 = _1976;
        _1954 = _1990;
        if (_1970)
        {
            _1980 = _1900;
        }
        float _1992 = _1980;
        _1960 = _1992;
        if (_1970)
        {
            _1984 = _1902;
        }
        float _1994 = _1984;
        _1968 = _1994;
        if (_1970)
        {
            _1988 = _1894;
        }
        float _1996 = _1988;
        _1840 = _1996;
        if (_1970)
        {
            _1930 = _184;
        }
        float _1998 = _1930;
        _1936 = _1998;
        if (_1970)
        {
            _1932 = _186;
        }
        float _2000 = _1932;
        _1938 = _2000;
        if (_1970)
        {
            _1940 = _188;
        }
    }
    float _2002 = _1840;
    float _2004 = _1934;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1968;
    float _2012 = _1936;
    float _2014 = _1938;
    float _2016 = _1940;
    bool _2018 = _2002 >= _1924;
    bool _2020 = isnan(_2002);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(_1924);
    bool _2026 = _2022 || _2024;
    float _2028 = _206 * _864;
    float _2030 = fma(_204, _866, _2028);
    float _2032 = fma(_208, _868, _2030);
    float _2034 = _2030;
    float _2036 = _2004;
    float _2038 = _2012;
    float _2040 = _2014;
    float _2042 = _2004;
    float _2044 = _2012;
    float _2046 = _2014;
    float _2048 = _2016;
    float _2050 = _2006;
    float _2052 = _2010;
    float _2054 = _2032;
    float _2056 = _2032;
    if (!_2026)
    {
        _2034 = _194;
    }
    float _2058 = _2034;
    float _2060 = _2058;
    float _2062 = _2058;
    if (!_2026)
    {
        _1942 = _196;
    }
    float _2064 = _1942;
    float _2066 = _2064;
    float _2068 = _2064;
    if (!_2026)
    {
        _1944 = _198;
    }
    float _2070 = _1944;
    bool _2072 = !_2026;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _2004 > _1924;
        if (_2078)
        {
            _2036 = _1924;
        }
        float _2080 = _2036;
        _2042 = _2080;
        if (!_2078)
        {
            _2060 = _2006;
        }
        float _2082 = _2060;
        float _2084 = _2082;
        if (!_2078)
        {
            _2066 = _2008;
        }
        float _2086 = _2066;
        float _2088 = _2086;
        if (!_2078)
        {
            _2074 = _2010;
        }
        float _2090 = _2074;
        float _2092 = _2090;
        if (!_2078)
        {
            _1946 = _2002;
        }
        float _2094 = _1946;
        float _2096 = _2094;
        if (_2078)
        {
            _2084 = _2006;
        }
        float _2098 = _2084;
        _2062 = _2098;
        if (_2078)
        {
            _2088 = _2008;
        }
        float _2100 = _2088;
        _2068 = _2100;
        if (_2078)
        {
            _2092 = _2010;
        }
        float _2102 = _2092;
        _2076 = _2102;
        if (_2078)
        {
            _2096 = _2002;
        }
        float _2104 = _2096;
        _1948 = _2104;
        if (_2078)
        {
            _2038 = _194;
        }
        float _2106 = _2038;
        _2044 = _2106;
        if (_2078)
        {
            _2040 = _196;
        }
        float _2108 = _2040;
        _2046 = _2108;
        if (_2078)
        {
            _2048 = _198;
        }
    }
    float _2110 = _1948;
    float _2112 = _2042;
    float _2114 = _2062;
    float _2116 = _2068;
    float _2118 = _2076;
    float _2120 = _2044;
    float _2122 = _2046;
    float _2124 = _2048;
    bool _2126 = _2110 >= _2032;
    bool _2128 = isnan(_2110);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_2032);
    bool _2134 = _2130 || _2132;
    float _2136 = _216 * _864;
    float _2138 = fma(_214, _866, _2136);
    float _2140 = fma(_218, _868, _2138);
    float _2142 = _2138;
    float _2144 = _2112;
    float _2146 = _2120;
    float _2148 = _2122;
    float _2150 = _2112;
    float _2152 = _2120;
    float _2154 = _2122;
    float _2156 = _2124;
    float _2158 = _2116;
    float _2160 = _2118;
    float _2162 = _2140;
    float _2164 = _2140;
    if (!_2134)
    {
        _2050 = _204;
    }
    float _2166 = _2050;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2134)
    {
        _2142 = _206;
    }
    float _2172 = _2142;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2134)
    {
        _2052 = _208;
    }
    float _2178 = _2052;
    bool _2180 = !_2134;
    float _2182 = _2178;
    float _2184 = _2178;
    if (!_2180)
    {
        bool _2186 = _2112 > _2032;
        if (_2186)
        {
            _2144 = _2032;
        }
        float _2188 = _2144;
        _2150 = _2188;
        if (!_2186)
        {
            _2168 = _2114;
        }
        float _2190 = _2168;
        float _2192 = _2190;
        if (!_2186)
        {
            _2174 = _2116;
        }
        float _2194 = _2174;
        float _2196 = _2194;
        if (!_2186)
        {
            _2182 = _2118;
        }
        float _2198 = _2182;
        float _2200 = _2198;
        if (!_2186)
        {
            _2054 = _2110;
        }
        float _2202 = _2054;
        float _2204 = _2202;
        if (_2186)
        {
            _2192 = _2114;
        }
        float _2206 = _2192;
        _2170 = _2206;
        if (_2186)
        {
            _2196 = _2116;
        }
        float _2208 = _2196;
        _2176 = _2208;
        if (_2186)
        {
            _2200 = _2118;
        }
        float _2210 = _2200;
        _2184 = _2210;
        if (_2186)
        {
            _2204 = _2110;
        }
        float _2212 = _2204;
        _2056 = _2212;
        if (_2186)
        {
            _2146 = _204;
        }
        float _2214 = _2146;
        _2152 = _2214;
        if (_2186)
        {
            _2148 = _206;
        }
        float _2216 = _2148;
        _2154 = _2216;
        if (_2186)
        {
            _2156 = _208;
        }
    }
    float _2218 = _2056;
    float _2220 = _2150;
    float _2222 = _2170;
    float _2224 = _2176;
    float _2226 = _2184;
    float _2228 = _2152;
    float _2230 = _2154;
    float _2232 = _2156;
    bool _2234 = _2218 >= _2140;
    bool _2236 = isnan(_2218);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(_2140);
    bool _2242 = _2238 || _2240;
    float _2244 = _226 * _864;
    float _2246 = fma(_224, _866, _2244);
    float _2248 = fma(_228, _868, _2246);
    float _2250 = _2246;
    float _2252 = _2220;
    float _2254 = _2228;
    float _2256 = _2230;
    float _2258 = _2228;
    float _2260 = _2230;
    float _2262 = _2220;
    float _2264 = _2232;
    float _2266 = _2226;
    float _2268 = _2222;
    float _2270 = _2248;
    float _2272 = _2248;
    if (!_2242)
    {
        _2250 = _214;
    }
    float _2274 = _2250;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2242)
    {
        _2158 = _216;
    }
    float _2280 = _2158;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2242)
    {
        _2160 = _218;
    }
    float _2286 = _2160;
    bool _2288 = !_2242;
    float _2290 = _2286;
    float _2292 = _2286;
    if (!_2288)
    {
        bool _2294 = _2220 > _2140;
        if (_2294)
        {
            _2252 = _2140;
        }
        float _2296 = _2252;
        _2262 = _2296;
        if (!_2294)
        {
            _2276 = _2222;
        }
        float _2298 = _2276;
        float _2300 = _2298;
        if (!_2294)
        {
            _2282 = _2224;
        }
        float _2302 = _2282;
        float _2304 = _2302;
        if (!_2294)
        {
            _2290 = _2226;
        }
        float _2306 = _2290;
        float _2308 = _2306;
        if (!_2294)
        {
            _2162 = _2218;
        }
        float _2310 = _2162;
        float _2312 = _2310;
        if (_2294)
        {
            _2300 = _2222;
        }
        float _2314 = _2300;
        _2278 = _2314;
        if (_2294)
        {
            _2304 = _2224;
        }
        float _2316 = _2304;
        _2284 = _2316;
        if (_2294)
        {
            _2308 = _2226;
        }
        float _2318 = _2308;
        _2292 = _2318;
        if (_2294)
        {
            _2312 = _2218;
        }
        float _2320 = _2312;
        _2164 = _2320;
        if (_2294)
        {
            _2254 = _214;
        }
        float _2322 = _2254;
        _2258 = _2322;
        if (_2294)
        {
            _2256 = _216;
        }
        float _2324 = _2256;
        _2260 = _2324;
        if (_2294)
        {
            _2264 = _218;
        }
    }
    float _2326 = _2164;
    float _2328 = _2258;
    float _2330 = _2260;
    float _2332 = _2262;
    float _2334 = _2278;
    float _2336 = _2284;
    float _2338 = _2292;
    float _2340 = _2264;
    bool _2342 = _2326 >= _2248;
    bool _2344 = isnan(_2326);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(_2248);
    bool _2350 = _2346 || _2348;
    float _2352 = _236 * _864;
    float _2354 = fma(_234, _866, _2352);
    float _2356 = fma(_238, _868, _2354);
    float _2358 = _2354;
    float _2360 = _2332;
    float _2362 = _2340;
    float _2364 = _2332;
    float _2366 = _2330;
    float _2368 = _2328;
    if (!_2350)
    {
        _924 = _2328;
    }
    float _2370 = _924;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2350)
    {
        _2358 = _2330;
    }
    float _2376 = _2358;
    float _2378 = _2376;
    float _2380 = _2376;
    if (!_2350)
    {
        _926 = _224;
    }
    float _2382 = _926;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2350)
    {
        _2266 = _226;
    }
    float _2388 = _2266;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2350)
    {
        _2268 = _228;
    }
    float _2394 = _2268;
    bool _2396 = !_2350;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _2332 > _2248;
        if (_2402)
        {
            _2360 = _2248;
        }
        float _2404 = _2360;
        _2364 = _2404;
        if (!_2402)
        {
            _2384 = _2334;
        }
        float _2406 = _2384;
        float _2408 = _2406;
        if (!_2402)
        {
            _2390 = _2336;
        }
        float _2410 = _2390;
        float _2412 = _2410;
        if (!_2402)
        {
            _2398 = _2338;
        }
        float _2414 = _2398;
        float _2416 = _2414;
        if (!_2402)
        {
            _2270 = _2326;
        }
        float _2418 = _2270;
        float _2420 = _2418;
        if (!_2402)
        {
            _2372 = _2328;
        }
        float _2422 = _2372;
        float _2424 = _2422;
        if (!_2402)
        {
            _2378 = _2330;
        }
        float _2426 = _2378;
        float _2428 = _2426;
        if (_2402)
        {
            _2408 = _2334;
        }
        float _2430 = _2408;
        _2386 = _2430;
        if (_2402)
        {
            _2412 = _2336;
        }
        float _2432 = _2412;
        _2392 = _2432;
        if (_2402)
        {
            _2416 = _2338;
        }
        float _2434 = _2416;
        _2400 = _2434;
        if (_2402)
        {
            _2420 = _2326;
        }
        float _2436 = _2420;
        _2272 = _2436;
        if (_2402)
        {
            _2424 = _224;
        }
        float _2438 = _2424;
        _2374 = _2438;
        if (_2402)
        {
            _2428 = _226;
        }
        float _2440 = _2428;
        _2380 = _2440;
        if (_2402)
        {
            _2362 = _228;
        }
    }
    float _2442 = _2272;
    float _2444 = _2374;
    float _2446 = _2362;
    float _2448 = _2364;
    float _2450 = _2386;
    float _2452 = _2392;
    float _2454 = _2400;
    float _2456 = _2380;
    bool _2458 = _2442 >= _2356;
    bool _2460 = isnan(_2442);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(_2356);
    bool _2466 = _2462 || _2464;
    float _2468 = _2456;
    float _2470 = _2456;
    if (!_2466)
    {
        _2366 = _2444;
    }
    float _2472 = _2366;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2466)
    {
        _2368 = _2446;
    }
    float _2478 = _2368;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2466)
    {
        _928 = _234;
    }
    float _2484 = _928;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2466)
    {
        _930 = _236;
    }
    float _2490 = _930;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2466)
    {
        _932 = _238;
    }
    float _2496 = _932;
    bool _2498 = !_2466;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2498)
    {
        bool _2504 = _2448 > _2356;
        if (!_2504)
        {
            _2486 = _2450;
        }
        float _2506 = _2486;
        float _2508 = _2506;
        if (!_2504)
        {
            _2492 = _2452;
        }
        float _2510 = _2492;
        float _2512 = _2510;
        if (!_2504)
        {
            _2500 = _2454;
        }
        float _2514 = _2500;
        float _2516 = _2514;
        if (!_2504)
        {
            _2474 = _2444;
        }
        float _2518 = _2474;
        float _2520 = _2518;
        if (!_2504)
        {
            _2480 = _2446;
        }
        float _2522 = _2480;
        _2482 = _2522;
        if (_2504)
        {
            _2508 = _2450;
        }
        float _2524 = _2508;
        _2488 = _2524;
        if (_2504)
        {
            _2512 = _2452;
        }
        float _2526 = _2512;
        _2494 = _2526;
        if (_2504)
        {
            _2516 = _2454;
        }
        float _2528 = _2516;
        _2502 = _2528;
        if (_2504)
        {
            _2520 = _234;
        }
        float _2530 = _2520;
        _2476 = _2530;
        if (_2504)
        {
            _2468 = _236;
        }
        float _2532 = _2468;
        _2470 = _2532;
        if (_2504)
        {
            _2482 = _238;
        }
    }
    float _2534 = _2470;
    float _2536 = _2494;
    float _2538 = _2476;
    float _2540 = _2488;
    float _2542 = _2482;
    float _2544 = _2502;
    float _2546 = -_2534;
    float _2548 = _2536 + _2546;
    float _2550 = -_2538;
    float _2552 = _2540 + _2550;
    float _2554 = -_2542;
    float _2556 = _2544 + _2554;
    float _2558 = -_2534;
    float _2560 = _96 + _2558;
    float _2562 = _2548 * _2548;
    float _2564 = _2548 * _2560;
    float _2566 = fma(_2552, _2552, _2562);
    float _2568 = -_2538;
    float _2570 = _94 + _2568;
    float _2572 = -_2542;
    float _2574 = _98 + _2572;
    float _2576 = fma(_2556, _2556, _2566);
    float _2578 = fma(_2552, _2570, _2564);
    float _2580 = fma(_2556, _2574, _2578);
    float _2582 = 1.0 / _2576;
    float _2584 = _2582 * 3.0;
    float _2586 = _2584 * _2580;
    float _2588 = rint(_2586);
    float _2590 = precise::max(0.0, _2588);
    float _2592 = precise::min(_2590, 3.0);
    float _2594 = trunc(_2592);
    int _2597 = int(_2594);
    bool _2599 = _2597 >= 2;
    bool _2601 = !_2599;
    float _2603 = _2552;
    float _2605 = _2548;
    float _2607 = _2556;
    float _2609 = _2538;
    float _2611 = _2540;
    float _2613 = _2534;
    float _2615 = _2536;
    float _2617 = _2542;
    float _2619 = _2544;
    float _2629;
    float _2631;
    float _2633;
    float _2635;
    float _2637;
    float _2639;
    float _2641;
    float _2643;
    float _2645;
    float _2647;
    float _2649;
    float _2651;
    float _2653;
    float _2655;
    float _2657;
    float _2659;
    if (!_2601)
    {
        bool _2621 = _2597 >= 3;
        bool _2623 = !_2621;
        if (!_2623)
        {
            bool _2625 = _2597 != 3;
            _2627 = _2625;
            if (!_2627)
            {
                _2629 = _94;
                _2631 = _96;
                _2633 = _98;
                _2635 = 1.0;
                _2637 = 0.0;
                _2639 = 0.0;
                _2641 = 0.0;
                _2643 = 0.0;
                _2645 = 0.0;
                _2647 = 0.0;
                _2649 = 0.0;
                _2651 = 0.0;
                _2653 = 0.0;
                _2655 = 0.0;
                _2657 = 0.0;
                _2659 = 0.0;
                _2661 = true;
            }
        }
        else
        {
            _2629 = 0.0;
            _2631 = 0.0;
            _2633 = 0.0;
            _2635 = 0.0;
            _2637 = 0.0;
            _2639 = 0.0;
            _2641 = 0.0;
            _2643 = 0.0;
            _2645 = _94;
            _2647 = _96;
            _2649 = _98;
            _2651 = 1.0;
            _2653 = 0.0;
            _2655 = 0.0;
            _2657 = 0.0;
            _2659 = 0.0;
            _2661 = true;
        }
    }
    if ((!_2661) || _2627)
    {
        bool _2663;
        if (!_2627)
        {
            _2663 = _2597 >= 1;
        }
        if ((!_2663) || _2627)
        {
            bool _2665;
            if (!_2627)
            {
                _2665 = _2597 != 0;
            }
            if ((!_2665) && (!_2627))
            {
                _2629 = 0.0;
                _2631 = 0.0;
                _2633 = 0.0;
                _2635 = 0.0;
                _2637 = _94;
                _2639 = _96;
                _2641 = _98;
                _2643 = 1.0;
                _2645 = 0.0;
                _2647 = 0.0;
                _2649 = 0.0;
                _2651 = 0.0;
                _2653 = 0.0;
                _2655 = 0.0;
                _2657 = 0.0;
                _2659 = 0.0;
                _2661 = true;
            }
            else
            {
                _2627 = false;
                _2629 = 0.0;
                _2631 = 0.0;
                _2633 = 0.0;
                _2635 = 0.0;
                _2637 = 0.0;
                _2639 = 0.0;
                _2641 = 0.0;
                _2643 = 0.0;
                _2645 = 0.0;
                _2647 = 0.0;
                _2649 = 0.0;
                _2651 = 0.0;
                _2653 = 0.0;
                _2655 = 0.0;
                _2657 = 0.0;
                _2659 = 0.0;
                _2661 = true;
            }
        }
        else
        {
            _2629 = 0.0;
            _2631 = 0.0;
            _2633 = 0.0;
            _2635 = 0.0;
            _2637 = 0.0;
            _2639 = 0.0;
            _2641 = 0.0;
            _2643 = 0.0;
            _2645 = 0.0;
            _2647 = 0.0;
            _2649 = 0.0;
            _2651 = 0.0;
            _2653 = _94;
            _2655 = _96;
            _2657 = _98;
            _2659 = 1.0;
        }
    }
    _2661 = false;
    float _2667 = _2629;
    float _2669 = _2631;
    float _2671 = _2633;
    float _2673 = _2635;
    float _2675 = _2637;
    float _2677 = _2639;
    float _2679 = _2641;
    float _2681 = _2643;
    float _2683 = _2645;
    float _2685 = _2647;
    float _2687 = _2649;
    float _2689 = _2651;
    float _2691 = _2653;
    float _2693 = _2655;
    float _2695 = _2657;
    float _2697 = _2659;
    float _2699 = -_2534;
    float _2701 = _86 + _2699;
    float _2703 = -_2538;
    float _2705 = _84 + _2703;
    float _2707 = _2548 * _2701;
    float _2709 = -_2542;
    float _2711 = _88 + _2709;
    float _2713 = fma(_2552, _2705, _2707);
    float _2715 = fma(_2556, _2711, _2713);
    float _2717 = _2584 * _2715;
    float _2719 = rint(_2717);
    float _2721 = precise::max(0.0, _2719);
    float _2723 = precise::min(_2721, 3.0);
    float _2725 = trunc(_2723);
    int _2727 = int(_2725);
    bool _2729 = _2727 >= 2;
    bool _2731 = !_2729;
    float _2733 = as_type<float>(_2727);
    float _2735 = _2719;
    float _2737 = _2713;
    float _2739 = _2707;
    float _2741 = _2667;
    float _2743 = _2669;
    float _2745 = _2671;
    float _2747 = _2673;
    float _2749 = _2683;
    float _2751 = _2685;
    float _2753 = _2687;
    float _2755 = _2689;
    float _2757 = _2691;
    float _2759 = _2693;
    float _2761 = _2695;
    float _2763 = _2697;
    float _2781;
    float _2783;
    float _2785;
    float _2787;
    if (!_2731)
    {
        bool _2765 = _2727 >= 3;
        bool _2767 = !_2765;
        if (!_2767)
        {
            bool _2769 = _2727 != 3;
            _2771 = _2769;
            if (!_2771)
            {
                float _2773 = _84 + _2667;
                float _2775 = _86 + _2669;
                float _2777 = _88 + _2671;
                float _2779 = _2673 + 1.0;
                _2741 = _2773;
                _2743 = _2775;
                _2745 = _2777;
                _2747 = _2779;
                _2781 = _2675;
                _2783 = _2677;
                _2785 = _2679;
                _2787 = _2681;
                _2789 = true;
            }
        }
        else
        {
            float _2791 = _84 + _2683;
            float _2793 = _86 + _2685;
            float _2795 = _88 + _2687;
            float _2797 = _2689 + 1.0;
            _2781 = _2675;
            _2783 = _2677;
            _2785 = _2679;
            _2787 = _2681;
            _2749 = _2791;
            _2751 = _2793;
            _2753 = _2795;
            _2755 = _2797;
            _2789 = true;
        }
    }
    if ((!_2789) || _2771)
    {
        bool _2799;
        if (!_2771)
        {
            _2799 = _2727 >= 1;
        }
        if ((!_2799) || _2771)
        {
            if (!_2771)
            {
                bool _2801 = _2727 != 0;
                if (!_2801)
                {
                    float _2803 = _84 + _2675;
                    _2733 = _2803;
                }
                float _2805 = _2733;
                _2781 = _2805;
                if (!_2801)
                {
                    float _2807 = _86 + _2677;
                    _2735 = _2807;
                }
                float _2809 = _2735;
                _2783 = _2809;
                if (!_2801)
                {
                    float _2811 = _88 + _2679;
                    _2737 = _2811;
                }
                float _2813 = _2737;
                _2785 = _2813;
                if (!_2801)
                {
                    float _2815 = _2681 + 1.0;
                    _2739 = _2815;
                }
                float _2817 = _2739;
                bool _2819 = !_2801;
                _2787 = _2817;
                _2789 = _2819;
            }
            if ((!_2789) || _2771)
            {
                _2771 = false;
                _2781 = _2675;
                _2783 = _2677;
                _2785 = _2679;
                _2787 = _2681;
                _2789 = true;
            }
        }
        else
        {
            float _2821 = _84 + _2691;
            float _2823 = _86 + _2693;
            float _2825 = _88 + _2695;
            float _2827 = _2697 + 1.0;
            _2781 = _2675;
            _2783 = _2677;
            _2785 = _2679;
            _2787 = _2681;
            _2757 = _2821;
            _2759 = _2823;
            _2761 = _2825;
            _2763 = _2827;
        }
    }
    _2789 = false;
    float _2829 = _2741;
    float _2831 = _2743;
    float _2833 = _2745;
    float _2835 = _2747;
    float _2837 = _2781;
    float _2839 = _2783;
    float _2841 = _2785;
    float _2843 = _2787;
    float _2845 = _2749;
    float _2847 = _2751;
    float _2849 = _2753;
    float _2851 = _2755;
    float _2853 = _2757;
    float _2855 = _2759;
    float _2857 = _2761;
    float _2859 = _2763;
    float _2861 = -_2534;
    float _2863 = _106 + _2861;
    float _2865 = -_2538;
    float _2867 = _104 + _2865;
    float _2869 = _2548 * _2863;
    float _2871 = -_2542;
    float _2873 = _108 + _2871;
    float _2875 = fma(_2552, _2867, _2869);
    float _2877 = fma(_2556, _2873, _2875);
    float _2879 = _2584 * _2877;
    float _2881 = rint(_2879);
    float _2883 = precise::max(0.0, _2881);
    float _2885 = precise::min(_2883, 3.0);
    float _2887 = trunc(_2885);
    int _2889 = int(_2887);
    bool _2891 = _2889 >= 2;
    bool _2893 = !_2891;
    float _2895 = _2881;
    float _2897 = as_type<float>(_2889);
    float _2899 = _2869;
    float _2901 = _2875;
    float _2903 = _2829;
    float _2905 = _2831;
    float _2907 = _2833;
    float _2909 = _2835;
    float _2911 = _2845;
    float _2913 = _2847;
    float _2915 = _2849;
    float _2917 = _2851;
    float _2919 = _2853;
    float _2921 = _2855;
    float _2923 = _2857;
    float _2925 = _2859;
    float _2943;
    float _2945;
    float _2947;
    float _2949;
    if (!_2893)
    {
        bool _2927 = _2889 >= 3;
        bool _2929 = !_2927;
        if (!_2929)
        {
            bool _2931 = _2889 != 3;
            _2933 = _2931;
            if (!_2933)
            {
                float _2935 = _104 + _2829;
                float _2937 = _106 + _2831;
                float _2939 = _108 + _2833;
                float _2941 = _2835 + 1.0;
                _2903 = _2935;
                _2905 = _2937;
                _2907 = _2939;
                _2909 = _2941;
                _2943 = _2837;
                _2945 = _2839;
                _2947 = _2841;
                _2949 = _2843;
                _2951 = true;
            }
        }
        else
        {
            float _2953 = _104 + _2845;
            float _2955 = _106 + _2847;
            float _2957 = _108 + _2849;
            float _2959 = _2851 + 1.0;
            _2943 = _2837;
            _2945 = _2839;
            _2947 = _2841;
            _2949 = _2843;
            _2911 = _2953;
            _2913 = _2955;
            _2915 = _2957;
            _2917 = _2959;
            _2951 = true;
        }
    }
    if ((!_2951) || _2933)
    {
        bool _2961;
        if (!_2933)
        {
            _2961 = _2889 >= 1;
        }
        if ((!_2961) || _2933)
        {
            if (!_2933)
            {
                bool _2963 = _2889 != 0;
                if (!_2963)
                {
                    float _2965 = _104 + _2837;
                    _2895 = _2965;
                }
                float _2967 = _2895;
                _2943 = _2967;
                if (!_2963)
                {
                    float _2969 = _106 + _2839;
                    _2897 = _2969;
                }
                float _2971 = _2897;
                _2945 = _2971;
                if (!_2963)
                {
                    float _2973 = _108 + _2841;
                    _2899 = _2973;
                }
                float _2975 = _2899;
                _2947 = _2975;
                if (!_2963)
                {
                    float _2977 = _2843 + 1.0;
                    _2901 = _2977;
                }
                float _2979 = _2901;
                bool _2981 = !_2963;
                _2949 = _2979;
                _2951 = _2981;
            }
            if ((!_2951) || _2933)
            {
                _2933 = false;
                _2943 = _2837;
                _2945 = _2839;
                _2947 = _2841;
                _2949 = _2843;
                _2951 = true;
            }
        }
        else
        {
            float _2983 = _104 + _2853;
            float _2985 = _106 + _2855;
            float _2987 = _108 + _2857;
            float _2989 = _2859 + 1.0;
            _2943 = _2837;
            _2945 = _2839;
            _2947 = _2841;
            _2949 = _2843;
            _2919 = _2983;
            _2921 = _2985;
            _2923 = _2987;
            _2925 = _2989;
        }
    }
    _2951 = false;
    float _2991 = _2903;
    float _2993 = _2905;
    float _2995 = _2907;
    float _2997 = _2909;
    float _2999 = _2943;
    float _3001 = _2945;
    float _3003 = _2947;
    float _3005 = _2949;
    float _3007 = _2911;
    float _3009 = _2913;
    float _3011 = _2915;
    float _3013 = _2917;
    float _3015 = _2919;
    float _3017 = _2921;
    float _3019 = _2923;
    float _3021 = _2925;
    float _3023 = -_2534;
    float _3025 = _116 + _3023;
    float _3027 = -_2538;
    float _3029 = _114 + _3027;
    float _3031 = _2548 * _3025;
    float _3033 = -_2542;
    float _3035 = _118 + _3033;
    float _3037 = fma(_2552, _3029, _3031);
    float _3039 = fma(_2556, _3035, _3037);
    float _3041 = _2584 * _3039;
    float _3043 = rint(_3041);
    float _3045 = precise::max(0.0, _3043);
    float _3047 = precise::min(_3045, 3.0);
    float _3049 = trunc(_3047);
    int _3051 = int(_3049);
    bool _3053 = _3051 >= 2;
    bool _3055 = !_3053;
    float _3057 = as_type<float>(_3051);
    float _3059 = _3043;
    float _3061 = _3037;
    float _3063 = _3031;
    float _3065 = _2991;
    float _3067 = _2993;
    float _3069 = _2995;
    float _3071 = _2997;
    float _3073 = _3007;
    float _3075 = _3009;
    float _3077 = _3011;
    float _3079 = _3013;
    float _3081 = _3015;
    float _3083 = _3017;
    float _3085 = _3019;
    float _3087 = _3021;
    float _3105;
    float _3107;
    float _3109;
    float _3111;
    if (!_3055)
    {
        bool _3089 = _3051 >= 3;
        bool _3091 = !_3089;
        if (!_3091)
        {
            bool _3093 = _3051 != 3;
            _3095 = _3093;
            if (!_3095)
            {
                float _3097 = _114 + _2991;
                float _3099 = _116 + _2993;
                float _3101 = _118 + _2995;
                float _3103 = _2997 + 1.0;
                _3065 = _3097;
                _3067 = _3099;
                _3069 = _3101;
                _3071 = _3103;
                _3105 = _2999;
                _3107 = _3001;
                _3109 = _3003;
                _3111 = _3005;
                _3113 = true;
            }
        }
        else
        {
            float _3115 = _114 + _3007;
            float _3117 = _116 + _3009;
            float _3119 = _118 + _3011;
            float _3121 = _3013 + 1.0;
            _3105 = _2999;
            _3107 = _3001;
            _3109 = _3003;
            _3111 = _3005;
            _3073 = _3115;
            _3075 = _3117;
            _3077 = _3119;
            _3079 = _3121;
            _3113 = true;
        }
    }
    if ((!_3113) || _3095)
    {
        bool _3123;
        if (!_3095)
        {
            _3123 = _3051 >= 1;
        }
        if ((!_3123) || _3095)
        {
            if (!_3095)
            {
                bool _3125 = _3051 != 0;
                if (!_3125)
                {
                    float _3127 = _114 + _2999;
                    _3057 = _3127;
                }
                float _3129 = _3057;
                _3105 = _3129;
                if (!_3125)
                {
                    float _3131 = _116 + _3001;
                    _3059 = _3131;
                }
                float _3133 = _3059;
                _3107 = _3133;
                if (!_3125)
                {
                    float _3135 = _118 + _3003;
                    _3061 = _3135;
                }
                float _3137 = _3061;
                _3109 = _3137;
                if (!_3125)
                {
                    float _3139 = _3005 + 1.0;
                    _3063 = _3139;
                }
                float _3141 = _3063;
                bool _3143 = !_3125;
                _3111 = _3141;
                _3113 = _3143;
            }
            if ((!_3113) || _3095)
            {
                _3095 = false;
                _3105 = _2999;
                _3107 = _3001;
                _3109 = _3003;
                _3111 = _3005;
                _3113 = true;
            }
        }
        else
        {
            float _3145 = _114 + _3015;
            float _3147 = _116 + _3017;
            float _3149 = _118 + _3019;
            float _3151 = _3021 + 1.0;
            _3105 = _2999;
            _3107 = _3001;
            _3109 = _3003;
            _3111 = _3005;
            _3081 = _3145;
            _3083 = _3147;
            _3085 = _3149;
            _3087 = _3151;
        }
    }
    _3113 = false;
    float _3153 = _3065;
    float _3155 = _3067;
    float _3157 = _3069;
    float _3159 = _3071;
    float _3161 = _3105;
    float _3163 = _3107;
    float _3165 = _3109;
    float _3167 = _3111;
    float _3169 = _3073;
    float _3171 = _3075;
    float _3173 = _3077;
    float _3175 = _3079;
    float _3177 = _3081;
    float _3179 = _3083;
    float _3181 = _3085;
    float _3183 = _3087;
    float _3185 = -_2534;
    float _3187 = _126 + _3185;
    float _3189 = -_2538;
    float _3191 = _124 + _3189;
    float _3193 = _2548 * _3187;
    float _3195 = -_2542;
    float _3197 = _128 + _3195;
    float _3199 = fma(_2552, _3191, _3193);
    float _3201 = fma(_2556, _3197, _3199);
    float _3203 = _2584 * _3201;
    float _3205 = rint(_3203);
    float _3207 = precise::max(0.0, _3205);
    float _3209 = precise::min(_3207, 3.0);
    float _3211 = trunc(_3209);
    int _3213 = int(_3211);
    bool _3215 = _3213 >= 2;
    bool _3217 = !_3215;
    float _3219 = _3205;
    float _3221 = as_type<float>(_3213);
    float _3223 = _3193;
    float _3225 = _3199;
    float _3227 = _3153;
    float _3229 = _3155;
    float _3231 = _3157;
    float _3233 = _3159;
    float _3235 = _3169;
    float _3237 = _3171;
    float _3239 = _3173;
    float _3241 = _3175;
    float _3243 = _3177;
    float _3245 = _3179;
    float _3247 = _3181;
    float _3249 = _3183;
    float _3267;
    float _3269;
    float _3271;
    float _3273;
    if (!_3217)
    {
        bool _3251 = _3213 >= 3;
        bool _3253 = !_3251;
        if (!_3253)
        {
            bool _3255 = _3213 != 3;
            _3257 = _3255;
            if (!_3257)
            {
                float _3259 = _124 + _3153;
                float _3261 = _126 + _3155;
                float _3263 = _128 + _3157;
                float _3265 = _3159 + 1.0;
                _3227 = _3259;
                _3229 = _3261;
                _3231 = _3263;
                _3233 = _3265;
                _3267 = _3161;
                _3269 = _3163;
                _3271 = _3165;
                _3273 = _3167;
                _3275 = true;
            }
        }
        else
        {
            float _3277 = _124 + _3169;
            float _3279 = _126 + _3171;
            float _3281 = _128 + _3173;
            float _3283 = _3175 + 1.0;
            _3267 = _3161;
            _3269 = _3163;
            _3271 = _3165;
            _3273 = _3167;
            _3235 = _3277;
            _3237 = _3279;
            _3239 = _3281;
            _3241 = _3283;
            _3275 = true;
        }
    }
    if ((!_3275) || _3257)
    {
        bool _3285;
        if (!_3257)
        {
            _3285 = _3213 >= 1;
        }
        if ((!_3285) || _3257)
        {
            if (!_3257)
            {
                bool _3287 = _3213 != 0;
                if (!_3287)
                {
                    float _3289 = _124 + _3161;
                    _3219 = _3289;
                }
                float _3291 = _3219;
                _3267 = _3291;
                if (!_3287)
                {
                    float _3293 = _126 + _3163;
                    _3221 = _3293;
                }
                float _3295 = _3221;
                _3269 = _3295;
                if (!_3287)
                {
                    float _3297 = _128 + _3165;
                    _3223 = _3297;
                }
                float _3299 = _3223;
                _3271 = _3299;
                if (!_3287)
                {
                    float _3301 = _3167 + 1.0;
                    _3225 = _3301;
                }
                float _3303 = _3225;
                bool _3305 = !_3287;
                _3273 = _3303;
                _3275 = _3305;
            }
            if ((!_3275) || _3257)
            {
                _3257 = false;
                _3267 = _3161;
                _3269 = _3163;
                _3271 = _3165;
                _3273 = _3167;
                _3275 = true;
            }
        }
        else
        {
            float _3307 = _124 + _3177;
            float _3309 = _126 + _3179;
            float _3311 = _128 + _3181;
            float _3313 = _3183 + 1.0;
            _3267 = _3161;
            _3269 = _3163;
            _3271 = _3165;
            _3273 = _3167;
            _3243 = _3307;
            _3245 = _3309;
            _3247 = _3311;
            _3249 = _3313;
        }
    }
    _3275 = false;
    float _3315 = _3227;
    float _3317 = _3229;
    float _3319 = _3231;
    float _3321 = _3233;
    float _3323 = _3267;
    float _3325 = _3269;
    float _3327 = _3271;
    float _3329 = _3273;
    float _3331 = _3235;
    float _3333 = _3237;
    float _3335 = _3239;
    float _3337 = _3241;
    float _3339 = _3243;
    float _3341 = _3245;
    float _3343 = _3247;
    float _3345 = _3249;
    float _3347 = -_2534;
    float _3349 = _136 + _3347;
    float _3351 = -_2538;
    float _3353 = _134 + _3351;
    float _3355 = _2548 * _3349;
    float _3357 = -_2542;
    float _3359 = _138 + _3357;
    float _3361 = fma(_2552, _3353, _3355);
    float _3363 = fma(_2556, _3359, _3361);
    float _3365 = _2584 * _3363;
    float _3367 = rint(_3365);
    float _3369 = precise::max(0.0, _3367);
    float _3371 = precise::min(_3369, 3.0);
    float _3373 = trunc(_3371);
    int _3375 = int(_3373);
    bool _3377 = _3375 >= 2;
    bool _3379 = !_3377;
    float _3381 = as_type<float>(_3375);
    float _3383 = _3367;
    float _3385 = _3361;
    float _3387 = _3355;
    float _3389 = _3315;
    float _3391 = _3317;
    float _3393 = _3319;
    float _3395 = _3321;
    float _3397 = _3331;
    float _3399 = _3333;
    float _3401 = _3335;
    float _3403 = _3337;
    float _3405 = _3339;
    float _3407 = _3341;
    float _3409 = _3343;
    float _3411 = _3345;
    float _3429;
    float _3431;
    float _3433;
    float _3435;
    if (!_3379)
    {
        bool _3413 = _3375 >= 3;
        bool _3415 = !_3413;
        if (!_3415)
        {
            bool _3417 = _3375 != 3;
            _3419 = _3417;
            if (!_3419)
            {
                float _3421 = _134 + _3315;
                float _3423 = _136 + _3317;
                float _3425 = _138 + _3319;
                float _3427 = _3321 + 1.0;
                _3389 = _3421;
                _3391 = _3423;
                _3393 = _3425;
                _3395 = _3427;
                _3429 = _3323;
                _3431 = _3325;
                _3433 = _3327;
                _3435 = _3329;
                _3437 = true;
            }
        }
        else
        {
            float _3439 = _134 + _3331;
            float _3441 = _136 + _3333;
            float _3443 = _138 + _3335;
            float _3445 = _3337 + 1.0;
            _3429 = _3323;
            _3431 = _3325;
            _3433 = _3327;
            _3435 = _3329;
            _3397 = _3439;
            _3399 = _3441;
            _3401 = _3443;
            _3403 = _3445;
            _3437 = true;
        }
    }
    if ((!_3437) || _3419)
    {
        bool _3447;
        if (!_3419)
        {
            _3447 = _3375 >= 1;
        }
        if ((!_3447) || _3419)
        {
            if (!_3419)
            {
                bool _3449 = _3375 != 0;
                if (!_3449)
                {
                    float _3451 = _134 + _3323;
                    _3381 = _3451;
                }
                float _3453 = _3381;
                _3429 = _3453;
                if (!_3449)
                {
                    float _3455 = _136 + _3325;
                    _3383 = _3455;
                }
                float _3457 = _3383;
                _3431 = _3457;
                if (!_3449)
                {
                    float _3459 = _138 + _3327;
                    _3385 = _3459;
                }
                float _3461 = _3385;
                _3433 = _3461;
                if (!_3449)
                {
                    float _3463 = _3329 + 1.0;
                    _3387 = _3463;
                }
                float _3465 = _3387;
                bool _3467 = !_3449;
                _3435 = _3465;
                _3437 = _3467;
            }
            if ((!_3437) || _3419)
            {
                _3419 = false;
                _3429 = _3323;
                _3431 = _3325;
                _3433 = _3327;
                _3435 = _3329;
                _3437 = true;
            }
        }
        else
        {
            float _3469 = _134 + _3339;
            float _3471 = _136 + _3341;
            float _3473 = _138 + _3343;
            float _3475 = _3345 + 1.0;
            _3429 = _3323;
            _3431 = _3325;
            _3433 = _3327;
            _3435 = _3329;
            _3405 = _3469;
            _3407 = _3471;
            _3409 = _3473;
            _3411 = _3475;
        }
    }
    _3437 = false;
    float _3477 = _3389;
    float _3479 = _3391;
    float _3481 = _3393;
    float _3483 = _3395;
    float _3485 = _3429;
    float _3487 = _3431;
    float _3489 = _3433;
    float _3491 = _3435;
    float _3493 = _3397;
    float _3495 = _3399;
    float _3497 = _3401;
    float _3499 = _3403;
    float _3501 = _3405;
    float _3503 = _3407;
    float _3505 = _3409;
    float _3507 = _3411;
    float _3509 = -_2534;
    float _3511 = _146 + _3509;
    float _3513 = -_2538;
    float _3515 = _144 + _3513;
    float _3517 = _2548 * _3511;
    float _3519 = -_2542;
    float _3521 = _148 + _3519;
    float _3523 = fma(_2552, _3515, _3517);
    float _3525 = fma(_2556, _3521, _3523);
    float _3527 = _2584 * _3525;
    float _3529 = rint(_3527);
    float _3531 = precise::max(0.0, _3529);
    float _3533 = precise::min(_3531, 3.0);
    float _3535 = trunc(_3533);
    int _3537 = int(_3535);
    bool _3539 = _3537 >= 2;
    bool _3541 = !_3539;
    float _3543 = _3529;
    float _3545 = as_type<float>(_3537);
    float _3547 = _3517;
    float _3549 = _3523;
    float _3551 = _3477;
    float _3553 = _3479;
    float _3555 = _3481;
    float _3557 = _3483;
    float _3559 = _3493;
    float _3561 = _3495;
    float _3563 = _3497;
    float _3565 = _3499;
    float _3567 = _3501;
    float _3569 = _3503;
    float _3571 = _3505;
    float _3573 = _3507;
    float _3591;
    float _3593;
    float _3595;
    float _3597;
    if (!_3541)
    {
        bool _3575 = _3537 >= 3;
        bool _3577 = !_3575;
        if (!_3577)
        {
            bool _3579 = _3537 != 3;
            _3581 = _3579;
            if (!_3581)
            {
                float _3583 = _144 + _3477;
                float _3585 = _146 + _3479;
                float _3587 = _148 + _3481;
                float _3589 = _3483 + 1.0;
                _3551 = _3583;
                _3553 = _3585;
                _3555 = _3587;
                _3557 = _3589;
                _3591 = _3485;
                _3593 = _3487;
                _3595 = _3489;
                _3597 = _3491;
                _3599 = true;
            }
        }
        else
        {
            float _3601 = _144 + _3493;
            float _3603 = _146 + _3495;
            float _3605 = _148 + _3497;
            float _3607 = _3499 + 1.0;
            _3591 = _3485;
            _3593 = _3487;
            _3595 = _3489;
            _3597 = _3491;
            _3559 = _3601;
            _3561 = _3603;
            _3563 = _3605;
            _3565 = _3607;
            _3599 = true;
        }
    }
    if ((!_3599) || _3581)
    {
        bool _3609;
        if (!_3581)
        {
            _3609 = _3537 >= 1;
        }
        if ((!_3609) || _3581)
        {
            if (!_3581)
            {
                bool _3611 = _3537 != 0;
                if (!_3611)
                {
                    float _3613 = _144 + _3485;
                    _3543 = _3613;
                }
                float _3615 = _3543;
                _3591 = _3615;
                if (!_3611)
                {
                    float _3617 = _146 + _3487;
                    _3545 = _3617;
                }
                float _3619 = _3545;
                _3593 = _3619;
                if (!_3611)
                {
                    float _3621 = _148 + _3489;
                    _3547 = _3621;
                }
                float _3623 = _3547;
                _3595 = _3623;
                if (!_3611)
                {
                    float _3625 = _3491 + 1.0;
                    _3549 = _3625;
                }
                float _3627 = _3549;
                bool _3629 = !_3611;
                _3597 = _3627;
                _3599 = _3629;
            }
            if ((!_3599) || _3581)
            {
                _3581 = false;
                _3591 = _3485;
                _3593 = _3487;
                _3595 = _3489;
                _3597 = _3491;
                _3599 = true;
            }
        }
        else
        {
            float _3631 = _144 + _3501;
            float _3633 = _146 + _3503;
            float _3635 = _148 + _3505;
            float _3637 = _3507 + 1.0;
            _3591 = _3485;
            _3593 = _3487;
            _3595 = _3489;
            _3597 = _3491;
            _3567 = _3631;
            _3569 = _3633;
            _3571 = _3635;
            _3573 = _3637;
        }
    }
    _3599 = false;
    float _3639 = _3551;
    float _3641 = _3553;
    float _3643 = _3555;
    float _3645 = _3557;
    float _3647 = _3591;
    float _3649 = _3593;
    float _3651 = _3595;
    float _3653 = _3597;
    float _3655 = _3559;
    float _3657 = _3561;
    float _3659 = _3563;
    float _3661 = _3565;
    float _3663 = _3567;
    float _3665 = _3569;
    float _3667 = _3571;
    float _3669 = _3573;
    float _3671 = -_2534;
    float _3673 = _156 + _3671;
    float _3675 = -_2538;
    float _3677 = _154 + _3675;
    float _3679 = _2548 * _3673;
    float _3681 = -_2542;
    float _3683 = _158 + _3681;
    float _3685 = fma(_2552, _3677, _3679);
    float _3687 = fma(_2556, _3683, _3685);
    float _3689 = _2584 * _3687;
    float _3691 = rint(_3689);
    float _3693 = precise::max(0.0, _3691);
    float _3695 = precise::min(_3693, 3.0);
    float _3697 = trunc(_3695);
    int _3699 = int(_3697);
    bool _3701 = _3699 >= 2;
    bool _3703 = !_3701;
    float _3705 = _3679;
    float _3707 = _3685;
    float _3709 = _3691;
    float _3711 = as_type<float>(_3699);
    float _3713 = _3639;
    float _3715 = _3641;
    float _3717 = _3643;
    float _3719 = _3645;
    float _3721 = _3655;
    float _3723 = _3657;
    float _3725 = _3659;
    float _3727 = _3661;
    float _3729 = _3663;
    float _3731 = _3665;
    float _3733 = _3667;
    float _3735 = _3669;
    float _3753;
    float _3755;
    float _3757;
    float _3759;
    if (!_3703)
    {
        bool _3737 = _3699 >= 3;
        bool _3739 = !_3737;
        if (!_3739)
        {
            bool _3741 = _3699 != 3;
            _3743 = _3741;
            if (!_3743)
            {
                float _3745 = _154 + _3639;
                float _3747 = _156 + _3641;
                float _3749 = _158 + _3643;
                float _3751 = _3645 + 1.0;
                _3713 = _3745;
                _3715 = _3747;
                _3717 = _3749;
                _3719 = _3751;
                _3753 = _3647;
                _3755 = _3649;
                _3757 = _3651;
                _3759 = _3653;
                _3761 = true;
            }
        }
        else
        {
            float _3763 = _154 + _3655;
            float _3765 = _156 + _3657;
            float _3767 = _158 + _3659;
            float _3769 = _3661 + 1.0;
            _3753 = _3647;
            _3755 = _3649;
            _3757 = _3651;
            _3759 = _3653;
            _3721 = _3763;
            _3723 = _3765;
            _3725 = _3767;
            _3727 = _3769;
            _3761 = true;
        }
    }
    if ((!_3761) || _3743)
    {
        bool _3771;
        if (!_3743)
        {
            _3771 = _3699 >= 1;
        }
        if ((!_3771) || _3743)
        {
            if (!_3743)
            {
                bool _3773 = _3699 != 0;
                if (!_3773)
                {
                    float _3775 = _154 + _3647;
                    _3705 = _3775;
                }
                float _3777 = _3705;
                _3753 = _3777;
                if (!_3773)
                {
                    float _3779 = _156 + _3649;
                    _3707 = _3779;
                }
                float _3781 = _3707;
                _3755 = _3781;
                if (!_3773)
                {
                    float _3783 = _158 + _3651;
                    _3709 = _3783;
                }
                float _3785 = _3709;
                _3757 = _3785;
                if (!_3773)
                {
                    float _3787 = _3653 + 1.0;
                    _3711 = _3787;
                }
                float _3789 = _3711;
                bool _3791 = !_3773;
                _3759 = _3789;
                _3761 = _3791;
            }
            if ((!_3761) || _3743)
            {
                _3743 = false;
                _3753 = _3647;
                _3755 = _3649;
                _3757 = _3651;
                _3759 = _3653;
                _3761 = true;
            }
        }
        else
        {
            float _3793 = _154 + _3663;
            float _3795 = _156 + _3665;
            float _3797 = _158 + _3667;
            float _3799 = _3669 + 1.0;
            _3753 = _3647;
            _3755 = _3649;
            _3757 = _3651;
            _3759 = _3653;
            _3729 = _3793;
            _3731 = _3795;
            _3733 = _3797;
            _3735 = _3799;
        }
    }
    _3761 = false;
    float _3801 = _3713;
    float _3803 = _3715;
    float _3805 = _3717;
    float _3807 = _3719;
    float _3809 = _3753;
    float _3811 = _3755;
    float _3813 = _3757;
    float _3815 = _3759;
    float _3817 = _3721;
    float _3819 = _3723;
    float _3821 = _3725;
    float _3823 = _3727;
    float _3825 = _3729;
    float _3827 = _3731;
    float _3829 = _3733;
    float _3831 = _3735;
    float _3833 = -_2534;
    float _3835 = _166 + _3833;
    float _3837 = -_2538;
    float _3839 = _164 + _3837;
    float _3841 = _2548 * _3835;
    float _3843 = -_2542;
    float _3845 = _168 + _3843;
    float _3847 = fma(_2552, _3839, _3841);
    float _3849 = fma(_2556, _3845, _3847);
    float _3851 = _2584 * _3849;
    float _3853 = rint(_3851);
    float _3855 = precise::max(0.0, _3853);
    float _3857 = precise::min(_3855, 3.0);
    float _3859 = trunc(_3857);
    int _3861 = int(_3859);
    bool _3863 = _3861 >= 2;
    bool _3865 = !_3863;
    float _3867 = _3853;
    float _3869 = as_type<float>(_3861);
    float _3871 = _3841;
    float _3873 = _3847;
    float _3875 = _3801;
    float _3877 = _3803;
    float _3879 = _3805;
    float _3881 = _3807;
    float _3883 = _3817;
    float _3885 = _3819;
    float _3887 = _3821;
    float _3889 = _3823;
    float _3891 = _3825;
    float _3893 = _3827;
    float _3895 = _3829;
    float _3897 = _3831;
    float _3915;
    float _3917;
    float _3919;
    float _3921;
    if (!_3865)
    {
        bool _3899 = _3861 >= 3;
        bool _3901 = !_3899;
        if (!_3901)
        {
            bool _3903 = _3861 != 3;
            _3905 = _3903;
            if (!_3905)
            {
                float _3907 = _164 + _3801;
                float _3909 = _166 + _3803;
                float _3911 = _168 + _3805;
                float _3913 = _3807 + 1.0;
                _3875 = _3907;
                _3877 = _3909;
                _3879 = _3911;
                _3881 = _3913;
                _3915 = _3809;
                _3917 = _3811;
                _3919 = _3813;
                _3921 = _3815;
                _3923 = true;
            }
        }
        else
        {
            float _3925 = _164 + _3817;
            float _3927 = _166 + _3819;
            float _3929 = _168 + _3821;
            float _3931 = _3823 + 1.0;
            _3915 = _3809;
            _3917 = _3811;
            _3919 = _3813;
            _3921 = _3815;
            _3883 = _3925;
            _3885 = _3927;
            _3887 = _3929;
            _3889 = _3931;
            _3923 = true;
        }
    }
    if ((!_3923) || _3905)
    {
        bool _3933;
        if (!_3905)
        {
            _3933 = _3861 >= 1;
        }
        if ((!_3933) || _3905)
        {
            if (!_3905)
            {
                bool _3935 = _3861 != 0;
                if (!_3935)
                {
                    float _3937 = _164 + _3809;
                    _3867 = _3937;
                }
                float _3939 = _3867;
                _3915 = _3939;
                if (!_3935)
                {
                    float _3941 = _166 + _3811;
                    _3869 = _3941;
                }
                float _3943 = _3869;
                _3917 = _3943;
                if (!_3935)
                {
                    float _3945 = _168 + _3813;
                    _3871 = _3945;
                }
                float _3947 = _3871;
                _3919 = _3947;
                if (!_3935)
                {
                    float _3949 = _3815 + 1.0;
                    _3873 = _3949;
                }
                float _3951 = _3873;
                bool _3953 = !_3935;
                _3921 = _3951;
                _3923 = _3953;
            }
            if ((!_3923) || _3905)
            {
                _3905 = false;
                _3915 = _3809;
                _3917 = _3811;
                _3919 = _3813;
                _3921 = _3815;
                _3923 = true;
            }
        }
        else
        {
            float _3955 = _164 + _3825;
            float _3957 = _166 + _3827;
            float _3959 = _168 + _3829;
            float _3961 = _3831 + 1.0;
            _3915 = _3809;
            _3917 = _3811;
            _3919 = _3813;
            _3921 = _3815;
            _3891 = _3955;
            _3893 = _3957;
            _3895 = _3959;
            _3897 = _3961;
        }
    }
    _3923 = false;
    float _3963 = _3875;
    float _3965 = _3877;
    float _3967 = _3879;
    float _3969 = _3881;
    float _3971 = _3915;
    float _3973 = _3917;
    float _3975 = _3919;
    float _3977 = _3921;
    float _3979 = _3883;
    float _3981 = _3885;
    float _3983 = _3887;
    float _3985 = _3889;
    float _3987 = _3891;
    float _3989 = _3893;
    float _3991 = _3895;
    float _3993 = _3897;
    float _3995 = -_2534;
    float _3997 = _176 + _3995;
    float _3999 = -_2538;
    float _4001 = _174 + _3999;
    float _4003 = _2548 * _3997;
    float _4005 = -_2542;
    float _4007 = _178 + _4005;
    float _4009 = fma(_2552, _4001, _4003);
    float _4011 = fma(_2556, _4007, _4009);
    float _4013 = _2584 * _4011;
    float _4015 = rint(_4013);
    float _4017 = precise::max(0.0, _4015);
    float _4019 = precise::min(_4017, 3.0);
    float _4021 = trunc(_4019);
    int _4023 = int(_4021);
    bool _4025 = _4023 >= 2;
    bool _4027 = !_4025;
    float _4029 = as_type<float>(_4023);
    float _4031 = _4015;
    float _4033 = _4009;
    float _4035 = _4003;
    float _4037 = _3963;
    float _4039 = _3965;
    float _4041 = _3967;
    float _4043 = _3969;
    float _4045 = _3979;
    float _4047 = _3981;
    float _4049 = _3983;
    float _4051 = _3985;
    float _4053 = _3987;
    float _4055 = _3989;
    float _4057 = _3991;
    float _4059 = _3993;
    float _4077;
    float _4079;
    float _4081;
    float _4083;
    if (!_4027)
    {
        bool _4061 = _4023 >= 3;
        bool _4063 = !_4061;
        if (!_4063)
        {
            bool _4065 = _4023 != 3;
            _4067 = _4065;
            if (!_4067)
            {
                float _4069 = _174 + _3963;
                float _4071 = _176 + _3965;
                float _4073 = _178 + _3967;
                float _4075 = _3969 + 1.0;
                _4037 = _4069;
                _4039 = _4071;
                _4041 = _4073;
                _4043 = _4075;
                _4077 = _3971;
                _4079 = _3973;
                _4081 = _3975;
                _4083 = _3977;
                _4085 = true;
            }
        }
        else
        {
            float _4087 = _174 + _3979;
            float _4089 = _176 + _3981;
            float _4091 = _178 + _3983;
            float _4093 = _3985 + 1.0;
            _4077 = _3971;
            _4079 = _3973;
            _4081 = _3975;
            _4083 = _3977;
            _4045 = _4087;
            _4047 = _4089;
            _4049 = _4091;
            _4051 = _4093;
            _4085 = true;
        }
    }
    if ((!_4085) || _4067)
    {
        bool _4095;
        if (!_4067)
        {
            _4095 = _4023 >= 1;
        }
        if ((!_4095) || _4067)
        {
            if (!_4067)
            {
                bool _4097 = _4023 != 0;
                if (!_4097)
                {
                    float _4099 = _174 + _3971;
                    _4029 = _4099;
                }
                float _4101 = _4029;
                _4077 = _4101;
                if (!_4097)
                {
                    float _4103 = _176 + _3973;
                    _4031 = _4103;
                }
                float _4105 = _4031;
                _4079 = _4105;
                if (!_4097)
                {
                    float _4107 = _178 + _3975;
                    _4033 = _4107;
                }
                float _4109 = _4033;
                _4081 = _4109;
                if (!_4097)
                {
                    float _4111 = _3977 + 1.0;
                    _4035 = _4111;
                }
                float _4113 = _4035;
                bool _4115 = !_4097;
                _4083 = _4113;
                _4085 = _4115;
            }
            if ((!_4085) || _4067)
            {
                _4067 = false;
                _4077 = _3971;
                _4079 = _3973;
                _4081 = _3975;
                _4083 = _3977;
                _4085 = true;
            }
        }
        else
        {
            float _4117 = _174 + _3987;
            float _4119 = _176 + _3989;
            float _4121 = _178 + _3991;
            float _4123 = _3993 + 1.0;
            _4077 = _3971;
            _4079 = _3973;
            _4081 = _3975;
            _4083 = _3977;
            _4053 = _4117;
            _4055 = _4119;
            _4057 = _4121;
            _4059 = _4123;
        }
    }
    _4085 = false;
    float _4125 = _4037;
    float _4127 = _4039;
    float _4129 = _4041;
    float _4131 = _4043;
    float _4133 = _4077;
    float _4135 = _4079;
    float _4137 = _4081;
    float _4139 = _4083;
    float _4141 = _4045;
    float _4143 = _4047;
    float _4145 = _4049;
    float _4147 = _4051;
    float _4149 = _4053;
    float _4151 = _4055;
    float _4153 = _4057;
    float _4155 = _4059;
    float _4157 = -_2534;
    float _4159 = _186 + _4157;
    float _4161 = -_2538;
    float _4163 = _184 + _4161;
    float _4165 = _2548 * _4159;
    float _4167 = -_2542;
    float _4169 = _188 + _4167;
    float _4171 = fma(_2552, _4163, _4165);
    float _4173 = fma(_2556, _4169, _4171);
    float _4175 = _2584 * _4173;
    float _4177 = rint(_4175);
    float _4179 = precise::max(0.0, _4177);
    float _4181 = precise::min(_4179, 3.0);
    float _4183 = trunc(_4181);
    int _4185 = int(_4183);
    bool _4187 = _4185 >= 2;
    bool _4189 = !_4187;
    float _4191 = _4177;
    float _4193 = as_type<float>(_4185);
    float _4195 = _4165;
    float _4197 = _4171;
    float _4199 = _4125;
    float _4201 = _4127;
    float _4203 = _4129;
    float _4205 = _4131;
    float _4207 = _4141;
    float _4209 = _4143;
    float _4211 = _4145;
    float _4213 = _4147;
    float _4215 = _4149;
    float _4217 = _4151;
    float _4219 = _4153;
    float _4221 = _4155;
    float _4239;
    float _4241;
    float _4243;
    float _4245;
    if (!_4189)
    {
        bool _4223 = _4185 >= 3;
        bool _4225 = !_4223;
        if (!_4225)
        {
            bool _4227 = _4185 != 3;
            _4229 = _4227;
            if (!_4229)
            {
                float _4231 = _184 + _4125;
                float _4233 = _186 + _4127;
                float _4235 = _188 + _4129;
                float _4237 = _4131 + 1.0;
                _4199 = _4231;
                _4201 = _4233;
                _4203 = _4235;
                _4205 = _4237;
                _4239 = _4133;
                _4241 = _4135;
                _4243 = _4137;
                _4245 = _4139;
                _4247 = true;
            }
        }
        else
        {
            float _4249 = _184 + _4141;
            float _4251 = _186 + _4143;
            float _4253 = _188 + _4145;
            float _4255 = _4147 + 1.0;
            _4239 = _4133;
            _4241 = _4135;
            _4243 = _4137;
            _4245 = _4139;
            _4207 = _4249;
            _4209 = _4251;
            _4211 = _4253;
            _4213 = _4255;
            _4247 = true;
        }
    }
    if ((!_4247) || _4229)
    {
        bool _4257;
        if (!_4229)
        {
            _4257 = _4185 >= 1;
        }
        if ((!_4257) || _4229)
        {
            if (!_4229)
            {
                bool _4259 = _4185 != 0;
                if (!_4259)
                {
                    float _4261 = _184 + _4133;
                    _4191 = _4261;
                }
                float _4263 = _4191;
                _4239 = _4263;
                if (!_4259)
                {
                    float _4265 = _186 + _4135;
                    _4193 = _4265;
                }
                float _4267 = _4193;
                _4241 = _4267;
                if (!_4259)
                {
                    float _4269 = _188 + _4137;
                    _4195 = _4269;
                }
                float _4271 = _4195;
                _4243 = _4271;
                if (!_4259)
                {
                    float _4273 = _4139 + 1.0;
                    _4197 = _4273;
                }
                float _4275 = _4197;
                bool _4277 = !_4259;
                _4245 = _4275;
                _4247 = _4277;
            }
            if ((!_4247) || _4229)
            {
                _4229 = false;
                _4239 = _4133;
                _4241 = _4135;
                _4243 = _4137;
                _4245 = _4139;
                _4247 = true;
            }
        }
        else
        {
            float _4279 = _184 + _4149;
            float _4281 = _186 + _4151;
            float _4283 = _188 + _4153;
            float _4285 = _4155 + 1.0;
            _4239 = _4133;
            _4241 = _4135;
            _4243 = _4137;
            _4245 = _4139;
            _4215 = _4279;
            _4217 = _4281;
            _4219 = _4283;
            _4221 = _4285;
        }
    }
    _4247 = false;
    float _4287 = _4199;
    float _4289 = _4201;
    float _4291 = _4203;
    float _4293 = _4205;
    float _4295 = _4239;
    float _4297 = _4241;
    float _4299 = _4243;
    float _4301 = _4245;
    float _4303 = _4207;
    float _4305 = _4209;
    float _4307 = _4211;
    float _4309 = _4213;
    float _4311 = _4215;
    float _4313 = _4217;
    float _4315 = _4219;
    float _4317 = _4221;
    float _4319 = -_2534;
    float _4321 = _196 + _4319;
    float _4323 = -_2538;
    float _4325 = _194 + _4323;
    float _4327 = _2548 * _4321;
    float _4329 = -_2542;
    float _4331 = _198 + _4329;
    float _4333 = fma(_2552, _4325, _4327);
    float _4335 = fma(_2556, _4331, _4333);
    float _4337 = _2584 * _4335;
    float _4339 = rint(_4337);
    float _4341 = precise::max(0.0, _4339);
    float _4343 = precise::min(_4341, 3.0);
    float _4345 = trunc(_4343);
    int _4347 = int(_4345);
    bool _4349 = _4347 >= 2;
    bool _4351 = !_4349;
    float _4353 = as_type<float>(_4347);
    float _4355 = _4339;
    float _4357 = _4333;
    float _4359 = _4327;
    float _4361 = _4287;
    float _4363 = _4289;
    float _4365 = _4291;
    float _4367 = _4293;
    float _4369 = _4303;
    float _4371 = _4305;
    float _4373 = _4307;
    float _4375 = _4309;
    float _4377 = _4311;
    float _4379 = _4313;
    float _4381 = _4315;
    float _4383 = _4317;
    float _4401;
    float _4403;
    float _4405;
    float _4407;
    if (!_4351)
    {
        bool _4385 = _4347 >= 3;
        bool _4387 = !_4385;
        if (!_4387)
        {
            bool _4389 = _4347 != 3;
            _4391 = _4389;
            if (!_4391)
            {
                float _4393 = _194 + _4287;
                float _4395 = _196 + _4289;
                float _4397 = _198 + _4291;
                float _4399 = _4293 + 1.0;
                _4361 = _4393;
                _4363 = _4395;
                _4365 = _4397;
                _4367 = _4399;
                _4401 = _4295;
                _4403 = _4297;
                _4405 = _4299;
                _4407 = _4301;
                _4409 = true;
            }
        }
        else
        {
            float _4411 = _194 + _4303;
            float _4413 = _196 + _4305;
            float _4415 = _198 + _4307;
            float _4417 = _4309 + 1.0;
            _4401 = _4295;
            _4403 = _4297;
            _4405 = _4299;
            _4407 = _4301;
            _4369 = _4411;
            _4371 = _4413;
            _4373 = _4415;
            _4375 = _4417;
            _4409 = true;
        }
    }
    if ((!_4409) || _4391)
    {
        bool _4419;
        if (!_4391)
        {
            _4419 = _4347 >= 1;
        }
        if ((!_4419) || _4391)
        {
            if (!_4391)
            {
                bool _4421 = _4347 != 0;
                if (!_4421)
                {
                    float _4423 = _194 + _4295;
                    _4353 = _4423;
                }
                float _4425 = _4353;
                _4401 = _4425;
                if (!_4421)
                {
                    float _4427 = _196 + _4297;
                    _4355 = _4427;
                }
                float _4429 = _4355;
                _4403 = _4429;
                if (!_4421)
                {
                    float _4431 = _198 + _4299;
                    _4357 = _4431;
                }
                float _4433 = _4357;
                _4405 = _4433;
                if (!_4421)
                {
                    float _4435 = _4301 + 1.0;
                    _4359 = _4435;
                }
                float _4437 = _4359;
                bool _4439 = !_4421;
                _4407 = _4437;
                _4409 = _4439;
            }
            if ((!_4409) || _4391)
            {
                _4391 = false;
                _4401 = _4295;
                _4403 = _4297;
                _4405 = _4299;
                _4407 = _4301;
                _4409 = true;
            }
        }
        else
        {
            float _4441 = _194 + _4311;
            float _4443 = _196 + _4313;
            float _4445 = _198 + _4315;
            float _4447 = _4317 + 1.0;
            _4401 = _4295;
            _4403 = _4297;
            _4405 = _4299;
            _4407 = _4301;
            _4377 = _4441;
            _4379 = _4443;
            _4381 = _4445;
            _4383 = _4447;
        }
    }
    _4409 = false;
    float _4449 = _4361;
    float _4451 = _4363;
    float _4453 = _4365;
    float _4455 = _4367;
    float _4457 = _4401;
    float _4459 = _4403;
    float _4461 = _4405;
    float _4463 = _4407;
    float _4465 = _4369;
    float _4467 = _4371;
    float _4469 = _4373;
    float _4471 = _4375;
    float _4473 = _4377;
    float _4475 = _4379;
    float _4477 = _4381;
    float _4479 = _4383;
    float _4481 = -_2534;
    float _4483 = _206 + _4481;
    float _4485 = -_2538;
    float _4487 = _204 + _4485;
    float _4489 = _2548 * _4483;
    float _4491 = -_2542;
    float _4493 = _208 + _4491;
    float _4495 = fma(_2552, _4487, _4489);
    float _4497 = fma(_2556, _4493, _4495);
    float _4499 = _2584 * _4497;
    float _4501 = rint(_4499);
    float _4503 = precise::max(0.0, _4501);
    float _4505 = precise::min(_4503, 3.0);
    float _4507 = trunc(_4505);
    int _4509 = int(_4507);
    bool _4511 = _4509 >= 2;
    bool _4513 = !_4511;
    float _4515 = _4501;
    float _4517 = as_type<float>(_4509);
    float _4519 = _4489;
    float _4521 = _4495;
    float _4523 = _4449;
    float _4525 = _4451;
    float _4527 = _4453;
    float _4529 = _4455;
    float _4531 = _4465;
    float _4533 = _4467;
    float _4535 = _4469;
    float _4537 = _4471;
    float _4539 = _4473;
    float _4541 = _4475;
    float _4543 = _4477;
    float _4545 = _4479;
    float _4563;
    float _4565;
    float _4567;
    float _4569;
    if (!_4513)
    {
        bool _4547 = _4509 >= 3;
        bool _4549 = !_4547;
        if (!_4549)
        {
            bool _4551 = _4509 != 3;
            _4553 = _4551;
            if (!_4553)
            {
                float _4555 = _204 + _4449;
                float _4557 = _206 + _4451;
                float _4559 = _208 + _4453;
                float _4561 = _4455 + 1.0;
                _4523 = _4555;
                _4525 = _4557;
                _4527 = _4559;
                _4529 = _4561;
                _4563 = _4457;
                _4565 = _4459;
                _4567 = _4461;
                _4569 = _4463;
                _4571 = true;
            }
        }
        else
        {
            float _4573 = _204 + _4465;
            float _4575 = _206 + _4467;
            float _4577 = _208 + _4469;
            float _4579 = _4471 + 1.0;
            _4563 = _4457;
            _4565 = _4459;
            _4567 = _4461;
            _4569 = _4463;
            _4531 = _4573;
            _4533 = _4575;
            _4535 = _4577;
            _4537 = _4579;
            _4571 = true;
        }
    }
    if ((!_4571) || _4553)
    {
        bool _4581;
        if (!_4553)
        {
            _4581 = _4509 >= 1;
        }
        if ((!_4581) || _4553)
        {
            if (!_4553)
            {
                bool _4583 = _4509 != 0;
                if (!_4583)
                {
                    float _4585 = _204 + _4457;
                    _4515 = _4585;
                }
                float _4587 = _4515;
                _4563 = _4587;
                if (!_4583)
                {
                    float _4589 = _206 + _4459;
                    _4517 = _4589;
                }
                float _4591 = _4517;
                _4565 = _4591;
                if (!_4583)
                {
                    float _4593 = _208 + _4461;
                    _4519 = _4593;
                }
                float _4595 = _4519;
                _4567 = _4595;
                if (!_4583)
                {
                    float _4597 = _4463 + 1.0;
                    _4521 = _4597;
                }
                float _4599 = _4521;
                bool _4601 = !_4583;
                _4569 = _4599;
                _4571 = _4601;
            }
            if ((!_4571) || _4553)
            {
                _4553 = false;
                _4563 = _4457;
                _4565 = _4459;
                _4567 = _4461;
                _4569 = _4463;
                _4571 = true;
            }
        }
        else
        {
            float _4603 = _204 + _4473;
            float _4605 = _206 + _4475;
            float _4607 = _208 + _4477;
            float _4609 = _4479 + 1.0;
            _4563 = _4457;
            _4565 = _4459;
            _4567 = _4461;
            _4569 = _4463;
            _4539 = _4603;
            _4541 = _4605;
            _4543 = _4607;
            _4545 = _4609;
        }
    }
    _4571 = false;
    float _4611 = _4523;
    float _4613 = _4525;
    float _4615 = _4527;
    float _4617 = _4529;
    float _4619 = _4563;
    float _4621 = _4565;
    float _4623 = _4567;
    float _4625 = _4569;
    float _4627 = _4531;
    float _4629 = _4533;
    float _4631 = _4535;
    float _4633 = _4537;
    float _4635 = _4539;
    float _4637 = _4541;
    float _4639 = _4543;
    float _4641 = _4545;
    float _4643 = -_2534;
    float _4645 = _216 + _4643;
    float _4647 = -_2538;
    float _4649 = _214 + _4647;
    float _4651 = _2548 * _4645;
    float _4653 = -_2542;
    float _4655 = _218 + _4653;
    float _4657 = fma(_2552, _4649, _4651);
    float _4659 = fma(_2556, _4655, _4657);
    float _4661 = _2584 * _4659;
    float _4663 = rint(_4661);
    float _4665 = precise::max(0.0, _4663);
    float _4667 = precise::min(_4665, 3.0);
    float _4669 = trunc(_4667);
    int _4671 = int(_4669);
    bool _4673 = _4671 >= 2;
    bool _4675 = !_4673;
    float _4677 = as_type<float>(_4671);
    float _4679 = _4663;
    float _4681 = _4657;
    float _4683 = _4651;
    float _4685 = _4611;
    float _4687 = _4613;
    float _4689 = _4615;
    float _4691 = _4617;
    float _4693 = _4627;
    float _4695 = _4629;
    float _4697 = _4631;
    float _4699 = _4633;
    float _4701 = _4635;
    float _4703 = _4637;
    float _4705 = _4639;
    float _4707 = _4641;
    float _4725;
    float _4727;
    float _4729;
    float _4731;
    if (!_4675)
    {
        bool _4709 = _4671 >= 3;
        bool _4711 = !_4709;
        if (!_4711)
        {
            bool _4713 = _4671 != 3;
            _4715 = _4713;
            if (!_4715)
            {
                float _4717 = _214 + _4611;
                float _4719 = _216 + _4613;
                float _4721 = _218 + _4615;
                float _4723 = _4617 + 1.0;
                _4685 = _4717;
                _4687 = _4719;
                _4689 = _4721;
                _4691 = _4723;
                _4725 = _4619;
                _4727 = _4621;
                _4729 = _4623;
                _4731 = _4625;
                _4733 = true;
            }
        }
        else
        {
            float _4735 = _214 + _4627;
            float _4737 = _216 + _4629;
            float _4739 = _218 + _4631;
            float _4741 = _4633 + 1.0;
            _4725 = _4619;
            _4727 = _4621;
            _4729 = _4623;
            _4731 = _4625;
            _4693 = _4735;
            _4695 = _4737;
            _4697 = _4739;
            _4699 = _4741;
            _4733 = true;
        }
    }
    if ((!_4733) || _4715)
    {
        bool _4743;
        if (!_4715)
        {
            _4743 = _4671 >= 1;
        }
        if ((!_4743) || _4715)
        {
            if (!_4715)
            {
                bool _4745 = _4671 != 0;
                if (!_4745)
                {
                    float _4747 = _214 + _4619;
                    _4677 = _4747;
                }
                float _4749 = _4677;
                _4725 = _4749;
                if (!_4745)
                {
                    float _4751 = _216 + _4621;
                    _4679 = _4751;
                }
                float _4753 = _4679;
                _4727 = _4753;
                if (!_4745)
                {
                    float _4755 = _218 + _4623;
                    _4681 = _4755;
                }
                float _4757 = _4681;
                _4729 = _4757;
                if (!_4745)
                {
                    float _4759 = _4625 + 1.0;
                    _4683 = _4759;
                }
                float _4761 = _4683;
                bool _4763 = !_4745;
                _4731 = _4761;
                _4733 = _4763;
            }
            if ((!_4733) || _4715)
            {
                _4715 = false;
                _4725 = _4619;
                _4727 = _4621;
                _4729 = _4623;
                _4731 = _4625;
                _4733 = true;
            }
        }
        else
        {
            float _4765 = _214 + _4635;
            float _4767 = _216 + _4637;
            float _4769 = _218 + _4639;
            float _4771 = _4641 + 1.0;
            _4725 = _4619;
            _4727 = _4621;
            _4729 = _4623;
            _4731 = _4625;
            _4701 = _4765;
            _4703 = _4767;
            _4705 = _4769;
            _4707 = _4771;
        }
    }
    _4733 = false;
    float _4773 = _4685;
    float _4775 = _4687;
    float _4777 = _4689;
    float _4779 = _4691;
    float _4781 = _4725;
    float _4783 = _4727;
    float _4785 = _4729;
    float _4787 = _4731;
    float _4789 = _4693;
    float _4791 = _4695;
    float _4793 = _4697;
    float _4795 = _4699;
    float _4797 = _4701;
    float _4799 = _4703;
    float _4801 = _4705;
    float _4803 = _4707;
    float _4805 = -_2534;
    float _4807 = _226 + _4805;
    float _4809 = -_2538;
    float _4811 = _224 + _4809;
    float _4813 = _2548 * _4807;
    float _4815 = -_2542;
    float _4817 = _228 + _4815;
    float _4819 = fma(_2552, _4811, _4813);
    float _4821 = fma(_2556, _4817, _4819);
    float _4823 = _2584 * _4821;
    float _4825 = rint(_4823);
    float _4827 = precise::max(0.0, _4825);
    float _4829 = precise::min(_4827, 3.0);
    float _4831 = trunc(_4829);
    int _4833 = int(_4831);
    bool _4835 = _4833 >= 2;
    bool _4837 = !_4835;
    float _4839 = _4825;
    float _4841 = as_type<float>(_4833);
    float _4843 = _4813;
    float _4845 = _4819;
    float _4847 = _4773;
    float _4849 = _4775;
    float _4851 = _4777;
    float _4853 = _4779;
    float _4855 = _4789;
    float _4857 = _4791;
    float _4859 = _4793;
    float _4861 = _4795;
    float _4863 = _4797;
    float _4865 = _4799;
    float _4867 = _4801;
    float _4869 = _4803;
    float _4887;
    float _4889;
    float _4891;
    float _4893;
    if (!_4837)
    {
        bool _4871 = _4833 >= 3;
        bool _4873 = !_4871;
        if (!_4873)
        {
            bool _4875 = _4833 != 3;
            _4877 = _4875;
            if (!_4877)
            {
                float _4879 = _224 + _4773;
                float _4881 = _226 + _4775;
                float _4883 = _228 + _4777;
                float _4885 = _4779 + 1.0;
                _4847 = _4879;
                _4849 = _4881;
                _4851 = _4883;
                _4853 = _4885;
                _4887 = _4781;
                _4889 = _4783;
                _4891 = _4785;
                _4893 = _4787;
                _4895 = true;
            }
        }
        else
        {
            float _4897 = _224 + _4789;
            float _4899 = _226 + _4791;
            float _4901 = _228 + _4793;
            float _4903 = _4795 + 1.0;
            _4887 = _4781;
            _4889 = _4783;
            _4891 = _4785;
            _4893 = _4787;
            _4855 = _4897;
            _4857 = _4899;
            _4859 = _4901;
            _4861 = _4903;
            _4895 = true;
        }
    }
    if ((!_4895) || _4877)
    {
        bool _4905;
        if (!_4877)
        {
            _4905 = _4833 >= 1;
        }
        if ((!_4905) || _4877)
        {
            if (!_4877)
            {
                bool _4907 = _4833 != 0;
                if (!_4907)
                {
                    float _4909 = _224 + _4781;
                    _4839 = _4909;
                }
                float _4911 = _4839;
                _4887 = _4911;
                if (!_4907)
                {
                    float _4913 = _226 + _4783;
                    _4841 = _4913;
                }
                float _4915 = _4841;
                _4889 = _4915;
                if (!_4907)
                {
                    float _4917 = _228 + _4785;
                    _4843 = _4917;
                }
                float _4919 = _4843;
                _4891 = _4919;
                if (!_4907)
                {
                    float _4921 = _4787 + 1.0;
                    _4845 = _4921;
                }
                float _4923 = _4845;
                bool _4925 = !_4907;
                _4893 = _4923;
                _4895 = _4925;
            }
            if ((!_4895) || _4877)
            {
                _4877 = false;
                _4887 = _4781;
                _4889 = _4783;
                _4891 = _4785;
                _4893 = _4787;
                _4895 = true;
            }
        }
        else
        {
            float _4927 = _224 + _4797;
            float _4929 = _226 + _4799;
            float _4931 = _228 + _4801;
            float _4933 = _4803 + 1.0;
            _4887 = _4781;
            _4889 = _4783;
            _4891 = _4785;
            _4893 = _4787;
            _4863 = _4927;
            _4865 = _4929;
            _4867 = _4931;
            _4869 = _4933;
        }
    }
    _4895 = false;
    float _4935 = _4847;
    float _4937 = _4849;
    float _4939 = _4851;
    float _4941 = _4853;
    float _4943 = _4887;
    float _4945 = _4889;
    float _4947 = _4891;
    float _4949 = _4893;
    float _4951 = _4855;
    float _4953 = _4857;
    float _4955 = _4859;
    float _4957 = _4861;
    float _4959 = _4863;
    float _4961 = _4865;
    float _4963 = _4867;
    float _4965 = _4869;
    float _4967 = -_2534;
    float _4969 = _236 + _4967;
    float _4971 = -_2538;
    float _4973 = _234 + _4971;
    float _4975 = _2548 * _4969;
    float _4977 = -_2542;
    float _4979 = _238 + _4977;
    float _4981 = fma(_2552, _4973, _4975);
    float _4983 = fma(_2556, _4979, _4981);
    float _4985 = _2584 * _4983;
    float _4987 = rint(_4985);
    float _4989 = precise::max(0.0, _4987);
    float _4991 = precise::min(_4989, 3.0);
    float _4993 = trunc(_4991);
    int _4995 = int(_4993);
    bool _4997 = _4995 >= 2;
    bool _4999 = !_4997;
    float _5001 = as_type<float>(_4995);
    float _5003 = _4987;
    float _5005 = _4981;
    float _5007 = _4975;
    float _5009 = _4951;
    float _5011 = _4953;
    float _5013 = _4959;
    float _5015 = _4961;
    float _5017 = _4965;
    float _5019 = _4957;
    float _5021 = _4941;
    float _5023 = _4963;
    float _5025 = _4955;
    float _5027 = _4935;
    float _5029 = _4937;
    float _5031 = _4939;
    float _5049;
    float _5051;
    float _5053;
    float _5055;
    if (!_4999)
    {
        bool _5033 = _4995 >= 3;
        bool _5035 = !_5033;
        if (!_5035)
        {
            bool _5037 = _4995 != 3;
            _5039 = _5037;
            if (!_5039)
            {
                float _5041 = _234 + _4935;
                float _5043 = _236 + _4937;
                float _5045 = _238 + _4939;
                float _5047 = _4941 + 1.0;
                _5049 = _4943;
                _5051 = _4949;
                _5021 = _5047;
                _5053 = _4945;
                _5055 = _4947;
                _5027 = _5041;
                _5029 = _5043;
                _5031 = _5045;
                _5057 = true;
            }
        }
        else
        {
            float _5059 = _234 + _4951;
            float _5061 = _236 + _4953;
            float _5063 = _238 + _4955;
            float _5065 = _4957 + 1.0;
            _5009 = _5059;
            _5011 = _5061;
            _5019 = _5065;
            _5049 = _4943;
            _5051 = _4949;
            _5053 = _4945;
            _5025 = _5063;
            _5055 = _4947;
            _5057 = true;
        }
    }
    if ((!_5057) || _5039)
    {
        bool _5067;
        if (!_5039)
        {
            _5067 = _4995 >= 1;
        }
        if ((!_5067) || _5039)
        {
            if (!_5039)
            {
                bool _5069 = _4995 != 0;
                if (!_5069)
                {
                    float _5071 = _234 + _4943;
                    _5001 = _5071;
                }
                float _5073 = _5001;
                _5049 = _5073;
                if (!_5069)
                {
                    float _5075 = _236 + _4945;
                    _5003 = _5075;
                }
                float _5077 = _5003;
                _5053 = _5077;
                if (!_5069)
                {
                    float _5079 = _238 + _4947;
                    _5005 = _5079;
                }
                float _5081 = _5005;
                _5055 = _5081;
                if (!_5069)
                {
                    float _5083 = _4949 + 1.0;
                    _5007 = _5083;
                }
                float _5085 = _5007;
                bool _5087 = !_5069;
                _5051 = _5085;
                _5057 = _5087;
            }
            if ((!_5057) || _5039)
            {
                _5039 = false;
                _5049 = _4943;
                _5051 = _4949;
                _5053 = _4945;
                _5055 = _4947;
                _5057 = true;
            }
        }
        else
        {
            float _5089 = _234 + _4959;
            float _5091 = _236 + _4961;
            float _5093 = _238 + _4963;
            float _5095 = _4965 + 1.0;
            _5013 = _5089;
            _5015 = _5091;
            _5017 = _5095;
            _5049 = _4943;
            _5051 = _4949;
            _5053 = _4945;
            _5023 = _5093;
            _5055 = _4947;
        }
    }
    _5057 = false;
    float _5097 = _5009;
    float _5099 = _5011;
    float _5101 = _5013;
    float _5103 = _5015;
    float _5105 = _5017;
    float _5107 = _5019;
    float _5109 = _5049;
    float _5111 = _5051;
    float _5113 = _5021;
    float _5115 = _5053;
    float _5117 = _5023;
    float _5119 = _5025;
    float _5121 = _5055;
    float _5123 = _5027;
    float _5125 = _5029;
    float _5127 = _5031;
    float _5129 = _5097 * 6.0;
    float _5131 = _5099 * 6.0;
    float _5133 = _5101 * 6.0;
    float _5135 = _5103 * 6.0;
    float _5137 = fma(_5101, 3.0, _5129);
    float _5139 = fma(_5103, 3.0, _5131);
    float _5141 = _5105 * 4.0;
    float _5143 = fma(_5107, 4.0, _5105);
    _24[1] = as_type<uint>(_194);
    float _5145 = fma(_5109, 9.0, _5133);
    float _5147 = fma(_5111, 9.0, _5141);
    float _5149 = fma(_5113, 9.0, _5143);
    _24[0] = as_type<uint>(_198);
    float _5151 = precise::max(_150, _160);
    float _5153 = fma(_5115, 9.0, _5135);
    float _5155 = precise::max(_190, _200);
    float _5157 = _5117 * 6.0;
    float _5159 = precise::max(_130, _140);
    float _5161 = _5119 * 6.0;
    float _5163 = _5107 + _5105;
    float _5165 = precise::max(_170, _180);
    float _5167 = fma(_5121, 9.0, _5157);
    float _5169 = precise::max(_5159, _5151);
    float _5171 = fma(_5117, 3.0, _5161);
    float _5173 = precise::max(_5165, _5155);
    float _5175 = as_type<float>(_24[1]);
    float _5177 = precise::max(_100, _90);
    float _5179 = _5147 + _5107;
    float _5181 = precise::max(_110, _120);
    float _5183 = as_type<float>(_24[0]);
    float _5185 = precise::max(_210, _220);
    float _5187 = _5179 * _5149;
    float _5189 = precise::max(_5177, _5181);
    float _5191 = _5163 * 2.0;
    float _5193 = precise::max(_230, _240);
    float _5195 = -_5187;
    float _5197 = fma(_5191, _5191, _5195);
    bool _5199 = _5197 != 0.0;
    bool _5201 = isnan(_5197);
    bool _5203 = _5199 || _5201;
    bool _5205 = isnan(0.0);
    bool _5207 = _5203 || _5205;
    float _5209 = precise::max(_5185, _5193);
    float _5211 = precise::max(_5189, _5169);
    float _5213 = precise::max(_5173, _5209);
    float _5215 = fma(_5097, 3.0, _5145);
    float _5217 = fma(_5119, 3.0, _5167);
    float _5219 = fma(_5099, 3.0, _5153);
    float _5221 = fma(_5123, 9.0, _5137);
    float _5223 = fma(_5125, 9.0, _5139);
    float _5225 = fma(_5127, 9.0, _5171);
    float _5227 = precise::max(_5211, _5213);
    bool _5229 = !_5207;
    if (!_5229)
    {
        float _5231 = 1.0 / _5197;
        float _5233 = _5179 * _5221;
        float _5235 = _5215 * _5149;
        float _5237 = -_5233;
        float _5239 = fma(_5215, _5191, _5237);
        float _5241 = -_5235;
        float _5243 = fma(_5221, _5191, _5241);
        float _5245 = _5179 * _5223;
        float _5247 = _5219 * _5149;
        float _5249 = _5179 * _5225;
        float _5251 = _5217 * _5149;
        float _5253 = -_5245;
        float _5255 = fma(_5219, _5191, _5253);
        float _5257 = -_5247;
        float _5259 = fma(_5223, _5191, _5257);
        float _5261 = -_5249;
        float _5263 = fma(_5217, _5191, _5261);
        float _5265 = -_5251;
        float _5267 = fma(_5225, _5191, _5265);
        float _5269 = _5259 * _5231;
        float _5271 = _5239 * _5231;
        float _5273 = _5255 * _5231;
        float _5275 = _5263 * _5231;
        float _5277 = _5243 * _5231;
        float _5279 = _5267 * _5231;
        float _5281 = -_5269;
        float _5283 = _5273 + _5281;
        float _5285 = -_5277;
        float _5287 = _5271 + _5285;
        float _5289 = -_5279;
        float _5291 = _5275 + _5289;
        _2603 = _5287;
        _2605 = _5283;
        _2607 = _5291;
        _2609 = _5277;
        _2611 = _5271;
        _2613 = _5269;
        _2615 = _5273;
        _2617 = _5279;
        _2619 = _5275;
    }
    float _5293 = _2603;
    float _5295 = _2605;
    float _5297 = _2607;
    float _5299 = _2609;
    float _5301 = _2611;
    float _5303 = _2613;
    float _5305 = _2615;
    float _5307 = _2617;
    float _5309 = _2619;
    float _5311 = fma(_5293, 496.0, 0.5);
    float _5313 = precise::clamp(_5311, 0.0, 1.0);
    float _5315 = fma(_5295, 1008.0, 0.5);
    float _5317 = precise::clamp(_5315, 0.0, 1.0);
    float _5319 = fma(_5293, -31.0, 1.0);
    float _5321 = precise::clamp(_5319, 0.0, 1.0);
    float _5323 = fma(_5297, 496.0, 0.5);
    float _5325 = precise::clamp(_5323, 0.0, 1.0);
    float _5327 = _5313 + (-0.5);
    float _5329 = fma(_5295, -63.0, 1.0);
    float _5331 = precise::clamp(_5329, 0.0, 1.0);
    float _5333 = _5317 + (-0.5);
    float _5335 = fma(_5297, -31.0, 1.0);
    float _5337 = precise::clamp(_5335, 0.0, 1.0);
    float _5339 = _5321 * _5327;
    float _5341 = _5325 + (-0.5);
    float _5343 = _5331 * _5333;
    float _5345 = _5343 * 2.0;
    float _5347 = _5227 * 255.0;
    float _5349 = fma(_5339, -0.0322580635547637939453125, _5299);
    float _5351 = precise::clamp(_5349, 0.0, 1.0);
    float _5353 = _5337 * _5341;
    float _5355 = fma(_5339, 0.0322580635547637939453125, _5301);
    float _5357 = precise::clamp(_5355, 0.0, 1.0);
    float _5359 = fma(_5345, -0.01587301678955554962158203125, _5303);
    float _5361 = precise::clamp(_5359, 0.0, 1.0);
    float _5363 = fma(_5345, 0.01587301678955554962158203125, _5305);
    float _5365 = precise::clamp(_5363, 0.0, 1.0);
    float _5367 = fma(_5353, -0.0322580635547637939453125, _5307);
    float _5369 = precise::clamp(_5367, 0.0, 1.0);
    float _5371 = _5357 * 31.0;
    float _5373 = fma(_5353, 0.0322580635547637939453125, _5309);
    float _5375 = precise::clamp(_5373, 0.0, 1.0);
    float _5377 = _5351 * 31.0;
    float _5379 = _5361 * 63.0;
    float _5381 = _5365 * 63.0;
    float _5383 = _5369 * 31.0;
    float _5385 = _5375 * 31.0;
    float _5387 = trunc(_5347);
    float _5389 = precise::max(_5387, 0.0);
    uint _5391 = uint(_5389);
    float _5393 = precise::min(_100, _90);
    float _5395 = precise::min(_130, _140);
    float _5397 = precise::min(_170, _180);
    float _5399 = precise::min(_190, _200);
    float _5401 = rint(_5371);
    float _5403 = precise::min(_210, _220);
    float _5405 = precise::min(_230, _240);
    float _5407 = precise::min(_5397, _5399);
    float _5409 = precise::min(_5403, _5405);
    float _5411 = rint(_5381);
    float _5413 = precise::min(_5407, _5409);
    float _5415 = rint(_5377);
    float _5417 = _5401 + 0.5;
    float _5419 = rint(_5379);
    float _5421 = _5411 + 0.5;
    float _5423 = rint(_5383);
    float _5425 = _5415 + 0.5;
    float _5427 = rint(_5385);
    float _5429 = precise::min(_110, _120);
    float _5431 = precise::min(_5393, _5429);
    float _5433 = precise::min(_150, _160);
    float _5435 = trunc(_5417);
    float _5437 = precise::max(_5435, 0.0);
    uint _5439 = uint(_5437);
    float _5441 = precise::min(_5395, _5433);
    float _5443 = _5419 + 0.5;
    float _5445 = precise::min(_5431, _5441);
    float _5447 = _5427 + 0.5;
    float _5449 = trunc(_5421);
    float _5451 = precise::max(_5449, 0.0);
    uint _5453 = uint(_5451);
    float _5455 = precise::min(_5445, _5413);
    float _5457 = _5423 + 0.5;
    float _5459 = _5455 * 255.0;
    float _5461 = trunc(_5425);
    float _5463 = precise::max(_5461, 0.0);
    uint _5465 = uint(_5463);
    int _5467 = int(_5439) << 11;
    float _5469 = trunc(_5443);
    float _5471 = precise::max(_5469, 0.0);
    uint _5473 = uint(_5471);
    int _5475 = int(_5453) << 5;
    float _5477 = trunc(_5447);
    float _5479 = precise::max(_5477, 0.0);
    uint _5481 = uint(_5479);
    int _5483 = int(_5465) << 11;
    float _5485 = trunc(_5457);
    float _5487 = precise::max(_5485, 0.0);
    uint _5489 = uint(_5487);
    int _5491 = int(_5473) << 5;
    float _5493 = trunc(_5459);
    float _5495 = precise::max(_5493, 0.0);
    uint _5497 = uint(_5495);
    int _5499 = _5467 | _5475;
    int _5501 = int(_5481) | _5499;
    int _5503 = _5483 | _5491;
    int _5505 = int(_5489) | _5503;
    bool _5507 = _5501 != _5505;
    bool _5509 = _5391 > _5497;
    int _5511 = int(_5497) << 8;
    int _5513 = _5511 & 65280;
    int _5515 = int(_5473);
    int _5517 = _5511;
    int _5519 = _5475;
    int _5521 = _5513;
    int _5523 = as_type<int>(_5415);
    int _5525 = _5501;
    int _5527 = _5505;
    if (!_5507)
    {
        _5515 = _5501;
    }
    int _5529 = _5515;
    int _5531 = 255 & int(_5391);
    int _5533 = _5513 | _5531;
    int _5535 = _5529;
    if (!_5509)
    {
        _5517 = 0;
    }
    int _5537 = _5517;
    int _5539 = _5537;
    if (!_5507)
    {
        _5519 = 0;
    }
    int _5541 = _5519;
    int _5543 = _5541;
    if (!_5507)
    {
        _5521 = 0;
    }
    int _5545 = _5521;
    bool _5547 = !_5507;
    int _5549 = _5545;
    if (!_5547)
    {
        float _5551 = _5415 * 0.0322580635547637939453125;
        float _5553 = _5411 * 0.01587301678955554962158203125;
        float _5555 = _5419 * 0.01587301678955554962158203125;
        bool _5557 = uint(_5501) >= uint(_5505);
        float _5559 = _5401 * 0.0322580635547637939453125;
        float _5561 = _5427 * 0.0322580635547637939453125;
        float _5563 = _5423 * 0.0322580635547637939453125;
        bool _5565 = !_5557;
        float _5567 = _5565 ? _5553 : _5555;
        bool _5569 = !_5557;
        float _5571 = _5569 ? _5555 : _5553;
        bool _5573 = !_5557;
        float _5575 = _5573 ? _5559 : _5551;
        float _5577 = -_5567;
        float _5579 = _156 + _5577;
        bool _5581 = !_5557;
        float _5583 = _5581 ? _5551 : _5559;
        float _5585 = -_5567;
        float _5587 = _5585 + _5571;
        bool _5589 = !_5557;
        float _5591 = _5589 ? _5561 : _5563;
        float _5593 = -_5575;
        float _5595 = _154 + _5593;
        bool _5597 = !_5557;
        float _5599 = _5597 ? _5563 : _5561;
        float _5601 = -_5575;
        float _5603 = _5601 + _5583;
        float _5605 = -_5575;
        float _5607 = _144 + _5605;
        float _5609 = -_5575;
        float _5611 = _134 + _5609;
        float _5613 = -_5575;
        float _5615 = _124 + _5613;
        float _5617 = -_5575;
        float _5619 = _114 + _5617;
        float _5621 = -_5575;
        float _5623 = _104 + _5621;
        float _5625 = -_5575;
        float _5627 = _84 + _5625;
        float _5629 = -_5575;
        float _5631 = _94 + _5629;
        float _5633 = -_5575;
        float _5635 = _234 + _5633;
        float _5637 = -_5575;
        float _5639 = _224 + _5637;
        float _5641 = -_5575;
        float _5643 = _214 + _5641;
        float _5645 = -_5575;
        float _5647 = _204 + _5645;
        float _5649 = -_5575;
        float _5651 = _5175 + _5649;
        float _5653 = -_5575;
        float _5655 = _184 + _5653;
        float _5657 = -_5575;
        float _5659 = _174 + _5657;
        float _5661 = -_5575;
        float _5663 = _164 + _5661;
        float _5665 = _5587 * _5587;
        float _5667 = -_5591;
        float _5669 = _5667 + _5599;
        float _5671 = -_5567;
        float _5673 = _146 + _5671;
        float _5675 = -_5591;
        float _5677 = _158 + _5675;
        float _5679 = fma(_5603, _5603, _5665);
        float _5681 = -_5591;
        float _5683 = _148 + _5681;
        float _5685 = -_5567;
        float _5687 = _136 + _5685;
        float _5689 = -_5567;
        float _5691 = _126 + _5689;
        float _5693 = fma(_5669, _5669, _5679);
        float _5695 = -_5591;
        float _5697 = _138 + _5695;
        float _5699 = -_5567;
        float _5701 = _116 + _5699;
        float _5703 = -_5567;
        float _5705 = _106 + _5703;
        float _5707 = 1.0 / _5693;
        float _5709 = -_5567;
        float _5711 = _86 + _5709;
        float _5713 = -_5567;
        float _5715 = _96 + _5713;
        float _5717 = -_5567;
        float _5719 = _236 + _5717;
        float _5721 = -_5567;
        float _5723 = _226 + _5721;
        float _5725 = -_5567;
        float _5727 = _216 + _5725;
        float _5729 = -_5567;
        float _5731 = _206 + _5729;
        float _5733 = -_5567;
        float _5735 = _196 + _5733;
        float _5737 = -_5567;
        float _5739 = _186 + _5737;
        float _5741 = -_5567;
        float _5743 = _176 + _5741;
        float _5745 = -_5567;
        float _5747 = _166 + _5745;
        float _5749 = -_5591;
        float _5751 = _128 + _5749;
        float _5753 = -_5591;
        float _5755 = _118 + _5753;
        float _5757 = -_5591;
        float _5759 = _108 + _5757;
        float _5761 = -_5591;
        float _5763 = _88 + _5761;
        float _5765 = _5587 * _5707;
        float _5767 = _5603 * _5707;
        float _5769 = _5669 * _5707;
        float _5771 = _5765 * _5579;
        float _5773 = _5765 * _5673;
        float _5775 = _5765 * _5687;
        float _5777 = _5765 * _5691;
        float _5779 = fma(_5767, _5595, _5771);
        float _5781 = fma(_5767, _5607, _5773);
        float _5783 = fma(_5767, _5611, _5775);
        float _5785 = fma(_5767, _5615, _5777);
        float _5787 = fma(_5769, _5677, _5779);
        float _5789 = fma(_5769, _5683, _5781);
        float _5791 = fma(_5769, _5697, _5783);
        float _5793 = _5765 * _5701;
        float _5795 = _5765 * _5747;
        bool _5797 = _5787 >= 0.5;
        float _5799 = _5765 * _5705;
        bool _5801 = _5789 >= 0.5;
        float _5803 = _5765 * _5711;
        bool _5805 = _5787 >= 0.833000004291534423828125;
        float _5807 = _5765 * _5715;
        bool _5809 = _5787 >= 0.16599999368190765380859375;
        float _5811 = _5765 * _5719;
        float _5813 = _5765 * _5723;
        float _5815 = _5765 * _5727;
        float _5817 = _5765 * _5731;
        float _5819 = _5765 * _5735;
        float _5821 = _5765 * _5739;
        float _5823 = _5765 * _5743;
        int _5825 = _5805 ? 0 : 32768;
        float _5827 = fma(_5769, _5751, _5785);
        bool _5829 = _5789 >= 0.833000004291534423828125;
        float _5831 = fma(_5767, _5619, _5793);
        int _5833 = _5825;
        if (!_5797)
        {
            int _5835 = _5809 ? 49152 : 16384;
            _5833 = _5835;
        }
        int _5837 = _5833;
        float _5839 = fma(_5767, _5623, _5799);
        bool _5841 = _5789 >= 0.16599999368190765380859375;
        float _5843 = fma(_5767, _5627, _5803);
        float _5845 = fma(_5767, _5631, _5807);
        bool _5847 = _5791 >= 0.5;
        float _5849 = fma(_5767, _5635, _5811);
        float _5851 = fma(_5767, _5639, _5813);
        float _5853 = fma(_5767, _5643, _5815);
        float _5855 = fma(_5767, _5647, _5817);
        float _5857 = fma(_5767, _5651, _5819);
        float _5859 = fma(_5767, _5655, _5821);
        float _5861 = fma(_5767, _5659, _5823);
        float _5863 = fma(_5767, _5663, _5795);
        int _5865 = _5829 ? 0 : 8192;
        float _5867 = fma(_5769, _5755, _5831);
        bool _5869 = _5827 >= 0.5;
        float _5871 = fma(_5769, _5759, _5839);
        int _5873 = _5865;
        if (!_5801)
        {
            int _5875 = _5841 ? 12288 : 4096;
            _5873 = _5875;
        }
        int _5877 = _5873;
        float _5879 = fma(_5769, _5763, _5843);
        bool _5881 = _5827 >= 0.833000004291534423828125;
        float _5883 = -_5591;
        float _5885 = _238 + _5883;
        bool _5887 = _5791 >= 0.833000004291534423828125;
        float _5889 = -_5591;
        float _5891 = _228 + _5889;
        bool _5893 = _5791 >= 0.16599999368190765380859375;
        float _5895 = fma(_5769, _5885, _5849);
        int _5897 = _5881 ? 0 : 512;
        float _5899 = fma(_5769, _5891, _5851);
        bool _5901 = _5867 >= 0.5;
        float _5903 = -_5591;
        float _5905 = _218 + _5903;
        int _5907 = _5887 ? 0 : 2048;
        float _5909 = -_5591;
        float _5911 = _208 + _5909;
        bool _5913 = _5827 >= 0.16599999368190765380859375;
        float _5915 = fma(_5769, _5905, _5853);
        float _5917 = fma(_5769, _5911, _5855);
        int _5919 = _5907;
        int _5921 = _5897;
        if (!_5847)
        {
            int _5923 = _5893 ? 3072 : 1024;
            _5919 = _5923;
        }
        int _5925 = _5919;
        float _5927 = -_5591;
        float _5929 = _5183 + _5927;
        bool _5931 = _5871 >= 0.5;
        float _5933 = -_5591;
        float _5935 = _178 + _5933;
        if (!_5869)
        {
            int _5937 = _5913 ? 768 : 256;
            _5921 = _5937;
        }
        int _5939 = _5921;
        float _5941 = fma(_5769, _5929, _5857);
        bool _5943 = _5867 >= 0.833000004291534423828125;
        float _5945 = -_5591;
        float _5947 = _188 + _5945;
        bool _5949 = _5871 >= 0.833000004291534423828125;
        float _5951 = fma(_5769, _5935, _5861);
        bool _5953 = _5867 >= 0.16599999368190765380859375;
        float _5955 = fma(_5769, _5947, _5859);
        int _5957 = _5943 ? 0 : 128;
        float _5959 = -_5591;
        float _5961 = _98 + _5959;
        int _5963 = _5949 ? 0 : 32;
        float _5965 = -_5591;
        float _5967 = _168 + _5965;
        bool _5969 = _5879 >= 0.5;
        float _5971 = fma(_5769, _5961, _5845);
        bool _5973 = _5871 >= 0.16599999368190765380859375;
        float _5975 = fma(_5769, _5967, _5863);
        int _5977 = _5957;
        int _5979 = _5963;
        if (!_5901)
        {
            int _5981 = _5953 ? 192 : 64;
            _5977 = _5981;
        }
        int _5983 = _5977;
        bool _5985 = _5879 >= 0.833000004291534423828125;
        if (!_5931)
        {
            int _5987 = _5973 ? 48 : 16;
            _5979 = _5987;
        }
        int _5989 = _5979;
        int _5991 = _5985 ? 0 : 8;
        bool _5993 = _5895 >= 0.5;
        bool _5995 = _5879 >= 0.16599999368190765380859375;
        bool _5997 = _5899 >= 0.5;
        bool _5999 = _5895 >= 0.833000004291534423828125;
        int _6001 = _5991;
        if (!_5969)
        {
            int _6003 = _5995 ? 12 : 4;
            _6001 = _6003;
        }
        int _6005 = _6001;
        bool _6007 = _5899 >= 0.833000004291534423828125;
        bool _6009 = _5895 >= 0.16599999368190765380859375;
        int _6011 = _5999 ? 0 : int(0x80000000);
        bool _6013 = _5899 >= 0.16599999368190765380859375;
        int _6015 = _6007 ? 0 : 536870912;
        bool _6017 = _5915 >= 0.5;
        int _6019 = _6011;
        int _6021 = _6015;
        if (!_5993)
        {
            int _6023 = _6009 ? (-1073741824) : 1073741824;
            _6019 = _6023;
        }
        int _6025 = _6019;
        bool _6027 = _5917 >= 0.5;
        if (!_5997)
        {
            int _6029 = _6013 ? 805306368 : 268435456;
            _6021 = _6029;
        }
        int _6031 = _6021;
        bool _6033 = _5915 >= 0.833000004291534423828125;
        bool _6035 = _5917 >= 0.833000004291534423828125;
        int _6037 = _6033 ? 0 : 134217728;
        bool _6039 = _5915 >= 0.16599999368190765380859375;
        bool _6041 = _5941 >= 0.5;
        int _6043 = _6035 ? 0 : 33554432;
        bool _6045 = _5917 >= 0.16599999368190765380859375;
        int _6047 = _6037;
        int _6049 = _6043;
        if (!_6017)
        {
            int _6051 = _6039 ? 201326592 : 67108864;
            _6047 = _6051;
        }
        int _6053 = _6047;
        bool _6055 = _5941 >= 0.833000004291534423828125;
        if (!_6027)
        {
            int _6057 = _6045 ? 50331648 : 16777216;
            _6049 = _6057;
        }
        int _6059 = _6049;
        bool _6061 = _5951 >= 0.5;
        bool _6063 = _5941 >= 0.16599999368190765380859375;
        int _6065 = _6055 ? 0 : 8388608;
        bool _6067 = _5955 >= 0.5;
        bool _6069 = _5955 >= 0.833000004291534423828125;
        int _6071 = _6065;
        if (!_6041)
        {
            int _6073 = _6063 ? 12582912 : 4194304;
            _6071 = _6073;
        }
        int _6075 = _6071;
        bool _6077 = _5955 >= 0.16599999368190765380859375;
        bool _6079 = _5951 >= 0.833000004291534423828125;
        int _6081 = _6069 ? 0 : 2097152;
        bool _6083 = _5951 >= 0.16599999368190765380859375;
        int _6085 = _6079 ? 0 : 524288;
        int _6087 = _6085;
        int _6089 = _6081;
        if (!_6061)
        {
            int _6091 = _6083 ? 786432 : 262144;
            _6087 = _6091;
        }
        int _6093 = _6087;
        bool _6095 = _5971 >= 0.5;
        bool _6097 = _5975 >= 0.5;
        if (!_6067)
        {
            int _6099 = _6077 ? 3145728 : 1048576;
            _6089 = _6099;
        }
        int _6101 = _6089;
        bool _6103 = _5971 >= 0.833000004291534423828125;
        int _6105 = _6053 + _6025;
        int _6107 = _6105 + _6031;
        int _6109 = _5925 + _5837;
        int _6111 = _6109 + _5877;
        bool _6113 = _5975 >= 0.833000004291534423828125;
        int _6115 = _6103 ? 0 : 2;
        bool _6117 = _5971 >= 0.16599999368190765380859375;
        bool _6119 = _5975 >= 0.16599999368190765380859375;
        int _6121 = _6075 + _6107;
        int _6123 = _6121 + _6059;
        int _6125 = _5983 + _6111;
        int _6127 = _6125 + _5939;
        int _6129 = _6113 ? 0 : 131072;
        int _6131 = _6115;
        int _6133 = _6129;
        _5523 = 3;
        if (!_6095)
        {
            int _6135 = _6117 ? 3 : 1;
            _6131 = _6135;
        }
        int _6137 = _6131;
        if (!_6097)
        {
            int _6139 = _6119 ? 196608 : 65536;
            _6133 = _6139;
        }
        int _6141 = _6133;
        int _6143 = _6093 + _6123;
        int _6145 = _6143 + _6101;
        int _6147 = _6005 + _6127;
        int _6149 = _6147 + _5989;
        bool _6151 = !_5557;
        int _6153 = _6151 ? _5505 : _5501;
        bool _6155 = !_5557;
        int _6157 = _6155 ? _5501 : _5505;
        int _6159 = _6145 + _6141;
        int _6161 = _6149 + _6137;
        _5535 = _6153;
        _5549 = _6159;
        _5543 = _6161;
        _5525 = _6157;
    }
    int _6163 = _5535;
    int _6165 = _5523;
    int _6167 = _5549;
    int _6169 = _5543;
    int _6171 = _5525;
    int _6173 = _6165;
    if (!_5509)
    {
        _6173 = 0;
    }
    int _6175 = _6173;
    int _6177 = _6175;
    if (!_5509)
    {
        _5527 = 0;
    }
    int _6179 = _5527;
    bool _6181 = !_5509;
    int _6183 = _6179;
    if (!_6181)
    {
        float _6185 = -_5455;
        float _6187 = _5227 + _6185;
        float _6189 = -_5455;
        float _6191 = _110 + _6189;
        float _6193 = -_5455;
        float _6195 = _100 + _6193;
        float _6197 = -_5455;
        float _6199 = _90 + _6197;
        float _6201 = -_5455;
        float _6203 = _140 + _6201;
        float _6205 = 1.0 / _6187;
        float _6207 = -_5455;
        float _6209 = _150 + _6207;
        float _6211 = -_5455;
        float _6213 = _160 + _6211;
        float _6215 = -_5455;
        float _6217 = _170 + _6215;
        float _6219 = -_5455;
        float _6221 = _180 + _6219;
        float _6223 = -_5455;
        float _6225 = _190 + _6223;
        float _6227 = -_5455;
        float _6229 = _200 + _6227;
        float _6231 = -_5455;
        float _6233 = _210 + _6231;
        float _6235 = -_5455;
        float _6237 = _220 + _6235;
        float _6239 = -_5455;
        float _6241 = _230 + _6239;
        float _6243 = -_5455;
        float _6245 = _240 + _6243;
        float _6247 = _6191 * _6205;
        float _6249 = -_5455;
        float _6251 = _120 + _6249;
        float _6253 = _6195 * _6205;
        float _6255 = _6199 * _6205;
        float _6257 = _6251 * _6205;
        float _6259 = -_5455;
        float _6261 = _130 + _6259;
        float _6263 = fma(_6253, -1.99999904632568359375, 1.99999904632568359375);
        float _6265 = fma(_6253, -7.99999904632568359375, 7.99999904632568359375);
        float _6267 = fma(_6255, -1.99999904632568359375, 1.99999904632568359375);
        float _6269 = fma(_6255, -7.99999904632568359375, 7.99999904632568359375);
        float _6271 = fma(_6247, -1.99999904632568359375, 1.99999904632568359375);
        float _6273 = fma(_6247, -7.99999904632568359375, 7.99999904632568359375);
        float _6275 = _6261 * _6205;
        float _6277 = -_6253;
        float _6279 = _6277 + 0.5;
        float _6281 = -_6255;
        float _6283 = _6281 + 0.5;
        float _6285 = fma(_6257, -1.99999904632568359375, 1.99999904632568359375);
        float _6287 = fma(_6257, -7.99999904632568359375, 7.99999904632568359375);
        float _6289 = trunc(_6263);
        float _6291 = precise::max(_6289, 0.0);
        uint _6293 = uint(_6291);
        float _6295 = fma(_6275, -1.99999904632568359375, 1.99999904632568359375);
        float _6297 = fma(_6275, -7.99999904632568359375, 7.99999904632568359375);
        float _6299 = _6203 * _6205;
        float _6301 = _6209 * _6205;
        float _6303 = -_6247;
        float _6305 = _6303 + 0.5;
        float _6307 = abs(_6279);
        bool _6309 = _6307 >= 0.375;
        float _6311 = -_6257;
        float _6313 = _6311 + 0.5;
        float _6315 = trunc(_6265);
        float _6317 = precise::max(_6315, 0.0);
        uint _6319 = uint(_6317);
        float _6321 = abs(_6283);
        bool _6323 = _6321 >= 0.375;
        float _6325 = fma(_6299, -1.99999904632568359375, 1.99999904632568359375);
        float _6327 = fma(_6299, -7.99999904632568359375, 7.99999904632568359375);
        float _6329 = fma(_6301, -1.99999904632568359375, 1.99999904632568359375);
        float _6331 = fma(_6301, -7.99999904632568359375, 7.99999904632568359375);
        float _6333 = _6213 * _6205;
        float _6335 = _6217 * _6205;
        float _6337 = trunc(_6267);
        float _6339 = precise::max(_6337, 0.0);
        uint _6341 = uint(_6339);
        float _6343 = -_6275;
        float _6345 = _6343 + 0.5;
        float _6347 = abs(_6305);
        bool _6349 = _6347 >= 0.375;
        float _6351 = _6221 * _6205;
        float _6353 = fma(_6333, -1.99999904632568359375, 1.99999904632568359375);
        float _6355 = fma(_6333, -7.99999904632568359375, 7.99999904632568359375);
        float _6357 = fma(_6335, -1.99999904632568359375, 1.99999904632568359375);
        float _6359 = fma(_6335, -7.99999904632568359375, 7.99999904632568359375);
        float _6361 = trunc(_6269);
        float _6363 = precise::max(_6361, 0.0);
        uint _6365 = uint(_6363);
        float _6367 = -_6299;
        float _6369 = _6367 + 0.5;
        float _6371 = abs(_6313);
        bool _6373 = _6371 >= 0.375;
        float _6375 = -_6301;
        float _6377 = _6375 + 0.5;
        float _6379 = abs(_6345);
        bool _6381 = _6379 >= 0.375;
        float _6383 = fma(_6351, -1.99999904632568359375, 1.99999904632568359375);
        float _6385 = fma(_6351, -7.99999904632568359375, 7.99999904632568359375);
        float _6387 = _6225 * _6205;
        float _6389 = trunc(_6271);
        float _6391 = precise::max(_6389, 0.0);
        uint _6393 = uint(_6391);
        float _6395 = _6229 * _6205;
        float _6397 = -_6333;
        float _6399 = _6397 + 0.5;
        float _6401 = -_6335;
        float _6403 = _6401 + 0.5;
        float _6405 = abs(_6369);
        bool _6407 = _6405 >= 0.375;
        float _6409 = fma(_6387, -1.99999904632568359375, 1.99999904632568359375);
        float _6411 = abs(_6377);
        bool _6413 = _6411 >= 0.375;
        float _6415 = fma(_6387, -7.99999904632568359375, 7.99999904632568359375);
        float _6417 = trunc(_6273);
        float _6419 = precise::max(_6417, 0.0);
        uint _6421 = uint(_6419);
        float _6423 = fma(_6395, -1.99999904632568359375, 1.99999904632568359375);
        float _6425 = fma(_6395, -7.99999904632568359375, 7.99999904632568359375);
        float _6427 = _6233 * _6205;
        float _6429 = _6237 * _6205;
        float _6431 = -_6351;
        float _6433 = _6431 + 0.5;
        int _6435 = int(_6293);
        int _6437 = int(_6341);
        int _6439 = int(_6393);
        if (!_6309)
        {
            int _6441 = int(_6319) + 1;
            _6435 = _6441;
        }
        int _6443 = _6435;
        float _6445 = _6241 * _6205;
        float _6447 = trunc(_6285);
        float _6449 = precise::max(_6447, 0.0);
        uint _6451 = uint(_6449);
        int _6453 = int(_6451);
        if (!_6323)
        {
            int _6455 = int(_6365) + 1;
            _6437 = _6455;
        }
        int _6457 = _6437;
        float _6459 = _6245 * _6205;
        float _6461 = abs(_6399);
        bool _6463 = _6461 >= 0.375;
        float _6465 = fma(_6427, -1.99999904632568359375, 1.99999904632568359375);
        float _6467 = abs(_6403);
        bool _6469 = _6467 >= 0.375;
        float _6471 = fma(_6427, -7.99999904632568359375, 7.99999904632568359375);
        float _6473 = fma(_6429, -1.99999904632568359375, 1.99999904632568359375);
        float _6475 = trunc(_6287);
        float _6477 = precise::max(_6475, 0.0);
        uint _6479 = uint(_6477);
        float _6481 = fma(_6429, -7.99999904632568359375, 7.99999904632568359375);
        if (!_6349)
        {
            int _6483 = int(_6421) + 1;
            _6439 = _6483;
        }
        int _6485 = _6439;
        float _6487 = -_6387;
        float _6489 = _6487 + 0.5;
        float _6491 = -_6395;
        float _6493 = _6491 + 0.5;
        float _6495 = abs(_6433);
        bool _6497 = _6495 >= 0.375;
        float _6499 = fma(_6445, -1.99999904632568359375, 1.99999904632568359375);
        float _6501 = -_6427;
        float _6503 = _6501 + 0.5;
        float _6505 = trunc(_6295);
        float _6507 = precise::max(_6505, 0.0);
        uint _6509 = uint(_6507);
        float _6511 = -_6429;
        float _6513 = _6511 + 0.5;
        float _6515 = fma(_6445, -7.99999904632568359375, 7.99999904632568359375);
        float _6517 = fma(_6459, -1.99999904632568359375, 1.99999904632568359375);
        float _6519 = -_6445;
        float _6521 = _6519 + 0.5;
        int _6523 = _6457 << 3;
        float _6525 = trunc(_6297);
        float _6527 = precise::max(_6525, 0.0);
        uint _6529 = uint(_6527);
        int _6531 = int(_6509);
        if (!_6373)
        {
            int _6533 = int(_6479) + 1;
            _6453 = _6533;
        }
        int _6535 = _6453;
        float _6537 = fma(_6459, -7.99999904632568359375, 7.99999904632568359375);
        float _6539 = abs(_6489);
        bool _6541 = _6539 >= 0.375;
        float _6543 = -_6459;
        float _6545 = _6543 + 0.5;
        int _6547 = _6443 | _6523;
        int _6549 = _6535 << 9;
        float _6551 = trunc(_6325);
        float _6553 = precise::max(_6551, 0.0);
        uint _6555 = uint(_6553);
        float _6557 = trunc(_6327);
        float _6559 = precise::max(_6557, 0.0);
        uint _6561 = uint(_6559);
        int _6563 = int(_6555);
        if (!_6381)
        {
            int _6565 = int(_6529) + 1;
            _6531 = _6565;
        }
        int _6567 = _6531;
        float _6569 = abs(_6493);
        bool _6571 = _6569 >= 0.375;
        float _6573 = trunc(_6329);
        float _6575 = precise::max(_6573, 0.0);
        uint _6577 = uint(_6575);
        float _6579 = trunc(_6331);
        float _6581 = precise::max(_6579, 0.0);
        uint _6583 = uint(_6581);
        int _6585 = int(_6577);
        if (!_6407)
        {
            int _6587 = int(_6561) + 1;
            _6563 = _6587;
        }
        int _6589 = _6563;
        float _6591 = abs(_6503);
        bool _6593 = _6591 >= 0.375;
        int _6595 = _6589 << 15;
        float _6597 = trunc(_6353);
        float _6599 = precise::max(_6597, 0.0);
        uint _6601 = uint(_6599);
        float _6603 = trunc(_6355);
        float _6605 = precise::max(_6603, 0.0);
        uint _6607 = uint(_6605);
        int _6609 = int(_6601);
        if (!_6413)
        {
            int _6611 = int(_6583) + 1;
            _6585 = _6611;
        }
        int _6613 = _6585;
        float _6615 = abs(_6513);
        bool _6617 = _6615 >= 0.375;
        float _6619 = trunc(_6357);
        float _6621 = precise::max(_6619, 0.0);
        uint _6623 = uint(_6621);
        float _6625 = trunc(_6359);
        float _6627 = precise::max(_6625, 0.0);
        uint _6629 = uint(_6627);
        int _6631 = int(_6623);
        if (!_6463)
        {
            int _6633 = int(_6607) + 1;
            _6609 = _6633;
        }
        int _6635 = _6609;
        float _6637 = abs(_6521);
        bool _6639 = _6637 >= 0.375;
        int _6641 = _6635 << 21;
        float _6643 = trunc(_6383);
        float _6645 = precise::max(_6643, 0.0);
        uint _6647 = uint(_6645);
        float _6649 = trunc(_6385);
        float _6651 = precise::max(_6649, 0.0);
        uint _6653 = uint(_6651);
        int _6655 = int(_6647);
        if (!_6469)
        {
            int _6657 = int(_6629) + 1;
            _6631 = _6657;
        }
        int _6659 = _6631;
        float _6661 = abs(_6545);
        bool _6663 = _6661 >= 0.375;
        float _6665 = trunc(_6409);
        float _6667 = precise::max(_6665, 0.0);
        uint _6669 = uint(_6667);
        float _6671 = trunc(_6415);
        float _6673 = precise::max(_6671, 0.0);
        uint _6675 = uint(_6673);
        int _6677 = int(_6669);
        if (!_6497)
        {
            int _6679 = int(_6653) + 1;
            _6655 = _6679;
        }
        int _6681 = _6655;
        int _6683 = _6681 << 3;
        float _6685 = trunc(_6423);
        float _6687 = precise::max(_6685, 0.0);
        uint _6689 = uint(_6687);
        int _6691 = _6659 | _6683;
        float _6693 = trunc(_6425);
        float _6695 = precise::max(_6693, 0.0);
        uint _6697 = uint(_6695);
        int _6699 = int(_6689);
        if (!_6541)
        {
            int _6701 = int(_6675) + 1;
            _6677 = _6701;
        }
        int _6703 = _6677;
        int _6705 = _6703 << 6;
        float _6707 = trunc(_6465);
        float _6709 = precise::max(_6707, 0.0);
        uint _6711 = uint(_6709);
        float _6713 = trunc(_6471);
        float _6715 = precise::max(_6713, 0.0);
        uint _6717 = uint(_6715);
        int _6719 = int(_6711);
        if (!_6571)
        {
            int _6721 = int(_6697) + 1;
            _6699 = _6721;
        }
        int _6723 = _6699;
        int _6725 = _6723 << 9;
        float _6727 = trunc(_6473);
        float _6729 = precise::max(_6727, 0.0);
        uint _6731 = uint(_6729);
        int _6733 = _6691 | _6705;
        int _6735 = _6725 | _6733;
        float _6737 = trunc(_6481);
        float _6739 = precise::max(_6737, 0.0);
        uint _6741 = uint(_6739);
        int _6743 = int(_6731);
        if (!_6593)
        {
            int _6745 = int(_6717) + 1;
            _6719 = _6745;
        }
        int _6747 = _6719;
        float _6749 = trunc(_6499);
        float _6751 = precise::max(_6749, 0.0);
        uint _6753 = uint(_6751);
        float _6755 = trunc(_6515);
        float _6757 = precise::max(_6755, 0.0);
        uint _6759 = uint(_6757);
        int _6761 = int(_6753);
        if (!_6617)
        {
            int _6763 = int(_6741) + 1;
            _6743 = _6763;
        }
        int _6765 = _6743;
        int _6767 = _6765 << 15;
        float _6769 = trunc(_6517);
        float _6771 = precise::max(_6769, 0.0);
        uint _6773 = uint(_6771);
        float _6775 = trunc(_6537);
        float _6777 = precise::max(_6775, 0.0);
        uint _6779 = uint(_6777);
        int _6781 = _6485 << 6;
        int _6783 = _6747 << 12;
        int _6785 = _6547 | _6781;
        int _6787 = _6549 | _6785;
        int _6789 = _6567 << 12;
        int _6791 = int(_6773);
        if (!_6639)
        {
            int _6793 = int(_6759) + 1;
            _6761 = _6793;
        }
        int _6795 = _6761;
        int _6797 = _6787 | _6789;
        int _6799 = _6595 | _6797;
        int _6801 = _6735 | _6783;
        int _6803 = _6767 | _6801;
        int _6805 = _6613 << 18;
        if (!_6663)
        {
            int _6807 = int(_6779) + 1;
            _6791 = _6807;
        }
        int _6809 = _6791;
        int _6811 = _6795 << 18;
        int _6813 = _6809 << 21;
        int _6815 = _6799 | _6805;
        int _6817 = _6641 | _6815;
        int _6819 = _6803 | _6811;
        int _6821 = _6813 | _6819;
        uint _6823 = uint(int(uint(_6817) >> uint(16)));
        int _6825 = _6821 << 8;
        uint _6827 = uint(int(uint(_6821) >> uint(8)));
        int _6829 = 65280 & _6825;
        int _6831 = int(_6823) | _6829;
        int _6833 = _6817 << 16;
        int _6835 = int(_6827) << 16;
        _5539 = _6833;
        _6183 = _6835;
        _6177 = _6831;
    }
    int _6837 = _5539;
    int _6839 = _6183;
    int _6841 = _6177;
    int _6843 = _6163 & 65535;
    int _6845 = _6837 | _5533;
    int _6847 = _6839 | _6841;
    int _6849 = _6167 | _6169;
    int _6851 = _6171 << 16;
    int _6853 = _6851 + _6843;
    out.m_37.x = as_type<float>(_6845);
    out.m_37.y = as_type<float>(_6847);
    out.m_37.z = as_type<float>(_6853);
    out.m_37.w = as_type<float>(_6849);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5057 = false;
    bool _5039 = false;
    bool _4895 = false;
    bool _4877 = false;
    bool _4733 = false;
    bool _4715 = false;
    bool _4571 = false;
    bool _4553 = false;
    bool _4409 = false;
    bool _4391 = false;
    bool _4247 = false;
    bool _4229 = false;
    bool _4085 = false;
    bool _4067 = false;
    bool _3923 = false;
    bool _3905 = false;
    bool _3761 = false;
    bool _3743 = false;
    bool _3599 = false;
    bool _3581 = false;
    bool _3437 = false;
    bool _3419 = false;
    bool _3275 = false;
    bool _3257 = false;
    bool _3113 = false;
    bool _3095 = false;
    bool _2951 = false;
    bool _2933 = false;
    bool _2789 = false;
    bool _2771 = false;
    bool _2661 = false;
    bool _2627 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_34.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float _72 = rint(_66);
    float _74 = precise::max(_72, 0.0);
    uint _77 = uint(_74);
    uint _79 = clamp(_77, 0u, 65535u);
    float3 _6914 = float3(_68, _70, float(int(_79)));
    float3 _6918 = select(_6914, float3(0.0), isnan(_6914));
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6918.xy, uint(rint(_6918.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6918.xy, uint(rint(_6918.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float3 _6940 = float3(_68, _70, float(int(_79)));
    float3 _6942 = select(_6940, float3(0.0), isnan(_6940));
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6942.xy, uint(rint(_6942.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6942.xy, uint(rint(_6942.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float3 _6961 = float3(_68, _70, float(int(_79)));
    float3 _6963 = select(_6961, float3(0.0), isnan(_6961));
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6963.xy, uint(rint(_6963.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6963.xy, uint(rint(_6963.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float3 _6983 = float3(_68, _70, float(int(_79)));
    float3 _6985 = select(_6983, float3(0.0), isnan(_6983));
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6985.xy, uint(rint(_6985.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6985.xy, uint(rint(_6985.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float3 _7005 = float3(_68, _70, float(int(_79)));
    float3 _7007 = select(_7005, float3(0.0), isnan(_7005));
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7007.xy, uint(rint(_7007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7007.xy, uint(rint(_7007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float3 _7027 = float3(_68, _70, float(int(_79)));
    float3 _7029 = select(_7027, float3(0.0), isnan(_7027));
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7029.xy, uint(rint(_7029.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7029.xy, uint(rint(_7029.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float3 _7049 = float3(_68, _70, float(int(_79)));
    float3 _7051 = select(_7049, float3(0.0), isnan(_7049));
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7051.xy, uint(rint(_7051.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7051.xy, uint(rint(_7051.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float3 _7071 = float3(_68, _70, float(int(_79)));
    float3 _7073 = select(_7071, float3(0.0), isnan(_7071));
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7073.xy, uint(rint(_7073.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7073.xy, uint(rint(_7073.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float3 _7093 = float3(_68, _70, float(int(_79)));
    float3 _7095 = select(_7093, float3(0.0), isnan(_7093));
    float4 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7095.xy, uint(rint(_7095.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7095.xy, uint(rint(_7095.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyzw;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _162.z;
    float _170 = _162.w;
    float3 _7115 = float3(_68, _70, float(int(_79)));
    float3 _7117 = select(_7115, float3(0.0), isnan(_7115));
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7117.xy, uint(rint(_7117.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7117.xy, uint(rint(_7117.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float3 _7137 = float3(_68, _70, float(int(_79)));
    float3 _7139 = select(_7137, float3(0.0), isnan(_7137));
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7139.xy, uint(rint(_7139.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7139.xy, uint(rint(_7139.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float3 _7159 = float3(_68, _70, float(int(_79)));
    float3 _7161 = select(_7159, float3(0.0), isnan(_7159));
    float4 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7161.xy, uint(rint(_7161.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7161.xy, uint(rint(_7161.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyzw;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _192.w;
    float3 _7181 = float3(_68, _70, float(int(_79)));
    float3 _7183 = select(_7181, float3(0.0), isnan(_7181));
    float4 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7183.xy, uint(rint(_7183.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7183.xy, uint(rint(_7183.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyzw;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float _210 = _202.w;
    float3 _7203 = float3(_68, _70, float(int(_79)));
    float3 _7205 = select(_7203, float3(0.0), isnan(_7203));
    float4 _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7205.xy, uint(rint(_7205.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7205.xy, uint(rint(_7205.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyzw;
    float _214 = _212.x;
    float _216 = _212.y;
    float _218 = _212.z;
    float _220 = _212.w;
    float3 _7225 = float3(_68, _70, float(int(_79)));
    float3 _7227 = select(_7225, float3(0.0), isnan(_7225));
    float4 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7227.xy, uint(rint(_7227.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7227.xy, uint(rint(_7227.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyzw;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = _222.z;
    float _230 = _222.w;
    float3 _7247 = float3(_68, _70, float(int(_79)));
    float3 _7249 = select(_7247, float3(0.0), isnan(_7247));
    float4 _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7249.xy, uint(rint(_7249.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7249.xy, uint(rint(_7249.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyzw;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = _232.z;
    float _240 = _232.w;
    float _242 = _94 + _84;
    float _244 = _96 + _86;
    float _246 = _98 + _88;
    float _248 = _104 + _242;
    float _250 = _106 + _244;
    float _252 = _108 + _246;
    float _254 = _114 + _248;
    float _256 = _116 + _250;
    float _258 = _118 + _252;
    float _260 = _124 + _254;
    float _262 = _126 + _256;
    float _264 = _128 + _258;
    float _266 = _134 + _260;
    float _268 = _136 + _262;
    float _270 = _138 + _264;
    float _272 = _144 + _266;
    float _274 = _146 + _268;
    float _276 = _148 + _270;
    float _278 = _154 + _272;
    float _280 = _156 + _274;
    float _282 = _158 + _276;
    float _284 = _164 + _278;
    float _286 = _166 + _280;
    float _288 = _168 + _282;
    float _290 = _174 + _284;
    float _292 = _176 + _286;
    float _294 = _178 + _288;
    float _296 = _184 + _290;
    float _298 = _186 + _292;
    float _300 = _188 + _294;
    float _302 = _194 + _296;
    float _304 = _196 + _298;
    float _306 = _198 + _300;
    float _308 = _204 + _302;
    float _310 = _206 + _304;
    float _312 = _208 + _306;
    float _314 = _214 + _308;
    float _316 = _216 + _310;
    float _318 = _218 + _312;
    float _320 = _224 + _314;
    float _322 = _226 + _316;
    float _324 = _228 + _318;
    float _326 = _236 + _322;
    float _328 = _234 + _320;
    float _330 = _238 + _324;
    float _332 = fma(_326, -0.0625, _86);
    float _334 = fma(_328, -0.0625, _84);
    float _336 = fma(_330, -0.0625, _88);
    float _338 = fma(_326, -0.0625, _96);
    float _340 = _332 * _332;
    float _342 = _334 * _332;
    float _344 = _332 * _336;
    float _346 = fma(_328, -0.0625, _94);
    float _348 = fma(_330, -0.0625, _98);
    float _350 = _334 * _334;
    float _352 = _334 * _336;
    float _354 = fma(_338, _338, _340);
    float _356 = fma(_346, _338, _342);
    float _358 = fma(_338, _348, _344);
    float _360 = fma(_346, _346, _350);
    float _362 = fma(_346, _348, _352);
    float _364 = _336 * _336;
    float _366 = fma(_326, -0.0625, _106);
    float _368 = fma(_328, -0.0625, _104);
    float _370 = fma(_330, -0.0625, _108);
    float _372 = fma(_348, _348, _364);
    float _374 = fma(_366, _366, _354);
    float _376 = fma(_368, _366, _356);
    float _378 = fma(_366, _370, _358);
    float _380 = fma(_368, _368, _360);
    float _382 = fma(_368, _370, _362);
    float _384 = fma(_326, -0.0625, _116);
    float _386 = fma(_328, -0.0625, _114);
    float _388 = fma(_330, -0.0625, _118);
    float _390 = fma(_370, _370, _372);
    float _392 = fma(_384, _384, _374);
    float _394 = fma(_386, _384, _376);
    float _396 = fma(_384, _388, _378);
    float _398 = fma(_386, _386, _380);
    float _400 = fma(_386, _388, _382);
    float _402 = fma(_326, -0.0625, _126);
    float _404 = fma(_328, -0.0625, _124);
    float _406 = fma(_330, -0.0625, _128);
    float _408 = fma(_388, _388, _390);
    float _410 = fma(_402, _402, _392);
    float _412 = fma(_404, _402, _394);
    float _414 = fma(_402, _406, _396);
    float _416 = fma(_404, _404, _398);
    float _418 = fma(_404, _406, _400);
    float _420 = fma(_326, -0.0625, _136);
    float _422 = fma(_328, -0.0625, _134);
    float _424 = fma(_330, -0.0625, _138);
    float _426 = fma(_406, _406, _408);
    float _428 = fma(_420, _420, _410);
    float _430 = fma(_422, _420, _412);
    float _432 = fma(_420, _424, _414);
    float _434 = fma(_422, _422, _416);
    float _436 = fma(_422, _424, _418);
    float _438 = fma(_326, -0.0625, _146);
    float _440 = fma(_328, -0.0625, _144);
    float _442 = fma(_330, -0.0625, _148);
    float _444 = fma(_424, _424, _426);
    float _446 = fma(_438, _438, _428);
    float _448 = fma(_440, _438, _430);
    float _450 = fma(_438, _442, _432);
    float _452 = fma(_440, _440, _434);
    float _454 = fma(_440, _442, _436);
    float _456 = fma(_326, -0.0625, _156);
    float _458 = fma(_328, -0.0625, _154);
    float _460 = fma(_330, -0.0625, _158);
    float _462 = fma(_442, _442, _444);
    float _464 = fma(_456, _456, _446);
    float _466 = fma(_458, _456, _448);
    float _468 = fma(_456, _460, _450);
    float _470 = fma(_458, _458, _452);
    float _472 = fma(_458, _460, _454);
    float _474 = fma(_326, -0.0625, _166);
    float _476 = fma(_328, -0.0625, _164);
    float _478 = fma(_330, -0.0625, _168);
    float _480 = fma(_460, _460, _462);
    float _482 = fma(_474, _474, _464);
    float _484 = fma(_476, _474, _466);
    float _486 = fma(_474, _478, _468);
    float _488 = fma(_476, _476, _470);
    float _490 = fma(_476, _478, _472);
    float _492 = fma(_326, -0.0625, _176);
    float _494 = fma(_328, -0.0625, _174);
    float _496 = fma(_330, -0.0625, _178);
    float _498 = fma(_478, _478, _480);
    float _500 = fma(_492, _492, _482);
    float _502 = fma(_494, _492, _484);
    float _504 = fma(_492, _496, _486);
    float _506 = fma(_494, _494, _488);
    float _508 = fma(_494, _496, _490);
    float _510 = fma(_326, -0.0625, _186);
    float _512 = fma(_328, -0.0625, _184);
    float _514 = fma(_330, -0.0625, _188);
    float _516 = fma(_496, _496, _498);
    float _518 = fma(_510, _510, _500);
    float _520 = fma(_512, _510, _502);
    float _522 = fma(_510, _514, _504);
    float _524 = fma(_512, _512, _506);
    float _526 = fma(_512, _514, _508);
    float _528 = fma(_326, -0.0625, _196);
    float _530 = fma(_328, -0.0625, _194);
    float _532 = fma(_330, -0.0625, _198);
    float _534 = fma(_514, _514, _516);
    float _536 = fma(_528, _528, _518);
    float _538 = fma(_530, _528, _520);
    float _540 = fma(_528, _532, _522);
    float _542 = fma(_530, _530, _524);
    float _544 = fma(_530, _532, _526);
    float _546 = fma(_326, -0.0625, _206);
    float _548 = fma(_328, -0.0625, _204);
    float _550 = fma(_330, -0.0625, _208);
    float _552 = fma(_532, _532, _534);
    float _554 = fma(_546, _546, _536);
    float _556 = fma(_548, _546, _538);
    float _558 = fma(_546, _550, _540);
    float _560 = fma(_548, _548, _542);
    float _562 = fma(_548, _550, _544);
    float _564 = fma(_326, -0.0625, _216);
    float _566 = fma(_328, -0.0625, _214);
    float _568 = fma(_330, -0.0625, _218);
    float _570 = fma(_550, _550, _552);
    float _572 = fma(_564, _564, _554);
    float _574 = fma(_566, _564, _556);
    float _576 = fma(_564, _568, _558);
    float _578 = fma(_566, _566, _560);
    float _580 = fma(_566, _568, _562);
    float _582 = fma(_326, -0.0625, _226);
    float _584 = fma(_328, -0.0625, _224);
    float _586 = fma(_330, -0.0625, _228);
    float _588 = fma(_328, -0.0625, _234);
    float _590 = fma(_582, _582, _572);
    float _592 = fma(_584, _582, _574);
    float _594 = fma(_582, _586, _576);
    float _596 = fma(_326, -0.0625, _236);
    float _598 = fma(_568, _568, _570);
    float _600 = fma(_330, -0.0625, _238);
    float _602 = fma(_584, _584, _578);
    float _604 = fma(_596, _596, _590);
    float _606 = fma(_588, _596, _592);
    float _608 = fma(_584, _586, _580);
    float _610 = fma(_596, _600, _594);
    float _612 = fma(_588, _588, _602);
    float _614 = _604 + _606;
    float _616 = fma(_586, _586, _598);
    float _618 = fma(_588, _600, _608);
    float _620 = _612 + _606;
    float _622 = _610 + _614;
    float _624 = fma(_600, _600, _616);
    float _626 = _610 + _618;
    float _628 = _618 + _620;
    float _630 = _622 * _622;
    float _632 = _624 + _626;
    float _634 = fma(_628, _628, _630);
    float _636 = fma(_632, _632, _634);
    float _638 = rsqrt(_636);
    float _640 = _622 * _638;
    float _642 = _628 * _638;
    float _644 = _632 * _638;
    float _646 = _604 * _640;
    float _648 = _606 * _640;
    float _650 = fma(_606, _642, _646);
    float _652 = _610 * _640;
    float _654 = fma(_612, _642, _648);
    float _656 = fma(_610, _644, _650);
    float _658 = fma(_618, _642, _652);
    float _660 = fma(_618, _644, _654);
    float _662 = _656 * _656;
    float _664 = fma(_624, _644, _658);
    float _666 = fma(_660, _660, _662);
    float _668 = fma(_664, _664, _666);
    float _670 = rsqrt(_668);
    float _672 = _656 * _670;
    float _674 = _660 * _670;
    float _676 = _664 * _670;
    float _678 = _604 * _672;
    float _680 = _606 * _672;
    float _682 = _610 * _672;
    float _684 = fma(_606, _674, _678);
    float _686 = fma(_612, _674, _680);
    float _688 = fma(_618, _674, _682);
    float _690 = fma(_610, _676, _684);
    float _692 = fma(_618, _676, _686);
    float _694 = fma(_624, _676, _688);
    float _696 = _690 * _690;
    float _698 = fma(_692, _692, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _690 * _702;
    float _706 = _692 * _702;
    float _708 = _694 * _702;
    float _710 = _604 * _704;
    float _712 = _606 * _704;
    float _714 = _610 * _704;
    float _716 = fma(_606, _706, _710);
    float _718 = fma(_612, _706, _712);
    float _720 = fma(_618, _706, _714);
    float _722 = fma(_610, _708, _716);
    float _724 = fma(_618, _708, _718);
    float _726 = fma(_624, _708, _720);
    float _728 = _722 * _722;
    float _730 = fma(_724, _724, _728);
    float _732 = fma(_726, _726, _730);
    float _734 = rsqrt(_732);
    float _736 = _722 * _734;
    float _738 = _724 * _734;
    float _740 = _726 * _734;
    float _742 = _604 * _736;
    float _744 = _606 * _736;
    float _746 = _610 * _736;
    float _748 = fma(_606, _738, _742);
    float _750 = fma(_612, _738, _744);
    float _752 = fma(_618, _738, _746);
    float _754 = fma(_610, _740, _748);
    float _756 = fma(_618, _740, _750);
    float _758 = fma(_624, _740, _752);
    float _760 = _754 * _754;
    float _762 = fma(_756, _756, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = _754 * _766;
    float _770 = _756 * _766;
    float _772 = _758 * _766;
    float _774 = _604 * _768;
    float _776 = _606 * _768;
    float _778 = _610 * _768;
    float _780 = fma(_606, _770, _774);
    float _782 = fma(_612, _770, _776);
    float _784 = fma(_618, _770, _778);
    float _786 = fma(_610, _772, _780);
    float _788 = fma(_618, _772, _782);
    float _790 = fma(_624, _772, _784);
    float _792 = _786 * _786;
    float _794 = fma(_788, _788, _792);
    float _796 = fma(_790, _790, _794);
    float _798 = rsqrt(_796);
    float _800 = _786 * _798;
    float _802 = _788 * _798;
    float _804 = _790 * _798;
    float _806 = _604 * _800;
    float _808 = _606 * _800;
    float _810 = _610 * _800;
    float _812 = fma(_606, _802, _806);
    float _814 = fma(_612, _802, _808);
    float _816 = fma(_618, _802, _810);
    float _818 = fma(_610, _804, _812);
    float _820 = fma(_618, _804, _814);
    float _822 = fma(_624, _804, _816);
    float _824 = _818 * _818;
    float _826 = fma(_820, _820, _824);
    float _828 = fma(_822, _822, _826);
    float _830 = rsqrt(_828);
    float _832 = _818 * _830;
    float _834 = _820 * _830;
    float _836 = _822 * _830;
    float _838 = _604 * _832;
    float _840 = _606 * _832;
    float _842 = fma(_606, _834, _838);
    float _844 = _610 * _832;
    float _846 = fma(_612, _834, _840);
    float _848 = fma(_610, _836, _842);
    float _850 = fma(_618, _834, _844);
    float _852 = fma(_618, _836, _846);
    float _854 = _848 * _848;
    float _856 = fma(_624, _836, _850);
    float _858 = fma(_852, _852, _854);
    float _860 = fma(_856, _856, _858);
    float _862 = rsqrt(_860);
    float _864 = _848 * _862;
    float _866 = _852 * _862;
    float _868 = _856 * _862;
    float _870 = _96 * _864;
    float _872 = _86 * _864;
    float _874 = _106 * _864;
    float _876 = fma(_94, _866, _870);
    float _878 = fma(_84, _866, _872);
    float _880 = fma(_104, _866, _874);
    float _882 = fma(_98, _868, _876);
    float _884 = fma(_88, _868, _878);
    float _886 = fma(_108, _868, _880);
    bool _890 = _882 >= _884;
    bool _892 = isnan(_882);
    bool _894 = _890 || _892;
    bool _896 = isnan(_884);
    bool _898 = _894 || _896;
    float _900 = _70;
    float _902 = _880;
    float _904 = _612;
    float _906 = _876;
    float _908 = _862;
    float _910 = _834;
    float _912 = _822;
    float _914 = _832;
    float _916 = _882;
    float _918 = _806;
    float _920 = _886;
    float _922 = _886;
    float _924 = _864;
    float _926 = _866;
    float _928 = 7.1466221680565670617110208747786e-44;
    float _930 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _932 = 7.0064923216240853546186479164496e-44;
    spvUnsafeArray<uint, 4> _24;
    if (!_898)
    {
        _900 = _84;
    }
    float _934 = _900;
    float _936 = _934;
    float _938 = _934;
    if (!_898)
    {
        _902 = _86;
    }
    float _940 = _902;
    float _942 = _940;
    float _944 = _940;
    if (!_898)
    {
        _904 = _88;
    }
    float _946 = _904;
    float _948 = _946;
    float _950 = _946;
    if (!_898)
    {
        _906 = _882;
    }
    float _952 = _906;
    float _954 = _952;
    float _956 = _952;
    if (!_898)
    {
        _908 = _884;
    }
    float _958 = _908;
    float _960 = _958;
    float _962 = _958;
    if (!_898)
    {
        _910 = _94;
    }
    float _964 = _910;
    float _966 = _964;
    float _968 = _964;
    if (!_898)
    {
        _912 = _96;
    }
    float _970 = _912;
    float _972 = _970;
    float _974 = _970;
    if (!_898)
    {
        _914 = _98;
    }
    float _976 = _914;
    bool _978 = !_898;
    float _980 = _976;
    float _982 = _976;
    if (!_978)
    {
        bool _984 = _882 > _884;
        if (!_984)
        {
            _954 = _882;
        }
        float _986 = _954;
        float _988 = _986;
        if (!_984)
        {
            _960 = _882;
        }
        float _990 = _960;
        float _992 = _990;
        if (!_984)
        {
            _966 = _94;
        }
        float _994 = _966;
        float _996 = _994;
        if (!_984)
        {
            _972 = _96;
        }
        float _998 = _972;
        float _1000 = _998;
        if (!_984)
        {
            _980 = _98;
        }
        float _1002 = _980;
        float _1004 = _1002;
        if (!_984)
        {
            _936 = _94;
        }
        float _1006 = _936;
        float _1008 = _1006;
        if (!_984)
        {
            _942 = _96;
        }
        float _1010 = _942;
        float _1012 = _1010;
        if (!_984)
        {
            _948 = _98;
        }
        float _1014 = _948;
        _950 = _1014;
        if (_984)
        {
            _988 = _884;
        }
        float _1016 = _988;
        _956 = _1016;
        if (_984)
        {
            _992 = _882;
        }
        float _1018 = _992;
        _962 = _1018;
        if (_984)
        {
            _996 = _84;
        }
        float _1020 = _996;
        _968 = _1020;
        if (_984)
        {
            _1000 = _86;
        }
        float _1022 = _1000;
        _974 = _1022;
        if (_984)
        {
            _1004 = _88;
        }
        float _1024 = _1004;
        _982 = _1024;
        if (_984)
        {
            _1008 = _94;
        }
        float _1026 = _1008;
        _938 = _1026;
        if (_984)
        {
            _1012 = _96;
        }
        float _1028 = _1012;
        _944 = _1028;
        if (_984)
        {
            _950 = _98;
        }
    }
    float _1030 = _962;
    float _1032 = _956;
    float _1034 = _938;
    float _1036 = _944;
    float _1038 = _950;
    float _1040 = _968;
    float _1042 = _974;
    float _1044 = _982;
    bool _1046 = _1030 >= _886;
    bool _1048 = isnan(_1030);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(_886);
    bool _1054 = _1050 || _1052;
    float _1056 = _116 * _864;
    float _1058 = fma(_114, _866, _1056);
    float _1060 = fma(_118, _868, _1058);
    float _1062 = _1058;
    float _1064 = _1032;
    float _1066 = _1040;
    float _1068 = _1042;
    float _1070 = _1032;
    float _1072 = _1040;
    float _1074 = _1042;
    float _1076 = _1044;
    float _1078 = _1030;
    float _1080 = _1038;
    float _1082 = _1060;
    float _1084 = _1060;
    if (!_1054)
    {
        _916 = _104;
    }
    float _1086 = _916;
    float _1088 = _1086;
    float _1090 = _1086;
    if (!_1054)
    {
        _1062 = _106;
    }
    float _1092 = _1062;
    float _1094 = _1092;
    float _1096 = _1092;
    if (!_1054)
    {
        _918 = _108;
    }
    float _1098 = _918;
    bool _1100 = !_1054;
    float _1102 = _1098;
    float _1104 = _1098;
    if (!_1100)
    {
        bool _1106 = _1032 > _886;
        if (_1106)
        {
            _1064 = _886;
        }
        float _1108 = _1064;
        _1070 = _1108;
        if (!_1106)
        {
            _1088 = _1034;
        }
        float _1110 = _1088;
        float _1112 = _1110;
        if (!_1106)
        {
            _1094 = _1036;
        }
        float _1114 = _1094;
        float _1116 = _1114;
        if (!_1106)
        {
            _1102 = _1038;
        }
        float _1118 = _1102;
        float _1120 = _1118;
        if (!_1106)
        {
            _920 = _1030;
        }
        float _1122 = _920;
        float _1124 = _1122;
        if (_1106)
        {
            _1112 = _1034;
        }
        float _1126 = _1112;
        _1090 = _1126;
        if (_1106)
        {
            _1116 = _1036;
        }
        float _1128 = _1116;
        _1096 = _1128;
        if (_1106)
        {
            _1120 = _1038;
        }
        float _1130 = _1120;
        _1104 = _1130;
        if (_1106)
        {
            _1124 = _1030;
        }
        float _1132 = _1124;
        _922 = _1132;
        if (_1106)
        {
            _1066 = _104;
        }
        float _1134 = _1066;
        _1072 = _1134;
        if (_1106)
        {
            _1068 = _106;
        }
        float _1136 = _1068;
        _1074 = _1136;
        if (_1106)
        {
            _1076 = _108;
        }
    }
    float _1138 = _922;
    float _1140 = _1070;
    float _1142 = _1090;
    float _1144 = _1096;
    float _1146 = _1104;
    float _1148 = _1072;
    float _1150 = _1074;
    float _1152 = _1076;
    bool _1154 = _1138 >= _1060;
    bool _1156 = isnan(_1138);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(_1060);
    bool _1162 = _1158 || _1160;
    float _1164 = _126 * _864;
    float _1166 = fma(_124, _866, _1164);
    float _1168 = fma(_128, _868, _1166);
    float _1170 = _1166;
    float _1172 = _1140;
    float _1174 = _1148;
    float _1176 = _1150;
    float _1178 = _1140;
    float _1180 = _1148;
    float _1182 = _1150;
    float _1184 = _1152;
    float _1186 = _1142;
    float _1188 = _1146;
    float _1190 = _1168;
    float _1192 = _1168;
    if (!_1162)
    {
        _1078 = _114;
    }
    float _1194 = _1078;
    float _1196 = _1194;
    float _1198 = _1194;
    if (!_1162)
    {
        _1080 = _116;
    }
    float _1200 = _1080;
    float _1202 = _1200;
    float _1204 = _1200;
    if (!_1162)
    {
        _1170 = _118;
    }
    float _1206 = _1170;
    bool _1208 = !_1162;
    float _1210 = _1206;
    float _1212 = _1206;
    if (!_1208)
    {
        bool _1214 = _1140 > _1060;
        if (_1214)
        {
            _1172 = _1060;
        }
        float _1216 = _1172;
        _1178 = _1216;
        if (!_1214)
        {
            _1196 = _1142;
        }
        float _1218 = _1196;
        float _1220 = _1218;
        if (!_1214)
        {
            _1202 = _1144;
        }
        float _1222 = _1202;
        float _1224 = _1222;
        if (!_1214)
        {
            _1210 = _1146;
        }
        float _1226 = _1210;
        float _1228 = _1226;
        if (!_1214)
        {
            _1082 = _1138;
        }
        float _1230 = _1082;
        float _1232 = _1230;
        if (_1214)
        {
            _1220 = _1142;
        }
        float _1234 = _1220;
        _1198 = _1234;
        if (_1214)
        {
            _1224 = _1144;
        }
        float _1236 = _1224;
        _1204 = _1236;
        if (_1214)
        {
            _1228 = _1146;
        }
        float _1238 = _1228;
        _1212 = _1238;
        if (_1214)
        {
            _1232 = _1138;
        }
        float _1240 = _1232;
        _1084 = _1240;
        if (_1214)
        {
            _1174 = _114;
        }
        float _1242 = _1174;
        _1180 = _1242;
        if (_1214)
        {
            _1176 = _116;
        }
        float _1244 = _1176;
        _1182 = _1244;
        if (_1214)
        {
            _1184 = _118;
        }
    }
    float _1246 = _1084;
    float _1248 = _1178;
    float _1250 = _1198;
    float _1252 = _1204;
    float _1254 = _1212;
    float _1256 = _1180;
    float _1258 = _1182;
    float _1260 = _1184;
    bool _1262 = _1246 >= _1168;
    bool _1264 = isnan(_1246);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(_1168);
    bool _1270 = _1266 || _1268;
    float _1272 = _136 * _864;
    float _1274 = fma(_134, _866, _1272);
    float _1276 = fma(_138, _868, _1274);
    float _1278 = _1274;
    float _1280 = _1248;
    float _1282 = _1256;
    float _1284 = _1258;
    float _1286 = _1248;
    float _1288 = _1256;
    float _1290 = _1258;
    float _1292 = _1260;
    float _1294 = _1250;
    float _1296 = _1252;
    float _1298 = _1276;
    float _1300 = _1276;
    float _1302 = _1246;
    if (!_1270)
    {
        _1186 = _124;
    }
    float _1304 = _1186;
    float _1306 = _1304;
    float _1308 = _1304;
    if (!_1270)
    {
        _1278 = _126;
    }
    float _1310 = _1278;
    float _1312 = _1310;
    float _1314 = _1310;
    if (!_1270)
    {
        _1188 = _128;
    }
    float _1316 = _1188;
    bool _1318 = !_1270;
    float _1320 = _1316;
    float _1322 = _1316;
    if (!_1318)
    {
        bool _1324 = _1248 > _1168;
        if (_1324)
        {
            _1280 = _1168;
        }
        float _1326 = _1280;
        _1286 = _1326;
        if (!_1324)
        {
            _1306 = _1250;
        }
        float _1328 = _1306;
        float _1330 = _1328;
        if (!_1324)
        {
            _1312 = _1252;
        }
        float _1332 = _1312;
        float _1334 = _1332;
        if (!_1324)
        {
            _1320 = _1254;
        }
        float _1336 = _1320;
        float _1338 = _1336;
        if (!_1324)
        {
            _1190 = _1246;
        }
        float _1340 = _1190;
        float _1342 = _1340;
        if (_1324)
        {
            _1330 = _1250;
        }
        float _1344 = _1330;
        _1308 = _1344;
        if (_1324)
        {
            _1334 = _1252;
        }
        float _1346 = _1334;
        _1314 = _1346;
        if (_1324)
        {
            _1338 = _1254;
        }
        float _1348 = _1338;
        _1322 = _1348;
        if (_1324)
        {
            _1342 = _1246;
        }
        float _1350 = _1342;
        _1192 = _1350;
        if (_1324)
        {
            _1282 = _124;
        }
        float _1352 = _1282;
        _1288 = _1352;
        if (_1324)
        {
            _1284 = _126;
        }
        float _1354 = _1284;
        _1290 = _1354;
        if (_1324)
        {
            _1292 = _128;
        }
    }
    float _1356 = _1192;
    float _1358 = _1286;
    float _1360 = _1308;
    float _1362 = _1314;
    float _1364 = _1322;
    float _1366 = _1288;
    float _1368 = _1290;
    float _1370 = _1292;
    bool _1372 = _1356 >= _1276;
    bool _1374 = isnan(_1356);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(_1276);
    bool _1380 = _1376 || _1378;
    float _1382 = _146 * _864;
    float _1384 = fma(_144, _866, _1382);
    float _1386 = fma(_148, _868, _1384);
    float _1388 = _1384;
    float _1390 = _1358;
    float _1392 = _1366;
    float _1394 = _1368;
    float _1396 = _1358;
    float _1398 = _1366;
    float _1400 = _1368;
    float _1402 = _1370;
    float _1404 = _1364;
    float _1406 = _1356;
    float _1408 = _1386;
    float _1410 = _1386;
    if (!_1380)
    {
        _1294 = _134;
    }
    float _1412 = _1294;
    float _1414 = _1412;
    float _1416 = _1412;
    if (!_1380)
    {
        _1296 = _136;
    }
    float _1418 = _1296;
    float _1420 = _1418;
    float _1422 = _1418;
    if (!_1380)
    {
        _1388 = _138;
    }
    float _1424 = _1388;
    bool _1426 = !_1380;
    float _1428 = _1424;
    float _1430 = _1424;
    if (!_1426)
    {
        bool _1432 = _1358 > _1276;
        if (_1432)
        {
            _1390 = _1276;
        }
        float _1434 = _1390;
        _1396 = _1434;
        if (!_1432)
        {
            _1414 = _1360;
        }
        float _1436 = _1414;
        float _1438 = _1436;
        if (!_1432)
        {
            _1420 = _1362;
        }
        float _1440 = _1420;
        float _1442 = _1440;
        if (!_1432)
        {
            _1428 = _1364;
        }
        float _1444 = _1428;
        float _1446 = _1444;
        if (!_1432)
        {
            _1298 = _1356;
        }
        float _1448 = _1298;
        float _1450 = _1448;
        if (_1432)
        {
            _1438 = _1360;
        }
        float _1452 = _1438;
        _1416 = _1452;
        if (_1432)
        {
            _1442 = _1362;
        }
        float _1454 = _1442;
        _1422 = _1454;
        if (_1432)
        {
            _1446 = _1364;
        }
        float _1456 = _1446;
        _1430 = _1456;
        if (_1432)
        {
            _1450 = _1356;
        }
        float _1458 = _1450;
        _1300 = _1458;
        if (_1432)
        {
            _1392 = _134;
        }
        float _1460 = _1392;
        _1398 = _1460;
        if (_1432)
        {
            _1394 = _136;
        }
        float _1462 = _1394;
        _1400 = _1462;
        if (_1432)
        {
            _1402 = _138;
        }
    }
    float _1464 = _1300;
    float _1466 = _1396;
    float _1468 = _1416;
    float _1470 = _1422;
    float _1472 = _1430;
    float _1474 = _1398;
    float _1476 = _1400;
    float _1478 = _1402;
    bool _1480 = _1464 >= _1386;
    bool _1482 = isnan(_1464);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(_1386);
    bool _1488 = _1484 || _1486;
    float _1490 = _156 * _864;
    float _1492 = fma(_154, _866, _1490);
    float _1494 = fma(_158, _868, _1492);
    float _1496 = _1466;
    float _1498 = _1474;
    float _1500 = _1476;
    float _1502 = _1466;
    float _1504 = _1474;
    float _1506 = _1476;
    float _1508 = _1478;
    float _1510 = _1468;
    float _1512 = _1470;
    float _1514 = _1494;
    float _1516 = _1494;
    if (!_1488)
    {
        _1404 = _144;
    }
    float _1518 = _1404;
    float _1520 = _1518;
    float _1522 = _1518;
    if (!_1488)
    {
        _1302 = _146;
    }
    float _1524 = _1302;
    float _1526 = _1524;
    float _1528 = _1524;
    if (!_1488)
    {
        _1406 = _148;
    }
    float _1530 = _1406;
    bool _1532 = !_1488;
    float _1534 = _1530;
    float _1536 = _1530;
    if (!_1532)
    {
        bool _1538 = _1466 > _1386;
        if (_1538)
        {
            _1496 = _1386;
        }
        float _1540 = _1496;
        _1502 = _1540;
        if (!_1538)
        {
            _1520 = _1468;
        }
        float _1542 = _1520;
        float _1544 = _1542;
        if (!_1538)
        {
            _1526 = _1470;
        }
        float _1546 = _1526;
        float _1548 = _1546;
        if (!_1538)
        {
            _1534 = _1472;
        }
        float _1550 = _1534;
        float _1552 = _1550;
        if (!_1538)
        {
            _1408 = _1464;
        }
        float _1554 = _1408;
        float _1556 = _1554;
        if (_1538)
        {
            _1544 = _1468;
        }
        float _1558 = _1544;
        _1522 = _1558;
        if (_1538)
        {
            _1548 = _1470;
        }
        float _1560 = _1548;
        _1528 = _1560;
        if (_1538)
        {
            _1552 = _1472;
        }
        float _1562 = _1552;
        _1536 = _1562;
        if (_1538)
        {
            _1556 = _1464;
        }
        float _1564 = _1556;
        _1410 = _1564;
        if (_1538)
        {
            _1498 = _144;
        }
        float _1566 = _1498;
        _1504 = _1566;
        if (_1538)
        {
            _1500 = _146;
        }
        float _1568 = _1500;
        _1506 = _1568;
        if (_1538)
        {
            _1508 = _148;
        }
    }
    float _1570 = _1410;
    float _1572 = _1502;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1536;
    float _1580 = _1504;
    float _1582 = _1506;
    float _1584 = _1508;
    bool _1586 = _1570 >= _1494;
    bool _1588 = isnan(_1570);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan(_1494);
    bool _1594 = _1590 || _1592;
    float _1596 = _166 * _864;
    float _1598 = fma(_164, _866, _1596);
    float _1600 = fma(_168, _868, _1598);
    float _1602 = _1598;
    float _1604 = _1572;
    float _1606 = _1580;
    float _1608 = _1582;
    float _1610 = _1572;
    float _1612 = _1580;
    float _1614 = _1582;
    float _1616 = _1584;
    float _1618 = _1578;
    float _1620 = _1574;
    float _1622 = _1600;
    float _1624 = _1600;
    if (!_1594)
    {
        _1510 = _154;
    }
    float _1626 = _1510;
    float _1628 = _1626;
    float _1630 = _1626;
    if (!_1594)
    {
        _1512 = _156;
    }
    float _1632 = _1512;
    float _1634 = _1632;
    float _1636 = _1632;
    if (!_1594)
    {
        _1602 = _158;
    }
    float _1638 = _1602;
    bool _1640 = !_1594;
    float _1642 = _1638;
    float _1644 = _1638;
    if (!_1640)
    {
        bool _1646 = _1572 > _1494;
        if (_1646)
        {
            _1604 = _1494;
        }
        float _1648 = _1604;
        _1610 = _1648;
        if (!_1646)
        {
            _1628 = _1574;
        }
        float _1650 = _1628;
        float _1652 = _1650;
        if (!_1646)
        {
            _1634 = _1576;
        }
        float _1654 = _1634;
        float _1656 = _1654;
        if (!_1646)
        {
            _1642 = _1578;
        }
        float _1658 = _1642;
        float _1660 = _1658;
        if (!_1646)
        {
            _1514 = _1570;
        }
        float _1662 = _1514;
        float _1664 = _1662;
        if (_1646)
        {
            _1652 = _1574;
        }
        float _1666 = _1652;
        _1630 = _1666;
        if (_1646)
        {
            _1656 = _1576;
        }
        float _1668 = _1656;
        _1636 = _1668;
        if (_1646)
        {
            _1660 = _1578;
        }
        float _1670 = _1660;
        _1644 = _1670;
        if (_1646)
        {
            _1664 = _1570;
        }
        float _1672 = _1664;
        _1516 = _1672;
        if (_1646)
        {
            _1606 = _154;
        }
        float _1674 = _1606;
        _1612 = _1674;
        if (_1646)
        {
            _1608 = _156;
        }
        float _1676 = _1608;
        _1614 = _1676;
        if (_1646)
        {
            _1616 = _158;
        }
    }
    float _1678 = _1516;
    float _1680 = _1610;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1644;
    float _1688 = _1612;
    float _1690 = _1614;
    float _1692 = _1616;
    bool _1694 = _1678 >= _1600;
    bool _1696 = isnan(_1678);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(_1600);
    bool _1702 = _1698 || _1700;
    float _1704 = _176 * _864;
    float _1706 = fma(_174, _866, _1704);
    float _1708 = fma(_178, _868, _1706);
    float _1710 = _1706;
    float _1712 = _1680;
    float _1714 = _1688;
    float _1716 = _1690;
    float _1718 = _1680;
    float _1720 = _1688;
    float _1722 = _1690;
    float _1724 = _1692;
    float _1726 = _1684;
    float _1728 = _1682;
    float _1730 = _1708;
    float _1732 = _1708;
    if (!_1702)
    {
        _1618 = _164;
    }
    float _1734 = _1618;
    float _1736 = _1734;
    float _1738 = _1734;
    if (!_1702)
    {
        _1710 = _166;
    }
    float _1740 = _1710;
    float _1742 = _1740;
    float _1744 = _1740;
    if (!_1702)
    {
        _1620 = _168;
    }
    float _1746 = _1620;
    bool _1748 = !_1702;
    float _1750 = _1746;
    float _1752 = _1746;
    if (!_1748)
    {
        bool _1754 = _1680 > _1600;
        if (_1754)
        {
            _1712 = _1600;
        }
        float _1756 = _1712;
        _1718 = _1756;
        if (!_1754)
        {
            _1736 = _1682;
        }
        float _1758 = _1736;
        float _1760 = _1758;
        if (!_1754)
        {
            _1742 = _1684;
        }
        float _1762 = _1742;
        float _1764 = _1762;
        if (!_1754)
        {
            _1750 = _1686;
        }
        float _1766 = _1750;
        float _1768 = _1766;
        if (!_1754)
        {
            _1622 = _1678;
        }
        float _1770 = _1622;
        float _1772 = _1770;
        if (_1754)
        {
            _1760 = _1682;
        }
        float _1774 = _1760;
        _1738 = _1774;
        if (_1754)
        {
            _1764 = _1684;
        }
        float _1776 = _1764;
        _1744 = _1776;
        if (_1754)
        {
            _1768 = _1686;
        }
        float _1778 = _1768;
        _1752 = _1778;
        if (_1754)
        {
            _1772 = _1678;
        }
        float _1780 = _1772;
        _1624 = _1780;
        if (_1754)
        {
            _1714 = _164;
        }
        float _1782 = _1714;
        _1720 = _1782;
        if (_1754)
        {
            _1716 = _166;
        }
        float _1784 = _1716;
        _1722 = _1784;
        if (_1754)
        {
            _1724 = _168;
        }
    }
    float _1786 = _1624;
    float _1788 = _1718;
    float _1790 = _1738;
    float _1792 = _1744;
    float _1794 = _1752;
    float _1796 = _1720;
    float _1798 = _1722;
    float _1800 = _1724;
    bool _1802 = _1786 >= _1708;
    bool _1804 = isnan(_1786);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(_1708);
    bool _1810 = _1806 || _1808;
    float _1812 = _186 * _864;
    float _1814 = fma(_184, _866, _1812);
    float _1816 = fma(_188, _868, _1814);
    float _1818 = _1814;
    float _1820 = _1788;
    float _1822 = _1796;
    float _1824 = _1798;
    float _1826 = _1788;
    float _1828 = _1796;
    float _1830 = _1798;
    float _1832 = _1800;
    float _1834 = _1794;
    float _1836 = _1786;
    float _1838 = _1816;
    float _1840 = _1816;
    if (!_1810)
    {
        _1818 = _174;
    }
    float _1842 = _1818;
    float _1844 = _1842;
    float _1846 = _1842;
    if (!_1810)
    {
        _1726 = _176;
    }
    float _1848 = _1726;
    float _1850 = _1848;
    float _1852 = _1848;
    if (!_1810)
    {
        _1728 = _178;
    }
    float _1854 = _1728;
    bool _1856 = !_1810;
    float _1858 = _1854;
    float _1860 = _1854;
    if (!_1856)
    {
        bool _1862 = _1788 > _1708;
        if (_1862)
        {
            _1820 = _1708;
        }
        float _1864 = _1820;
        _1826 = _1864;
        if (!_1862)
        {
            _1844 = _1790;
        }
        float _1866 = _1844;
        float _1868 = _1866;
        if (!_1862)
        {
            _1850 = _1792;
        }
        float _1870 = _1850;
        float _1872 = _1870;
        if (!_1862)
        {
            _1858 = _1794;
        }
        float _1874 = _1858;
        float _1876 = _1874;
        if (!_1862)
        {
            _1730 = _1786;
        }
        float _1878 = _1730;
        float _1880 = _1878;
        if (_1862)
        {
            _1868 = _1790;
        }
        float _1882 = _1868;
        _1846 = _1882;
        if (_1862)
        {
            _1872 = _1792;
        }
        float _1884 = _1872;
        _1852 = _1884;
        if (_1862)
        {
            _1876 = _1794;
        }
        float _1886 = _1876;
        _1860 = _1886;
        if (_1862)
        {
            _1880 = _1786;
        }
        float _1888 = _1880;
        _1732 = _1888;
        if (_1862)
        {
            _1822 = _174;
        }
        float _1890 = _1822;
        _1828 = _1890;
        if (_1862)
        {
            _1824 = _176;
        }
        float _1892 = _1824;
        _1830 = _1892;
        if (_1862)
        {
            _1832 = _178;
        }
    }
    float _1894 = _1732;
    float _1896 = _1826;
    float _1898 = _1846;
    float _1900 = _1852;
    float _1902 = _1860;
    float _1904 = _1828;
    float _1906 = _1830;
    float _1908 = _1832;
    bool _1910 = _1894 >= _1816;
    bool _1912 = isnan(_1894);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(_1816);
    bool _1918 = _1914 || _1916;
    float _1920 = _196 * _864;
    float _1922 = fma(_194, _866, _1920);
    float _1924 = fma(_198, _868, _1922);
    float _1926 = _1922;
    float _1928 = _1896;
    float _1930 = _1904;
    float _1932 = _1906;
    float _1934 = _1896;
    float _1936 = _1904;
    float _1938 = _1906;
    float _1940 = _1908;
    float _1942 = _1900;
    float _1944 = _1902;
    float _1946 = _1924;
    float _1948 = _1924;
    if (!_1918)
    {
        _1834 = _184;
    }
    float _1950 = _1834;
    float _1952 = _1950;
    float _1954 = _1950;
    if (!_1918)
    {
        _1926 = _186;
    }
    float _1956 = _1926;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1918)
    {
        _1836 = _188;
    }
    float _1962 = _1836;
    bool _1964 = !_1918;
    float _1966 = _1962;
    float _1968 = _1962;
    if (!_1964)
    {
        bool _1970 = _1896 > _1816;
        if (_1970)
        {
            _1928 = _1816;
        }
        float _1972 = _1928;
        _1934 = _1972;
        if (!_1970)
        {
            _1952 = _1898;
        }
        float _1974 = _1952;
        float _1976 = _1974;
        if (!_1970)
        {
            _1958 = _1900;
        }
        float _1978 = _1958;
        float _1980 = _1978;
        if (!_1970)
        {
            _1966 = _1902;
        }
        float _1982 = _1966;
        float _1984 = _1982;
        if (!_1970)
        {
            _1838 = _1894;
        }
        float _1986 = _1838;
        float _1988 = _1986;
        if (_1970)
        {
            _1976 = _1898;
        }
        float _1990 = _1976;
        _1954 = _1990;
        if (_1970)
        {
            _1980 = _1900;
        }
        float _1992 = _1980;
        _1960 = _1992;
        if (_1970)
        {
            _1984 = _1902;
        }
        float _1994 = _1984;
        _1968 = _1994;
        if (_1970)
        {
            _1988 = _1894;
        }
        float _1996 = _1988;
        _1840 = _1996;
        if (_1970)
        {
            _1930 = _184;
        }
        float _1998 = _1930;
        _1936 = _1998;
        if (_1970)
        {
            _1932 = _186;
        }
        float _2000 = _1932;
        _1938 = _2000;
        if (_1970)
        {
            _1940 = _188;
        }
    }
    float _2002 = _1840;
    float _2004 = _1934;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1968;
    float _2012 = _1936;
    float _2014 = _1938;
    float _2016 = _1940;
    bool _2018 = _2002 >= _1924;
    bool _2020 = isnan(_2002);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(_1924);
    bool _2026 = _2022 || _2024;
    float _2028 = _206 * _864;
    float _2030 = fma(_204, _866, _2028);
    float _2032 = fma(_208, _868, _2030);
    float _2034 = _2030;
    float _2036 = _2004;
    float _2038 = _2012;
    float _2040 = _2014;
    float _2042 = _2004;
    float _2044 = _2012;
    float _2046 = _2014;
    float _2048 = _2016;
    float _2050 = _2006;
    float _2052 = _2010;
    float _2054 = _2032;
    float _2056 = _2032;
    if (!_2026)
    {
        _2034 = _194;
    }
    float _2058 = _2034;
    float _2060 = _2058;
    float _2062 = _2058;
    if (!_2026)
    {
        _1942 = _196;
    }
    float _2064 = _1942;
    float _2066 = _2064;
    float _2068 = _2064;
    if (!_2026)
    {
        _1944 = _198;
    }
    float _2070 = _1944;
    bool _2072 = !_2026;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _2004 > _1924;
        if (_2078)
        {
            _2036 = _1924;
        }
        float _2080 = _2036;
        _2042 = _2080;
        if (!_2078)
        {
            _2060 = _2006;
        }
        float _2082 = _2060;
        float _2084 = _2082;
        if (!_2078)
        {
            _2066 = _2008;
        }
        float _2086 = _2066;
        float _2088 = _2086;
        if (!_2078)
        {
            _2074 = _2010;
        }
        float _2090 = _2074;
        float _2092 = _2090;
        if (!_2078)
        {
            _1946 = _2002;
        }
        float _2094 = _1946;
        float _2096 = _2094;
        if (_2078)
        {
            _2084 = _2006;
        }
        float _2098 = _2084;
        _2062 = _2098;
        if (_2078)
        {
            _2088 = _2008;
        }
        float _2100 = _2088;
        _2068 = _2100;
        if (_2078)
        {
            _2092 = _2010;
        }
        float _2102 = _2092;
        _2076 = _2102;
        if (_2078)
        {
            _2096 = _2002;
        }
        float _2104 = _2096;
        _1948 = _2104;
        if (_2078)
        {
            _2038 = _194;
        }
        float _2106 = _2038;
        _2044 = _2106;
        if (_2078)
        {
            _2040 = _196;
        }
        float _2108 = _2040;
        _2046 = _2108;
        if (_2078)
        {
            _2048 = _198;
        }
    }
    float _2110 = _1948;
    float _2112 = _2042;
    float _2114 = _2062;
    float _2116 = _2068;
    float _2118 = _2076;
    float _2120 = _2044;
    float _2122 = _2046;
    float _2124 = _2048;
    bool _2126 = _2110 >= _2032;
    bool _2128 = isnan(_2110);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_2032);
    bool _2134 = _2130 || _2132;
    float _2136 = _216 * _864;
    float _2138 = fma(_214, _866, _2136);
    float _2140 = fma(_218, _868, _2138);
    float _2142 = _2138;
    float _2144 = _2112;
    float _2146 = _2120;
    float _2148 = _2122;
    float _2150 = _2112;
    float _2152 = _2120;
    float _2154 = _2122;
    float _2156 = _2124;
    float _2158 = _2116;
    float _2160 = _2118;
    float _2162 = _2140;
    float _2164 = _2140;
    if (!_2134)
    {
        _2050 = _204;
    }
    float _2166 = _2050;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2134)
    {
        _2142 = _206;
    }
    float _2172 = _2142;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2134)
    {
        _2052 = _208;
    }
    float _2178 = _2052;
    bool _2180 = !_2134;
    float _2182 = _2178;
    float _2184 = _2178;
    if (!_2180)
    {
        bool _2186 = _2112 > _2032;
        if (_2186)
        {
            _2144 = _2032;
        }
        float _2188 = _2144;
        _2150 = _2188;
        if (!_2186)
        {
            _2168 = _2114;
        }
        float _2190 = _2168;
        float _2192 = _2190;
        if (!_2186)
        {
            _2174 = _2116;
        }
        float _2194 = _2174;
        float _2196 = _2194;
        if (!_2186)
        {
            _2182 = _2118;
        }
        float _2198 = _2182;
        float _2200 = _2198;
        if (!_2186)
        {
            _2054 = _2110;
        }
        float _2202 = _2054;
        float _2204 = _2202;
        if (_2186)
        {
            _2192 = _2114;
        }
        float _2206 = _2192;
        _2170 = _2206;
        if (_2186)
        {
            _2196 = _2116;
        }
        float _2208 = _2196;
        _2176 = _2208;
        if (_2186)
        {
            _2200 = _2118;
        }
        float _2210 = _2200;
        _2184 = _2210;
        if (_2186)
        {
            _2204 = _2110;
        }
        float _2212 = _2204;
        _2056 = _2212;
        if (_2186)
        {
            _2146 = _204;
        }
        float _2214 = _2146;
        _2152 = _2214;
        if (_2186)
        {
            _2148 = _206;
        }
        float _2216 = _2148;
        _2154 = _2216;
        if (_2186)
        {
            _2156 = _208;
        }
    }
    float _2218 = _2056;
    float _2220 = _2150;
    float _2222 = _2170;
    float _2224 = _2176;
    float _2226 = _2184;
    float _2228 = _2152;
    float _2230 = _2154;
    float _2232 = _2156;
    bool _2234 = _2218 >= _2140;
    bool _2236 = isnan(_2218);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(_2140);
    bool _2242 = _2238 || _2240;
    float _2244 = _226 * _864;
    float _2246 = fma(_224, _866, _2244);
    float _2248 = fma(_228, _868, _2246);
    float _2250 = _2246;
    float _2252 = _2220;
    float _2254 = _2228;
    float _2256 = _2230;
    float _2258 = _2228;
    float _2260 = _2230;
    float _2262 = _2220;
    float _2264 = _2232;
    float _2266 = _2226;
    float _2268 = _2222;
    float _2270 = _2248;
    float _2272 = _2248;
    if (!_2242)
    {
        _2250 = _214;
    }
    float _2274 = _2250;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2242)
    {
        _2158 = _216;
    }
    float _2280 = _2158;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2242)
    {
        _2160 = _218;
    }
    float _2286 = _2160;
    bool _2288 = !_2242;
    float _2290 = _2286;
    float _2292 = _2286;
    if (!_2288)
    {
        bool _2294 = _2220 > _2140;
        if (_2294)
        {
            _2252 = _2140;
        }
        float _2296 = _2252;
        _2262 = _2296;
        if (!_2294)
        {
            _2276 = _2222;
        }
        float _2298 = _2276;
        float _2300 = _2298;
        if (!_2294)
        {
            _2282 = _2224;
        }
        float _2302 = _2282;
        float _2304 = _2302;
        if (!_2294)
        {
            _2290 = _2226;
        }
        float _2306 = _2290;
        float _2308 = _2306;
        if (!_2294)
        {
            _2162 = _2218;
        }
        float _2310 = _2162;
        float _2312 = _2310;
        if (_2294)
        {
            _2300 = _2222;
        }
        float _2314 = _2300;
        _2278 = _2314;
        if (_2294)
        {
            _2304 = _2224;
        }
        float _2316 = _2304;
        _2284 = _2316;
        if (_2294)
        {
            _2308 = _2226;
        }
        float _2318 = _2308;
        _2292 = _2318;
        if (_2294)
        {
            _2312 = _2218;
        }
        float _2320 = _2312;
        _2164 = _2320;
        if (_2294)
        {
            _2254 = _214;
        }
        float _2322 = _2254;
        _2258 = _2322;
        if (_2294)
        {
            _2256 = _216;
        }
        float _2324 = _2256;
        _2260 = _2324;
        if (_2294)
        {
            _2264 = _218;
        }
    }
    float _2326 = _2164;
    float _2328 = _2258;
    float _2330 = _2260;
    float _2332 = _2262;
    float _2334 = _2278;
    float _2336 = _2284;
    float _2338 = _2292;
    float _2340 = _2264;
    bool _2342 = _2326 >= _2248;
    bool _2344 = isnan(_2326);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(_2248);
    bool _2350 = _2346 || _2348;
    float _2352 = _236 * _864;
    float _2354 = fma(_234, _866, _2352);
    float _2356 = fma(_238, _868, _2354);
    float _2358 = _2354;
    float _2360 = _2332;
    float _2362 = _2340;
    float _2364 = _2332;
    float _2366 = _2330;
    float _2368 = _2328;
    if (!_2350)
    {
        _924 = _2328;
    }
    float _2370 = _924;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2350)
    {
        _2358 = _2330;
    }
    float _2376 = _2358;
    float _2378 = _2376;
    float _2380 = _2376;
    if (!_2350)
    {
        _926 = _224;
    }
    float _2382 = _926;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2350)
    {
        _2266 = _226;
    }
    float _2388 = _2266;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2350)
    {
        _2268 = _228;
    }
    float _2394 = _2268;
    bool _2396 = !_2350;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _2332 > _2248;
        if (_2402)
        {
            _2360 = _2248;
        }
        float _2404 = _2360;
        _2364 = _2404;
        if (!_2402)
        {
            _2384 = _2334;
        }
        float _2406 = _2384;
        float _2408 = _2406;
        if (!_2402)
        {
            _2390 = _2336;
        }
        float _2410 = _2390;
        float _2412 = _2410;
        if (!_2402)
        {
            _2398 = _2338;
        }
        float _2414 = _2398;
        float _2416 = _2414;
        if (!_2402)
        {
            _2270 = _2326;
        }
        float _2418 = _2270;
        float _2420 = _2418;
        if (!_2402)
        {
            _2372 = _2328;
        }
        float _2422 = _2372;
        float _2424 = _2422;
        if (!_2402)
        {
            _2378 = _2330;
        }
        float _2426 = _2378;
        float _2428 = _2426;
        if (_2402)
        {
            _2408 = _2334;
        }
        float _2430 = _2408;
        _2386 = _2430;
        if (_2402)
        {
            _2412 = _2336;
        }
        float _2432 = _2412;
        _2392 = _2432;
        if (_2402)
        {
            _2416 = _2338;
        }
        float _2434 = _2416;
        _2400 = _2434;
        if (_2402)
        {
            _2420 = _2326;
        }
        float _2436 = _2420;
        _2272 = _2436;
        if (_2402)
        {
            _2424 = _224;
        }
        float _2438 = _2424;
        _2374 = _2438;
        if (_2402)
        {
            _2428 = _226;
        }
        float _2440 = _2428;
        _2380 = _2440;
        if (_2402)
        {
            _2362 = _228;
        }
    }
    float _2442 = _2272;
    float _2444 = _2374;
    float _2446 = _2362;
    float _2448 = _2364;
    float _2450 = _2386;
    float _2452 = _2392;
    float _2454 = _2400;
    float _2456 = _2380;
    bool _2458 = _2442 >= _2356;
    bool _2460 = isnan(_2442);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(_2356);
    bool _2466 = _2462 || _2464;
    float _2468 = _2456;
    float _2470 = _2456;
    if (!_2466)
    {
        _2366 = _2444;
    }
    float _2472 = _2366;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2466)
    {
        _2368 = _2446;
    }
    float _2478 = _2368;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2466)
    {
        _928 = _234;
    }
    float _2484 = _928;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2466)
    {
        _930 = _236;
    }
    float _2490 = _930;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2466)
    {
        _932 = _238;
    }
    float _2496 = _932;
    bool _2498 = !_2466;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2498)
    {
        bool _2504 = _2448 > _2356;
        if (!_2504)
        {
            _2486 = _2450;
        }
        float _2506 = _2486;
        float _2508 = _2506;
        if (!_2504)
        {
            _2492 = _2452;
        }
        float _2510 = _2492;
        float _2512 = _2510;
        if (!_2504)
        {
            _2500 = _2454;
        }
        float _2514 = _2500;
        float _2516 = _2514;
        if (!_2504)
        {
            _2474 = _2444;
        }
        float _2518 = _2474;
        float _2520 = _2518;
        if (!_2504)
        {
            _2480 = _2446;
        }
        float _2522 = _2480;
        _2482 = _2522;
        if (_2504)
        {
            _2508 = _2450;
        }
        float _2524 = _2508;
        _2488 = _2524;
        if (_2504)
        {
            _2512 = _2452;
        }
        float _2526 = _2512;
        _2494 = _2526;
        if (_2504)
        {
            _2516 = _2454;
        }
        float _2528 = _2516;
        _2502 = _2528;
        if (_2504)
        {
            _2520 = _234;
        }
        float _2530 = _2520;
        _2476 = _2530;
        if (_2504)
        {
            _2468 = _236;
        }
        float _2532 = _2468;
        _2470 = _2532;
        if (_2504)
        {
            _2482 = _238;
        }
    }
    float _2534 = _2470;
    float _2536 = _2494;
    float _2538 = _2476;
    float _2540 = _2488;
    float _2542 = _2482;
    float _2544 = _2502;
    float _2546 = -_2534;
    float _2548 = _2536 + _2546;
    float _2550 = -_2538;
    float _2552 = _2540 + _2550;
    float _2554 = -_2542;
    float _2556 = _2544 + _2554;
    float _2558 = -_2534;
    float _2560 = _96 + _2558;
    float _2562 = _2548 * _2548;
    float _2564 = _2548 * _2560;
    float _2566 = fma(_2552, _2552, _2562);
    float _2568 = -_2538;
    float _2570 = _94 + _2568;
    float _2572 = -_2542;
    float _2574 = _98 + _2572;
    float _2576 = fma(_2556, _2556, _2566);
    float _2578 = fma(_2552, _2570, _2564);
    float _2580 = fma(_2556, _2574, _2578);
    float _2582 = 1.0 / _2576;
    float _2584 = _2582 * 3.0;
    float _2586 = _2584 * _2580;
    float _2588 = rint(_2586);
    float _2590 = precise::max(0.0, _2588);
    float _2592 = precise::min(_2590, 3.0);
    float _2594 = trunc(_2592);
    int _2597 = int(_2594);
    bool _2599 = _2597 >= 2;
    bool _2601 = !_2599;
    float _2603 = _2552;
    float _2605 = _2548;
    float _2607 = _2556;
    float _2609 = _2538;
    float _2611 = _2540;
    float _2613 = _2534;
    float _2615 = _2536;
    float _2617 = _2542;
    float _2619 = _2544;
    float _2629;
    float _2631;
    float _2633;
    float _2635;
    float _2637;
    float _2639;
    float _2641;
    float _2643;
    float _2645;
    float _2647;
    float _2649;
    float _2651;
    float _2653;
    float _2655;
    float _2657;
    float _2659;
    if (!_2601)
    {
        bool _2621 = _2597 >= 3;
        bool _2623 = !_2621;
        if (!_2623)
        {
            bool _2625 = _2597 != 3;
            _2627 = _2625;
            if (!_2627)
            {
                _2629 = _94;
                _2631 = _96;
                _2633 = _98;
                _2635 = 1.0;
                _2637 = 0.0;
                _2639 = 0.0;
                _2641 = 0.0;
                _2643 = 0.0;
                _2645 = 0.0;
                _2647 = 0.0;
                _2649 = 0.0;
                _2651 = 0.0;
                _2653 = 0.0;
                _2655 = 0.0;
                _2657 = 0.0;
                _2659 = 0.0;
                _2661 = true;
            }
        }
        else
        {
            _2629 = 0.0;
            _2631 = 0.0;
            _2633 = 0.0;
            _2635 = 0.0;
            _2637 = 0.0;
            _2639 = 0.0;
            _2641 = 0.0;
            _2643 = 0.0;
            _2645 = _94;
            _2647 = _96;
            _2649 = _98;
            _2651 = 1.0;
            _2653 = 0.0;
            _2655 = 0.0;
            _2657 = 0.0;
            _2659 = 0.0;
            _2661 = true;
        }
    }
    if ((!_2661) || _2627)
    {
        bool _2663;
        if (!_2627)
        {
            _2663 = _2597 >= 1;
        }
        if ((!_2663) || _2627)
        {
            bool _2665;
            if (!_2627)
            {
                _2665 = _2597 != 0;
            }
            if ((!_2665) && (!_2627))
            {
                _2629 = 0.0;
                _2631 = 0.0;
                _2633 = 0.0;
                _2635 = 0.0;
                _2637 = _94;
                _2639 = _96;
                _2641 = _98;
                _2643 = 1.0;
                _2645 = 0.0;
                _2647 = 0.0;
                _2649 = 0.0;
                _2651 = 0.0;
                _2653 = 0.0;
                _2655 = 0.0;
                _2657 = 0.0;
                _2659 = 0.0;
                _2661 = true;
            }
            else
            {
                _2627 = false;
                _2629 = 0.0;
                _2631 = 0.0;
                _2633 = 0.0;
                _2635 = 0.0;
                _2637 = 0.0;
                _2639 = 0.0;
                _2641 = 0.0;
                _2643 = 0.0;
                _2645 = 0.0;
                _2647 = 0.0;
                _2649 = 0.0;
                _2651 = 0.0;
                _2653 = 0.0;
                _2655 = 0.0;
                _2657 = 0.0;
                _2659 = 0.0;
                _2661 = true;
            }
        }
        else
        {
            _2629 = 0.0;
            _2631 = 0.0;
            _2633 = 0.0;
            _2635 = 0.0;
            _2637 = 0.0;
            _2639 = 0.0;
            _2641 = 0.0;
            _2643 = 0.0;
            _2645 = 0.0;
            _2647 = 0.0;
            _2649 = 0.0;
            _2651 = 0.0;
            _2653 = _94;
            _2655 = _96;
            _2657 = _98;
            _2659 = 1.0;
        }
    }
    _2661 = false;
    float _2667 = _2629;
    float _2669 = _2631;
    float _2671 = _2633;
    float _2673 = _2635;
    float _2675 = _2637;
    float _2677 = _2639;
    float _2679 = _2641;
    float _2681 = _2643;
    float _2683 = _2645;
    float _2685 = _2647;
    float _2687 = _2649;
    float _2689 = _2651;
    float _2691 = _2653;
    float _2693 = _2655;
    float _2695 = _2657;
    float _2697 = _2659;
    float _2699 = -_2534;
    float _2701 = _86 + _2699;
    float _2703 = -_2538;
    float _2705 = _84 + _2703;
    float _2707 = _2548 * _2701;
    float _2709 = -_2542;
    float _2711 = _88 + _2709;
    float _2713 = fma(_2552, _2705, _2707);
    float _2715 = fma(_2556, _2711, _2713);
    float _2717 = _2584 * _2715;
    float _2719 = rint(_2717);
    float _2721 = precise::max(0.0, _2719);
    float _2723 = precise::min(_2721, 3.0);
    float _2725 = trunc(_2723);
    int _2727 = int(_2725);
    bool _2729 = _2727 >= 2;
    bool _2731 = !_2729;
    float _2733 = as_type<float>(_2727);
    float _2735 = _2719;
    float _2737 = _2713;
    float _2739 = _2707;
    float _2741 = _2667;
    float _2743 = _2669;
    float _2745 = _2671;
    float _2747 = _2673;
    float _2749 = _2683;
    float _2751 = _2685;
    float _2753 = _2687;
    float _2755 = _2689;
    float _2757 = _2691;
    float _2759 = _2693;
    float _2761 = _2695;
    float _2763 = _2697;
    float _2781;
    float _2783;
    float _2785;
    float _2787;
    if (!_2731)
    {
        bool _2765 = _2727 >= 3;
        bool _2767 = !_2765;
        if (!_2767)
        {
            bool _2769 = _2727 != 3;
            _2771 = _2769;
            if (!_2771)
            {
                float _2773 = _84 + _2667;
                float _2775 = _86 + _2669;
                float _2777 = _88 + _2671;
                float _2779 = _2673 + 1.0;
                _2741 = _2773;
                _2743 = _2775;
                _2745 = _2777;
                _2747 = _2779;
                _2781 = _2675;
                _2783 = _2677;
                _2785 = _2679;
                _2787 = _2681;
                _2789 = true;
            }
        }
        else
        {
            float _2791 = _84 + _2683;
            float _2793 = _86 + _2685;
            float _2795 = _88 + _2687;
            float _2797 = _2689 + 1.0;
            _2781 = _2675;
            _2783 = _2677;
            _2785 = _2679;
            _2787 = _2681;
            _2749 = _2791;
            _2751 = _2793;
            _2753 = _2795;
            _2755 = _2797;
            _2789 = true;
        }
    }
    if ((!_2789) || _2771)
    {
        bool _2799;
        if (!_2771)
        {
            _2799 = _2727 >= 1;
        }
        if ((!_2799) || _2771)
        {
            if (!_2771)
            {
                bool _2801 = _2727 != 0;
                if (!_2801)
                {
                    float _2803 = _84 + _2675;
                    _2733 = _2803;
                }
                float _2805 = _2733;
                _2781 = _2805;
                if (!_2801)
                {
                    float _2807 = _86 + _2677;
                    _2735 = _2807;
                }
                float _2809 = _2735;
                _2783 = _2809;
                if (!_2801)
                {
                    float _2811 = _88 + _2679;
                    _2737 = _2811;
                }
                float _2813 = _2737;
                _2785 = _2813;
                if (!_2801)
                {
                    float _2815 = _2681 + 1.0;
                    _2739 = _2815;
                }
                float _2817 = _2739;
                bool _2819 = !_2801;
                _2787 = _2817;
                _2789 = _2819;
            }
            if ((!_2789) || _2771)
            {
                _2771 = false;
                _2781 = _2675;
                _2783 = _2677;
                _2785 = _2679;
                _2787 = _2681;
                _2789 = true;
            }
        }
        else
        {
            float _2821 = _84 + _2691;
            float _2823 = _86 + _2693;
            float _2825 = _88 + _2695;
            float _2827 = _2697 + 1.0;
            _2781 = _2675;
            _2783 = _2677;
            _2785 = _2679;
            _2787 = _2681;
            _2757 = _2821;
            _2759 = _2823;
            _2761 = _2825;
            _2763 = _2827;
        }
    }
    _2789 = false;
    float _2829 = _2741;
    float _2831 = _2743;
    float _2833 = _2745;
    float _2835 = _2747;
    float _2837 = _2781;
    float _2839 = _2783;
    float _2841 = _2785;
    float _2843 = _2787;
    float _2845 = _2749;
    float _2847 = _2751;
    float _2849 = _2753;
    float _2851 = _2755;
    float _2853 = _2757;
    float _2855 = _2759;
    float _2857 = _2761;
    float _2859 = _2763;
    float _2861 = -_2534;
    float _2863 = _106 + _2861;
    float _2865 = -_2538;
    float _2867 = _104 + _2865;
    float _2869 = _2548 * _2863;
    float _2871 = -_2542;
    float _2873 = _108 + _2871;
    float _2875 = fma(_2552, _2867, _2869);
    float _2877 = fma(_2556, _2873, _2875);
    float _2879 = _2584 * _2877;
    float _2881 = rint(_2879);
    float _2883 = precise::max(0.0, _2881);
    float _2885 = precise::min(_2883, 3.0);
    float _2887 = trunc(_2885);
    int _2889 = int(_2887);
    bool _2891 = _2889 >= 2;
    bool _2893 = !_2891;
    float _2895 = _2881;
    float _2897 = as_type<float>(_2889);
    float _2899 = _2869;
    float _2901 = _2875;
    float _2903 = _2829;
    float _2905 = _2831;
    float _2907 = _2833;
    float _2909 = _2835;
    float _2911 = _2845;
    float _2913 = _2847;
    float _2915 = _2849;
    float _2917 = _2851;
    float _2919 = _2853;
    float _2921 = _2855;
    float _2923 = _2857;
    float _2925 = _2859;
    float _2943;
    float _2945;
    float _2947;
    float _2949;
    if (!_2893)
    {
        bool _2927 = _2889 >= 3;
        bool _2929 = !_2927;
        if (!_2929)
        {
            bool _2931 = _2889 != 3;
            _2933 = _2931;
            if (!_2933)
            {
                float _2935 = _104 + _2829;
                float _2937 = _106 + _2831;
                float _2939 = _108 + _2833;
                float _2941 = _2835 + 1.0;
                _2903 = _2935;
                _2905 = _2937;
                _2907 = _2939;
                _2909 = _2941;
                _2943 = _2837;
                _2945 = _2839;
                _2947 = _2841;
                _2949 = _2843;
                _2951 = true;
            }
        }
        else
        {
            float _2953 = _104 + _2845;
            float _2955 = _106 + _2847;
            float _2957 = _108 + _2849;
            float _2959 = _2851 + 1.0;
            _2943 = _2837;
            _2945 = _2839;
            _2947 = _2841;
            _2949 = _2843;
            _2911 = _2953;
            _2913 = _2955;
            _2915 = _2957;
            _2917 = _2959;
            _2951 = true;
        }
    }
    if ((!_2951) || _2933)
    {
        bool _2961;
        if (!_2933)
        {
            _2961 = _2889 >= 1;
        }
        if ((!_2961) || _2933)
        {
            if (!_2933)
            {
                bool _2963 = _2889 != 0;
                if (!_2963)
                {
                    float _2965 = _104 + _2837;
                    _2895 = _2965;
                }
                float _2967 = _2895;
                _2943 = _2967;
                if (!_2963)
                {
                    float _2969 = _106 + _2839;
                    _2897 = _2969;
                }
                float _2971 = _2897;
                _2945 = _2971;
                if (!_2963)
                {
                    float _2973 = _108 + _2841;
                    _2899 = _2973;
                }
                float _2975 = _2899;
                _2947 = _2975;
                if (!_2963)
                {
                    float _2977 = _2843 + 1.0;
                    _2901 = _2977;
                }
                float _2979 = _2901;
                bool _2981 = !_2963;
                _2949 = _2979;
                _2951 = _2981;
            }
            if ((!_2951) || _2933)
            {
                _2933 = false;
                _2943 = _2837;
                _2945 = _2839;
                _2947 = _2841;
                _2949 = _2843;
                _2951 = true;
            }
        }
        else
        {
            float _2983 = _104 + _2853;
            float _2985 = _106 + _2855;
            float _2987 = _108 + _2857;
            float _2989 = _2859 + 1.0;
            _2943 = _2837;
            _2945 = _2839;
            _2947 = _2841;
            _2949 = _2843;
            _2919 = _2983;
            _2921 = _2985;
            _2923 = _2987;
            _2925 = _2989;
        }
    }
    _2951 = false;
    float _2991 = _2903;
    float _2993 = _2905;
    float _2995 = _2907;
    float _2997 = _2909;
    float _2999 = _2943;
    float _3001 = _2945;
    float _3003 = _2947;
    float _3005 = _2949;
    float _3007 = _2911;
    float _3009 = _2913;
    float _3011 = _2915;
    float _3013 = _2917;
    float _3015 = _2919;
    float _3017 = _2921;
    float _3019 = _2923;
    float _3021 = _2925;
    float _3023 = -_2534;
    float _3025 = _116 + _3023;
    float _3027 = -_2538;
    float _3029 = _114 + _3027;
    float _3031 = _2548 * _3025;
    float _3033 = -_2542;
    float _3035 = _118 + _3033;
    float _3037 = fma(_2552, _3029, _3031);
    float _3039 = fma(_2556, _3035, _3037);
    float _3041 = _2584 * _3039;
    float _3043 = rint(_3041);
    float _3045 = precise::max(0.0, _3043);
    float _3047 = precise::min(_3045, 3.0);
    float _3049 = trunc(_3047);
    int _3051 = int(_3049);
    bool _3053 = _3051 >= 2;
    bool _3055 = !_3053;
    float _3057 = as_type<float>(_3051);
    float _3059 = _3043;
    float _3061 = _3037;
    float _3063 = _3031;
    float _3065 = _2991;
    float _3067 = _2993;
    float _3069 = _2995;
    float _3071 = _2997;
    float _3073 = _3007;
    float _3075 = _3009;
    float _3077 = _3011;
    float _3079 = _3013;
    float _3081 = _3015;
    float _3083 = _3017;
    float _3085 = _3019;
    float _3087 = _3021;
    float _3105;
    float _3107;
    float _3109;
    float _3111;
    if (!_3055)
    {
        bool _3089 = _3051 >= 3;
        bool _3091 = !_3089;
        if (!_3091)
        {
            bool _3093 = _3051 != 3;
            _3095 = _3093;
            if (!_3095)
            {
                float _3097 = _114 + _2991;
                float _3099 = _116 + _2993;
                float _3101 = _118 + _2995;
                float _3103 = _2997 + 1.0;
                _3065 = _3097;
                _3067 = _3099;
                _3069 = _3101;
                _3071 = _3103;
                _3105 = _2999;
                _3107 = _3001;
                _3109 = _3003;
                _3111 = _3005;
                _3113 = true;
            }
        }
        else
        {
            float _3115 = _114 + _3007;
            float _3117 = _116 + _3009;
            float _3119 = _118 + _3011;
            float _3121 = _3013 + 1.0;
            _3105 = _2999;
            _3107 = _3001;
            _3109 = _3003;
            _3111 = _3005;
            _3073 = _3115;
            _3075 = _3117;
            _3077 = _3119;
            _3079 = _3121;
            _3113 = true;
        }
    }
    if ((!_3113) || _3095)
    {
        bool _3123;
        if (!_3095)
        {
            _3123 = _3051 >= 1;
        }
        if ((!_3123) || _3095)
        {
            if (!_3095)
            {
                bool _3125 = _3051 != 0;
                if (!_3125)
                {
                    float _3127 = _114 + _2999;
                    _3057 = _3127;
                }
                float _3129 = _3057;
                _3105 = _3129;
                if (!_3125)
                {
                    float _3131 = _116 + _3001;
                    _3059 = _3131;
                }
                float _3133 = _3059;
                _3107 = _3133;
                if (!_3125)
                {
                    float _3135 = _118 + _3003;
                    _3061 = _3135;
                }
                float _3137 = _3061;
                _3109 = _3137;
                if (!_3125)
                {
                    float _3139 = _3005 + 1.0;
                    _3063 = _3139;
                }
                float _3141 = _3063;
                bool _3143 = !_3125;
                _3111 = _3141;
                _3113 = _3143;
            }
            if ((!_3113) || _3095)
            {
                _3095 = false;
                _3105 = _2999;
                _3107 = _3001;
                _3109 = _3003;
                _3111 = _3005;
                _3113 = true;
            }
        }
        else
        {
            float _3145 = _114 + _3015;
            float _3147 = _116 + _3017;
            float _3149 = _118 + _3019;
            float _3151 = _3021 + 1.0;
            _3105 = _2999;
            _3107 = _3001;
            _3109 = _3003;
            _3111 = _3005;
            _3081 = _3145;
            _3083 = _3147;
            _3085 = _3149;
            _3087 = _3151;
        }
    }
    _3113 = false;
    float _3153 = _3065;
    float _3155 = _3067;
    float _3157 = _3069;
    float _3159 = _3071;
    float _3161 = _3105;
    float _3163 = _3107;
    float _3165 = _3109;
    float _3167 = _3111;
    float _3169 = _3073;
    float _3171 = _3075;
    float _3173 = _3077;
    float _3175 = _3079;
    float _3177 = _3081;
    float _3179 = _3083;
    float _3181 = _3085;
    float _3183 = _3087;
    float _3185 = -_2534;
    float _3187 = _126 + _3185;
    float _3189 = -_2538;
    float _3191 = _124 + _3189;
    float _3193 = _2548 * _3187;
    float _3195 = -_2542;
    float _3197 = _128 + _3195;
    float _3199 = fma(_2552, _3191, _3193);
    float _3201 = fma(_2556, _3197, _3199);
    float _3203 = _2584 * _3201;
    float _3205 = rint(_3203);
    float _3207 = precise::max(0.0, _3205);
    float _3209 = precise::min(_3207, 3.0);
    float _3211 = trunc(_3209);
    int _3213 = int(_3211);
    bool _3215 = _3213 >= 2;
    bool _3217 = !_3215;
    float _3219 = _3205;
    float _3221 = as_type<float>(_3213);
    float _3223 = _3193;
    float _3225 = _3199;
    float _3227 = _3153;
    float _3229 = _3155;
    float _3231 = _3157;
    float _3233 = _3159;
    float _3235 = _3169;
    float _3237 = _3171;
    float _3239 = _3173;
    float _3241 = _3175;
    float _3243 = _3177;
    float _3245 = _3179;
    float _3247 = _3181;
    float _3249 = _3183;
    float _3267;
    float _3269;
    float _3271;
    float _3273;
    if (!_3217)
    {
        bool _3251 = _3213 >= 3;
        bool _3253 = !_3251;
        if (!_3253)
        {
            bool _3255 = _3213 != 3;
            _3257 = _3255;
            if (!_3257)
            {
                float _3259 = _124 + _3153;
                float _3261 = _126 + _3155;
                float _3263 = _128 + _3157;
                float _3265 = _3159 + 1.0;
                _3227 = _3259;
                _3229 = _3261;
                _3231 = _3263;
                _3233 = _3265;
                _3267 = _3161;
                _3269 = _3163;
                _3271 = _3165;
                _3273 = _3167;
                _3275 = true;
            }
        }
        else
        {
            float _3277 = _124 + _3169;
            float _3279 = _126 + _3171;
            float _3281 = _128 + _3173;
            float _3283 = _3175 + 1.0;
            _3267 = _3161;
            _3269 = _3163;
            _3271 = _3165;
            _3273 = _3167;
            _3235 = _3277;
            _3237 = _3279;
            _3239 = _3281;
            _3241 = _3283;
            _3275 = true;
        }
    }
    if ((!_3275) || _3257)
    {
        bool _3285;
        if (!_3257)
        {
            _3285 = _3213 >= 1;
        }
        if ((!_3285) || _3257)
        {
            if (!_3257)
            {
                bool _3287 = _3213 != 0;
                if (!_3287)
                {
                    float _3289 = _124 + _3161;
                    _3219 = _3289;
                }
                float _3291 = _3219;
                _3267 = _3291;
                if (!_3287)
                {
                    float _3293 = _126 + _3163;
                    _3221 = _3293;
                }
                float _3295 = _3221;
                _3269 = _3295;
                if (!_3287)
                {
                    float _3297 = _128 + _3165;
                    _3223 = _3297;
                }
                float _3299 = _3223;
                _3271 = _3299;
                if (!_3287)
                {
                    float _3301 = _3167 + 1.0;
                    _3225 = _3301;
                }
                float _3303 = _3225;
                bool _3305 = !_3287;
                _3273 = _3303;
                _3275 = _3305;
            }
            if ((!_3275) || _3257)
            {
                _3257 = false;
                _3267 = _3161;
                _3269 = _3163;
                _3271 = _3165;
                _3273 = _3167;
                _3275 = true;
            }
        }
        else
        {
            float _3307 = _124 + _3177;
            float _3309 = _126 + _3179;
            float _3311 = _128 + _3181;
            float _3313 = _3183 + 1.0;
            _3267 = _3161;
            _3269 = _3163;
            _3271 = _3165;
            _3273 = _3167;
            _3243 = _3307;
            _3245 = _3309;
            _3247 = _3311;
            _3249 = _3313;
        }
    }
    _3275 = false;
    float _3315 = _3227;
    float _3317 = _3229;
    float _3319 = _3231;
    float _3321 = _3233;
    float _3323 = _3267;
    float _3325 = _3269;
    float _3327 = _3271;
    float _3329 = _3273;
    float _3331 = _3235;
    float _3333 = _3237;
    float _3335 = _3239;
    float _3337 = _3241;
    float _3339 = _3243;
    float _3341 = _3245;
    float _3343 = _3247;
    float _3345 = _3249;
    float _3347 = -_2534;
    float _3349 = _136 + _3347;
    float _3351 = -_2538;
    float _3353 = _134 + _3351;
    float _3355 = _2548 * _3349;
    float _3357 = -_2542;
    float _3359 = _138 + _3357;
    float _3361 = fma(_2552, _3353, _3355);
    float _3363 = fma(_2556, _3359, _3361);
    float _3365 = _2584 * _3363;
    float _3367 = rint(_3365);
    float _3369 = precise::max(0.0, _3367);
    float _3371 = precise::min(_3369, 3.0);
    float _3373 = trunc(_3371);
    int _3375 = int(_3373);
    bool _3377 = _3375 >= 2;
    bool _3379 = !_3377;
    float _3381 = as_type<float>(_3375);
    float _3383 = _3367;
    float _3385 = _3361;
    float _3387 = _3355;
    float _3389 = _3315;
    float _3391 = _3317;
    float _3393 = _3319;
    float _3395 = _3321;
    float _3397 = _3331;
    float _3399 = _3333;
    float _3401 = _3335;
    float _3403 = _3337;
    float _3405 = _3339;
    float _3407 = _3341;
    float _3409 = _3343;
    float _3411 = _3345;
    float _3429;
    float _3431;
    float _3433;
    float _3435;
    if (!_3379)
    {
        bool _3413 = _3375 >= 3;
        bool _3415 = !_3413;
        if (!_3415)
        {
            bool _3417 = _3375 != 3;
            _3419 = _3417;
            if (!_3419)
            {
                float _3421 = _134 + _3315;
                float _3423 = _136 + _3317;
                float _3425 = _138 + _3319;
                float _3427 = _3321 + 1.0;
                _3389 = _3421;
                _3391 = _3423;
                _3393 = _3425;
                _3395 = _3427;
                _3429 = _3323;
                _3431 = _3325;
                _3433 = _3327;
                _3435 = _3329;
                _3437 = true;
            }
        }
        else
        {
            float _3439 = _134 + _3331;
            float _3441 = _136 + _3333;
            float _3443 = _138 + _3335;
            float _3445 = _3337 + 1.0;
            _3429 = _3323;
            _3431 = _3325;
            _3433 = _3327;
            _3435 = _3329;
            _3397 = _3439;
            _3399 = _3441;
            _3401 = _3443;
            _3403 = _3445;
            _3437 = true;
        }
    }
    if ((!_3437) || _3419)
    {
        bool _3447;
        if (!_3419)
        {
            _3447 = _3375 >= 1;
        }
        if ((!_3447) || _3419)
        {
            if (!_3419)
            {
                bool _3449 = _3375 != 0;
                if (!_3449)
                {
                    float _3451 = _134 + _3323;
                    _3381 = _3451;
                }
                float _3453 = _3381;
                _3429 = _3453;
                if (!_3449)
                {
                    float _3455 = _136 + _3325;
                    _3383 = _3455;
                }
                float _3457 = _3383;
                _3431 = _3457;
                if (!_3449)
                {
                    float _3459 = _138 + _3327;
                    _3385 = _3459;
                }
                float _3461 = _3385;
                _3433 = _3461;
                if (!_3449)
                {
                    float _3463 = _3329 + 1.0;
                    _3387 = _3463;
                }
                float _3465 = _3387;
                bool _3467 = !_3449;
                _3435 = _3465;
                _3437 = _3467;
            }
            if ((!_3437) || _3419)
            {
                _3419 = false;
                _3429 = _3323;
                _3431 = _3325;
                _3433 = _3327;
                _3435 = _3329;
                _3437 = true;
            }
        }
        else
        {
            float _3469 = _134 + _3339;
            float _3471 = _136 + _3341;
            float _3473 = _138 + _3343;
            float _3475 = _3345 + 1.0;
            _3429 = _3323;
            _3431 = _3325;
            _3433 = _3327;
            _3435 = _3329;
            _3405 = _3469;
            _3407 = _3471;
            _3409 = _3473;
            _3411 = _3475;
        }
    }
    _3437 = false;
    float _3477 = _3389;
    float _3479 = _3391;
    float _3481 = _3393;
    float _3483 = _3395;
    float _3485 = _3429;
    float _3487 = _3431;
    float _3489 = _3433;
    float _3491 = _3435;
    float _3493 = _3397;
    float _3495 = _3399;
    float _3497 = _3401;
    float _3499 = _3403;
    float _3501 = _3405;
    float _3503 = _3407;
    float _3505 = _3409;
    float _3507 = _3411;
    float _3509 = -_2534;
    float _3511 = _146 + _3509;
    float _3513 = -_2538;
    float _3515 = _144 + _3513;
    float _3517 = _2548 * _3511;
    float _3519 = -_2542;
    float _3521 = _148 + _3519;
    float _3523 = fma(_2552, _3515, _3517);
    float _3525 = fma(_2556, _3521, _3523);
    float _3527 = _2584 * _3525;
    float _3529 = rint(_3527);
    float _3531 = precise::max(0.0, _3529);
    float _3533 = precise::min(_3531, 3.0);
    float _3535 = trunc(_3533);
    int _3537 = int(_3535);
    bool _3539 = _3537 >= 2;
    bool _3541 = !_3539;
    float _3543 = _3529;
    float _3545 = as_type<float>(_3537);
    float _3547 = _3517;
    float _3549 = _3523;
    float _3551 = _3477;
    float _3553 = _3479;
    float _3555 = _3481;
    float _3557 = _3483;
    float _3559 = _3493;
    float _3561 = _3495;
    float _3563 = _3497;
    float _3565 = _3499;
    float _3567 = _3501;
    float _3569 = _3503;
    float _3571 = _3505;
    float _3573 = _3507;
    float _3591;
    float _3593;
    float _3595;
    float _3597;
    if (!_3541)
    {
        bool _3575 = _3537 >= 3;
        bool _3577 = !_3575;
        if (!_3577)
        {
            bool _3579 = _3537 != 3;
            _3581 = _3579;
            if (!_3581)
            {
                float _3583 = _144 + _3477;
                float _3585 = _146 + _3479;
                float _3587 = _148 + _3481;
                float _3589 = _3483 + 1.0;
                _3551 = _3583;
                _3553 = _3585;
                _3555 = _3587;
                _3557 = _3589;
                _3591 = _3485;
                _3593 = _3487;
                _3595 = _3489;
                _3597 = _3491;
                _3599 = true;
            }
        }
        else
        {
            float _3601 = _144 + _3493;
            float _3603 = _146 + _3495;
            float _3605 = _148 + _3497;
            float _3607 = _3499 + 1.0;
            _3591 = _3485;
            _3593 = _3487;
            _3595 = _3489;
            _3597 = _3491;
            _3559 = _3601;
            _3561 = _3603;
            _3563 = _3605;
            _3565 = _3607;
            _3599 = true;
        }
    }
    if ((!_3599) || _3581)
    {
        bool _3609;
        if (!_3581)
        {
            _3609 = _3537 >= 1;
        }
        if ((!_3609) || _3581)
        {
            if (!_3581)
            {
                bool _3611 = _3537 != 0;
                if (!_3611)
                {
                    float _3613 = _144 + _3485;
                    _3543 = _3613;
                }
                float _3615 = _3543;
                _3591 = _3615;
                if (!_3611)
                {
                    float _3617 = _146 + _3487;
                    _3545 = _3617;
                }
                float _3619 = _3545;
                _3593 = _3619;
                if (!_3611)
                {
                    float _3621 = _148 + _3489;
                    _3547 = _3621;
                }
                float _3623 = _3547;
                _3595 = _3623;
                if (!_3611)
                {
                    float _3625 = _3491 + 1.0;
                    _3549 = _3625;
                }
                float _3627 = _3549;
                bool _3629 = !_3611;
                _3597 = _3627;
                _3599 = _3629;
            }
            if ((!_3599) || _3581)
            {
                _3581 = false;
                _3591 = _3485;
                _3593 = _3487;
                _3595 = _3489;
                _3597 = _3491;
                _3599 = true;
            }
        }
        else
        {
            float _3631 = _144 + _3501;
            float _3633 = _146 + _3503;
            float _3635 = _148 + _3505;
            float _3637 = _3507 + 1.0;
            _3591 = _3485;
            _3593 = _3487;
            _3595 = _3489;
            _3597 = _3491;
            _3567 = _3631;
            _3569 = _3633;
            _3571 = _3635;
            _3573 = _3637;
        }
    }
    _3599 = false;
    float _3639 = _3551;
    float _3641 = _3553;
    float _3643 = _3555;
    float _3645 = _3557;
    float _3647 = _3591;
    float _3649 = _3593;
    float _3651 = _3595;
    float _3653 = _3597;
    float _3655 = _3559;
    float _3657 = _3561;
    float _3659 = _3563;
    float _3661 = _3565;
    float _3663 = _3567;
    float _3665 = _3569;
    float _3667 = _3571;
    float _3669 = _3573;
    float _3671 = -_2534;
    float _3673 = _156 + _3671;
    float _3675 = -_2538;
    float _3677 = _154 + _3675;
    float _3679 = _2548 * _3673;
    float _3681 = -_2542;
    float _3683 = _158 + _3681;
    float _3685 = fma(_2552, _3677, _3679);
    float _3687 = fma(_2556, _3683, _3685);
    float _3689 = _2584 * _3687;
    float _3691 = rint(_3689);
    float _3693 = precise::max(0.0, _3691);
    float _3695 = precise::min(_3693, 3.0);
    float _3697 = trunc(_3695);
    int _3699 = int(_3697);
    bool _3701 = _3699 >= 2;
    bool _3703 = !_3701;
    float _3705 = _3679;
    float _3707 = _3685;
    float _3709 = _3691;
    float _3711 = as_type<float>(_3699);
    float _3713 = _3639;
    float _3715 = _3641;
    float _3717 = _3643;
    float _3719 = _3645;
    float _3721 = _3655;
    float _3723 = _3657;
    float _3725 = _3659;
    float _3727 = _3661;
    float _3729 = _3663;
    float _3731 = _3665;
    float _3733 = _3667;
    float _3735 = _3669;
    float _3753;
    float _3755;
    float _3757;
    float _3759;
    if (!_3703)
    {
        bool _3737 = _3699 >= 3;
        bool _3739 = !_3737;
        if (!_3739)
        {
            bool _3741 = _3699 != 3;
            _3743 = _3741;
            if (!_3743)
            {
                float _3745 = _154 + _3639;
                float _3747 = _156 + _3641;
                float _3749 = _158 + _3643;
                float _3751 = _3645 + 1.0;
                _3713 = _3745;
                _3715 = _3747;
                _3717 = _3749;
                _3719 = _3751;
                _3753 = _3647;
                _3755 = _3649;
                _3757 = _3651;
                _3759 = _3653;
                _3761 = true;
            }
        }
        else
        {
            float _3763 = _154 + _3655;
            float _3765 = _156 + _3657;
            float _3767 = _158 + _3659;
            float _3769 = _3661 + 1.0;
            _3753 = _3647;
            _3755 = _3649;
            _3757 = _3651;
            _3759 = _3653;
            _3721 = _3763;
            _3723 = _3765;
            _3725 = _3767;
            _3727 = _3769;
            _3761 = true;
        }
    }
    if ((!_3761) || _3743)
    {
        bool _3771;
        if (!_3743)
        {
            _3771 = _3699 >= 1;
        }
        if ((!_3771) || _3743)
        {
            if (!_3743)
            {
                bool _3773 = _3699 != 0;
                if (!_3773)
                {
                    float _3775 = _154 + _3647;
                    _3705 = _3775;
                }
                float _3777 = _3705;
                _3753 = _3777;
                if (!_3773)
                {
                    float _3779 = _156 + _3649;
                    _3707 = _3779;
                }
                float _3781 = _3707;
                _3755 = _3781;
                if (!_3773)
                {
                    float _3783 = _158 + _3651;
                    _3709 = _3783;
                }
                float _3785 = _3709;
                _3757 = _3785;
                if (!_3773)
                {
                    float _3787 = _3653 + 1.0;
                    _3711 = _3787;
                }
                float _3789 = _3711;
                bool _3791 = !_3773;
                _3759 = _3789;
                _3761 = _3791;
            }
            if ((!_3761) || _3743)
            {
                _3743 = false;
                _3753 = _3647;
                _3755 = _3649;
                _3757 = _3651;
                _3759 = _3653;
                _3761 = true;
            }
        }
        else
        {
            float _3793 = _154 + _3663;
            float _3795 = _156 + _3665;
            float _3797 = _158 + _3667;
            float _3799 = _3669 + 1.0;
            _3753 = _3647;
            _3755 = _3649;
            _3757 = _3651;
            _3759 = _3653;
            _3729 = _3793;
            _3731 = _3795;
            _3733 = _3797;
            _3735 = _3799;
        }
    }
    _3761 = false;
    float _3801 = _3713;
    float _3803 = _3715;
    float _3805 = _3717;
    float _3807 = _3719;
    float _3809 = _3753;
    float _3811 = _3755;
    float _3813 = _3757;
    float _3815 = _3759;
    float _3817 = _3721;
    float _3819 = _3723;
    float _3821 = _3725;
    float _3823 = _3727;
    float _3825 = _3729;
    float _3827 = _3731;
    float _3829 = _3733;
    float _3831 = _3735;
    float _3833 = -_2534;
    float _3835 = _166 + _3833;
    float _3837 = -_2538;
    float _3839 = _164 + _3837;
    float _3841 = _2548 * _3835;
    float _3843 = -_2542;
    float _3845 = _168 + _3843;
    float _3847 = fma(_2552, _3839, _3841);
    float _3849 = fma(_2556, _3845, _3847);
    float _3851 = _2584 * _3849;
    float _3853 = rint(_3851);
    float _3855 = precise::max(0.0, _3853);
    float _3857 = precise::min(_3855, 3.0);
    float _3859 = trunc(_3857);
    int _3861 = int(_3859);
    bool _3863 = _3861 >= 2;
    bool _3865 = !_3863;
    float _3867 = _3853;
    float _3869 = as_type<float>(_3861);
    float _3871 = _3841;
    float _3873 = _3847;
    float _3875 = _3801;
    float _3877 = _3803;
    float _3879 = _3805;
    float _3881 = _3807;
    float _3883 = _3817;
    float _3885 = _3819;
    float _3887 = _3821;
    float _3889 = _3823;
    float _3891 = _3825;
    float _3893 = _3827;
    float _3895 = _3829;
    float _3897 = _3831;
    float _3915;
    float _3917;
    float _3919;
    float _3921;
    if (!_3865)
    {
        bool _3899 = _3861 >= 3;
        bool _3901 = !_3899;
        if (!_3901)
        {
            bool _3903 = _3861 != 3;
            _3905 = _3903;
            if (!_3905)
            {
                float _3907 = _164 + _3801;
                float _3909 = _166 + _3803;
                float _3911 = _168 + _3805;
                float _3913 = _3807 + 1.0;
                _3875 = _3907;
                _3877 = _3909;
                _3879 = _3911;
                _3881 = _3913;
                _3915 = _3809;
                _3917 = _3811;
                _3919 = _3813;
                _3921 = _3815;
                _3923 = true;
            }
        }
        else
        {
            float _3925 = _164 + _3817;
            float _3927 = _166 + _3819;
            float _3929 = _168 + _3821;
            float _3931 = _3823 + 1.0;
            _3915 = _3809;
            _3917 = _3811;
            _3919 = _3813;
            _3921 = _3815;
            _3883 = _3925;
            _3885 = _3927;
            _3887 = _3929;
            _3889 = _3931;
            _3923 = true;
        }
    }
    if ((!_3923) || _3905)
    {
        bool _3933;
        if (!_3905)
        {
            _3933 = _3861 >= 1;
        }
        if ((!_3933) || _3905)
        {
            if (!_3905)
            {
                bool _3935 = _3861 != 0;
                if (!_3935)
                {
                    float _3937 = _164 + _3809;
                    _3867 = _3937;
                }
                float _3939 = _3867;
                _3915 = _3939;
                if (!_3935)
                {
                    float _3941 = _166 + _3811;
                    _3869 = _3941;
                }
                float _3943 = _3869;
                _3917 = _3943;
                if (!_3935)
                {
                    float _3945 = _168 + _3813;
                    _3871 = _3945;
                }
                float _3947 = _3871;
                _3919 = _3947;
                if (!_3935)
                {
                    float _3949 = _3815 + 1.0;
                    _3873 = _3949;
                }
                float _3951 = _3873;
                bool _3953 = !_3935;
                _3921 = _3951;
                _3923 = _3953;
            }
            if ((!_3923) || _3905)
            {
                _3905 = false;
                _3915 = _3809;
                _3917 = _3811;
                _3919 = _3813;
                _3921 = _3815;
                _3923 = true;
            }
        }
        else
        {
            float _3955 = _164 + _3825;
            float _3957 = _166 + _3827;
            float _3959 = _168 + _3829;
            float _3961 = _3831 + 1.0;
            _3915 = _3809;
            _3917 = _3811;
            _3919 = _3813;
            _3921 = _3815;
            _3891 = _3955;
            _3893 = _3957;
            _3895 = _3959;
            _3897 = _3961;
        }
    }
    _3923 = false;
    float _3963 = _3875;
    float _3965 = _3877;
    float _3967 = _3879;
    float _3969 = _3881;
    float _3971 = _3915;
    float _3973 = _3917;
    float _3975 = _3919;
    float _3977 = _3921;
    float _3979 = _3883;
    float _3981 = _3885;
    float _3983 = _3887;
    float _3985 = _3889;
    float _3987 = _3891;
    float _3989 = _3893;
    float _3991 = _3895;
    float _3993 = _3897;
    float _3995 = -_2534;
    float _3997 = _176 + _3995;
    float _3999 = -_2538;
    float _4001 = _174 + _3999;
    float _4003 = _2548 * _3997;
    float _4005 = -_2542;
    float _4007 = _178 + _4005;
    float _4009 = fma(_2552, _4001, _4003);
    float _4011 = fma(_2556, _4007, _4009);
    float _4013 = _2584 * _4011;
    float _4015 = rint(_4013);
    float _4017 = precise::max(0.0, _4015);
    float _4019 = precise::min(_4017, 3.0);
    float _4021 = trunc(_4019);
    int _4023 = int(_4021);
    bool _4025 = _4023 >= 2;
    bool _4027 = !_4025;
    float _4029 = as_type<float>(_4023);
    float _4031 = _4015;
    float _4033 = _4009;
    float _4035 = _4003;
    float _4037 = _3963;
    float _4039 = _3965;
    float _4041 = _3967;
    float _4043 = _3969;
    float _4045 = _3979;
    float _4047 = _3981;
    float _4049 = _3983;
    float _4051 = _3985;
    float _4053 = _3987;
    float _4055 = _3989;
    float _4057 = _3991;
    float _4059 = _3993;
    float _4077;
    float _4079;
    float _4081;
    float _4083;
    if (!_4027)
    {
        bool _4061 = _4023 >= 3;
        bool _4063 = !_4061;
        if (!_4063)
        {
            bool _4065 = _4023 != 3;
            _4067 = _4065;
            if (!_4067)
            {
                float _4069 = _174 + _3963;
                float _4071 = _176 + _3965;
                float _4073 = _178 + _3967;
                float _4075 = _3969 + 1.0;
                _4037 = _4069;
                _4039 = _4071;
                _4041 = _4073;
                _4043 = _4075;
                _4077 = _3971;
                _4079 = _3973;
                _4081 = _3975;
                _4083 = _3977;
                _4085 = true;
            }
        }
        else
        {
            float _4087 = _174 + _3979;
            float _4089 = _176 + _3981;
            float _4091 = _178 + _3983;
            float _4093 = _3985 + 1.0;
            _4077 = _3971;
            _4079 = _3973;
            _4081 = _3975;
            _4083 = _3977;
            _4045 = _4087;
            _4047 = _4089;
            _4049 = _4091;
            _4051 = _4093;
            _4085 = true;
        }
    }
    if ((!_4085) || _4067)
    {
        bool _4095;
        if (!_4067)
        {
            _4095 = _4023 >= 1;
        }
        if ((!_4095) || _4067)
        {
            if (!_4067)
            {
                bool _4097 = _4023 != 0;
                if (!_4097)
                {
                    float _4099 = _174 + _3971;
                    _4029 = _4099;
                }
                float _4101 = _4029;
                _4077 = _4101;
                if (!_4097)
                {
                    float _4103 = _176 + _3973;
                    _4031 = _4103;
                }
                float _4105 = _4031;
                _4079 = _4105;
                if (!_4097)
                {
                    float _4107 = _178 + _3975;
                    _4033 = _4107;
                }
                float _4109 = _4033;
                _4081 = _4109;
                if (!_4097)
                {
                    float _4111 = _3977 + 1.0;
                    _4035 = _4111;
                }
                float _4113 = _4035;
                bool _4115 = !_4097;
                _4083 = _4113;
                _4085 = _4115;
            }
            if ((!_4085) || _4067)
            {
                _4067 = false;
                _4077 = _3971;
                _4079 = _3973;
                _4081 = _3975;
                _4083 = _3977;
                _4085 = true;
            }
        }
        else
        {
            float _4117 = _174 + _3987;
            float _4119 = _176 + _3989;
            float _4121 = _178 + _3991;
            float _4123 = _3993 + 1.0;
            _4077 = _3971;
            _4079 = _3973;
            _4081 = _3975;
            _4083 = _3977;
            _4053 = _4117;
            _4055 = _4119;
            _4057 = _4121;
            _4059 = _4123;
        }
    }
    _4085 = false;
    float _4125 = _4037;
    float _4127 = _4039;
    float _4129 = _4041;
    float _4131 = _4043;
    float _4133 = _4077;
    float _4135 = _4079;
    float _4137 = _4081;
    float _4139 = _4083;
    float _4141 = _4045;
    float _4143 = _4047;
    float _4145 = _4049;
    float _4147 = _4051;
    float _4149 = _4053;
    float _4151 = _4055;
    float _4153 = _4057;
    float _4155 = _4059;
    float _4157 = -_2534;
    float _4159 = _186 + _4157;
    float _4161 = -_2538;
    float _4163 = _184 + _4161;
    float _4165 = _2548 * _4159;
    float _4167 = -_2542;
    float _4169 = _188 + _4167;
    float _4171 = fma(_2552, _4163, _4165);
    float _4173 = fma(_2556, _4169, _4171);
    float _4175 = _2584 * _4173;
    float _4177 = rint(_4175);
    float _4179 = precise::max(0.0, _4177);
    float _4181 = precise::min(_4179, 3.0);
    float _4183 = trunc(_4181);
    int _4185 = int(_4183);
    bool _4187 = _4185 >= 2;
    bool _4189 = !_4187;
    float _4191 = _4177;
    float _4193 = as_type<float>(_4185);
    float _4195 = _4165;
    float _4197 = _4171;
    float _4199 = _4125;
    float _4201 = _4127;
    float _4203 = _4129;
    float _4205 = _4131;
    float _4207 = _4141;
    float _4209 = _4143;
    float _4211 = _4145;
    float _4213 = _4147;
    float _4215 = _4149;
    float _4217 = _4151;
    float _4219 = _4153;
    float _4221 = _4155;
    float _4239;
    float _4241;
    float _4243;
    float _4245;
    if (!_4189)
    {
        bool _4223 = _4185 >= 3;
        bool _4225 = !_4223;
        if (!_4225)
        {
            bool _4227 = _4185 != 3;
            _4229 = _4227;
            if (!_4229)
            {
                float _4231 = _184 + _4125;
                float _4233 = _186 + _4127;
                float _4235 = _188 + _4129;
                float _4237 = _4131 + 1.0;
                _4199 = _4231;
                _4201 = _4233;
                _4203 = _4235;
                _4205 = _4237;
                _4239 = _4133;
                _4241 = _4135;
                _4243 = _4137;
                _4245 = _4139;
                _4247 = true;
            }
        }
        else
        {
            float _4249 = _184 + _4141;
            float _4251 = _186 + _4143;
            float _4253 = _188 + _4145;
            float _4255 = _4147 + 1.0;
            _4239 = _4133;
            _4241 = _4135;
            _4243 = _4137;
            _4245 = _4139;
            _4207 = _4249;
            _4209 = _4251;
            _4211 = _4253;
            _4213 = _4255;
            _4247 = true;
        }
    }
    if ((!_4247) || _4229)
    {
        bool _4257;
        if (!_4229)
        {
            _4257 = _4185 >= 1;
        }
        if ((!_4257) || _4229)
        {
            if (!_4229)
            {
                bool _4259 = _4185 != 0;
                if (!_4259)
                {
                    float _4261 = _184 + _4133;
                    _4191 = _4261;
                }
                float _4263 = _4191;
                _4239 = _4263;
                if (!_4259)
                {
                    float _4265 = _186 + _4135;
                    _4193 = _4265;
                }
                float _4267 = _4193;
                _4241 = _4267;
                if (!_4259)
                {
                    float _4269 = _188 + _4137;
                    _4195 = _4269;
                }
                float _4271 = _4195;
                _4243 = _4271;
                if (!_4259)
                {
                    float _4273 = _4139 + 1.0;
                    _4197 = _4273;
                }
                float _4275 = _4197;
                bool _4277 = !_4259;
                _4245 = _4275;
                _4247 = _4277;
            }
            if ((!_4247) || _4229)
            {
                _4229 = false;
                _4239 = _4133;
                _4241 = _4135;
                _4243 = _4137;
                _4245 = _4139;
                _4247 = true;
            }
        }
        else
        {
            float _4279 = _184 + _4149;
            float _4281 = _186 + _4151;
            float _4283 = _188 + _4153;
            float _4285 = _4155 + 1.0;
            _4239 = _4133;
            _4241 = _4135;
            _4243 = _4137;
            _4245 = _4139;
            _4215 = _4279;
            _4217 = _4281;
            _4219 = _4283;
            _4221 = _4285;
        }
    }
    _4247 = false;
    float _4287 = _4199;
    float _4289 = _4201;
    float _4291 = _4203;
    float _4293 = _4205;
    float _4295 = _4239;
    float _4297 = _4241;
    float _4299 = _4243;
    float _4301 = _4245;
    float _4303 = _4207;
    float _4305 = _4209;
    float _4307 = _4211;
    float _4309 = _4213;
    float _4311 = _4215;
    float _4313 = _4217;
    float _4315 = _4219;
    float _4317 = _4221;
    float _4319 = -_2534;
    float _4321 = _196 + _4319;
    float _4323 = -_2538;
    float _4325 = _194 + _4323;
    float _4327 = _2548 * _4321;
    float _4329 = -_2542;
    float _4331 = _198 + _4329;
    float _4333 = fma(_2552, _4325, _4327);
    float _4335 = fma(_2556, _4331, _4333);
    float _4337 = _2584 * _4335;
    float _4339 = rint(_4337);
    float _4341 = precise::max(0.0, _4339);
    float _4343 = precise::min(_4341, 3.0);
    float _4345 = trunc(_4343);
    int _4347 = int(_4345);
    bool _4349 = _4347 >= 2;
    bool _4351 = !_4349;
    float _4353 = as_type<float>(_4347);
    float _4355 = _4339;
    float _4357 = _4333;
    float _4359 = _4327;
    float _4361 = _4287;
    float _4363 = _4289;
    float _4365 = _4291;
    float _4367 = _4293;
    float _4369 = _4303;
    float _4371 = _4305;
    float _4373 = _4307;
    float _4375 = _4309;
    float _4377 = _4311;
    float _4379 = _4313;
    float _4381 = _4315;
    float _4383 = _4317;
    float _4401;
    float _4403;
    float _4405;
    float _4407;
    if (!_4351)
    {
        bool _4385 = _4347 >= 3;
        bool _4387 = !_4385;
        if (!_4387)
        {
            bool _4389 = _4347 != 3;
            _4391 = _4389;
            if (!_4391)
            {
                float _4393 = _194 + _4287;
                float _4395 = _196 + _4289;
                float _4397 = _198 + _4291;
                float _4399 = _4293 + 1.0;
                _4361 = _4393;
                _4363 = _4395;
                _4365 = _4397;
                _4367 = _4399;
                _4401 = _4295;
                _4403 = _4297;
                _4405 = _4299;
                _4407 = _4301;
                _4409 = true;
            }
        }
        else
        {
            float _4411 = _194 + _4303;
            float _4413 = _196 + _4305;
            float _4415 = _198 + _4307;
            float _4417 = _4309 + 1.0;
            _4401 = _4295;
            _4403 = _4297;
            _4405 = _4299;
            _4407 = _4301;
            _4369 = _4411;
            _4371 = _4413;
            _4373 = _4415;
            _4375 = _4417;
            _4409 = true;
        }
    }
    if ((!_4409) || _4391)
    {
        bool _4419;
        if (!_4391)
        {
            _4419 = _4347 >= 1;
        }
        if ((!_4419) || _4391)
        {
            if (!_4391)
            {
                bool _4421 = _4347 != 0;
                if (!_4421)
                {
                    float _4423 = _194 + _4295;
                    _4353 = _4423;
                }
                float _4425 = _4353;
                _4401 = _4425;
                if (!_4421)
                {
                    float _4427 = _196 + _4297;
                    _4355 = _4427;
                }
                float _4429 = _4355;
                _4403 = _4429;
                if (!_4421)
                {
                    float _4431 = _198 + _4299;
                    _4357 = _4431;
                }
                float _4433 = _4357;
                _4405 = _4433;
                if (!_4421)
                {
                    float _4435 = _4301 + 1.0;
                    _4359 = _4435;
                }
                float _4437 = _4359;
                bool _4439 = !_4421;
                _4407 = _4437;
                _4409 = _4439;
            }
            if ((!_4409) || _4391)
            {
                _4391 = false;
                _4401 = _4295;
                _4403 = _4297;
                _4405 = _4299;
                _4407 = _4301;
                _4409 = true;
            }
        }
        else
        {
            float _4441 = _194 + _4311;
            float _4443 = _196 + _4313;
            float _4445 = _198 + _4315;
            float _4447 = _4317 + 1.0;
            _4401 = _4295;
            _4403 = _4297;
            _4405 = _4299;
            _4407 = _4301;
            _4377 = _4441;
            _4379 = _4443;
            _4381 = _4445;
            _4383 = _4447;
        }
    }
    _4409 = false;
    float _4449 = _4361;
    float _4451 = _4363;
    float _4453 = _4365;
    float _4455 = _4367;
    float _4457 = _4401;
    float _4459 = _4403;
    float _4461 = _4405;
    float _4463 = _4407;
    float _4465 = _4369;
    float _4467 = _4371;
    float _4469 = _4373;
    float _4471 = _4375;
    float _4473 = _4377;
    float _4475 = _4379;
    float _4477 = _4381;
    float _4479 = _4383;
    float _4481 = -_2534;
    float _4483 = _206 + _4481;
    float _4485 = -_2538;
    float _4487 = _204 + _4485;
    float _4489 = _2548 * _4483;
    float _4491 = -_2542;
    float _4493 = _208 + _4491;
    float _4495 = fma(_2552, _4487, _4489);
    float _4497 = fma(_2556, _4493, _4495);
    float _4499 = _2584 * _4497;
    float _4501 = rint(_4499);
    float _4503 = precise::max(0.0, _4501);
    float _4505 = precise::min(_4503, 3.0);
    float _4507 = trunc(_4505);
    int _4509 = int(_4507);
    bool _4511 = _4509 >= 2;
    bool _4513 = !_4511;
    float _4515 = _4501;
    float _4517 = as_type<float>(_4509);
    float _4519 = _4489;
    float _4521 = _4495;
    float _4523 = _4449;
    float _4525 = _4451;
    float _4527 = _4453;
    float _4529 = _4455;
    float _4531 = _4465;
    float _4533 = _4467;
    float _4535 = _4469;
    float _4537 = _4471;
    float _4539 = _4473;
    float _4541 = _4475;
    float _4543 = _4477;
    float _4545 = _4479;
    float _4563;
    float _4565;
    float _4567;
    float _4569;
    if (!_4513)
    {
        bool _4547 = _4509 >= 3;
        bool _4549 = !_4547;
        if (!_4549)
        {
            bool _4551 = _4509 != 3;
            _4553 = _4551;
            if (!_4553)
            {
                float _4555 = _204 + _4449;
                float _4557 = _206 + _4451;
                float _4559 = _208 + _4453;
                float _4561 = _4455 + 1.0;
                _4523 = _4555;
                _4525 = _4557;
                _4527 = _4559;
                _4529 = _4561;
                _4563 = _4457;
                _4565 = _4459;
                _4567 = _4461;
                _4569 = _4463;
                _4571 = true;
            }
        }
        else
        {
            float _4573 = _204 + _4465;
            float _4575 = _206 + _4467;
            float _4577 = _208 + _4469;
            float _4579 = _4471 + 1.0;
            _4563 = _4457;
            _4565 = _4459;
            _4567 = _4461;
            _4569 = _4463;
            _4531 = _4573;
            _4533 = _4575;
            _4535 = _4577;
            _4537 = _4579;
            _4571 = true;
        }
    }
    if ((!_4571) || _4553)
    {
        bool _4581;
        if (!_4553)
        {
            _4581 = _4509 >= 1;
        }
        if ((!_4581) || _4553)
        {
            if (!_4553)
            {
                bool _4583 = _4509 != 0;
                if (!_4583)
                {
                    float _4585 = _204 + _4457;
                    _4515 = _4585;
                }
                float _4587 = _4515;
                _4563 = _4587;
                if (!_4583)
                {
                    float _4589 = _206 + _4459;
                    _4517 = _4589;
                }
                float _4591 = _4517;
                _4565 = _4591;
                if (!_4583)
                {
                    float _4593 = _208 + _4461;
                    _4519 = _4593;
                }
                float _4595 = _4519;
                _4567 = _4595;
                if (!_4583)
                {
                    float _4597 = _4463 + 1.0;
                    _4521 = _4597;
                }
                float _4599 = _4521;
                bool _4601 = !_4583;
                _4569 = _4599;
                _4571 = _4601;
            }
            if ((!_4571) || _4553)
            {
                _4553 = false;
                _4563 = _4457;
                _4565 = _4459;
                _4567 = _4461;
                _4569 = _4463;
                _4571 = true;
            }
        }
        else
        {
            float _4603 = _204 + _4473;
            float _4605 = _206 + _4475;
            float _4607 = _208 + _4477;
            float _4609 = _4479 + 1.0;
            _4563 = _4457;
            _4565 = _4459;
            _4567 = _4461;
            _4569 = _4463;
            _4539 = _4603;
            _4541 = _4605;
            _4543 = _4607;
            _4545 = _4609;
        }
    }
    _4571 = false;
    float _4611 = _4523;
    float _4613 = _4525;
    float _4615 = _4527;
    float _4617 = _4529;
    float _4619 = _4563;
    float _4621 = _4565;
    float _4623 = _4567;
    float _4625 = _4569;
    float _4627 = _4531;
    float _4629 = _4533;
    float _4631 = _4535;
    float _4633 = _4537;
    float _4635 = _4539;
    float _4637 = _4541;
    float _4639 = _4543;
    float _4641 = _4545;
    float _4643 = -_2534;
    float _4645 = _216 + _4643;
    float _4647 = -_2538;
    float _4649 = _214 + _4647;
    float _4651 = _2548 * _4645;
    float _4653 = -_2542;
    float _4655 = _218 + _4653;
    float _4657 = fma(_2552, _4649, _4651);
    float _4659 = fma(_2556, _4655, _4657);
    float _4661 = _2584 * _4659;
    float _4663 = rint(_4661);
    float _4665 = precise::max(0.0, _4663);
    float _4667 = precise::min(_4665, 3.0);
    float _4669 = trunc(_4667);
    int _4671 = int(_4669);
    bool _4673 = _4671 >= 2;
    bool _4675 = !_4673;
    float _4677 = as_type<float>(_4671);
    float _4679 = _4663;
    float _4681 = _4657;
    float _4683 = _4651;
    float _4685 = _4611;
    float _4687 = _4613;
    float _4689 = _4615;
    float _4691 = _4617;
    float _4693 = _4627;
    float _4695 = _4629;
    float _4697 = _4631;
    float _4699 = _4633;
    float _4701 = _4635;
    float _4703 = _4637;
    float _4705 = _4639;
    float _4707 = _4641;
    float _4725;
    float _4727;
    float _4729;
    float _4731;
    if (!_4675)
    {
        bool _4709 = _4671 >= 3;
        bool _4711 = !_4709;
        if (!_4711)
        {
            bool _4713 = _4671 != 3;
            _4715 = _4713;
            if (!_4715)
            {
                float _4717 = _214 + _4611;
                float _4719 = _216 + _4613;
                float _4721 = _218 + _4615;
                float _4723 = _4617 + 1.0;
                _4685 = _4717;
                _4687 = _4719;
                _4689 = _4721;
                _4691 = _4723;
                _4725 = _4619;
                _4727 = _4621;
                _4729 = _4623;
                _4731 = _4625;
                _4733 = true;
            }
        }
        else
        {
            float _4735 = _214 + _4627;
            float _4737 = _216 + _4629;
            float _4739 = _218 + _4631;
            float _4741 = _4633 + 1.0;
            _4725 = _4619;
            _4727 = _4621;
            _4729 = _4623;
            _4731 = _4625;
            _4693 = _4735;
            _4695 = _4737;
            _4697 = _4739;
            _4699 = _4741;
            _4733 = true;
        }
    }
    if ((!_4733) || _4715)
    {
        bool _4743;
        if (!_4715)
        {
            _4743 = _4671 >= 1;
        }
        if ((!_4743) || _4715)
        {
            if (!_4715)
            {
                bool _4745 = _4671 != 0;
                if (!_4745)
                {
                    float _4747 = _214 + _4619;
                    _4677 = _4747;
                }
                float _4749 = _4677;
                _4725 = _4749;
                if (!_4745)
                {
                    float _4751 = _216 + _4621;
                    _4679 = _4751;
                }
                float _4753 = _4679;
                _4727 = _4753;
                if (!_4745)
                {
                    float _4755 = _218 + _4623;
                    _4681 = _4755;
                }
                float _4757 = _4681;
                _4729 = _4757;
                if (!_4745)
                {
                    float _4759 = _4625 + 1.0;
                    _4683 = _4759;
                }
                float _4761 = _4683;
                bool _4763 = !_4745;
                _4731 = _4761;
                _4733 = _4763;
            }
            if ((!_4733) || _4715)
            {
                _4715 = false;
                _4725 = _4619;
                _4727 = _4621;
                _4729 = _4623;
                _4731 = _4625;
                _4733 = true;
            }
        }
        else
        {
            float _4765 = _214 + _4635;
            float _4767 = _216 + _4637;
            float _4769 = _218 + _4639;
            float _4771 = _4641 + 1.0;
            _4725 = _4619;
            _4727 = _4621;
            _4729 = _4623;
            _4731 = _4625;
            _4701 = _4765;
            _4703 = _4767;
            _4705 = _4769;
            _4707 = _4771;
        }
    }
    _4733 = false;
    float _4773 = _4685;
    float _4775 = _4687;
    float _4777 = _4689;
    float _4779 = _4691;
    float _4781 = _4725;
    float _4783 = _4727;
    float _4785 = _4729;
    float _4787 = _4731;
    float _4789 = _4693;
    float _4791 = _4695;
    float _4793 = _4697;
    float _4795 = _4699;
    float _4797 = _4701;
    float _4799 = _4703;
    float _4801 = _4705;
    float _4803 = _4707;
    float _4805 = -_2534;
    float _4807 = _226 + _4805;
    float _4809 = -_2538;
    float _4811 = _224 + _4809;
    float _4813 = _2548 * _4807;
    float _4815 = -_2542;
    float _4817 = _228 + _4815;
    float _4819 = fma(_2552, _4811, _4813);
    float _4821 = fma(_2556, _4817, _4819);
    float _4823 = _2584 * _4821;
    float _4825 = rint(_4823);
    float _4827 = precise::max(0.0, _4825);
    float _4829 = precise::min(_4827, 3.0);
    float _4831 = trunc(_4829);
    int _4833 = int(_4831);
    bool _4835 = _4833 >= 2;
    bool _4837 = !_4835;
    float _4839 = _4825;
    float _4841 = as_type<float>(_4833);
    float _4843 = _4813;
    float _4845 = _4819;
    float _4847 = _4773;
    float _4849 = _4775;
    float _4851 = _4777;
    float _4853 = _4779;
    float _4855 = _4789;
    float _4857 = _4791;
    float _4859 = _4793;
    float _4861 = _4795;
    float _4863 = _4797;
    float _4865 = _4799;
    float _4867 = _4801;
    float _4869 = _4803;
    float _4887;
    float _4889;
    float _4891;
    float _4893;
    if (!_4837)
    {
        bool _4871 = _4833 >= 3;
        bool _4873 = !_4871;
        if (!_4873)
        {
            bool _4875 = _4833 != 3;
            _4877 = _4875;
            if (!_4877)
            {
                float _4879 = _224 + _4773;
                float _4881 = _226 + _4775;
                float _4883 = _228 + _4777;
                float _4885 = _4779 + 1.0;
                _4847 = _4879;
                _4849 = _4881;
                _4851 = _4883;
                _4853 = _4885;
                _4887 = _4781;
                _4889 = _4783;
                _4891 = _4785;
                _4893 = _4787;
                _4895 = true;
            }
        }
        else
        {
            float _4897 = _224 + _4789;
            float _4899 = _226 + _4791;
            float _4901 = _228 + _4793;
            float _4903 = _4795 + 1.0;
            _4887 = _4781;
            _4889 = _4783;
            _4891 = _4785;
            _4893 = _4787;
            _4855 = _4897;
            _4857 = _4899;
            _4859 = _4901;
            _4861 = _4903;
            _4895 = true;
        }
    }
    if ((!_4895) || _4877)
    {
        bool _4905;
        if (!_4877)
        {
            _4905 = _4833 >= 1;
        }
        if ((!_4905) || _4877)
        {
            if (!_4877)
            {
                bool _4907 = _4833 != 0;
                if (!_4907)
                {
                    float _4909 = _224 + _4781;
                    _4839 = _4909;
                }
                float _4911 = _4839;
                _4887 = _4911;
                if (!_4907)
                {
                    float _4913 = _226 + _4783;
                    _4841 = _4913;
                }
                float _4915 = _4841;
                _4889 = _4915;
                if (!_4907)
                {
                    float _4917 = _228 + _4785;
                    _4843 = _4917;
                }
                float _4919 = _4843;
                _4891 = _4919;
                if (!_4907)
                {
                    float _4921 = _4787 + 1.0;
                    _4845 = _4921;
                }
                float _4923 = _4845;
                bool _4925 = !_4907;
                _4893 = _4923;
                _4895 = _4925;
            }
            if ((!_4895) || _4877)
            {
                _4877 = false;
                _4887 = _4781;
                _4889 = _4783;
                _4891 = _4785;
                _4893 = _4787;
                _4895 = true;
            }
        }
        else
        {
            float _4927 = _224 + _4797;
            float _4929 = _226 + _4799;
            float _4931 = _228 + _4801;
            float _4933 = _4803 + 1.0;
            _4887 = _4781;
            _4889 = _4783;
            _4891 = _4785;
            _4893 = _4787;
            _4863 = _4927;
            _4865 = _4929;
            _4867 = _4931;
            _4869 = _4933;
        }
    }
    _4895 = false;
    float _4935 = _4847;
    float _4937 = _4849;
    float _4939 = _4851;
    float _4941 = _4853;
    float _4943 = _4887;
    float _4945 = _4889;
    float _4947 = _4891;
    float _4949 = _4893;
    float _4951 = _4855;
    float _4953 = _4857;
    float _4955 = _4859;
    float _4957 = _4861;
    float _4959 = _4863;
    float _4961 = _4865;
    float _4963 = _4867;
    float _4965 = _4869;
    float _4967 = -_2534;
    float _4969 = _236 + _4967;
    float _4971 = -_2538;
    float _4973 = _234 + _4971;
    float _4975 = _2548 * _4969;
    float _4977 = -_2542;
    float _4979 = _238 + _4977;
    float _4981 = fma(_2552, _4973, _4975);
    float _4983 = fma(_2556, _4979, _4981);
    float _4985 = _2584 * _4983;
    float _4987 = rint(_4985);
    float _4989 = precise::max(0.0, _4987);
    float _4991 = precise::min(_4989, 3.0);
    float _4993 = trunc(_4991);
    int _4995 = int(_4993);
    bool _4997 = _4995 >= 2;
    bool _4999 = !_4997;
    float _5001 = as_type<float>(_4995);
    float _5003 = _4987;
    float _5005 = _4981;
    float _5007 = _4975;
    float _5009 = _4951;
    float _5011 = _4953;
    float _5013 = _4959;
    float _5015 = _4961;
    float _5017 = _4965;
    float _5019 = _4957;
    float _5021 = _4941;
    float _5023 = _4963;
    float _5025 = _4955;
    float _5027 = _4935;
    float _5029 = _4937;
    float _5031 = _4939;
    float _5049;
    float _5051;
    float _5053;
    float _5055;
    if (!_4999)
    {
        bool _5033 = _4995 >= 3;
        bool _5035 = !_5033;
        if (!_5035)
        {
            bool _5037 = _4995 != 3;
            _5039 = _5037;
            if (!_5039)
            {
                float _5041 = _234 + _4935;
                float _5043 = _236 + _4937;
                float _5045 = _238 + _4939;
                float _5047 = _4941 + 1.0;
                _5049 = _4943;
                _5051 = _4949;
                _5021 = _5047;
                _5053 = _4945;
                _5055 = _4947;
                _5027 = _5041;
                _5029 = _5043;
                _5031 = _5045;
                _5057 = true;
            }
        }
        else
        {
            float _5059 = _234 + _4951;
            float _5061 = _236 + _4953;
            float _5063 = _238 + _4955;
            float _5065 = _4957 + 1.0;
            _5009 = _5059;
            _5011 = _5061;
            _5019 = _5065;
            _5049 = _4943;
            _5051 = _4949;
            _5053 = _4945;
            _5025 = _5063;
            _5055 = _4947;
            _5057 = true;
        }
    }
    if ((!_5057) || _5039)
    {
        bool _5067;
        if (!_5039)
        {
            _5067 = _4995 >= 1;
        }
        if ((!_5067) || _5039)
        {
            if (!_5039)
            {
                bool _5069 = _4995 != 0;
                if (!_5069)
                {
                    float _5071 = _234 + _4943;
                    _5001 = _5071;
                }
                float _5073 = _5001;
                _5049 = _5073;
                if (!_5069)
                {
                    float _5075 = _236 + _4945;
                    _5003 = _5075;
                }
                float _5077 = _5003;
                _5053 = _5077;
                if (!_5069)
                {
                    float _5079 = _238 + _4947;
                    _5005 = _5079;
                }
                float _5081 = _5005;
                _5055 = _5081;
                if (!_5069)
                {
                    float _5083 = _4949 + 1.0;
                    _5007 = _5083;
                }
                float _5085 = _5007;
                bool _5087 = !_5069;
                _5051 = _5085;
                _5057 = _5087;
            }
            if ((!_5057) || _5039)
            {
                _5039 = false;
                _5049 = _4943;
                _5051 = _4949;
                _5053 = _4945;
                _5055 = _4947;
                _5057 = true;
            }
        }
        else
        {
            float _5089 = _234 + _4959;
            float _5091 = _236 + _4961;
            float _5093 = _238 + _4963;
            float _5095 = _4965 + 1.0;
            _5013 = _5089;
            _5015 = _5091;
            _5017 = _5095;
            _5049 = _4943;
            _5051 = _4949;
            _5053 = _4945;
            _5023 = _5093;
            _5055 = _4947;
        }
    }
    _5057 = false;
    float _5097 = _5009;
    float _5099 = _5011;
    float _5101 = _5013;
    float _5103 = _5015;
    float _5105 = _5017;
    float _5107 = _5019;
    float _5109 = _5049;
    float _5111 = _5051;
    float _5113 = _5021;
    float _5115 = _5053;
    float _5117 = _5023;
    float _5119 = _5025;
    float _5121 = _5055;
    float _5123 = _5027;
    float _5125 = _5029;
    float _5127 = _5031;
    float _5129 = _5097 * 6.0;
    float _5131 = _5099 * 6.0;
    float _5133 = _5101 * 6.0;
    float _5135 = _5103 * 6.0;
    float _5137 = fma(_5101, 3.0, _5129);
    float _5139 = fma(_5103, 3.0, _5131);
    float _5141 = _5105 * 4.0;
    float _5143 = fma(_5107, 4.0, _5105);
    _24[1] = as_type<uint>(_194);
    float _5145 = fma(_5109, 9.0, _5133);
    float _5147 = fma(_5111, 9.0, _5141);
    float _5149 = fma(_5113, 9.0, _5143);
    _24[0] = as_type<uint>(_198);
    float _5151 = precise::max(_150, _160);
    float _5153 = fma(_5115, 9.0, _5135);
    float _5155 = precise::max(_190, _200);
    float _5157 = _5117 * 6.0;
    float _5159 = precise::max(_130, _140);
    float _5161 = _5119 * 6.0;
    float _5163 = _5107 + _5105;
    float _5165 = precise::max(_170, _180);
    float _5167 = fma(_5121, 9.0, _5157);
    float _5169 = precise::max(_5159, _5151);
    float _5171 = fma(_5117, 3.0, _5161);
    float _5173 = precise::max(_5165, _5155);
    float _5175 = as_type<float>(_24[1]);
    float _5177 = precise::max(_100, _90);
    float _5179 = _5147 + _5107;
    float _5181 = precise::max(_110, _120);
    float _5183 = as_type<float>(_24[0]);
    float _5185 = precise::max(_210, _220);
    float _5187 = _5179 * _5149;
    float _5189 = precise::max(_5177, _5181);
    float _5191 = _5163 * 2.0;
    float _5193 = precise::max(_230, _240);
    float _5195 = -_5187;
    float _5197 = fma(_5191, _5191, _5195);
    bool _5199 = _5197 != 0.0;
    bool _5201 = isnan(_5197);
    bool _5203 = _5199 || _5201;
    bool _5205 = isnan(0.0);
    bool _5207 = _5203 || _5205;
    float _5209 = precise::max(_5185, _5193);
    float _5211 = precise::max(_5189, _5169);
    float _5213 = precise::max(_5173, _5209);
    float _5215 = fma(_5097, 3.0, _5145);
    float _5217 = fma(_5119, 3.0, _5167);
    float _5219 = fma(_5099, 3.0, _5153);
    float _5221 = fma(_5123, 9.0, _5137);
    float _5223 = fma(_5125, 9.0, _5139);
    float _5225 = fma(_5127, 9.0, _5171);
    float _5227 = precise::max(_5211, _5213);
    bool _5229 = !_5207;
    if (!_5229)
    {
        float _5231 = 1.0 / _5197;
        float _5233 = _5179 * _5221;
        float _5235 = _5215 * _5149;
        float _5237 = -_5233;
        float _5239 = fma(_5215, _5191, _5237);
        float _5241 = -_5235;
        float _5243 = fma(_5221, _5191, _5241);
        float _5245 = _5179 * _5223;
        float _5247 = _5219 * _5149;
        float _5249 = _5179 * _5225;
        float _5251 = _5217 * _5149;
        float _5253 = -_5245;
        float _5255 = fma(_5219, _5191, _5253);
        float _5257 = -_5247;
        float _5259 = fma(_5223, _5191, _5257);
        float _5261 = -_5249;
        float _5263 = fma(_5217, _5191, _5261);
        float _5265 = -_5251;
        float _5267 = fma(_5225, _5191, _5265);
        float _5269 = _5259 * _5231;
        float _5271 = _5239 * _5231;
        float _5273 = _5255 * _5231;
        float _5275 = _5263 * _5231;
        float _5277 = _5243 * _5231;
        float _5279 = _5267 * _5231;
        float _5281 = -_5269;
        float _5283 = _5273 + _5281;
        float _5285 = -_5277;
        float _5287 = _5271 + _5285;
        float _5289 = -_5279;
        float _5291 = _5275 + _5289;
        _2603 = _5287;
        _2605 = _5283;
        _2607 = _5291;
        _2609 = _5277;
        _2611 = _5271;
        _2613 = _5269;
        _2615 = _5273;
        _2617 = _5279;
        _2619 = _5275;
    }
    float _5293 = _2603;
    float _5295 = _2605;
    float _5297 = _2607;
    float _5299 = _2609;
    float _5301 = _2611;
    float _5303 = _2613;
    float _5305 = _2615;
    float _5307 = _2617;
    float _5309 = _2619;
    float _5311 = fma(_5293, 496.0, 0.5);
    float _5313 = precise::clamp(_5311, 0.0, 1.0);
    float _5315 = fma(_5295, 1008.0, 0.5);
    float _5317 = precise::clamp(_5315, 0.0, 1.0);
    float _5319 = fma(_5293, -31.0, 1.0);
    float _5321 = precise::clamp(_5319, 0.0, 1.0);
    float _5323 = fma(_5297, 496.0, 0.5);
    float _5325 = precise::clamp(_5323, 0.0, 1.0);
    float _5327 = _5313 + (-0.5);
    float _5329 = fma(_5295, -63.0, 1.0);
    float _5331 = precise::clamp(_5329, 0.0, 1.0);
    float _5333 = _5317 + (-0.5);
    float _5335 = fma(_5297, -31.0, 1.0);
    float _5337 = precise::clamp(_5335, 0.0, 1.0);
    float _5339 = _5321 * _5327;
    float _5341 = _5325 + (-0.5);
    float _5343 = _5331 * _5333;
    float _5345 = _5343 * 2.0;
    float _5347 = _5227 * 255.0;
    float _5349 = fma(_5339, -0.0322580635547637939453125, _5299);
    float _5351 = precise::clamp(_5349, 0.0, 1.0);
    float _5353 = _5337 * _5341;
    float _5355 = fma(_5339, 0.0322580635547637939453125, _5301);
    float _5357 = precise::clamp(_5355, 0.0, 1.0);
    float _5359 = fma(_5345, -0.01587301678955554962158203125, _5303);
    float _5361 = precise::clamp(_5359, 0.0, 1.0);
    float _5363 = fma(_5345, 0.01587301678955554962158203125, _5305);
    float _5365 = precise::clamp(_5363, 0.0, 1.0);
    float _5367 = fma(_5353, -0.0322580635547637939453125, _5307);
    float _5369 = precise::clamp(_5367, 0.0, 1.0);
    float _5371 = _5357 * 31.0;
    float _5373 = fma(_5353, 0.0322580635547637939453125, _5309);
    float _5375 = precise::clamp(_5373, 0.0, 1.0);
    float _5377 = _5351 * 31.0;
    float _5379 = _5361 * 63.0;
    float _5381 = _5365 * 63.0;
    float _5383 = _5369 * 31.0;
    float _5385 = _5375 * 31.0;
    float _5387 = trunc(_5347);
    float _5389 = precise::max(_5387, 0.0);
    uint _5391 = uint(_5389);
    float _5393 = precise::min(_100, _90);
    float _5395 = precise::min(_130, _140);
    float _5397 = precise::min(_170, _180);
    float _5399 = precise::min(_190, _200);
    float _5401 = rint(_5371);
    float _5403 = precise::min(_210, _220);
    float _5405 = precise::min(_230, _240);
    float _5407 = precise::min(_5397, _5399);
    float _5409 = precise::min(_5403, _5405);
    float _5411 = rint(_5381);
    float _5413 = precise::min(_5407, _5409);
    float _5415 = rint(_5377);
    float _5417 = _5401 + 0.5;
    float _5419 = rint(_5379);
    float _5421 = _5411 + 0.5;
    float _5423 = rint(_5383);
    float _5425 = _5415 + 0.5;
    float _5427 = rint(_5385);
    float _5429 = precise::min(_110, _120);
    float _5431 = precise::min(_5393, _5429);
    float _5433 = precise::min(_150, _160);
    float _5435 = trunc(_5417);
    float _5437 = precise::max(_5435, 0.0);
    uint _5439 = uint(_5437);
    float _5441 = precise::min(_5395, _5433);
    float _5443 = _5419 + 0.5;
    float _5445 = precise::min(_5431, _5441);
    float _5447 = _5427 + 0.5;
    float _5449 = trunc(_5421);
    float _5451 = precise::max(_5449, 0.0);
    uint _5453 = uint(_5451);
    float _5455 = precise::min(_5445, _5413);
    float _5457 = _5423 + 0.5;
    float _5459 = _5455 * 255.0;
    float _5461 = trunc(_5425);
    float _5463 = precise::max(_5461, 0.0);
    uint _5465 = uint(_5463);
    int _5467 = int(_5439) << 11;
    float _5469 = trunc(_5443);
    float _5471 = precise::max(_5469, 0.0);
    uint _5473 = uint(_5471);
    int _5475 = int(_5453) << 5;
    float _5477 = trunc(_5447);
    float _5479 = precise::max(_5477, 0.0);
    uint _5481 = uint(_5479);
    int _5483 = int(_5465) << 11;
    float _5485 = trunc(_5457);
    float _5487 = precise::max(_5485, 0.0);
    uint _5489 = uint(_5487);
    int _5491 = int(_5473) << 5;
    float _5493 = trunc(_5459);
    float _5495 = precise::max(_5493, 0.0);
    uint _5497 = uint(_5495);
    int _5499 = _5467 | _5475;
    int _5501 = int(_5481) | _5499;
    int _5503 = _5483 | _5491;
    int _5505 = int(_5489) | _5503;
    bool _5507 = _5501 != _5505;
    bool _5509 = _5391 > _5497;
    int _5511 = int(_5497) << 8;
    int _5513 = _5511 & 65280;
    int _5515 = int(_5473);
    int _5517 = _5511;
    int _5519 = _5475;
    int _5521 = _5513;
    int _5523 = as_type<int>(_5415);
    int _5525 = _5501;
    int _5527 = _5505;
    if (!_5507)
    {
        _5515 = _5501;
    }
    int _5529 = _5515;
    int _5531 = 255 & int(_5391);
    int _5533 = _5513 | _5531;
    int _5535 = _5529;
    if (!_5509)
    {
        _5517 = 0;
    }
    int _5537 = _5517;
    int _5539 = _5537;
    if (!_5507)
    {
        _5519 = 0;
    }
    int _5541 = _5519;
    int _5543 = _5541;
    if (!_5507)
    {
        _5521 = 0;
    }
    int _5545 = _5521;
    bool _5547 = !_5507;
    int _5549 = _5545;
    if (!_5547)
    {
        float _5551 = _5415 * 0.0322580635547637939453125;
        float _5553 = _5411 * 0.01587301678955554962158203125;
        float _5555 = _5419 * 0.01587301678955554962158203125;
        bool _5557 = uint(_5501) >= uint(_5505);
        float _5559 = _5401 * 0.0322580635547637939453125;
        float _5561 = _5427 * 0.0322580635547637939453125;
        float _5563 = _5423 * 0.0322580635547637939453125;
        bool _5565 = !_5557;
        float _5567 = _5565 ? _5553 : _5555;
        bool _5569 = !_5557;
        float _5571 = _5569 ? _5555 : _5553;
        bool _5573 = !_5557;
        float _5575 = _5573 ? _5559 : _5551;
        float _5577 = -_5567;
        float _5579 = _156 + _5577;
        bool _5581 = !_5557;
        float _5583 = _5581 ? _5551 : _5559;
        float _5585 = -_5567;
        float _5587 = _5585 + _5571;
        bool _5589 = !_5557;
        float _5591 = _5589 ? _5561 : _5563;
        float _5593 = -_5575;
        float _5595 = _154 + _5593;
        bool _5597 = !_5557;
        float _5599 = _5597 ? _5563 : _5561;
        float _5601 = -_5575;
        float _5603 = _5601 + _5583;
        float _5605 = -_5575;
        float _5607 = _144 + _5605;
        float _5609 = -_5575;
        float _5611 = _134 + _5609;
        float _5613 = -_5575;
        float _5615 = _124 + _5613;
        float _5617 = -_5575;
        float _5619 = _114 + _5617;
        float _5621 = -_5575;
        float _5623 = _104 + _5621;
        float _5625 = -_5575;
        float _5627 = _84 + _5625;
        float _5629 = -_5575;
        float _5631 = _94 + _5629;
        float _5633 = -_5575;
        float _5635 = _234 + _5633;
        float _5637 = -_5575;
        float _5639 = _224 + _5637;
        float _5641 = -_5575;
        float _5643 = _214 + _5641;
        float _5645 = -_5575;
        float _5647 = _204 + _5645;
        float _5649 = -_5575;
        float _5651 = _5175 + _5649;
        float _5653 = -_5575;
        float _5655 = _184 + _5653;
        float _5657 = -_5575;
        float _5659 = _174 + _5657;
        float _5661 = -_5575;
        float _5663 = _164 + _5661;
        float _5665 = _5587 * _5587;
        float _5667 = -_5591;
        float _5669 = _5667 + _5599;
        float _5671 = -_5567;
        float _5673 = _146 + _5671;
        float _5675 = -_5591;
        float _5677 = _158 + _5675;
        float _5679 = fma(_5603, _5603, _5665);
        float _5681 = -_5591;
        float _5683 = _148 + _5681;
        float _5685 = -_5567;
        float _5687 = _136 + _5685;
        float _5689 = -_5567;
        float _5691 = _126 + _5689;
        float _5693 = fma(_5669, _5669, _5679);
        float _5695 = -_5591;
        float _5697 = _138 + _5695;
        float _5699 = -_5567;
        float _5701 = _116 + _5699;
        float _5703 = -_5567;
        float _5705 = _106 + _5703;
        float _5707 = 1.0 / _5693;
        float _5709 = -_5567;
        float _5711 = _86 + _5709;
        float _5713 = -_5567;
        float _5715 = _96 + _5713;
        float _5717 = -_5567;
        float _5719 = _236 + _5717;
        float _5721 = -_5567;
        float _5723 = _226 + _5721;
        float _5725 = -_5567;
        float _5727 = _216 + _5725;
        float _5729 = -_5567;
        float _5731 = _206 + _5729;
        float _5733 = -_5567;
        float _5735 = _196 + _5733;
        float _5737 = -_5567;
        float _5739 = _186 + _5737;
        float _5741 = -_5567;
        float _5743 = _176 + _5741;
        float _5745 = -_5567;
        float _5747 = _166 + _5745;
        float _5749 = -_5591;
        float _5751 = _128 + _5749;
        float _5753 = -_5591;
        float _5755 = _118 + _5753;
        float _5757 = -_5591;
        float _5759 = _108 + _5757;
        float _5761 = -_5591;
        float _5763 = _88 + _5761;
        float _5765 = _5587 * _5707;
        float _5767 = _5603 * _5707;
        float _5769 = _5669 * _5707;
        float _5771 = _5765 * _5579;
        float _5773 = _5765 * _5673;
        float _5775 = _5765 * _5687;
        float _5777 = _5765 * _5691;
        float _5779 = fma(_5767, _5595, _5771);
        float _5781 = fma(_5767, _5607, _5773);
        float _5783 = fma(_5767, _5611, _5775);
        float _5785 = fma(_5767, _5615, _5777);
        float _5787 = fma(_5769, _5677, _5779);
        float _5789 = fma(_5769, _5683, _5781);
        float _5791 = fma(_5769, _5697, _5783);
        float _5793 = _5765 * _5701;
        float _5795 = _5765 * _5747;
        bool _5797 = _5787 >= 0.5;
        float _5799 = _5765 * _5705;
        bool _5801 = _5789 >= 0.5;
        float _5803 = _5765 * _5711;
        bool _5805 = _5787 >= 0.833000004291534423828125;
        float _5807 = _5765 * _5715;
        bool _5809 = _5787 >= 0.16599999368190765380859375;
        float _5811 = _5765 * _5719;
        float _5813 = _5765 * _5723;
        float _5815 = _5765 * _5727;
        float _5817 = _5765 * _5731;
        float _5819 = _5765 * _5735;
        float _5821 = _5765 * _5739;
        float _5823 = _5765 * _5743;
        int _5825 = _5805 ? 0 : 32768;
        float _5827 = fma(_5769, _5751, _5785);
        bool _5829 = _5789 >= 0.833000004291534423828125;
        float _5831 = fma(_5767, _5619, _5793);
        int _5833 = _5825;
        if (!_5797)
        {
            int _5835 = _5809 ? 49152 : 16384;
            _5833 = _5835;
        }
        int _5837 = _5833;
        float _5839 = fma(_5767, _5623, _5799);
        bool _5841 = _5789 >= 0.16599999368190765380859375;
        float _5843 = fma(_5767, _5627, _5803);
        float _5845 = fma(_5767, _5631, _5807);
        bool _5847 = _5791 >= 0.5;
        float _5849 = fma(_5767, _5635, _5811);
        float _5851 = fma(_5767, _5639, _5813);
        float _5853 = fma(_5767, _5643, _5815);
        float _5855 = fma(_5767, _5647, _5817);
        float _5857 = fma(_5767, _5651, _5819);
        float _5859 = fma(_5767, _5655, _5821);
        float _5861 = fma(_5767, _5659, _5823);
        float _5863 = fma(_5767, _5663, _5795);
        int _5865 = _5829 ? 0 : 8192;
        float _5867 = fma(_5769, _5755, _5831);
        bool _5869 = _5827 >= 0.5;
        float _5871 = fma(_5769, _5759, _5839);
        int _5873 = _5865;
        if (!_5801)
        {
            int _5875 = _5841 ? 12288 : 4096;
            _5873 = _5875;
        }
        int _5877 = _5873;
        float _5879 = fma(_5769, _5763, _5843);
        bool _5881 = _5827 >= 0.833000004291534423828125;
        float _5883 = -_5591;
        float _5885 = _238 + _5883;
        bool _5887 = _5791 >= 0.833000004291534423828125;
        float _5889 = -_5591;
        float _5891 = _228 + _5889;
        bool _5893 = _5791 >= 0.16599999368190765380859375;
        float _5895 = fma(_5769, _5885, _5849);
        int _5897 = _5881 ? 0 : 512;
        float _5899 = fma(_5769, _5891, _5851);
        bool _5901 = _5867 >= 0.5;
        float _5903 = -_5591;
        float _5905 = _218 + _5903;
        int _5907 = _5887 ? 0 : 2048;
        float _5909 = -_5591;
        float _5911 = _208 + _5909;
        bool _5913 = _5827 >= 0.16599999368190765380859375;
        float _5915 = fma(_5769, _5905, _5853);
        float _5917 = fma(_5769, _5911, _5855);
        int _5919 = _5907;
        int _5921 = _5897;
        if (!_5847)
        {
            int _5923 = _5893 ? 3072 : 1024;
            _5919 = _5923;
        }
        int _5925 = _5919;
        float _5927 = -_5591;
        float _5929 = _5183 + _5927;
        bool _5931 = _5871 >= 0.5;
        float _5933 = -_5591;
        float _5935 = _178 + _5933;
        if (!_5869)
        {
            int _5937 = _5913 ? 768 : 256;
            _5921 = _5937;
        }
        int _5939 = _5921;
        float _5941 = fma(_5769, _5929, _5857);
        bool _5943 = _5867 >= 0.833000004291534423828125;
        float _5945 = -_5591;
        float _5947 = _188 + _5945;
        bool _5949 = _5871 >= 0.833000004291534423828125;
        float _5951 = fma(_5769, _5935, _5861);
        bool _5953 = _5867 >= 0.16599999368190765380859375;
        float _5955 = fma(_5769, _5947, _5859);
        int _5957 = _5943 ? 0 : 128;
        float _5959 = -_5591;
        float _5961 = _98 + _5959;
        int _5963 = _5949 ? 0 : 32;
        float _5965 = -_5591;
        float _5967 = _168 + _5965;
        bool _5969 = _5879 >= 0.5;
        float _5971 = fma(_5769, _5961, _5845);
        bool _5973 = _5871 >= 0.16599999368190765380859375;
        float _5975 = fma(_5769, _5967, _5863);
        int _5977 = _5957;
        int _5979 = _5963;
        if (!_5901)
        {
            int _5981 = _5953 ? 192 : 64;
            _5977 = _5981;
        }
        int _5983 = _5977;
        bool _5985 = _5879 >= 0.833000004291534423828125;
        if (!_5931)
        {
            int _5987 = _5973 ? 48 : 16;
            _5979 = _5987;
        }
        int _5989 = _5979;
        int _5991 = _5985 ? 0 : 8;
        bool _5993 = _5895 >= 0.5;
        bool _5995 = _5879 >= 0.16599999368190765380859375;
        bool _5997 = _5899 >= 0.5;
        bool _5999 = _5895 >= 0.833000004291534423828125;
        int _6001 = _5991;
        if (!_5969)
        {
            int _6003 = _5995 ? 12 : 4;
            _6001 = _6003;
        }
        int _6005 = _6001;
        bool _6007 = _5899 >= 0.833000004291534423828125;
        bool _6009 = _5895 >= 0.16599999368190765380859375;
        int _6011 = _5999 ? 0 : int(0x80000000);
        bool _6013 = _5899 >= 0.16599999368190765380859375;
        int _6015 = _6007 ? 0 : 536870912;
        bool _6017 = _5915 >= 0.5;
        int _6019 = _6011;
        int _6021 = _6015;
        if (!_5993)
        {
            int _6023 = _6009 ? (-1073741824) : 1073741824;
            _6019 = _6023;
        }
        int _6025 = _6019;
        bool _6027 = _5917 >= 0.5;
        if (!_5997)
        {
            int _6029 = _6013 ? 805306368 : 268435456;
            _6021 = _6029;
        }
        int _6031 = _6021;
        bool _6033 = _5915 >= 0.833000004291534423828125;
        bool _6035 = _5917 >= 0.833000004291534423828125;
        int _6037 = _6033 ? 0 : 134217728;
        bool _6039 = _5915 >= 0.16599999368190765380859375;
        bool _6041 = _5941 >= 0.5;
        int _6043 = _6035 ? 0 : 33554432;
        bool _6045 = _5917 >= 0.16599999368190765380859375;
        int _6047 = _6037;
        int _6049 = _6043;
        if (!_6017)
        {
            int _6051 = _6039 ? 201326592 : 67108864;
            _6047 = _6051;
        }
        int _6053 = _6047;
        bool _6055 = _5941 >= 0.833000004291534423828125;
        if (!_6027)
        {
            int _6057 = _6045 ? 50331648 : 16777216;
            _6049 = _6057;
        }
        int _6059 = _6049;
        bool _6061 = _5951 >= 0.5;
        bool _6063 = _5941 >= 0.16599999368190765380859375;
        int _6065 = _6055 ? 0 : 8388608;
        bool _6067 = _5955 >= 0.5;
        bool _6069 = _5955 >= 0.833000004291534423828125;
        int _6071 = _6065;
        if (!_6041)
        {
            int _6073 = _6063 ? 12582912 : 4194304;
            _6071 = _6073;
        }
        int _6075 = _6071;
        bool _6077 = _5955 >= 0.16599999368190765380859375;
        bool _6079 = _5951 >= 0.833000004291534423828125;
        int _6081 = _6069 ? 0 : 2097152;
        bool _6083 = _5951 >= 0.16599999368190765380859375;
        int _6085 = _6079 ? 0 : 524288;
        int _6087 = _6085;
        int _6089 = _6081;
        if (!_6061)
        {
            int _6091 = _6083 ? 786432 : 262144;
            _6087 = _6091;
        }
        int _6093 = _6087;
        bool _6095 = _5971 >= 0.5;
        bool _6097 = _5975 >= 0.5;
        if (!_6067)
        {
            int _6099 = _6077 ? 3145728 : 1048576;
            _6089 = _6099;
        }
        int _6101 = _6089;
        bool _6103 = _5971 >= 0.833000004291534423828125;
        int _6105 = _6053 + _6025;
        int _6107 = _6105 + _6031;
        int _6109 = _5925 + _5837;
        int _6111 = _6109 + _5877;
        bool _6113 = _5975 >= 0.833000004291534423828125;
        int _6115 = _6103 ? 0 : 2;
        bool _6117 = _5971 >= 0.16599999368190765380859375;
        bool _6119 = _5975 >= 0.16599999368190765380859375;
        int _6121 = _6075 + _6107;
        int _6123 = _6121 + _6059;
        int _6125 = _5983 + _6111;
        int _6127 = _6125 + _5939;
        int _6129 = _6113 ? 0 : 131072;
        int _6131 = _6115;
        int _6133 = _6129;
        _5523 = 3;
        if (!_6095)
        {
            int _6135 = _6117 ? 3 : 1;
            _6131 = _6135;
        }
        int _6137 = _6131;
        if (!_6097)
        {
            int _6139 = _6119 ? 196608 : 65536;
            _6133 = _6139;
        }
        int _6141 = _6133;
        int _6143 = _6093 + _6123;
        int _6145 = _6143 + _6101;
        int _6147 = _6005 + _6127;
        int _6149 = _6147 + _5989;
        bool _6151 = !_5557;
        int _6153 = _6151 ? _5505 : _5501;
        bool _6155 = !_5557;
        int _6157 = _6155 ? _5501 : _5505;
        int _6159 = _6145 + _6141;
        int _6161 = _6149 + _6137;
        _5535 = _6153;
        _5549 = _6159;
        _5543 = _6161;
        _5525 = _6157;
    }
    int _6163 = _5535;
    int _6165 = _5523;
    int _6167 = _5549;
    int _6169 = _5543;
    int _6171 = _5525;
    int _6173 = _6165;
    if (!_5509)
    {
        _6173 = 0;
    }
    int _6175 = _6173;
    int _6177 = _6175;
    if (!_5509)
    {
        _5527 = 0;
    }
    int _6179 = _5527;
    bool _6181 = !_5509;
    int _6183 = _6179;
    if (!_6181)
    {
        float _6185 = -_5455;
        float _6187 = _5227 + _6185;
        float _6189 = -_5455;
        float _6191 = _110 + _6189;
        float _6193 = -_5455;
        float _6195 = _100 + _6193;
        float _6197 = -_5455;
        float _6199 = _90 + _6197;
        float _6201 = -_5455;
        float _6203 = _140 + _6201;
        float _6205 = 1.0 / _6187;
        float _6207 = -_5455;
        float _6209 = _150 + _6207;
        float _6211 = -_5455;
        float _6213 = _160 + _6211;
        float _6215 = -_5455;
        float _6217 = _170 + _6215;
        float _6219 = -_5455;
        float _6221 = _180 + _6219;
        float _6223 = -_5455;
        float _6225 = _190 + _6223;
        float _6227 = -_5455;
        float _6229 = _200 + _6227;
        float _6231 = -_5455;
        float _6233 = _210 + _6231;
        float _6235 = -_5455;
        float _6237 = _220 + _6235;
        float _6239 = -_5455;
        float _6241 = _230 + _6239;
        float _6243 = -_5455;
        float _6245 = _240 + _6243;
        float _6247 = _6191 * _6205;
        float _6249 = -_5455;
        float _6251 = _120 + _6249;
        float _6253 = _6195 * _6205;
        float _6255 = _6199 * _6205;
        float _6257 = _6251 * _6205;
        float _6259 = -_5455;
        float _6261 = _130 + _6259;
        float _6263 = fma(_6253, -1.99999904632568359375, 1.99999904632568359375);
        float _6265 = fma(_6253, -7.99999904632568359375, 7.99999904632568359375);
        float _6267 = fma(_6255, -1.99999904632568359375, 1.99999904632568359375);
        float _6269 = fma(_6255, -7.99999904632568359375, 7.99999904632568359375);
        float _6271 = fma(_6247, -1.99999904632568359375, 1.99999904632568359375);
        float _6273 = fma(_6247, -7.99999904632568359375, 7.99999904632568359375);
        float _6275 = _6261 * _6205;
        float _6277 = -_6253;
        float _6279 = _6277 + 0.5;
        float _6281 = -_6255;
        float _6283 = _6281 + 0.5;
        float _6285 = fma(_6257, -1.99999904632568359375, 1.99999904632568359375);
        float _6287 = fma(_6257, -7.99999904632568359375, 7.99999904632568359375);
        float _6289 = trunc(_6263);
        float _6291 = precise::max(_6289, 0.0);
        uint _6293 = uint(_6291);
        float _6295 = fma(_6275, -1.99999904632568359375, 1.99999904632568359375);
        float _6297 = fma(_6275, -7.99999904632568359375, 7.99999904632568359375);
        float _6299 = _6203 * _6205;
        float _6301 = _6209 * _6205;
        float _6303 = -_6247;
        float _6305 = _6303 + 0.5;
        float _6307 = abs(_6279);
        bool _6309 = _6307 >= 0.375;
        float _6311 = -_6257;
        float _6313 = _6311 + 0.5;
        float _6315 = trunc(_6265);
        float _6317 = precise::max(_6315, 0.0);
        uint _6319 = uint(_6317);
        float _6321 = abs(_6283);
        bool _6323 = _6321 >= 0.375;
        float _6325 = fma(_6299, -1.99999904632568359375, 1.99999904632568359375);
        float _6327 = fma(_6299, -7.99999904632568359375, 7.99999904632568359375);
        float _6329 = fma(_6301, -1.99999904632568359375, 1.99999904632568359375);
        float _6331 = fma(_6301, -7.99999904632568359375, 7.99999904632568359375);
        float _6333 = _6213 * _6205;
        float _6335 = _6217 * _6205;
        float _6337 = trunc(_6267);
        float _6339 = precise::max(_6337, 0.0);
        uint _6341 = uint(_6339);
        float _6343 = -_6275;
        float _6345 = _6343 + 0.5;
        float _6347 = abs(_6305);
        bool _6349 = _6347 >= 0.375;
        float _6351 = _6221 * _6205;
        float _6353 = fma(_6333, -1.99999904632568359375, 1.99999904632568359375);
        float _6355 = fma(_6333, -7.99999904632568359375, 7.99999904632568359375);
        float _6357 = fma(_6335, -1.99999904632568359375, 1.99999904632568359375);
        float _6359 = fma(_6335, -7.99999904632568359375, 7.99999904632568359375);
        float _6361 = trunc(_6269);
        float _6363 = precise::max(_6361, 0.0);
        uint _6365 = uint(_6363);
        float _6367 = -_6299;
        float _6369 = _6367 + 0.5;
        float _6371 = abs(_6313);
        bool _6373 = _6371 >= 0.375;
        float _6375 = -_6301;
        float _6377 = _6375 + 0.5;
        float _6379 = abs(_6345);
        bool _6381 = _6379 >= 0.375;
        float _6383 = fma(_6351, -1.99999904632568359375, 1.99999904632568359375);
        float _6385 = fma(_6351, -7.99999904632568359375, 7.99999904632568359375);
        float _6387 = _6225 * _6205;
        float _6389 = trunc(_6271);
        float _6391 = precise::max(_6389, 0.0);
        uint _6393 = uint(_6391);
        float _6395 = _6229 * _6205;
        float _6397 = -_6333;
        float _6399 = _6397 + 0.5;
        float _6401 = -_6335;
        float _6403 = _6401 + 0.5;
        float _6405 = abs(_6369);
        bool _6407 = _6405 >= 0.375;
        float _6409 = fma(_6387, -1.99999904632568359375, 1.99999904632568359375);
        float _6411 = abs(_6377);
        bool _6413 = _6411 >= 0.375;
        float _6415 = fma(_6387, -7.99999904632568359375, 7.99999904632568359375);
        float _6417 = trunc(_6273);
        float _6419 = precise::max(_6417, 0.0);
        uint _6421 = uint(_6419);
        float _6423 = fma(_6395, -1.99999904632568359375, 1.99999904632568359375);
        float _6425 = fma(_6395, -7.99999904632568359375, 7.99999904632568359375);
        float _6427 = _6233 * _6205;
        float _6429 = _6237 * _6205;
        float _6431 = -_6351;
        float _6433 = _6431 + 0.5;
        int _6435 = int(_6293);
        int _6437 = int(_6341);
        int _6439 = int(_6393);
        if (!_6309)
        {
            int _6441 = int(_6319) + 1;
            _6435 = _6441;
        }
        int _6443 = _6435;
        float _6445 = _6241 * _6205;
        float _6447 = trunc(_6285);
        float _6449 = precise::max(_6447, 0.0);
        uint _6451 = uint(_6449);
        int _6453 = int(_6451);
        if (!_6323)
        {
            int _6455 = int(_6365) + 1;
            _6437 = _6455;
        }
        int _6457 = _6437;
        float _6459 = _6245 * _6205;
        float _6461 = abs(_6399);
        bool _6463 = _6461 >= 0.375;
        float _6465 = fma(_6427, -1.99999904632568359375, 1.99999904632568359375);
        float _6467 = abs(_6403);
        bool _6469 = _6467 >= 0.375;
        float _6471 = fma(_6427, -7.99999904632568359375, 7.99999904632568359375);
        float _6473 = fma(_6429, -1.99999904632568359375, 1.99999904632568359375);
        float _6475 = trunc(_6287);
        float _6477 = precise::max(_6475, 0.0);
        uint _6479 = uint(_6477);
        float _6481 = fma(_6429, -7.99999904632568359375, 7.99999904632568359375);
        if (!_6349)
        {
            int _6483 = int(_6421) + 1;
            _6439 = _6483;
        }
        int _6485 = _6439;
        float _6487 = -_6387;
        float _6489 = _6487 + 0.5;
        float _6491 = -_6395;
        float _6493 = _6491 + 0.5;
        float _6495 = abs(_6433);
        bool _6497 = _6495 >= 0.375;
        float _6499 = fma(_6445, -1.99999904632568359375, 1.99999904632568359375);
        float _6501 = -_6427;
        float _6503 = _6501 + 0.5;
        float _6505 = trunc(_6295);
        float _6507 = precise::max(_6505, 0.0);
        uint _6509 = uint(_6507);
        float _6511 = -_6429;
        float _6513 = _6511 + 0.5;
        float _6515 = fma(_6445, -7.99999904632568359375, 7.99999904632568359375);
        float _6517 = fma(_6459, -1.99999904632568359375, 1.99999904632568359375);
        float _6519 = -_6445;
        float _6521 = _6519 + 0.5;
        int _6523 = _6457 << 3;
        float _6525 = trunc(_6297);
        float _6527 = precise::max(_6525, 0.0);
        uint _6529 = uint(_6527);
        int _6531 = int(_6509);
        if (!_6373)
        {
            int _6533 = int(_6479) + 1;
            _6453 = _6533;
        }
        int _6535 = _6453;
        float _6537 = fma(_6459, -7.99999904632568359375, 7.99999904632568359375);
        float _6539 = abs(_6489);
        bool _6541 = _6539 >= 0.375;
        float _6543 = -_6459;
        float _6545 = _6543 + 0.5;
        int _6547 = _6443 | _6523;
        int _6549 = _6535 << 9;
        float _6551 = trunc(_6325);
        float _6553 = precise::max(_6551, 0.0);
        uint _6555 = uint(_6553);
        float _6557 = trunc(_6327);
        float _6559 = precise::max(_6557, 0.0);
        uint _6561 = uint(_6559);
        int _6563 = int(_6555);
        if (!_6381)
        {
            int _6565 = int(_6529) + 1;
            _6531 = _6565;
        }
        int _6567 = _6531;
        float _6569 = abs(_6493);
        bool _6571 = _6569 >= 0.375;
        float _6573 = trunc(_6329);
        float _6575 = precise::max(_6573, 0.0);
        uint _6577 = uint(_6575);
        float _6579 = trunc(_6331);
        float _6581 = precise::max(_6579, 0.0);
        uint _6583 = uint(_6581);
        int _6585 = int(_6577);
        if (!_6407)
        {
            int _6587 = int(_6561) + 1;
            _6563 = _6587;
        }
        int _6589 = _6563;
        float _6591 = abs(_6503);
        bool _6593 = _6591 >= 0.375;
        int _6595 = _6589 << 15;
        float _6597 = trunc(_6353);
        float _6599 = precise::max(_6597, 0.0);
        uint _6601 = uint(_6599);
        float _6603 = trunc(_6355);
        float _6605 = precise::max(_6603, 0.0);
        uint _6607 = uint(_6605);
        int _6609 = int(_6601);
        if (!_6413)
        {
            int _6611 = int(_6583) + 1;
            _6585 = _6611;
        }
        int _6613 = _6585;
        float _6615 = abs(_6513);
        bool _6617 = _6615 >= 0.375;
        float _6619 = trunc(_6357);
        float _6621 = precise::max(_6619, 0.0);
        uint _6623 = uint(_6621);
        float _6625 = trunc(_6359);
        float _6627 = precise::max(_6625, 0.0);
        uint _6629 = uint(_6627);
        int _6631 = int(_6623);
        if (!_6463)
        {
            int _6633 = int(_6607) + 1;
            _6609 = _6633;
        }
        int _6635 = _6609;
        float _6637 = abs(_6521);
        bool _6639 = _6637 >= 0.375;
        int _6641 = _6635 << 21;
        float _6643 = trunc(_6383);
        float _6645 = precise::max(_6643, 0.0);
        uint _6647 = uint(_6645);
        float _6649 = trunc(_6385);
        float _6651 = precise::max(_6649, 0.0);
        uint _6653 = uint(_6651);
        int _6655 = int(_6647);
        if (!_6469)
        {
            int _6657 = int(_6629) + 1;
            _6631 = _6657;
        }
        int _6659 = _6631;
        float _6661 = abs(_6545);
        bool _6663 = _6661 >= 0.375;
        float _6665 = trunc(_6409);
        float _6667 = precise::max(_6665, 0.0);
        uint _6669 = uint(_6667);
        float _6671 = trunc(_6415);
        float _6673 = precise::max(_6671, 0.0);
        uint _6675 = uint(_6673);
        int _6677 = int(_6669);
        if (!_6497)
        {
            int _6679 = int(_6653) + 1;
            _6655 = _6679;
        }
        int _6681 = _6655;
        int _6683 = _6681 << 3;
        float _6685 = trunc(_6423);
        float _6687 = precise::max(_6685, 0.0);
        uint _6689 = uint(_6687);
        int _6691 = _6659 | _6683;
        float _6693 = trunc(_6425);
        float _6695 = precise::max(_6693, 0.0);
        uint _6697 = uint(_6695);
        int _6699 = int(_6689);
        if (!_6541)
        {
            int _6701 = int(_6675) + 1;
            _6677 = _6701;
        }
        int _6703 = _6677;
        int _6705 = _6703 << 6;
        float _6707 = trunc(_6465);
        float _6709 = precise::max(_6707, 0.0);
        uint _6711 = uint(_6709);
        float _6713 = trunc(_6471);
        float _6715 = precise::max(_6713, 0.0);
        uint _6717 = uint(_6715);
        int _6719 = int(_6711);
        if (!_6571)
        {
            int _6721 = int(_6697) + 1;
            _6699 = _6721;
        }
        int _6723 = _6699;
        int _6725 = _6723 << 9;
        float _6727 = trunc(_6473);
        float _6729 = precise::max(_6727, 0.0);
        uint _6731 = uint(_6729);
        int _6733 = _6691 | _6705;
        int _6735 = _6725 | _6733;
        float _6737 = trunc(_6481);
        float _6739 = precise::max(_6737, 0.0);
        uint _6741 = uint(_6739);
        int _6743 = int(_6731);
        if (!_6593)
        {
            int _6745 = int(_6717) + 1;
            _6719 = _6745;
        }
        int _6747 = _6719;
        float _6749 = trunc(_6499);
        float _6751 = precise::max(_6749, 0.0);
        uint _6753 = uint(_6751);
        float _6755 = trunc(_6515);
        float _6757 = precise::max(_6755, 0.0);
        uint _6759 = uint(_6757);
        int _6761 = int(_6753);
        if (!_6617)
        {
            int _6763 = int(_6741) + 1;
            _6743 = _6763;
        }
        int _6765 = _6743;
        int _6767 = _6765 << 15;
        float _6769 = trunc(_6517);
        float _6771 = precise::max(_6769, 0.0);
        uint _6773 = uint(_6771);
        float _6775 = trunc(_6537);
        float _6777 = precise::max(_6775, 0.0);
        uint _6779 = uint(_6777);
        int _6781 = _6485 << 6;
        int _6783 = _6747 << 12;
        int _6785 = _6547 | _6781;
        int _6787 = _6549 | _6785;
        int _6789 = _6567 << 12;
        int _6791 = int(_6773);
        if (!_6639)
        {
            int _6793 = int(_6759) + 1;
            _6761 = _6793;
        }
        int _6795 = _6761;
        int _6797 = _6787 | _6789;
        int _6799 = _6595 | _6797;
        int _6801 = _6735 | _6783;
        int _6803 = _6767 | _6801;
        int _6805 = _6613 << 18;
        if (!_6663)
        {
            int _6807 = int(_6779) + 1;
            _6791 = _6807;
        }
        int _6809 = _6791;
        int _6811 = _6795 << 18;
        int _6813 = _6809 << 21;
        int _6815 = _6799 | _6805;
        int _6817 = _6641 | _6815;
        int _6819 = _6803 | _6811;
        int _6821 = _6813 | _6819;
        uint _6823 = uint(int(uint(_6817) >> uint(16)));
        int _6825 = _6821 << 8;
        uint _6827 = uint(int(uint(_6821) >> uint(8)));
        int _6829 = 65280 & _6825;
        int _6831 = int(_6823) | _6829;
        int _6833 = _6817 << 16;
        int _6835 = int(_6827) << 16;
        _5539 = _6833;
        _6183 = _6835;
        _6177 = _6831;
    }
    int _6837 = _5539;
    int _6839 = _6183;
    int _6841 = _6177;
    int _6843 = _6163 & 65535;
    int _6845 = _6837 | _5533;
    int _6847 = _6839 | _6841;
    int _6849 = _6167 | _6169;
    int _6851 = _6171 << 16;
    int _6853 = _6851 + _6843;
    out.m_37.x = as_type<float>(_6845);
    out.m_37.y = as_type<float>(_6847);
    out.m_37.z = as_type<float>(_6853);
    out.m_37.w = as_type<float>(_6849);
    return main0_out_u{as_type<uint4>(out.m_37)};
}

