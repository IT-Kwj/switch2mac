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
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _85 * _77;
    float _95 = 1.0 / _87;
    float _97 = _85 * _83;
    float _99 = _89 * _95;
    float _101 = _91 * _95;
    float2 _386 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_386, float2(0.0), isnan(_386))).x;
    float2 _397 = float2(_93, _97);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_35.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_41.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _136 = _85 * _120;
    float _138 = _136 * _95;
    float _140 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c8)._m0[30].w, _140);
    float _144 = _85 * _126;
    float _146 = 1.0 / _142;
    float _148 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _150 = _146 * _148;
    float _152 = in.m_43.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_43.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _166 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[30].w, _164);
    float _168 = 1.0 / _166;
    float _170 = _114 * _144;
    float _172 = 0.0 + _170;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _178 = -_150;
    float _180 = fma(_168, _176, _178);
    float _182 = _180 * _134;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = _85 * _132;
    float _188 = _174 * _184;
    float _190 = _188 * _186;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _202 = _198 || _200;
    float _204 = in.m_39.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_39.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_43.y;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _150;
    if (!_202)
    {
        discard_fragment();
    }
    float _230 = _85 * _156;
    float _232 = _85 * _208;
    float _234 = _85 * _214;
    float _236 = _85 * _220;
    float _238 = _85 * _226;
    float _240 = _85 * _162;
    float _242 = -_230;
    float _244 = _236 + _242;
    float _246 = -_238;
    float _248 = _232 + _246;
    float _250 = -_240;
    float _252 = _234 + _250;
    float _254 = _108 * _108;
    float _256 = _110 * _110;
    float _258 = _112 * _112;
    float _260 = fma(_254, _244, _230);
    float _262 = fma(_256, _248, _238);
    float _264 = fma(_258, _252, _240);
    if (!_202)
    {
        out.m_46.x = _260;
        out.m_46.y = _262;
        out.m_46.z = _264;
        out.m_46.w = _170;
        return out;
    }
    float _266 = _262 * 0.715200006961822509765625;
    float _268 = fma(_260, 0.2125999927520751953125, _266);
    float _270 = fma(_264, 0.072200000286102294921875, _268);
    bool _272 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _274 = 1.0 / _270;
    float _276 = 0.0 + _190;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _278;
    if (_272)
    {
        float _282 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _284 = _150 + _282;
        _228 = _284;
    }
    float _286 = _228;
    float _288 = _274 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _286;
    if (_272)
    {
        float _294 = _286 * 8.0;
        float _296 = precise::clamp(_294, 0.0, 1.0);
        _292 = _296;
    }
    float _298 = _292;
    float _300 = fma(_290, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_272)
    {
        float _302 = _278 * _298;
        _280 = _302;
    }
    float _304 = _280;
    float _306 = _260 * _300;
    float _308 = _262 * _300;
    float _310 = _264 * _300;
    float _312 = 0.0 + _304;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    out.m_46.x = _306;
    out.m_46.y = _308;
    out.m_46.z = _310;
    out.m_46.w = _314;
    return out;
}

