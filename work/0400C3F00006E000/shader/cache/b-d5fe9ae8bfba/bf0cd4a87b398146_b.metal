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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _411 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _430 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_430, float2(0.0), isnan(_430))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = _83 * _118;
    float _134 = in.m_39.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_43.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _83 * _138;
    float _154 = _102 * _112;
    float _156 = _83 * _124;
    float _158 = _154 * _132;
    float _160 = _83 * _130;
    float _162 = _156 * _158;
    float _164 = 0.0 + _162;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = _166 * _160;
    bool _172 = _168 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _174 = isnan(_168);
    bool _176 = _172 || _174;
    bool _178 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _180 = _176 || _178;
    float _182 = in.m_43.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_39.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_39.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    if (!_180)
    {
        discard_fragment();
    }
    float _200 = _106 * _106;
    float _202 = _96 * _96;
    float _204 = _98 * _98;
    float _206 = _108 * _108;
    float _208 = _100 * _100;
    float _210 = _202 * _200;
    float _212 = _110 * _110;
    float _214 = _204 * _206;
    float _216 = _208 * _212;
    float _218 = _83 * _186;
    float _220 = _83 * _192;
    float _222 = _83 * _198;
    float _224 = _83 * _144;
    float _226 = _83 * _150;
    float _228 = -_218;
    float _230 = _152 + _228;
    float _232 = -_224;
    float _234 = _222 + _232;
    float _236 = -_226;
    float _238 = _220 + _236;
    float _240 = fma(_210, _230, _218);
    float _242 = fma(_214, _234, _224);
    float _244 = fma(_216, _238, _226);
    if (!_180)
    {
        out.m_46.x = _240;
        out.m_46.y = _242;
        out.m_46.z = _244;
        out.m_46.w = _162;
        return out;
    }
    float _246 = _242 * 0.715200006961822509765625;
    float _248 = in.m_48.w;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_48.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_48.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = fma(_240, 0.2125999927520751953125, _246);
    float _268 = in.m_48.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = fma(_244, 0.072200000286102294921875, _266);
    bool _276 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _278 = 1.0 / _274;
    float _280 = _278 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = fma(_282, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _286 = _83 * _252;
    float _288 = 0.0 + _168;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _83 * _258;
    float _294 = _83 * _272;
    float _296 = _284 * _286;
    float _298 = _83 * _264;
    float _300 = fma(_244, _296, _292);
    float _302 = fma(_240, _296, _298);
    float _304 = fma(_242, _296, _294);
    float _306 = _292;
    if (!_276)
    {
        _306 = _290;
    }
    float _308 = _306;
    bool _310 = !_276;
    float _312 = _308;
    if (!_310)
    {
        float _314 = in.m_50.w;
        float _316 = gl_FragCoord.w;
        float _318 = _314 * _316;
        float _320 = in.m_50.z;
        float _322 = gl_FragCoord.w;
        float _324 = _320 * _322;
        float _326 = _83 * _318;
        float _328 = _83 * _324;
        float _330 = 1.0 / _326;
        float _332 = _328 * _330;
        float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _336 = fma(_332, (*spvDescriptorSet0.fp_c8)._m0[30].w, _334);
        float _338 = 1.0 / _336;
        float _340 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _342 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _344 = fma(_338, _340, _342);
        float _346 = _344 * 8.0;
        float _348 = precise::clamp(_346, 0.0, 1.0);
        float _350 = _290 * _348;
        _312 = _350;
    }
    float _352 = _312;
    float _354 = 0.0 + _352;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    out.m_46.x = _302;
    out.m_46.y = _304;
    out.m_46.z = _300;
    out.m_46.w = _356;
    return out;
}

