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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _73;
    float _81 = fma(_75, _75, _79);
    float _83 = fma(_77, _77, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _75 * _85;
    float _91 = _77 * _85;
    float _93 = _87 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].x, _93);
    float _99 = fma(_95, 0.5, 0.5);
    float _101 = fma(_91, (*spvDescriptorSet0.fp_c5)._m0[2].z, _97);
    float _103 = fma(_101, -0.5, 0.5);
    float _105 = fma(_101, 0.5, 0.5);
    float _107 = fma(_105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _109 = sqrt(_103);
    float _111 = fma(_105, _107, -0.212114393711090087890625);
    float _113 = fma(_105, _111, 1.570728778839111328125);
    float _115 = _109 * 0.636619746685028076171875;
    float _117 = -_113;
    float _119 = fma(_115, _117, 1.0);
    float2 _418 = float2(_119, _99);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_418, float2(0.0), isnan(_418))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_37.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = 0.0 + _95;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = in.m_39.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = abs(_140);
    float _150 = log2(_148);
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _156 = _150 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _158 = exp2(_156);
    float _160 = _71 * _136;
    bool _164 = _95 >= _160;
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _168 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[12].z, _166);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _101;
    float _174 = _150;
    float _176 = _160;
    if (!_164)
    {
        _172 = 0.0;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_164)
    {
        _174 = 0.0;
        _176 = 0.0;
    }
    float _182 = _174;
    float _184 = _176;
    bool _186 = !_164;
    float _188 = _184;
    float _190 = _182;
    if (!_186)
    {
        float _192 = in.m_41.x;
        float _194 = gl_FragCoord.w;
        float _196 = _192 * _194;
        float _198 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _200 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _198;
        float _202 = 1.0 / _200;
        float _204 = _71 * _196;
        float _206 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _208 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _210 = _204 + _208;
        float _212 = log2(_206);
        float _214 = _210 * _202;
        float _216 = sqrt(_214);
        float _218 = _212 * 0.1155245304107666015625;
        float2 _552 = float2(_218, _216);
        float3 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_552, float2(0.0), isnan(_552))).xyz;
        float _224 = _222.x;
        float _226 = _222.y;
        float _228 = _222.z;
        _188 = _224;
        _190 = _226;
        _180 = _228;
    }
    float _230 = _188;
    float _232 = _190;
    float _234 = _180;
    float _236 = _124 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _238 = _126 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _240 = _128 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _242 = _130 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _236 * _230;
    float _248 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _250 = _236 + _248;
    float _252 = _238 * _232;
    float _254 = _240 * _234;
    float _256 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _258 = _238 + _256;
    float _260 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _262 = _240 + _260;
    float _264 = _170 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _266 = fma(_244, _250, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _268 = fma(_244, _258, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _270 = fma(_244, _262, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _272 = _71 * _146;
    float _274 = fma(_246, _264, _266);
    float _276 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _278 = fma(_252, _264, _268);
    float _280 = fma(_254, _264, _270);
    float _282 = -_274;
    float _284 = _282 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _286 = _276 * _272;
    float _288 = -_278;
    float _290 = _288 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _292 = -_280;
    float _294 = _292 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _296 = fma(_286, _284, _274);
    float _298 = fma(_286, _290, _278);
    float _300 = fma(_286, _294, _280);
    out.m_44.x = _296;
    out.m_44.y = _298;
    out.m_44.z = _300;
    out.m_44.w = 1.0;
    return out;
}

