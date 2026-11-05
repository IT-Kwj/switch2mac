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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = _81 * _79;
    float2 _409 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _428 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_428, float2(0.0), isnan(_428))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_37.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _81 * _116;
    float _132 = _81 * _122;
    float _134 = _81 * _128;
    float _136 = in.m_39.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_39.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = -_130;
    float _162 = fma(_100, _110, _160);
    float _164 = _132 * _162;
    float _166 = 0.0 + _164;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = _168 * _134;
    bool _174 = _170 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _176 = isnan(_170);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _182 = _178 || _180;
    float _184 = in.m_37.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_37.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    if (!_182)
    {
        discard_fragment();
    }
    float _196 = _94 * _94;
    float _198 = _104 * _104;
    float _200 = _96 * _96;
    float _202 = _106 * _106;
    float _204 = _98 * _98;
    float _206 = _196 * _198;
    float _208 = _108 * _108;
    float _210 = _200 * _202;
    float _212 = _81 * _140;
    float _214 = _81 * _146;
    float _216 = _81 * _152;
    float _218 = _81 * _158;
    float _220 = _204 * _208;
    float _222 = _81 * _188;
    float _224 = _81 * _194;
    float _226 = -_218;
    float _228 = _216 + _226;
    float _230 = -_212;
    float _232 = _222 + _230;
    float _234 = -_214;
    float _236 = _224 + _234;
    float _238 = fma(_210, _232, _212);
    float _240 = fma(_206, _236, _214);
    float _242 = fma(_220, _228, _218);
    if (!_182)
    {
        out.m_44.x = _240;
        out.m_44.y = _238;
        out.m_44.z = _242;
        out.m_44.w = _164;
        return out;
    }
    float _244 = _238 * 0.715200006961822509765625;
    float _246 = in.m_46.w;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_46.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_46.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = fma(_240, 0.2125999927520751953125, _244);
    float _266 = in.m_46.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_242, 0.072200000286102294921875, _264);
    bool _274 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _276 = 1.0 / _272;
    float _278 = _276 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = fma(_280, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _284 = _81 * _250;
    float _286 = 0.0 + _170;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _81 * _256;
    float _292 = _81 * _270;
    float _294 = _282 * _284;
    float _296 = _81 * _262;
    float _298 = fma(_242, _294, _290);
    float _300 = fma(_240, _294, _296);
    float _302 = fma(_238, _294, _292);
    float _304 = _290;
    if (!_274)
    {
        _304 = _288;
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
        float _324 = _81 * _316;
        float _326 = _81 * _322;
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
        float _348 = _288 * _346;
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

