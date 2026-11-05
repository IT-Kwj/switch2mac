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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = _55 + (-0.550000011920928955078125);
    float _61 = _57 + 0.300000011920928955078125;
    float _63 = _55 + 0.25;
    float _65 = _57 + 0.85000002384185791015625;
    float _67 = _57 + (-0.75);
    float _69 = _55 + 0.60000002384185791015625;
    float _71 = _55 + 0.5;
    float2 _437 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float2 _457 = float2(_63, _57);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_457, float2(0.0), isnan(_457))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _473 = float2(_69, _65);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _489 = float2(_71, _67);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_489, float2(0.0), isnan(_489))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = fma((*spvDescriptorSet0.fp_c3)._m0[0].y, 1.36000001430511474609375, 0.3200000226497650146484375);
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 1.60000002384185791015625;
    float _118 = floor(_114);
    float _120 = floor(_116);
    float _122 = -_118;
    float _124 = _114 + _122;
    float _126 = -_120;
    float _128 = _116 + _126;
    float _130 = _124 + _82;
    float _132 = floor(_130);
    float _134 = fma((*spvDescriptorSet0.fp_c3)._m0[0].y, 1.48800003528594970703125, 0.719999969005584716796875);
    float _136 = fma((*spvDescriptorSet0.fp_c3)._m0[0].y, 1.80799996852874755859375, 1.12000000476837158203125);
    float _138 = floor(_134);
    float _140 = -_132;
    float _142 = _130 + _140;
    float _144 = floor(_136);
    float _146 = _142 + (-1.0);
    float _148 = _128 + _92;
    float _150 = _76 + _146;
    float _152 = floor(_148);
    float _154 = -_138;
    float _156 = _134 + _154;
    float _158 = _150 * 9.0;
    float _160 = precise::max(0.0, _158);
    float _162 = _156 + _102;
    float _164 = -_144;
    float _166 = _136 + _164;
    float _168 = precise::min(_160, 3.0);
    float _170 = floor(_162);
    float _172 = _166 + _112;
    float _174 = (*spvDescriptorSet0.fp_c3)._m0[0].x * 4.0;
    float _176 = _168 * 3.1415927410125732421875;
    float _178 = _174 + (-1.0);
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = _176 * 0.15915493667125701904296875;
    float _184 = -_152;
    float _186 = _148 + _184;
    float _188 = floor(_172);
    float _190 = fma(_180, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _192 = _186 + (-1.0);
    float _194 = -_142;
    float _196 = _194 + _190;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = -_170;
    float _202 = _162 + _200;
    float _204 = _86 + _192;
    float _206 = _182 * 6.283185482025146484375;
    float _208 = sin(_206);
    float _210 = _76 * _198;
    float _212 = _202 + (-1.0);
    float _214 = _204 * 9.0;
    float _216 = 0.0 + _174;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _96 + _212;
    float _222 = -_188;
    float _224 = _172 + _222;
    float _226 = precise::max(0.0, _214);
    float _228 = _220 * 9.0;
    float _230 = fma(_218, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _232 = _224 + (-1.0);
    float _234 = precise::min(_226, 3.0);
    float _236 = precise::max(0.0, _228);
    float _238 = _106 + _232;
    float _240 = -_186;
    float _242 = _240 + _230;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _234 * 3.1415927410125732421875;
    float _248 = precise::min(_236, 3.0);
    float _250 = _238 * 9.0;
    float _252 = _210 * _208;
    float _254 = _246 * 0.15915493667125701904296875;
    float _256 = _248 * 3.1415927410125732421875;
    float _258 = precise::max(0.0, _250);
    float _260 = _254 * 6.283185482025146484375;
    float _262 = sin(_260);
    float _264 = _252 * 0.3499999940395355224609375;
    float _266 = fma(_78, 2.0, -1.0);
    float _268 = precise::min(_258, 3.0);
    float _270 = _256 * 0.15915493667125701904296875;
    float _272 = fma(_80, 2.0, -1.0);
    float _274 = _266 * _264;
    float _276 = _86 * _244;
    float _278 = _268 * 3.1415927410125732421875;
    float _280 = _272 * _264;
    float _282 = _270 * 6.283185482025146484375;
    float _284 = sin(_282);
    float _286 = _174 + (-2.0);
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _278 * 0.15915493667125701904296875;
    float _292 = _180 * _274;
    float _294 = _180 * _280;
    float _296 = fma(_288, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _298 = _276 * _262;
    float _300 = _174 + (-3.0);
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = _290 * 6.283185482025146484375;
    float _306 = sin(_304);
    float _308 = -_202;
    float _310 = _308 + _296;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _298 * 0.3499999940395355224609375;
    float _316 = fma(_302, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _318 = fma(_90, 2.0, -1.0);
    float _320 = _96 * _312;
    float _322 = fma(_100, 2.0, -1.0);
    float _324 = -_224;
    float _326 = _324 + _316;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _318 * _314;
    float _332 = _320 * _284;
    float _334 = fma(_88, 2.0, -1.0);
    float _336 = _106 * _328;
    float _338 = fma(_218, _330, _294);
    float _340 = _332 * 0.3499999940395355224609375;
    float _342 = _334 * _314;
    float _344 = fma(_98, 2.0, -1.0);
    float _346 = _336 * _306;
    float _348 = _322 * _340;
    float _350 = fma(_110, 2.0, -1.0);
    float _352 = fma(_218, _342, _292);
    float _354 = _346 * 0.3499999940395355224609375;
    float _356 = fma(_288, _348, _338);
    float _358 = _344 * _340;
    float _360 = fma(_108, 2.0, -1.0);
    float _362 = _350 * _354;
    float _364 = fma(_288, _358, _352);
    float _366 = _360 * _354;
    float _368 = fma(_302, _362, _356);
    float _370 = fma(_302, _366, _364);
    float _372 = _368 * _368;
    float _374 = fma(_370, _370, _372);
    float _376 = _374 + 1.0;
    float _378 = rsqrt(_376);
    float _380 = _370 * _378;
    float _382 = _368 * _378;
    out.m_32.x = _380;
    out.m_32.y = _382;
    out.m_32.z = 0.0;
    out.m_32.w = 1.0;
    return out;
}

