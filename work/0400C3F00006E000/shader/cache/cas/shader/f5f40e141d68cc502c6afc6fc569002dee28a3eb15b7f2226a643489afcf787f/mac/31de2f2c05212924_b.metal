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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
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
    float4 m_41 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _410 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_410, float2(0.0), isnan(_410))).x;
    float2 _421 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _138 = _87 * _122;
    float _140 = _138 * _97;
    float _142 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c8)._m0[30].w, _142);
    float _146 = _87 * _128;
    float _148 = 1.0 / _144;
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _152 = _148 * _150;
    float _154 = in.m_43.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_43.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _87 * _158;
    float _168 = _87 * _164;
    float _170 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _172 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _170);
    float _174 = 1.0 / _172;
    float _176 = _116 * _146;
    float _178 = 0.0 + _176;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = -_152;
    float _186 = fma(_174, _182, _184);
    float _188 = _186 * _136;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _87 * _134;
    float _194 = _180 * _190;
    float _196 = _194 * _192;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _202 = isnan(_196);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _208 = _204 || _206;
    float _210 = in.m_39.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.y;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_43.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    if (!_208)
    {
        discard_fragment();
    }
    float _234 = _112 * _112;
    float _236 = _87 * _214;
    float _238 = _87 * _220;
    float _240 = _87 * _226;
    float _242 = _87 * _232;
    float _244 = _110 * _110;
    float _246 = _114 * _114;
    float _248 = fma(_234, _240, _242);
    float _250 = fma(_244, _236, _166);
    float _252 = fma(_246, _238, _168);
    if (!_208)
    {
        out.m_46.x = _250;
        out.m_46.y = _248;
        out.m_46.z = _252;
        out.m_46.w = _176;
        return out;
    }
    float _254 = _248 * 0.715200006961822509765625;
    float _256 = in.m_48.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_48.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_48.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = fma(_250, 0.2125999927520751953125, _254);
    float _276 = in.m_48.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = fma(_252, 0.072200000286102294921875, _274);
    bool _284 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _286 = 1.0 / _282;
    float _288 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_284)
    {
        float _290 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _292 = _152 + _290;
        _288 = _292;
    }
    float _294 = _288;
    float _296 = _286 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = fma(_298, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _302 = _87 * _260;
    float _304 = _87 * _272;
    float _306 = _300 * _302;
    float _308 = 0.0 + _196;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = _302;
    float _314 = _310;
    if (_284)
    {
        float _316 = _294 * 8.0;
        float _318 = precise::clamp(_316, 0.0, 1.0);
        _312 = _318;
    }
    float _320 = _312;
    float _322 = _87 * _266;
    float _324 = _87 * _280;
    float _326 = fma(_248, _306, _304);
    if (_284)
    {
        float _328 = _310 * _320;
        _314 = _328;
    }
    float _330 = _314;
    float _332 = fma(_250, _306, _322);
    float _334 = fma(_252, _306, _324);
    float _336 = 0.0 + _330;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    out.m_46.x = _332;
    out.m_46.y = _326;
    out.m_46.z = _334;
    out.m_46.w = _338;
    return out;
}

