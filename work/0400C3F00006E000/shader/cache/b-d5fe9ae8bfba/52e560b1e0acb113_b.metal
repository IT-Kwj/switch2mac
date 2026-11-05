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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
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
    float2 _388 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_388, float2(0.0), isnan(_388))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_35.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_41.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _69 * _90;
    float _112 = _69 * _96;
    float _114 = _69 * _102;
    float _116 = in.m_39.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_35.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_39.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_37.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_37.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_37.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _69 * _120;
    float _160 = _69 * _126;
    float _162 = _69 * _132;
    float _164 = -_110;
    float _166 = fma(_84, _112, _164);
    float _168 = _114 * _166;
    float _170 = _69 * _108;
    float _172 = 0.0 + _168;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = _174 * _170;
    bool _180 = _176 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _182 = isnan(_176);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _188 = _184 || _186;
    float _190 = in.m_35.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_35.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    if (!_188)
    {
        discard_fragment();
    }
    float _202 = _78 * _78;
    float _204 = _80 * _80;
    float _206 = _82 * _82;
    float _208 = _69 * _194;
    float _210 = _69 * _200;
    float _212 = _69 * _138;
    float _214 = -_160;
    float _216 = _208 + _214;
    float _218 = -_158;
    float _220 = _210 + _218;
    float _222 = -_212;
    float _224 = _162 + _222;
    float _226 = fma(_202, _216, _160);
    float _228 = fma(_204, _220, _158);
    float _230 = fma(_206, _224, _212);
    float _232 = _69 * _144;
    float _234 = _69 * _150;
    float _236 = _69 * _156;
    float _238 = _226 * _232;
    float _240 = _228 * _234;
    float _242 = _230 * _236;
    if (!_188)
    {
        out.m_44.x = _238;
        out.m_44.y = _240;
        out.m_44.z = _242;
        out.m_44.w = _168;
        return out;
    }
    float _244 = _240 * 0.715200006961822509765625;
    float _246 = in.m_46.w;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_46.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_46.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = fma(_238, 0.2125999927520751953125, _244);
    float _266 = in.m_46.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_242, 0.072200000286102294921875, _264);
    bool _274 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _276 = 1.0 / _272;
    float _278 = _276 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _69 * _250;
    float _284 = fma(_280, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _286 = _69 * _256;
    float _288 = _284 * _282;
    float _290 = 0.0 + _176;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _69 * _262;
    float _296 = _69 * _270;
    float _298 = fma(_242, _288, _286);
    float _300 = fma(_238, _288, _294);
    float _302 = fma(_240, _288, _296);
    float _304 = _286;
    if (!_274)
    {
        _304 = _292;
    }
    float _306 = _304;
    bool _308 = !_274;
    float _310 = _306;
    if (!_308)
    {
        float _312 = in.m_48.w;
        float _314 = gl_FragCoord.w;
        float _316 = _312 * _314;
        float _318 = in.m_48.z;
        float _320 = gl_FragCoord.w;
        float _322 = _318 * _320;
        float _324 = _69 * _316;
        float _326 = _69 * _322;
        float _328 = 1.0 / _324;
        float _330 = _326 * _328;
        float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _334 = fma(_330, (*spvDescriptorSet0.fp_c8)._m0[30].w, _332);
        float _336 = 1.0 / _334;
        float _338 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _340 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _342 = fma(_336, _338, _340);
        float _344 = _342 * 8.0;
        float _346 = precise::clamp(_344, 0.0, 1.0);
        float _348 = _292 * _346;
        _310 = _348;
    }
    float _350 = _310;
    float _352 = 0.0 + _350;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    out.m_44.x = _300;
    out.m_44.y = _302;
    out.m_44.z = _298;
    out.m_44.w = _354;
    return out;
}

