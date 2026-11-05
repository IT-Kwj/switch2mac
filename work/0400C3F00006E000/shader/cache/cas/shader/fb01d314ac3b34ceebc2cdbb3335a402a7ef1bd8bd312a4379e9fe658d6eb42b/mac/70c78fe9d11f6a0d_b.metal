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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
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
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = _83 * _83;
    float _91 = in.m_39.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = fma(_85, _85, _89);
    float _99 = fma(_87, _87, _97);
    float _101 = rsqrt(_99);
    float _103 = _83 * _101;
    float _105 = _85 * _101;
    float _107 = _87 * _101;
    float _109 = _103 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _113 = _81 * _95;
    float _115 = _81 * _79;
    float _117 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].x, _109);
    float _119 = fma(_107, (*spvDescriptorSet0.fp_c5)._m0[2].z, _117);
    float _121 = fma(_111, 0.5, 0.5);
    float _123 = fma(_119, -0.5, 0.5);
    float _125 = fma(_119, 0.5, 0.5);
    float _127 = fma(_125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _129 = sqrt(_123);
    float _131 = fma(_125, _127, -0.212114393711090087890625);
    float _133 = fma(_125, _131, 1.570728778839111328125);
    float _135 = _129 * 0.636619746685028076171875;
    float _137 = -_133;
    float _139 = fma(_135, _137, 1.0);
    float2 _480 = float2(_113, _115);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_480, float2(0.0), isnan(_480))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float2 _499 = float2(_139, _121);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = 0.0 + _111;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = in.m_43.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = abs(_170);
    float _180 = log2(_178);
    float _182 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _184 = _182 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _186 = _180 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _188 = exp2(_186);
    float _190 = _81 * _166;
    bool _194 = _111 >= _190;
    float _196 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _198 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[12].z, _196);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _190;
    float _204 = (*spvDescriptorSet0.fp_c4)._m0[12].z;
    if (!_194)
    {
        _202 = 0.0;
    }
    float _206 = _202;
    float _208 = 0.0;
    float _210 = _206;
    if (!_194)
    {
        _204 = 0.0;
        _208 = 0.0;
    }
    float _212 = _204;
    float _214 = _208;
    bool _216 = !_194;
    float _218 = _214;
    float _220 = _212;
    if (!_216)
    {
        float _222 = in.m_45.x;
        float _224 = gl_FragCoord.w;
        float _226 = _222 * _224;
        float _228 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _230 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _228;
        float _232 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _234 = 1.0 / _230;
        float _236 = log2(_232);
        float _238 = _81 * _226;
        float _240 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _242 = _238 + _240;
        float _244 = _242 * _234;
        float _246 = _236 * 0.1155245304107666015625;
        float _248 = sqrt(_244);
        float2 _630 = float2(_246, _248);
        float3 _252 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_630, float2(0.0), isnan(_630))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_630, float2(0.0), isnan(_630))).xyz;
        float _254 = _252.x;
        float _256 = _252.y;
        float _258 = _252.z;
        _218 = _254;
        _220 = _256;
        _210 = _258;
    }
    float _260 = _218;
    float _262 = _220;
    float _264 = _210;
    float _266 = _154 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _268 = _156 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _270 = _158 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _272 = fma(_188, _184, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _274 = _266 * _260;
    float _276 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _278 = _266 + _276;
    float _280 = _268 * _262;
    float _282 = _160 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _288 = _268 + _286;
    float _290 = _270 * _264;
    float _292 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _294 = _270 + _292;
    float _296 = _200 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _298 = fma(_284, _278, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _300 = fma(_284, _288, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _302 = fma(_284, _294, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _304 = fma(_274, _296, _298);
    float _306 = fma(_280, _296, _300);
    float _308 = fma(_290, _296, _302);
    float _310 = _304 * _150;
    float _312 = _306 * _150;
    float _314 = _308 * _150;
    float _316 = _81 * _176;
    float _318 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[13].y, _310);
    float _320 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _312);
    float _322 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[13].y, _314);
    float _324 = _272 * _316;
    float _326 = -_318;
    float _328 = _326 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _330 = -_320;
    float _332 = _330 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _334 = -_322;
    float _336 = _334 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _338 = fma(_324, _328, _318);
    float _340 = fma(_324, _332, _320);
    float _342 = fma(_324, _336, _322);
    out.m_48.x = _338;
    out.m_48.y = _340;
    out.m_48.z = _342;
    out.m_48.w = 1.0;
    return out;
}

