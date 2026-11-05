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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _418 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_35.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_35.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _69 * _90;
    float _106 = _69 * _96;
    float _108 = in.m_35.z;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_39.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _69 * _118;
    float _128 = _84 * _104;
    float _130 = 0.0 + _128;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _132 * _106;
    bool _138 = _134 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _140 = isnan(_134);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _146 = _142 || _144;
    float _148 = in.m_35.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_39.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    if (!_146)
    {
        discard_fragment();
    }
    float _160 = _69 * _102;
    float _162 = _69 * _152;
    float _164 = _69 * _158;
    float _166 = _69 * _112;
    float _168 = _69 * _124;
    float _170 = -_126;
    float _172 = _162 + _170;
    float _174 = -_164;
    float _176 = _160 + _174;
    float _178 = -_168;
    float _180 = _166 + _178;
    float _182 = fma(_80, _172, _126);
    float _184 = fma(_78, _176, _164);
    float _186 = fma(_82, _180, _168);
    if (!_146)
    {
        out.m_42.x = _184;
        out.m_42.y = _182;
        out.m_42.z = _186;
        out.m_42.w = _128;
        return out;
    }
    float _188 = in.m_44.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _69 * _192;
    bool _196 = _194 != 1.0;
    bool _198 = isnan(_194);
    bool _200 = _196 || _198;
    bool _202 = isnan(1.0);
    bool _204 = _200 || _202;
    bool _206 = !_204;
    if (!_206)
    {
        float _208 = gl_FragCoord.x;
        float _210 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _212 = _208 / _210;
        float _214 = gl_FragCoord.y;
        float _216 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _218 = _214 / _216;
        float _220 = _194 * 256.0;
        float _222 = trunc(_220);
        int _225 = int(_222);
        uint _228 = uint(int(uint(_225) >> uint(7)));
        int _230 = int(_228) + _225;
        float _232 = trunc(_212);
        int _234 = int(_232);
        float _236 = trunc(_218);
        int _238 = int(_236);
        int _240 = _234 + 2;
        int _242 = _240 >> 1;
        uint _244 = uint(int(uint(_238) >> uint(1)));
        int _246 = _242 ^ int(_244);
        int _248 = _246 << 16;
        int _250 = _248 ^ _242;
        int _252 = 983055 & _250;
        int _254 = _252 << 6;
        int _256 = _254 + _252;
        int _258 = _256 & 13369548;
        uint _260 = uint(int(uint(_258) >> uint(3)));
        int _262 = _258 | int(_260);
        int _264 = _262 & 5570560;
        int _266 = _262 & 85;
        uint _268 = uint(int(uint(_264) >> uint(15)));
        int _270 = int(_268) + _266;
        bool _272 = uint(_230) > uint(_270);
        if (!_272)
        {
            discard_fragment();
        }
        if (!_272)
        {
            out.m_42.x = _184;
            out.m_42.y = _182;
            out.m_42.z = _186;
            out.m_42.w = _134;
            return out;
        }
    }
    float _274 = _182 * 0.715200006961822509765625;
    float _276 = in.m_46.w;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_46.z;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_46.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_184, 0.2125999927520751953125, _274);
    float _296 = in.m_46.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = fma(_186, 0.072200000286102294921875, _294);
    bool _304 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _306 = 1.0 / _302;
    float _308 = _306 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = fma(_310, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _314 = _69 * _280;
    float _316 = 0.0 + _134;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = _69 * _286;
    float _322 = _69 * _300;
    float _324 = _312 * _314;
    float _326 = _69 * _292;
    float _328 = fma(_186, _324, _320);
    float _330 = fma(_184, _324, _326);
    float _332 = fma(_182, _324, _322);
    float _334 = _320;
    if (!_304)
    {
        _334 = _318;
    }
    float _336 = _334;
    bool _338 = !_304;
    float _340 = _336;
    if (!_338)
    {
        float _342 = in.m_48.w;
        float _344 = gl_FragCoord.w;
        float _346 = _342 * _344;
        float _348 = in.m_48.z;
        float _350 = gl_FragCoord.w;
        float _352 = _348 * _350;
        float _354 = _69 * _346;
        float _356 = _69 * _352;
        float _358 = 1.0 / _354;
        float _360 = _356 * _358;
        float _362 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _364 = fma(_360, (*spvDescriptorSet0.fp_c8)._m0[30].w, _362);
        float _366 = 1.0 / _364;
        float _368 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _370 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _372 = fma(_366, _368, _370);
        float _374 = _372 * 8.0;
        float _376 = precise::clamp(_374, 0.0, 1.0);
        float _378 = _318 * _376;
        _340 = _378;
    }
    float _380 = _340;
    float _382 = 0.0 + _380;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    out.m_42.x = _330;
    out.m_42.y = _332;
    out.m_42.z = _328;
    out.m_42.w = _384;
    return out;
}

