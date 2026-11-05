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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _496 = false;
    bool _458 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = floor(_57);
    float _63 = floor(_59);
    float _65 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _69 = _65 + _67;
    float _71 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _65);
    float _73 = _65 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _75 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _79 = _75 + _77;
    float _81 = _75 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _83 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _75);
    float _85 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _75);
    float2 _714 = float2(_69, _79);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _727 = float2(_69, _75);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_727, float2(0.0), isnan(_727)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_727, float2(0.0), isnan(_727)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _737 = float2(_69, _81);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_737, float2(0.0), isnan(_737)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_737, float2(0.0), isnan(_737)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _747 = float2(_65, _79);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_747, float2(0.0), isnan(_747)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_747, float2(0.0), isnan(_747)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _757 = float2(_65, _75);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_757, float2(0.0), isnan(_757)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_757, float2(0.0), isnan(_757)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _767 = float2(_73, _79);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_767, float2(0.0), isnan(_767)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_767, float2(0.0), isnan(_767)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _777 = float2(_71, _79);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_777, float2(0.0), isnan(_777)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_777, float2(0.0), isnan(_777)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _787 = float2(_71, _75);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_787, float2(0.0), isnan(_787)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_787, float2(0.0), isnan(_787)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _797 = float2(_71, _81);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_797, float2(0.0), isnan(_797)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_797, float2(0.0), isnan(_797)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _807 = float2(_73, _75);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_807, float2(0.0), isnan(_807)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_807, float2(0.0), isnan(_807)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _817 = float2(_65, _81);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _827 = float2(_73, _81);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_827, float2(0.0), isnan(_827)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_827, float2(0.0), isnan(_827)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _837 = float2(_69, _83);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_837, float2(0.0), isnan(_837)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_837, float2(0.0), isnan(_837)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _847 = float2(_69, _85);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_847, float2(0.0), isnan(_847)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_847, float2(0.0), isnan(_847)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _857 = float2(_71, _83);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_857, float2(0.0), isnan(_857)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_857, float2(0.0), isnan(_857)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _117 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _65);
    float2 _871 = float2(_71, _85);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_871, float2(0.0), isnan(_871)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_871, float2(0.0), isnan(_871)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _881 = float2(_65, _83);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_881, float2(0.0), isnan(_881)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_881, float2(0.0), isnan(_881)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _891 = float2(_73, _83);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_891, float2(0.0), isnan(_891)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_891, float2(0.0), isnan(_891)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _901 = float2(_65, _85);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_901, float2(0.0), isnan(_901)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_901, float2(0.0), isnan(_901)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _911 = float2(_117, _83);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_911, float2(0.0), isnan(_911)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_911, float2(0.0), isnan(_911)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _921 = float2(_117, _79);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_921, float2(0.0), isnan(_921)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_921, float2(0.0), isnan(_921)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _931 = float2(_117, _75);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_931, float2(0.0), isnan(_931)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_931, float2(0.0), isnan(_931)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _941 = float2(_73, _85);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_941, float2(0.0), isnan(_941)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_941, float2(0.0), isnan(_941)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _951 = float2(_117, _81);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_951, float2(0.0), isnan(_951)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_951, float2(0.0), isnan(_951)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float2 _961 = float2(_117, _85);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_961, float2(0.0), isnan(_961)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_961, float2(0.0), isnan(_961)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _139 = in.m_31.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_31.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _55 * _143;
    float _153 = _55 * _149;
    float _155 = _151 * 0.5;
    float _157 = _153 * 0.5;
    float _159 = floor(_151);
    float _161 = floor(_153);
    float _163 = floor(_155);
    float _165 = floor(_157);
    float _167 = fma(_163, -2.0, _159);
    float _169 = fma(_165, -2.0, _161);
    float _171 = fma(_169, 2.0, _167);
    float _173 = _87 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _175 = _89 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _177 = _89 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _179 = _89 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _181 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[16].x, _173);
    float _183 = _91 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _185 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[17].x, _175);
    float _187 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[18].x, _179);
    float _189 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[16].z, _181);
    float _191 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[18].x, _183);
    float _193 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[17].z, _185);
    float _195 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _187);
    float _197 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[16].w, _189);
    float _199 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[17].w, _193);
    float _201 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[18].z, _191);
    float _203 = _87 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _205 = _197 + _199;
    float _207 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[17].x, _203);
    float _209 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].w, _201);
    float _211 = _111 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _213 = _113 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _215 = _205 + _209;
    float _217 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[16].x, _211);
    float _219 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[17].z, _207);
    float _221 = _95 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _223 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[9].x, _177);
    float _225 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].x, _213);
    float _227 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[16].z, _217);
    float _229 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[17].w, _219);
    float _231 = _121 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _233 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[9].x, _221);
    float _235 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[16].w, _227);
    float _237 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[9].x, _177);
    float _239 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[9].z, _223);
    float _241 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[16].x, _231);
    float _243 = _235 + _229;
    float _245 = _125 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _247 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[9].z, _233);
    float _249 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[9].w, _239);
    float _251 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].w, _195);
    float _253 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[19].x, _245);
    float _255 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[16].z, _241);
    float _257 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].z, _225);
    float _259 = _93 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _261 = _243 + _251;
    float _263 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[9].w, _247);
    float _265 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[9].x, _221);
    float _267 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[17].x, _259);
    float _269 = _95 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _271 = _89 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _273 = _95 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _275 = _89 * (*spvDescriptorSet0.fp_c3)._m0[17].x;
    float _277 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[17].z, _267);
    float _279 = _271 + _269;
    float _281 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[9].z, _265);
    float _283 = _275 + _273;
    float _285 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[16].w, _255);
    float _287 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].z, _279);
    float _289 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[17].w, _277);
    float _291 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[17].z, _283);
    float _293 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[9].w, _281);
    float _295 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[18].w, _287);
    float _297 = _285 + _289;
    float _299 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[17].w, _291);
    float _301 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].w, _257);
    float _303 = _107 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _305 = _297 + _295;
    float _307 = _87 * (*spvDescriptorSet0.fp_c3)._m0[16].x;
    float _309 = _215 + _301;
    float _311 = _93 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _313 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[18].x, _303);
    float _315 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].z, _253);
    float _317 = precise::max(_93, _91);
    float _319 = _307 + _311;
    float _321 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].z, _313);
    float _323 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[19].w, _315);
    float _325 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[16].z, _319);
    float _327 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[16].w, _325);
    float _329 = _91 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _331 = _327 + _299;
    float _333 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[18].w, _321);
    float _335 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[19].x, _329);
    float _337 = precise::min(_105, _109);
    float _339 = _331 + _333;
    float _341 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[19].z, _335);
    float _343 = _91 * (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _345 = _339 + _323;
    float _347 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[19].w, _341);
    float _349 = _93 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _351 = _261 + _347;
    float _353 = _107 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _355 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[9].x, _349);
    float _357 = precise::min(_87, _89);
    float _359 = _343 + _353;
    float _361 = precise::max(_105, _109);
    float _363 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[9].z, _355);
    float _365 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[19].z, _359);
    float _367 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].w, _365);
    float _369 = _305 + _367;
    float _371 = _105 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _373 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[9].x, _371);
    float _375 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[9].z, _373);
    float _377 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[9].w, _375);
    float _379 = _87 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _381 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[9].x, _379);
    float _383 = _97 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _385 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[9].x, _383);
    float _387 = precise::min(_93, _91);
    float _389 = precise::min(_357, _387);
    float _391 = precise::min(_97, _107);
    float _393 = precise::min(_391, _337);
    float _395 = precise::min(_389, _393);
    float _397 = trunc(_171);
    int _400 = int(_397);
    float _402 = precise::max(_87, _89);
    float _404 = precise::min(_95, _395);
    float _406 = precise::max(_402, _317);
    float _408 = precise::max(_97, _107);
    float _410 = precise::max(_408, _361);
    float _412 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[9].z, _385);
    float _414 = precise::max(_406, _410);
    float _416 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[9].z, _237);
    bool _420 = _400 >= 2;
    float _422 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[9].z, _381);
    float _424 = precise::max(_95, _414);
    float _426 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[9].w, _416);
    float _428 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[9].w, _363);
    float _430 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[9].w, _422);
    float _432 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[9].w, _412);
    bool _434 = !_420;
    float _494;
    if (!_434)
    {
        bool _436 = _400 >= 3;
        float _438 = _107 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _440 = _91 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _442 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[9].x, _438);
        float _444 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[9].x, _440);
        float _446 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[9].z, _442);
        float _448 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[9].z, _444);
        float _450 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[9].w, _446);
        float _452 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[9].w, _448);
        bool _454 = !_436;
        if (!_454)
        {
            bool _456 = _400 != 3;
            _458 = _456;
            if (!_458)
            {
                float _460 = _428 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
                float _462 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[17].x, _273);
                float _464 = _263 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
                float _466 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[16].x, _460);
                float _468 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[17].z, _462);
                float _470 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[18].x, _464);
                float _472 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[19].x, _353);
                float _474 = fma(_369, (*spvDescriptorSet0.fp_c3)._m0[16].z, _466);
                float _476 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[17].w, _468);
                float _478 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[18].z, _470);
                float _480 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[19].z, _472);
                float _482 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[16].w, _474);
                float _484 = fma(_377, (*spvDescriptorSet0.fp_c3)._m0[18].w, _478);
                float _486 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[19].w, _480);
                float _488 = _482 + _476;
                float _490 = _488 + _484;
                float _492 = _490 + _486;
                _494 = _492;
                _496 = true;
            }
        }
        else
        {
            float _498 = _351 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
            float _500 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[17].y, _275);
            float _502 = _309 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
            float _504 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[19].y, _343);
            float _506 = fma(_430, (*spvDescriptorSet0.fp_c3)._m0[16].x, _498);
            float _508 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[17].z, _500);
            float _510 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[18].x, _502);
            float _512 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[19].z, _504);
            float _514 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[16].z, _506);
            float _516 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[17].w, _508);
            float _518 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[18].z, _510);
            float _520 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[19].w, _512);
            float _522 = fma(_369, (*spvDescriptorSet0.fp_c3)._m0[16].w, _514);
            float _524 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[18].w, _518);
            float _526 = _522 + _516;
            float _528 = _526 + _524;
            float _530 = _528 + _520;
            _494 = _530;
            _496 = true;
        }
    }
    if ((!_496) || _458)
    {
        bool _532;
        float _546;
        float _548;
        if (!_458)
        {
            _532 = _400 >= 1;
            float _534 = _93 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _536 = _87 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _538 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[9].x, _534);
            float _540 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[9].x, _536);
            float _542 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[9].z, _538);
            float _544 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[9].z, _540);
            _546 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[9].w, _542);
            _548 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[9].w, _544);
        }
        if ((!_532) || _458)
        {
            bool _550;
            if (!_458)
            {
                _550 = _400 != 0;
            }
            if ((!_550) && (!_458))
            {
                float _552 = _351 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
                float _554 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[16].y, _307);
                float _556 = _89 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
                float _558 = _309 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
                float _560 = fma(_430, (*spvDescriptorSet0.fp_c3)._m0[17].x, _552);
                float _562 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[16].z, _554);
                float _564 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[18].y, _556);
                float _566 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[19].x, _558);
                float _568 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[17].z, _560);
                float _570 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[16].w, _562);
                float _572 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _564);
                float _574 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[19].z, _566);
                float _576 = fma(_369, (*spvDescriptorSet0.fp_c3)._m0[17].w, _568);
                float _578 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[18].w, _572);
                float _580 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[19].w, _574);
                float _582 = _570 + _576;
                float _584 = _582 + _578;
                float _586 = _584 + _580;
                _494 = _586;
                _496 = true;
            }
            else
            {
                _458 = false;
                _494 = 0.0;
                _496 = true;
            }
        }
        else
        {
            float _588 = _428 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
            float _590 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[16].x, _311);
            float _592 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[18].x, _269);
            float _594 = _263 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
            float _596 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[17].x, _588);
            float _598 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[16].z, _590);
            float _600 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[18].z, _592);
            float _602 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[19].x, _594);
            float _604 = fma(_369, (*spvDescriptorSet0.fp_c3)._m0[17].z, _596);
            float _606 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[16].w, _598);
            float _608 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].w, _600);
            float _610 = fma(_345, (*spvDescriptorSet0.fp_c3)._m0[19].z, _602);
            float _612 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[17].w, _604);
            float _614 = fma(_377, (*spvDescriptorSet0.fp_c3)._m0[19].w, _610);
            float _616 = _606 + _612;
            float _618 = _616 + _608;
            float _620 = _618 + _614;
            _494 = _620;
        }
    }
    _496 = false;
    float _622 = _494;
    float _624 = precise::max(_404, _622);
    float _626 = precise::min(_424, _624);
    out.m_34.x = _626;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = 0.0;
    return out;
}

