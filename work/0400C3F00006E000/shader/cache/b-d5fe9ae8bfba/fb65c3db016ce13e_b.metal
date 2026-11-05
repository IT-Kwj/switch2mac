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
    float4 m_37 [[user(locn5), flat]];
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
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _383 = float2(_73, _75);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_383, float2(0.0), isnan(_383))).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = in.m_37.x;
    float _87 = in.m_35.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _85 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _101 = fma(_81, 2.0, -1.0);
    float _103 = _85 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _105 = _71 * _91;
    float _107 = fma(_83, 2.0, -1.0);
    float _109 = _71 * _97;
    float _111 = fma(_99, _101, _105);
    float _113 = fma(_103, _107, _109);
    float2 _446 = float2(_111, _113);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_446, float2(0.0), isnan(_446))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_446, float2(0.0), isnan(_446))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float _126 = in.m_39.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_43.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _71 * _130;
    float _146 = _71 * _136;
    float _148 = in.m_39.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_39.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_41.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _71 * _158;
    float _174 = _71 * _164;
    float _176 = -_144;
    float _178 = _124 + _176;
    float _180 = _146 * _178;
    float _182 = _71 * _142;
    float _184 = 0.0 + _180;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = _186 * _182;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _194 = isnan(_188);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _200 = _196 || _198;
    float _202 = in.m_39.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_41.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    if (!_200)
    {
        discard_fragment();
    }
    float _214 = _71 * _206;
    float _216 = _71 * _212;
    float _218 = _71 * _152;
    float _220 = _71 * _170;
    float _222 = -_216;
    float _224 = _214 + _222;
    float _226 = -_172;
    float _228 = _218 + _226;
    float _230 = -_220;
    float _232 = _174 + _230;
    float _234 = fma(_118, _224, _216);
    float _236 = fma(_120, _228, _172);
    float _238 = fma(_122, _232, _220);
    if (!_200)
    {
        out.m_46.x = _234;
        out.m_46.y = _236;
        out.m_46.z = _238;
        out.m_46.w = _180;
        return out;
    }
    float _240 = _236 * 0.715200006961822509765625;
    float _242 = in.m_48.w;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_48.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_48.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = fma(_234, 0.2125999927520751953125, _240);
    float _262 = in.m_48.y;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_238, 0.072200000286102294921875, _260);
    bool _270 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _272 = 1.0 / _268;
    float _274 = _272 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _71 * _246;
    float _280 = fma(_276, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _282 = _71 * _252;
    float _284 = _280 * _278;
    float _286 = 0.0 + _188;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _71 * _258;
    float _292 = _71 * _266;
    float _294 = fma(_238, _284, _282);
    float _296 = fma(_234, _284, _290);
    float _298 = fma(_236, _284, _292);
    float _300 = _282;
    if (!_270)
    {
        _300 = _288;
    }
    float _302 = _300;
    bool _304 = !_270;
    float _306 = _302;
    if (!_304)
    {
        float _308 = in.m_50.w;
        float _310 = gl_FragCoord.w;
        float _312 = _308 * _310;
        float _314 = in.m_50.z;
        float _316 = gl_FragCoord.w;
        float _318 = _314 * _316;
        float _320 = _71 * _312;
        float _322 = _71 * _318;
        float _324 = 1.0 / _320;
        float _326 = _322 * _324;
        float _328 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _330 = fma(_326, (*spvDescriptorSet0.fp_c8)._m0[30].w, _328);
        float _332 = 1.0 / _330;
        float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _338 = fma(_332, _334, _336);
        float _340 = _338 * 8.0;
        float _342 = precise::clamp(_340, 0.0, 1.0);
        float _344 = _288 * _342;
        _306 = _344;
    }
    float _346 = _306;
    float _348 = 0.0 + _346;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    out.m_46.x = _296;
    out.m_46.y = _298;
    out.m_46.z = _294;
    out.m_46.w = _350;
    return out;
}

