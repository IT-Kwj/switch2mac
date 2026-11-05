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
    float4 m_46 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _53;
    float _81 = _79 * _59;
    float _83 = _79 * _65;
    float _85 = _79 * _71;
    float _87 = _79 * _77;
    float2 _373 = float2(_81, _83);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_373, float2(0.0), isnan(_373))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float2 _392 = float2(_85, _87);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_392, float2(0.0), isnan(_392))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_392, float2(0.0), isnan(_392))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_37.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_41.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _79 * _114;
    float _130 = in.m_37.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _79 * _134;
    float _150 = _98 * _108;
    float _152 = _79 * _120;
    float _154 = _150 * _128;
    float _156 = _79 * _126;
    float _158 = _152 * _154;
    float _160 = 0.0 + _158;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = _162 * _156;
    bool _168 = _164 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _170 = isnan(_164);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _176 = _172 || _174;
    float _178 = in.m_39.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_37.z;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_37.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    if (!_176)
    {
        discard_fragment();
    }
    float _196 = _102 * _102;
    float _198 = _92 * _92;
    float _200 = _94 * _94;
    float _202 = _104 * _104;
    float _204 = _96 * _96;
    float _206 = _198 * _196;
    float _208 = _106 * _106;
    float _210 = _200 * _202;
    float _212 = _204 * _208;
    float _214 = _79 * _182;
    float _216 = _79 * _188;
    float _218 = _79 * _194;
    float _220 = _79 * _140;
    float _222 = _79 * _146;
    float _224 = -_214;
    float _226 = _148 + _224;
    float _228 = -_220;
    float _230 = _218 + _228;
    float _232 = -_222;
    float _234 = _216 + _232;
    float _236 = fma(_206, _226, _214);
    float _238 = fma(_210, _230, _220);
    float _240 = fma(_212, _234, _222);
    if (!_176)
    {
        out.m_44.x = _236;
        out.m_44.y = _238;
        out.m_44.z = _240;
        out.m_44.w = _158;
        return out;
    }
    float _242 = _238 * 0.715200006961822509765625;
    float _244 = 0.0 + _164;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = fma(_236, 0.2125999927520751953125, _242);
    bool _250 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _252 = fma(_240, 0.072200000286102294921875, _248);
    float _254 = 1.0 / _252;
    float _256 = _254 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _262 = _236 * _260;
    float _264 = _238 * _260;
    float _266 = _240 * _260;
    float _268 = _260;
    if (!_250)
    {
        _268 = _246;
    }
    float _270 = _268;
    bool _272 = !_250;
    float _274 = _270;
    if (!_272)
    {
        float _276 = in.m_46.w;
        float _278 = gl_FragCoord.w;
        float _280 = _276 * _278;
        float _282 = in.m_46.z;
        float _284 = gl_FragCoord.w;
        float _286 = _282 * _284;
        float _288 = _79 * _280;
        float _290 = _79 * _286;
        float _292 = 1.0 / _288;
        float _294 = _290 * _292;
        float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _298 = fma(_294, (*spvDescriptorSet0.fp_c8)._m0[30].w, _296);
        float _300 = 1.0 / _298;
        float _302 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _304 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _306 = fma(_300, _302, _304);
        float _308 = _306 * 8.0;
        float _310 = precise::clamp(_308, 0.0, 1.0);
        float _312 = _246 * _310;
        _274 = _312;
    }
    float _314 = _274;
    float _316 = 0.0 + _314;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    out.m_44.x = _262;
    out.m_44.y = _264;
    out.m_44.z = _266;
    out.m_44.w = _318;
    return out;
}

