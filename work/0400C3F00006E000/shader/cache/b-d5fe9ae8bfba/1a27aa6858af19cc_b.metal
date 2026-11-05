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
    float4 m_48 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
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
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _347 = float2(_71, _73);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347))).xy;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = in.m_37.x;
    float _85 = in.m_35.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = _83 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _99 = fma(_79, 2.0, -1.0);
    float _101 = _83 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _103 = _69 * _89;
    float _105 = fma(_81, 2.0, -1.0);
    float _107 = _69 * _95;
    float _109 = fma(_97, _99, _103);
    float _111 = fma(_101, _105, _107);
    float2 _410 = float2(_109, _111);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_410, float2(0.0), isnan(_410))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = _69 * _128;
    float _144 = _69 * _134;
    float _146 = _69 * _140;
    float _148 = in.m_39.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_41.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_41.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _69 * _158;
    float _174 = _69 * _164;
    float _176 = -_142;
    float _178 = _122 + _176;
    float _180 = _144 * _178;
    float _182 = 0.0 + _180;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = _184 * _146;
    bool _190 = _186 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _192 = isnan(_186);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _198 = _194 || _196;
    float _200 = in.m_39.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_39.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    if (!_198)
    {
        discard_fragment();
    }
    float _212 = _69 * _204;
    float _214 = _69 * _210;
    float _216 = _69 * _152;
    float _218 = _69 * _170;
    float _220 = -_172;
    float _222 = _212 + _220;
    float _224 = -_174;
    float _226 = _214 + _224;
    float _228 = -_218;
    float _230 = _216 + _228;
    float _232 = fma(_116, _222, _172);
    float _234 = fma(_118, _226, _174);
    float _236 = fma(_120, _230, _218);
    if (!_198)
    {
        out.m_46.x = _232;
        out.m_46.y = _234;
        out.m_46.z = _236;
        out.m_46.w = _180;
        return out;
    }
    float _238 = _234 * 0.715200006961822509765625;
    float _240 = 0.0 + _186;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = fma(_232, 0.2125999927520751953125, _238);
    bool _246 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _248 = fma(_236, 0.072200000286102294921875, _244);
    float _250 = 1.0 / _248;
    float _252 = _250 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _258 = _232 * _256;
    float _260 = _234 * _256;
    float _262 = _236 * _256;
    float _264 = _256;
    if (!_246)
    {
        _264 = _242;
    }
    float _266 = _264;
    bool _268 = !_246;
    float _270 = _266;
    if (!_268)
    {
        float _272 = in.m_48.w;
        float _274 = gl_FragCoord.w;
        float _276 = _272 * _274;
        float _278 = in.m_48.z;
        float _280 = gl_FragCoord.w;
        float _282 = _278 * _280;
        float _284 = _69 * _276;
        float _286 = _69 * _282;
        float _288 = 1.0 / _284;
        float _290 = _286 * _288;
        float _292 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _294 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _292);
        float _296 = 1.0 / _294;
        float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _302 = fma(_296, _298, _300);
        float _304 = _302 * 8.0;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        float _308 = _242 * _306;
        _270 = _308;
    }
    float _310 = _270;
    float _312 = 0.0 + _310;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    out.m_46.x = _258;
    out.m_46.y = _260;
    out.m_46.z = _262;
    out.m_46.w = _314;
    return out;
}

