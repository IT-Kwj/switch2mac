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
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
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
    float2 _409 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _428 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_428, float2(0.0), isnan(_428))).xyzw;
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
    float _126 = in.m_41.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_43.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _83 * _118;
    float _140 = in.m_41.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _102 * _112;
    float _160 = _158 * _138;
    float _162 = _83 * _124;
    float _164 = _83 * _130;
    float _166 = _162 * _160;
    float _168 = _164 * _166;
    float _170 = _83 * _136;
    float _172 = 0.0 + _168;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = _174 * _170;
    bool _180 = _176 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _182 = isnan(_176);
    bool _184 = _180 || _182;
    bool _186 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _188 = _184 || _186;
    float _190 = in.m_39.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_39.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_39.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    if (!_188)
    {
        discard_fragment();
    }
    float _208 = _96 * _106;
    float _210 = _98 * _108;
    float _212 = _83 * _144;
    float _214 = _83 * _150;
    float _216 = _100 * _110;
    float _218 = _83 * _194;
    float _220 = _83 * _200;
    float _222 = _83 * _206;
    float _224 = _83 * _156;
    float _226 = -_214;
    float _228 = _218 + _226;
    float _230 = -_212;
    float _232 = _220 + _230;
    float _234 = -_224;
    float _236 = _222 + _234;
    float _238 = fma(_210, _228, _214);
    float _240 = fma(_208, _232, _212);
    float _242 = fma(_216, _236, _224);
    if (!_188)
    {
        out.m_46.x = _240;
        out.m_46.y = _238;
        out.m_46.z = _242;
        out.m_46.w = _168;
        return out;
    }
    float _244 = _238 * 0.715200006961822509765625;
    float _246 = in.m_48.w;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_48.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_48.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = fma(_240, 0.2125999927520751953125, _244);
    float _266 = in.m_48.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_242, 0.072200000286102294921875, _264);
    bool _274 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _276 = 1.0 / _272;
    float _278 = _276 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _83 * _250;
    float _284 = fma(_280, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _286 = _83 * _256;
    float _288 = _284 * _282;
    float _290 = 0.0 + _176;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _83 * _262;
    float _296 = _83 * _270;
    float _298 = fma(_242, _288, _286);
    float _300 = fma(_240, _288, _294);
    float _302 = fma(_238, _288, _296);
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
        float _312 = in.m_50.w;
        float _314 = gl_FragCoord.w;
        float _316 = _312 * _314;
        float _318 = in.m_50.z;
        float _320 = gl_FragCoord.w;
        float _322 = _318 * _320;
        float _324 = _83 * _316;
        float _326 = _83 * _322;
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
    out.m_46.x = _300;
    out.m_46.y = _302;
    out.m_46.z = _298;
    out.m_46.w = _354;
    return out;
}

