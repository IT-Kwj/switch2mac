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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _55;
    float _101 = _99 * _61;
    float _103 = _99 * _67;
    float _105 = _99 * _73;
    float _107 = _99 * _79;
    float _109 = 1.0 / _101;
    float _111 = _99 * _85;
    float _113 = _99 * _91;
    float _115 = _99 * _97;
    float _117 = _103 * _109;
    float _119 = _105 * _109;
    float2 _429 = float2(_119, _117);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_429, float2(0.0), isnan(_429))).x;
    float2 _440 = float2(_107, _115);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_440, float2(0.0), isnan(_440))).w;
    float2 _448 = float2(_111, _113);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float _136 = in.m_37.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_41.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_43.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _99 * _140;
    float _156 = _154 * _109;
    float _158 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _160 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _162 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _160);
    float _164 = 1.0 / _162;
    float _166 = in.m_45.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_45.y;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_45.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_121, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = 1.0 / _186;
    float _190 = _134 * _123;
    float _192 = _99 * _146;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _196 = _164 * _194;
    float _198 = _190 * _192;
    float _200 = 0.0 + _198;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _206 = -_196;
    float _208 = fma(_188, _204, _206);
    float _210 = _208 * _158;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _99 * _152;
    float _216 = _202 * _212;
    float _218 = _216 * _214;
    bool _222 = _218 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _224 = isnan(_218);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _230 = _226 || _228;
    float _232 = in.m_41.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_41.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_41.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _196;
    float _252 = _132;
    if (!_230)
    {
        discard_fragment();
    }
    float _254 = _99 * _176;
    float _256 = _99 * _236;
    float _258 = _99 * _242;
    float _260 = _99 * _248;
    float _262 = _99 * _170;
    float _264 = _99 * _182;
    float _266 = -_254;
    float _268 = _258 + _266;
    float _270 = _130 * _130;
    float _272 = -_262;
    float _274 = _256 + _272;
    float _276 = -_264;
    float _278 = _260 + _276;
    float _280 = _128 * _128;
    float _282 = _132 * _132;
    float _284 = fma(_270, _268, _254);
    float _286 = fma(_280, _274, _262);
    float _288 = fma(_282, _278, _264);
    if (!_230)
    {
        out.m_48.x = _286;
        out.m_48.y = _284;
        out.m_48.z = _288;
        out.m_48.w = _198;
        return out;
    }
    float _290 = _284 * 0.715200006961822509765625;
    float _292 = fma(_286, 0.2125999927520751953125, _290);
    float _294 = fma(_288, 0.072200000286102294921875, _292);
    bool _296 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _298 = 1.0 / _294;
    float _300 = 0.0 + _218;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = _302;
    if (_296)
    {
        float _306 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _308 = _196 + _306;
        _250 = _308;
    }
    float _310 = _250;
    float _312 = _298 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    if (_296)
    {
        float _316 = _310 * 8.0;
        float _318 = precise::clamp(_316, 0.0, 1.0);
        _252 = _318;
    }
    float _320 = _252;
    float _322 = fma(_314, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_296)
    {
        float _324 = _302 * _320;
        _304 = _324;
    }
    float _326 = _304;
    float _328 = _286 * _322;
    float _330 = _284 * _322;
    float _332 = _288 * _322;
    float _334 = 0.0 + _326;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    out.m_48.x = _328;
    out.m_48.y = _330;
    out.m_48.z = _332;
    out.m_48.w = _336;
    return out;
}

