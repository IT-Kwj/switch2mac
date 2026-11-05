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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
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
    bool _505 = false;
    bool _467 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = rint((*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _57 = precise::max(_55, 0.0);
    uint _60 = uint(_57);
    uint _62 = clamp(_60, 0u, 65535u);
    float _64 = 1.0 / _41;
    float _66 = _64 * _47;
    float _68 = _64 * _53;
    float _70 = floor(_66);
    float _72 = floor(_68);
    float _74 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _76 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _78 = _74 + _76;
    float _80 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _82 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _74);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _86 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _74);
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _90 = _84 + _88;
    float _92 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _84);
    float3 _734 = float3(_78, _90, float(int(_62)));
    float3 _738 = select(_734, float3(0.0), isnan(_734));
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _738.xy, uint(rint(_738.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _738.xy, uint(rint(_738.z)), level(0.0)).x;
    float3 _747 = float3(_78, _92, float(int(_62)));
    float3 _749 = select(_747, float3(0.0), isnan(_747));
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _749.xy, uint(rint(_749.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _749.xy, uint(rint(_749.z)), level(0.0)).x;
    float3 _758 = float3(_74, _92, float(int(_62)));
    float3 _760 = select(_758, float3(0.0), isnan(_758));
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _760.xy, uint(rint(_760.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _760.xy, uint(rint(_760.z)), level(0.0)).x;
    float3 _769 = float3(_74, _90, float(int(_62)));
    float3 _771 = select(_769, float3(0.0), isnan(_769));
    float _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _771.xy, uint(rint(_771.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _771.xy, uint(rint(_771.z)), level(0.0)).x;
    float3 _780 = float3(_80, _92, float(int(_62)));
    float3 _782 = select(_780, float3(0.0), isnan(_780));
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _782.xy, uint(rint(_782.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _782.xy, uint(rint(_782.z)), level(0.0)).x;
    float3 _791 = float3(_82, _92, float(int(_62)));
    float3 _793 = select(_791, float3(0.0), isnan(_791));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _793.xy, uint(rint(_793.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _793.xy, uint(rint(_793.z)), level(0.0)).x;
    float3 _802 = float3(_80, _90, float(int(_62)));
    float3 _804 = select(_802, float3(0.0), isnan(_802));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _804.xy, uint(rint(_804.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _804.xy, uint(rint(_804.z)), level(0.0)).x;
    float3 _813 = float3(_82, _90, float(int(_62)));
    float3 _815 = select(_813, float3(0.0), isnan(_813));
    float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _815.xy, uint(rint(_815.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _815.xy, uint(rint(_815.z)), level(0.0)).x;
    float3 _824 = float3(_86, _92, float(int(_62)));
    float3 _826 = select(_824, float3(0.0), isnan(_824));
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _826.xy, uint(rint(_826.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _826.xy, uint(rint(_826.z)), level(0.0)).x;
    float3 _835 = float3(_74, _84, float(int(_62)));
    float3 _837 = select(_835, float3(0.0), isnan(_835));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _837.xy, uint(rint(_837.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _837.xy, uint(rint(_837.z)), level(0.0)).x;
    float3 _846 = float3(_86, _90, float(int(_62)));
    float3 _848 = select(_846, float3(0.0), isnan(_846));
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _848.xy, uint(rint(_848.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _848.xy, uint(rint(_848.z)), level(0.0)).x;
    float3 _857 = float3(_78, _84, float(int(_62)));
    float3 _859 = select(_857, float3(0.0), isnan(_857));
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _859.xy, uint(rint(_859.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _859.xy, uint(rint(_859.z)), level(0.0)).x;
    float3 _868 = float3(_80, _84, float(int(_62)));
    float3 _870 = select(_868, float3(0.0), isnan(_868));
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _870.xy, uint(rint(_870.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _870.xy, uint(rint(_870.z)), level(0.0)).x;
    float3 _879 = float3(_86, _84, float(int(_62)));
    float3 _881 = select(_879, float3(0.0), isnan(_879));
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _881.xy, uint(rint(_881.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _881.xy, uint(rint(_881.z)), level(0.0)).x;
    float3 _890 = float3(_82, _84, float(int(_62)));
    float3 _892 = select(_890, float3(0.0), isnan(_890));
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _892.xy, uint(rint(_892.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _892.xy, uint(rint(_892.z)), level(0.0)).x;
    float _124 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _126 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _84);
    float3 _909 = float3(_78, _124, float(int(_62)));
    float3 _911 = select(_909, float3(0.0), isnan(_909));
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _911.xy, uint(rint(_911.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _911.xy, uint(rint(_911.z)), level(0.0)).x;
    float3 _920 = float3(_74, _124, float(int(_62)));
    float3 _922 = select(_920, float3(0.0), isnan(_920));
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _922.xy, uint(rint(_922.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _922.xy, uint(rint(_922.z)), level(0.0)).x;
    float3 _931 = float3(_82, _124, float(int(_62)));
    float3 _933 = select(_931, float3(0.0), isnan(_931));
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _933.xy, uint(rint(_933.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _933.xy, uint(rint(_933.z)), level(0.0)).x;
    float3 _942 = float3(_80, _124, float(int(_62)));
    float3 _944 = select(_942, float3(0.0), isnan(_942));
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _944.xy, uint(rint(_944.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _944.xy, uint(rint(_944.z)), level(0.0)).x;
    float3 _953 = float3(_78, _126, float(int(_62)));
    float3 _955 = select(_953, float3(0.0), isnan(_953));
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _955.xy, uint(rint(_955.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _955.xy, uint(rint(_955.z)), level(0.0)).x;
    float3 _964 = float3(_82, _126, float(int(_62)));
    float3 _966 = select(_964, float3(0.0), isnan(_964));
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _966.xy, uint(rint(_966.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _966.xy, uint(rint(_966.z)), level(0.0)).x;
    float3 _975 = float3(_74, _126, float(int(_62)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _977.xy, uint(rint(_977.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _977.xy, uint(rint(_977.z)), level(0.0)).x;
    float3 _986 = float3(_80, _126, float(int(_62)));
    float3 _988 = select(_986, float3(0.0), isnan(_986));
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _988.xy, uint(rint(_988.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _988.xy, uint(rint(_988.z)), level(0.0)).x;
    float3 _997 = float3(_86, _124, float(int(_62)));
    float3 _999 = select(_997, float3(0.0), isnan(_997));
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _999.xy, uint(rint(_999.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _999.xy, uint(rint(_999.z)), level(0.0)).x;
    float3 _1008 = float3(_86, _126, float(int(_62)));
    float3 _1010 = select(_1008, float3(0.0), isnan(_1008));
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1010.xy, uint(rint(_1010.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1010.xy, uint(rint(_1010.z)), level(0.0)).x;
    float _148 = in.m_31.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_31.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _64 * _152;
    float _162 = _64 * _158;
    float _164 = _160 * 0.5;
    float _166 = _162 * 0.5;
    float _168 = floor(_160);
    float _170 = floor(_162);
    float _172 = floor(_164);
    float _174 = floor(_166);
    float _176 = fma(_172, -2.0, _168);
    float _178 = fma(_174, -2.0, _170);
    float _180 = fma(_178, 2.0, _176);
    float _182 = trunc(_180);
    int _185 = int(_182);
    bool _189 = _185 >= 2;
    float _191 = _94 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _193 = _96 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _195 = _100 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _197 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[16].x, _193);
    float _199 = _98 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _201 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _191);
    float _203 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[17].x, _195);
    float _205 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[16].z, _197);
    float _207 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[16].x, _199);
    float _209 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[17].z, _201);
    float _211 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _203);
    float _213 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].w, _205);
    float _215 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].z, _207);
    float _217 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].w, _209);
    float _219 = _112 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _221 = _116 * (*spvDescriptorSet0.fp_c3)._m0[17].x;
    float _223 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[16].w, _215);
    float _225 = _213 + _217;
    float _227 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[17].w, _211);
    float _229 = _112 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _231 = _116 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _233 = _112 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _235 = _223 + _227;
    float _237 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, _229);
    float _239 = _231 + _219;
    float _241 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].z, _237);
    float _243 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].z, _239);
    float _245 = _94 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _247 = _116 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _249 = _221 + _233;
    float _251 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[18].w, _243);
    float _253 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _245);
    float _255 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].x, _247);
    float _257 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].z, _249);
    float _259 = _235 + _251;
    float _261 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[16].z, _253);
    float _263 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].z, _255);
    float _265 = _116 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _267 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[9].w, _241);
    float _269 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].w, _261);
    float _271 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].w, _263);
    float _273 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[17].w, _257);
    float _275 = _128 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _277 = _269 + _271;
    float _279 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].x, _265);
    float _281 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[18].x, _275);
    float _283 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].z, _279);
    float _285 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[18].z, _281);
    float _287 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].w, _283);
    float _289 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[18].w, _285);
    float _291 = _225 + _287;
    float _293 = _136 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _295 = _277 + _289;
    float _297 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[19].x, _293);
    float _299 = _116 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _301 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[9].x, _229);
    float _303 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[19].z, _297);
    float _305 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[9].x, _299);
    float _307 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[9].z, _301);
    float _309 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].x, _299);
    float _311 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[19].w, _303);
    float _313 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[9].z, _305);
    float _315 = _140 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _317 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[9].w, _307);
    float _319 = _94 * (*spvDescriptorSet0.fp_c3)._m0[16].x;
    float _321 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[9].w, _313);
    float _323 = _295 + _311;
    float _325 = _100 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _327 = _130 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _329 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[19].x, _315);
    float _331 = _319 + _325;
    float _333 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[18].x, _327);
    float _335 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[19].z, _329);
    float _337 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _331);
    float _339 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[18].z, _333);
    float _341 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[16].w, _337);
    float _343 = _128 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _345 = _341 + _273;
    float _347 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[18].w, _339);
    float _349 = _345 + _347;
    float _351 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[19].x, _343);
    float _353 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[19].z, _351);
    float _355 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[19].w, _353);
    float _357 = _130 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _359 = _291 + _355;
    float _361 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[19].w, _335);
    float _363 = _128 * (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _365 = precise::max(_118, _134);
    float _367 = _349 + _361;
    float _369 = _363 + _357;
    float _371 = _100 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _373 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[19].z, _369);
    float _375 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[9].x, _371);
    float _377 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _379 = precise::min(_106, _130);
    float _381 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].w, _373);
    float _383 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].z, _375);
    float _385 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].x, _377);
    float _387 = precise::min(_100, _128);
    float _389 = _259 + _381;
    float _391 = _118 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _393 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].z, _385);
    float _395 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _391);
    float _397 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].w, _393);
    float _399 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].z, _395);
    float _401 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[9].w, _399);
    float _403 = _94 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _405 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[9].x, _403);
    float _407 = precise::min(_94, _116);
    float _409 = precise::min(_407, _387);
    float _411 = precise::min(_118, _134);
    float _413 = precise::min(_379, _411);
    float _415 = precise::max(_94, _116);
    float _417 = precise::min(_409, _413);
    float _419 = precise::max(_100, _128);
    float _421 = precise::max(_415, _419);
    float _423 = precise::max(_106, _130);
    float _425 = precise::max(_423, _365);
    float _427 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].z, _309);
    float _429 = precise::max(_421, _425);
    float _431 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].z, _405);
    float _433 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[9].w, _383);
    float _435 = precise::min(_112, _417);
    float _437 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].w, _427);
    float _439 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[9].w, _431);
    float _441 = precise::max(_112, _429);
    bool _443 = !_189;
    float _503;
    if (!_443)
    {
        bool _445 = _185 >= 3;
        float _447 = _130 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _449 = _128 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _451 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[9].x, _447);
        float _453 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[9].x, _449);
        float _455 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].z, _451);
        float _457 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[9].z, _453);
        float _459 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].w, _455);
        float _461 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].w, _457);
        bool _463 = !_445;
        if (!_463)
        {
            bool _465 = _185 != 3;
            _467 = _465;
            if (!_467)
            {
                float _469 = _433 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
                float _471 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[17].x, _233);
                float _473 = _317 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
                float _475 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[19].x, _357);
                float _477 = fma(_359, (*spvDescriptorSet0.fp_c3)._m0[16].x, _469);
                float _479 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[17].z, _471);
                float _481 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[18].x, _473);
                float _483 = fma(_459, (*spvDescriptorSet0.fp_c3)._m0[19].z, _475);
                float _485 = fma(_389, (*spvDescriptorSet0.fp_c3)._m0[16].z, _477);
                float _487 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].w, _479);
                float _489 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[18].z, _481);
                float _491 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[19].w, _483);
                float _493 = fma(_397, (*spvDescriptorSet0.fp_c3)._m0[16].w, _485);
                float _495 = fma(_401, (*spvDescriptorSet0.fp_c3)._m0[18].w, _489);
                float _497 = _493 + _487;
                float _499 = _497 + _495;
                float _501 = _499 + _491;
                _503 = _501;
                _505 = true;
            }
        }
        else
        {
            float _507 = _359 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
            float _509 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[17].y, _221);
            float _511 = _323 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
            float _513 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[19].y, _363);
            float _515 = fma(_439, (*spvDescriptorSet0.fp_c3)._m0[16].x, _507);
            float _517 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].z, _509);
            float _519 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[18].x, _511);
            float _521 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[19].z, _513);
            float _523 = fma(_433, (*spvDescriptorSet0.fp_c3)._m0[16].z, _515);
            float _525 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[17].w, _517);
            float _527 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[18].z, _519);
            float _529 = fma(_459, (*spvDescriptorSet0.fp_c3)._m0[19].w, _521);
            float _531 = fma(_389, (*spvDescriptorSet0.fp_c3)._m0[16].w, _523);
            float _533 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[18].w, _527);
            float _535 = _531 + _525;
            float _537 = _535 + _533;
            float _539 = _537 + _529;
            _503 = _539;
            _505 = true;
        }
    }
    if ((!_505) || _467)
    {
        bool _541;
        float _555;
        float _557;
        if (!_467)
        {
            _541 = _185 >= 1;
            float _543 = _100 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _545 = _94 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _547 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[9].x, _543);
            float _549 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _545);
            float _551 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].z, _547);
            float _553 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[9].z, _549);
            _555 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].w, _551);
            _557 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].w, _553);
        }
        if ((!_541) || _467)
        {
            bool _559;
            if (!_467)
            {
                _559 = _185 != 0;
            }
            if ((!_559) && (!_467))
            {
                float _561 = _359 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
                float _563 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[16].y, _319);
                float _565 = _116 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
                float _567 = _323 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
                float _569 = fma(_439, (*spvDescriptorSet0.fp_c3)._m0[17].x, _561);
                float _571 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[16].z, _563);
                float _573 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[18].y, _565);
                float _575 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[19].x, _567);
                float _577 = fma(_433, (*spvDescriptorSet0.fp_c3)._m0[17].z, _569);
                float _579 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[16].w, _571);
                float _581 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].z, _573);
                float _583 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[19].z, _575);
                float _585 = fma(_389, (*spvDescriptorSet0.fp_c3)._m0[17].w, _577);
                float _587 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[18].w, _581);
                float _589 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[19].w, _583);
                float _591 = _579 + _585;
                float _593 = _591 + _587;
                float _595 = _593 + _589;
                _503 = _595;
                _505 = true;
            }
            else
            {
                _467 = false;
                _503 = 0.0;
                _505 = true;
            }
        }
        else
        {
            float _597 = _433 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
            float _599 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[16].x, _325);
            float _601 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[18].x, _219);
            float _603 = _317 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
            float _605 = fma(_359, (*spvDescriptorSet0.fp_c3)._m0[17].x, _597);
            float _607 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[16].z, _599);
            float _609 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[18].z, _601);
            float _611 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[19].x, _603);
            float _613 = fma(_389, (*spvDescriptorSet0.fp_c3)._m0[17].z, _605);
            float _615 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].w, _607);
            float _617 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].w, _609);
            float _619 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[19].z, _611);
            float _621 = fma(_397, (*spvDescriptorSet0.fp_c3)._m0[17].w, _613);
            float _623 = fma(_401, (*spvDescriptorSet0.fp_c3)._m0[19].w, _619);
            float _625 = _615 + _621;
            float _627 = _625 + _617;
            float _629 = _627 + _623;
            _503 = _629;
        }
    }
    _505 = false;
    float _631 = _503;
    float _633 = precise::max(_435, _631);
    float _635 = precise::min(_441, _633);
    out.m_34.x = _635;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = 0.0;
    return out;
}

